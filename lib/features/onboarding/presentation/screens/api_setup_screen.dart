import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ai_learning_route_planner/services/ai/ai_service.dart';
import 'package:ai_learning_route_planner/features/roadmap/presentation/providers/providers.dart';
import 'package:ai_learning_route_planner/core/router/app_router.dart';
import 'package:ai_learning_route_planner/core/services/locale_service.dart';
import 'package:ai_learning_route_planner/l10n/app_localizations.dart';

class ApiSetupScreen extends ConsumerStatefulWidget {
  const ApiSetupScreen({super.key});

  @override
  ConsumerState<ApiSetupScreen> createState() => _ApiSetupScreenState();
}

class _ApiSetupScreenState extends ConsumerState<ApiSetupScreen> {
  final _apiKeyController = TextEditingController();
  final _exaKeyController = TextEditingController();
  final _tavilyKeyController = TextEditingController();
  final _serpapiKeyController = TextEditingController();
  AIProviderType _selectedProvider = AIProviderType.claude;
  bool _isVerifying = false;
  bool _obscureApiKey = true;
  bool _obscureExaKey = true;
  bool _obscureTavilyKey = true;
  bool _obscureSerpapiKey = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadInitialKeys();
    });
  }

  void _loadInitialKeys() {
    // Load saved AI provider type
    final savedProviderType = ref.read(aiProviderTypeProvider);
    setState(() {
      _selectedProvider = savedProviderType;
    });

    // Load the API key for the saved provider
    _apiKeyController.text = _getSavedApiKeyForProvider(savedProviderType);

    // Load search API keys
    _exaKeyController.text = ref.read(exaApiKeyProvider);
    _tavilyKeyController.text = ref.read(tavilyApiKeyProvider);
    _serpapiKeyController.text = ref.read(serpapiApiKeyProvider);
  }

  String _getSavedApiKeyForProvider(AIProviderType type) {
    switch (type) {
      case AIProviderType.claude:
        return ref.read(claudeApiKeyProvider);
      case AIProviderType.deepseek:
        return ref.read(deepseekApiKeyProvider);
      case AIProviderType.openai:
        return ref.read(openaiApiKeyProvider);
      case AIProviderType.grok:
        return ref.read(grokApiKeyProvider);
      case AIProviderType.gemini:
        return ref.read(geminiApiKeyProvider);
    }
  }

  @override
  void dispose() {
    _apiKeyController.dispose();
    _exaKeyController.dispose();
    _tavilyKeyController.dispose();
    _serpapiKeyController.dispose();
    super.dispose();
  }

  Future<void> _openDocs(AIProviderType type) async {
    final config = AIProviderConfig.getConfig(type);
    final uri = Uri.parse(config.docsUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _openExaDocs() async {
    final uri = Uri.parse('https://exa.ai');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _openTavilyDocs() async {
    final uri = Uri.parse('https://tavily.com');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _openSerpapiDocs() async {
    final uri = Uri.parse('https://serpapi.com');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _verifyAndSave() async {
    final l10n = AppLocalizations.of(context)!;
    final apiKey = _apiKeyController.text.trim();
    if (apiKey.isEmpty) {
      setState(() => _errorMessage = l10n.pleaseEnterApiKey);
      return;
    }

    setState(() {
      _isVerifying = true;
      _errorMessage = null;
    });

    // Save AI API key to the correct provider's storage
    switch (_selectedProvider) {
      case AIProviderType.claude:
        await ref.read(claudeApiKeyProvider.notifier).setKey(apiKey);
        break;
      case AIProviderType.deepseek:
        await ref.read(deepseekApiKeyProvider.notifier).setKey(apiKey);
        break;
      case AIProviderType.openai:
        await ref.read(openaiApiKeyProvider.notifier).setKey(apiKey);
        break;
      case AIProviderType.grok:
        await ref.read(grokApiKeyProvider.notifier).setKey(apiKey);
        break;
      case AIProviderType.gemini:
        await ref.read(geminiApiKeyProvider.notifier).setKey(apiKey);
        break;
    }
    await ref.read(aiProviderTypeProvider.notifier).setProvider(_selectedProvider);

    // Save search API keys
    final exaKey = _exaKeyController.text.trim();
    if (exaKey.isNotEmpty) {
      await ref.read(exaApiKeyProvider.notifier).setKey(exaKey);
    }

    final tavilyKey = _tavilyKeyController.text.trim();
    if (tavilyKey.isNotEmpty) {
      await ref.read(tavilyApiKeyProvider.notifier).setKey(tavilyKey);
    }

    final serpapiKey = _serpapiKeyController.text.trim();
    if (serpapiKey.isNotEmpty) {
      await ref.read(serpapiApiKeyProvider.notifier).setKey(serpapiKey);
    }

    // 刷新 auth state 触发路由重定向
    ref.read(authRedirectNotifierProvider).refresh();

    // 跳过验证调用（浪费 token），直接进入主页
    // 如果 key 无效，用户在使用时会看到错误提示
    if (mounted) {
      context.go('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Watch locale to trigger rebuild on language change
    ref.watch(localeProvider);
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              _buildHeader(context, l10n, isDark),
              const SizedBox(height: 32),
              _buildProviderSelector(context, l10n, isDark),
              const SizedBox(height: 24),
              _buildApiKeyInput(context, l10n, isDark),
              const SizedBox(height: 24),
              _buildSearchSection(context, l10n, isDark),
              const SizedBox(height: 16),
              _buildDocsLink(context, l10n, isDark),
              if (_errorMessage != null) ...[
                const SizedBox(height: 16),
                _buildErrorMessage(context, isDark),
              ],
              const SizedBox(height: 32),
              _buildVerifyButton(context, l10n),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, AppLocalizations l10n, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(
            Icons.auto_awesome,
            size: 48,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          l10n.configureAiService,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          l10n.chooseAiProvider,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.grey[600],
              ),
        ),
      ],
    );
  }

  Widget _buildProviderSelector(BuildContext context, AppLocalizations l10n, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.selectAiProvider,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: AIProviderConfig.providers.map((provider) {
            final isSelected = _selectedProvider == provider.type;
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedProvider = provider.type;
                  _apiKeyController.text = _getSavedApiKeyForProvider(provider.type);
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected
                        ? Theme.of(context).colorScheme.primary
                        : Colors.grey[300]!,
                    width: 2,
                  ),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: Theme.of(context)
                                .colorScheme
                                .primary
                                .withValues(alpha: 0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ]
                      : null,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      _getProviderIcon(provider.type),
                      color: isSelected ? Colors.white : Colors.grey[700],
                      size: 24,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      provider.name,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.grey[700],
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  IconData _getProviderIcon(AIProviderType type) {
    switch (type) {
      case AIProviderType.claude:
        return Icons.smart_toy;
      case AIProviderType.deepseek:
        return Icons.psychology;
      case AIProviderType.openai:
        return Icons.auto_awesome;
      case AIProviderType.grok:
        return Icons.rocket_launch;
      case AIProviderType.gemini:
        return Icons.star;
    }
  }

  Widget _buildApiKeyInput(BuildContext context, AppLocalizations l10n, bool isDark) {
    final config = AIProviderConfig.getConfig(_selectedProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '${config.name} API Key',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const Spacer(),
            TextButton.icon(
              onPressed: () => _openDocs(_selectedProvider),
              icon: const Icon(Icons.open_in_new, size: 16),
              label: Text(l10n.getApiKey),
            ),
          ],
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _apiKeyController,
          obscureText: _obscureApiKey,
          decoration: InputDecoration(
            hintText: l10n.enterYourApiKey,
            prefixIcon: const Icon(Icons.key),
            suffixIcon: IconButton(
              icon: Icon(_obscureApiKey ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() => _obscureApiKey = !_obscureApiKey);
              },
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          l10n.apiKeyStoredLocally,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.grey[600],
              ),
        ),
      ],
    );
  }

  Widget _buildExaKeyInput(BuildContext context, AppLocalizations l10n, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '${l10n.exaApiKey} (${l10n.optional})',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.orange.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                l10n.forResourceSearch,
                style: const TextStyle(
                  color: Colors.orange,
                  fontSize: 12,
                ),
              ),
            ),
            const Spacer(),
            TextButton.icon(
              onPressed: _openExaDocs,
              icon: const Icon(Icons.open_in_new, size: 16),
              label: Text(l10n.getApiKey),
            ),
          ],
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _exaKeyController,
          obscureText: _obscureExaKey,
          decoration: InputDecoration(
            hintText: '${l10n.enterYourApiKey} (${l10n.optional})',
            prefixIcon: const Icon(Icons.search),
            suffixIcon: IconButton(
              icon: Icon(_obscureExaKey ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() => _obscureExaKey = !_obscureExaKey);
              },
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            filled: true,
            fillColor: isDark ? Colors.grey.shade800.withValues(alpha: 0.3) : Colors.grey.shade50,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          l10n.withoutExaKeyBasicSearch,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.grey[600],
              ),
        ),
      ],
    );
  }

  Widget _buildTavilyKeyInput(BuildContext context, AppLocalizations l10n, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '${l10n.tavilyApiKey} (${l10n.optional})',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.green.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                l10n.aiSearch,
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 12,
                ),
              ),
            ),
            const Spacer(),
            TextButton.icon(
              onPressed: _openTavilyDocs,
              icon: const Icon(Icons.open_in_new, size: 16),
              label: Text(l10n.getApiKey),
            ),
          ],
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _tavilyKeyController,
          obscureText: _obscureTavilyKey,
          decoration: InputDecoration(
            hintText: '${l10n.enterYourApiKey} (${l10n.optional})',
            prefixIcon: const Icon(Icons.search),
            suffixIcon: IconButton(
              icon: Icon(_obscureTavilyKey ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() => _obscureTavilyKey = !_obscureTavilyKey);
              },
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            filled: true,
            fillColor: isDark ? Colors.grey.shade800.withValues(alpha: 0.3) : Colors.grey.shade50,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          l10n.tavilyDescription,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.grey[600],
              ),
        ),
      ],
    );
  }

  Widget _buildSerpapiKeyInput(BuildContext context, AppLocalizations l10n, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '${l10n.serpapiApiKey} (${l10n.optional})',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.blue.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                l10n.googleSearch,
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 12,
                ),
              ),
            ),
            const Spacer(),
            TextButton.icon(
              onPressed: _openSerpapiDocs,
              icon: const Icon(Icons.open_in_new, size: 16),
              label: Text(l10n.getApiKey),
            ),
          ],
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _serpapiKeyController,
          obscureText: _obscureSerpapiKey,
          decoration: InputDecoration(
            hintText: '${l10n.enterYourApiKey} (${l10n.optional})',
            prefixIcon: const Icon(Icons.search),
            suffixIcon: IconButton(
              icon: Icon(_obscureSerpapiKey ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() => _obscureSerpapiKey = !_obscureSerpapiKey);
              },
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            filled: true,
            fillColor: isDark ? Colors.grey.shade800.withValues(alpha: 0.3) : Colors.grey.shade50,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          l10n.serpapiDescription,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.grey[600],
              ),
        ),
      ],
    );
  }

  Widget _buildDocsLink(BuildContext context, AppLocalizations l10n, bool isDark) {
    final config = AIProviderConfig.getConfig(_selectedProvider);

    return Card(
      color: isDark ? Colors.blue.shade900.withValues(alpha: 0.3) : Colors.blue[50],
      child: ListTile(
        leading: Icon(Icons.info_outline, color: isDark ? Colors.blue.shade300 : Colors.blue),
        title: Text(
          l10n.howToGetApiKey,
          style: TextStyle(color: isDark ? Colors.white : Colors.black87),
        ),
        subtitle: Text(
          l10n.visitToSignUp(config.docsUrl),
          style: TextStyle(color: isDark ? Colors.grey.shade400 : Colors.grey.shade700),
        ),
        trailing: Icon(Icons.chevron_right, color: isDark ? Colors.grey.shade400 : Colors.grey),
        onTap: () => _openDocs(_selectedProvider),
      ),
    );
  }

  Widget _buildSearchSection(BuildContext context, AppLocalizations l10n, bool isDark) {
    return ExpansionTile(
      title: Text(
        '🔍 搜索配置（可选）',
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
      ),
      subtitle: Text(
        '不配置也能使用核心功能',
        style: TextStyle(fontSize: 12, color: Colors.grey[500]),
      ),
      initiallyExpanded: false,
      children: [
        _buildExaKeyInput(context, l10n, isDark),
        const SizedBox(height: 12),
        _buildTavilyKeyInput(context, l10n, isDark),
        const SizedBox(height: 12),
        _buildSerpapiKeyInput(context, l10n, isDark),
      ],
    );
  }

  Widget _buildErrorMessage(BuildContext context, bool isDark) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isDark ? Colors.red.shade900.withValues(alpha: 0.3) : Colors.red[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.error_outline, color: isDark ? Colors.red.shade300 : Colors.red),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              _errorMessage!,
              style: TextStyle(color: isDark ? Colors.red.shade200 : Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVerifyButton(BuildContext context, AppLocalizations l10n) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: _isVerifying ? null : _verifyAndSave,
        child: _isVerifying
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(l10n.verifying),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.check),
                  const SizedBox(width: 8),
                  Text(l10n.verifyAndContinue),
                ],
              ),
      ),
    );
  }
}
