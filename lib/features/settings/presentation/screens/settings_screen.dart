import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ai_learning_route_planner/features/roadmap/presentation/providers/providers.dart';
import 'package:ai_learning_route_planner/core/router/app_router.dart';
import 'package:ai_learning_route_planner/core/services/locale_service.dart';
import 'package:ai_learning_route_planner/l10n/app_localizations.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  final _claudeKeyController = TextEditingController();
  final _exaKeyController = TextEditingController();
  bool _obscureClaudeKey = true;
  bool _obscureExaKey = true;
  bool _cloudSyncEnabled = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final claudeKey = ref.read(claudeApiKeyProvider);
      final exaKey = ref.read(exaApiKeyProvider);
      _claudeKeyController.text = claudeKey;
      _exaKeyController.text = exaKey;
    });
  }

  @override
  void dispose() {
    _claudeKeyController.dispose();
    _exaKeyController.dispose();
    super.dispose();
  }

  void _onCloudSyncChanged(bool value) {
    setState(() => _cloudSyncEnabled = value);
  }

  @override
  Widget build(BuildContext context) {
    // Watch locale to trigger rebuild on language change
    ref.watch(localeProvider);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settings),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SectionHeader(
              title: l10n.apiConfiguration,
              icon: Icons.key,
            ),
            const SizedBox(height: 16),
            _ApiKeyField(
              label: l10n.claudeApiKey,
              hint: 'sk-ant-api03-...',
              controller: _claudeKeyController,
              obscureText: _obscureClaudeKey,
              onToggleObscure: () {
                setState(() => _obscureClaudeKey = !_obscureClaudeKey);
              },
              onSave: (key) {
                ref.read(claudeApiKeyProvider.notifier).setKey(key);
                ref.read(authRedirectNotifierProvider).refresh();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(l10n.keySaved(l10n.claudeApiKey))),
                );
              },
              helperText: 'console.anthropic.com',
            ),
            const SizedBox(height: 16),
            _ApiKeyField(
              label: '${l10n.exaApiKey} (${l10n.optional})',
              hint: 'exa-...',
              controller: _exaKeyController,
              obscureText: _obscureExaKey,
              onToggleObscure: () {
                setState(() => _obscureExaKey = !_obscureExaKey);
              },
              onSave: (key) {
                ref.read(exaApiKeyProvider.notifier).setKey(key);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(l10n.keySaved(l10n.exaApiKey))),
                );
              },
              helperText: 'exa.ai',
            ),

            const SizedBox(height: 32),
            const Divider(),
            const SizedBox(height: 16),

            _SectionHeader(
              title: l10n.appearance,
              icon: Icons.palette,
            ),
            const SizedBox(height: 16),
            _ThemeToggle(l10n: l10n),

            const SizedBox(height: 8),
            _LanguageToggle(l10n: l10n),

            const SizedBox(height: 32),
            const Divider(),
            const SizedBox(height: 16),

            _SectionHeader(
              title: l10n.searchProvider,
              icon: Icons.search,
            ),
            const SizedBox(height: 16),
            _SearchProviderSelector(),

            const SizedBox(height: 32),
            const Divider(),
            const SizedBox(height: 16),

            _SectionHeader(
              title: l10n.notifications,
              icon: Icons.notifications,
            ),
            const SizedBox(height: 16),
            _NotificationToggle(l10n: l10n),

            const SizedBox(height: 32),
            const Divider(),
            const SizedBox(height: 16),

            _SectionHeader(
              title: l10n.dataPrivacy,
              icon: Icons.storage,
            ),
            const SizedBox(height: 16),
            _SettingsTile(
              icon: Icons.cloud_sync,
              title: l10n.cloudSync,
              subtitle: l10n.syncYourData,
              trailing: Switch(
                value: _cloudSyncEnabled,
                onChanged: _onCloudSyncChanged,
              ),
            ),
            const SizedBox(height: 8),
            _SettingsTile(
              icon: Icons.download,
              title: l10n.exportData,
              subtitle: l10n.downloadYourLearningData,
              onTap: () {},
            ),
            const SizedBox(height: 8),
            _SettingsTile(
              icon: Icons.delete_forever,
              title: l10n.clearData,
              subtitle: l10n.removeAllLocalData,
              textColor: Colors.red,
              onTap: () {
                _showClearDataDialog(l10n);
              },
            ),

            const SizedBox(height: 32),
            const Divider(),
            const SizedBox(height: 16),

            _SectionHeader(
              title: l10n.about,
              icon: Icons.info,
            ),
            const SizedBox(height: 16),
            _SettingsTile(
              icon: Icons.description,
              title: l10n.version,
              subtitle: '1.0.0',
            ),
            const SizedBox(height: 8),
            _SettingsTile(
              icon: Icons.privacy_tip,
              title: l10n.privacyPolicy,
              onTap: () {},
            ),
            const SizedBox(height: 8),
            _SettingsTile(
              icon: Icons.article,
              title: l10n.termsOfService,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  void _showClearDataDialog(AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.clearData),
        content: Text(l10n.thisWillDeleteAll),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () async {
              final db = ref.read(databaseProvider);
              await db.clearAllData();
              if (context.mounted) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(l10n.clearData)),
                );
              }
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: Text(l10n.confirm),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final IconData icon;

  const _SectionHeader({
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}

class _ApiKeyField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final bool obscureText;
  final VoidCallback onToggleObscure;
  final Function(String) onSave;
  final String helperText;

  const _ApiKeyField({
    required this.label,
    required this.hint,
    required this.controller,
    required this.obscureText,
    required this.onToggleObscure,
    required this.onSave,
    required this.helperText,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: controller,
              obscureText: obscureText,
              decoration: InputDecoration(
                hintText: hint,
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(
                        obscureText ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: onToggleObscure,
                    ),
                    IconButton(
                      icon: const Icon(Icons.save),
                      onPressed: () => onSave(controller.text),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              helperText,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey[600],
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ThemeToggle extends ConsumerWidget {
  final AppLocalizations l10n;

  const _ThemeToggle({required this.l10n});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeModeProvider);

    return Card(
      child: ListTile(
        leading: Icon(
          isDarkMode ? Icons.dark_mode : Icons.light_mode,
        ),
        title: Text(l10n.darkMode),
        subtitle: Text(isDarkMode ? l10n.enabled : l10n.disabled),
        trailing: Switch(
          value: isDarkMode,
          onChanged: (value) {
            ref.read(themeModeProvider.notifier).toggleTheme();
          },
        ),
      ),
    );
  }
}

class _LanguageToggle extends ConsumerWidget {
  final AppLocalizations l10n;

  const _LanguageToggle({required this.l10n});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    final isZh = locale.languageCode == 'zh';

    return Card(
      child: ListTile(
        leading: const Icon(Icons.language),
        title: Text(l10n.language),
        subtitle: Text(isZh ? '中文' : 'English'),
        trailing: Switch(
          value: !isZh,
          onChanged: (value) {
            ref.read(localeProvider.notifier).toggleLocale();
          },
        ),
        onTap: () {
          ref.read(localeProvider.notifier).toggleLocale();
        },
      ),
    );
  }
}

class _NotificationToggle extends StatelessWidget {
  final AppLocalizations l10n;

  const _NotificationToggle({required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          SwitchListTile(
            secondary: const Icon(Icons.alarm),
            title: Text(l10n.learningReminders),
            subtitle: Text(l10n.dailyRemindersToLearn),
            value: true,
            onChanged: (value) {},
          ),
          const Divider(height: 1),
          SwitchListTile(
            secondary: const Icon(Icons.style),
            title: Text(l10n.reviewAlerts),
            subtitle: Text(l10n.flashcardReviewReminders),
            value: true,
            onChanged: (value) {},
          ),
          const Divider(height: 1),
          SwitchListTile(
            secondary: const Icon(Icons.emoji_events),
            title: Text(l10n.achievements),
            subtitle: Text(l10n.milestoneCelebrations),
            value: false,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Color? textColor;

  const _SettingsTile({
    required this.icon,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: textColor),
        title: Text(
          title,
          style: TextStyle(color: textColor),
        ),
        subtitle: subtitle != null ? Text(subtitle!) : null,
        trailing: trailing ?? (onTap != null ? const Icon(Icons.chevron_right) : null),
        onTap: onTap,
      ),
    );
  }
}

class _SearchProviderSelector extends ConsumerWidget {
  const _SearchProviderSelector();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final currentProvider = ref.watch(searchProviderTypeProvider);

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: DropdownButtonHideUnderline(
                child: DropdownButton<SearchProviderType>(
                  value: currentProvider,
                  isExpanded: true,
                  items: [
                    DropdownMenuItem(
                      value: SearchProviderType.exa,
                      child: Text(l10n.exa),
                    ),
                    DropdownMenuItem(
                      value: SearchProviderType.tavily,
                      child: Text(l10n.tavily),
                    ),
                    DropdownMenuItem(
                      value: SearchProviderType.serpapi,
                      child: Text(l10n.serpapi),
                    ),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      ref.read(searchProviderTypeProvider.notifier).setProvider(value);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
