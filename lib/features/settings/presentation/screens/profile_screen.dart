import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Profile Header
            _ProfileHeader(),
            const SizedBox(height: 24),

            // Stats Grid
            _StatsGrid(),
            const SizedBox(height: 24),

            // Settings List
            _SettingsList(),
          ],
        ),
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor:
              Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
          child: Icon(
            Icons.person,
            size: 50,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Learner',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 4),
        Text(
          'Learning since today',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey[600],
              ),
        ),
      ],
    );
  }
}

class _StatsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _StatCard(
            icon: Icons.route,
            value: '0',
            label: 'Roadmaps',
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _StatCard(
            icon: Icons.check_circle,
            value: '0',
            label: 'Tasks Done',
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _StatCard(
            icon: Icons.local_fire_department,
            value: '0',
            label: 'Day Streak',
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const _StatCard({
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(
              icon,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
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

class _SettingsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          _SettingsTile(
            icon: Icons.settings_outlined,
            title: 'Settings',
            subtitle: 'API keys, notifications, appearance',
            onTap: () => context.push('/settings'),
          ),
          const Divider(height: 1),
          _SettingsTile(
            icon: Icons.sync_outlined,
            title: 'Sync & Backup',
            subtitle: 'Cloud sync settings',
            onTap: () {},
          ),
          const Divider(height: 1),
          _SettingsTile(
            icon: Icons.storage_outlined,
            title: 'Data & Privacy',
            subtitle: 'Manage your data',
            onTap: () {},
          ),
          const Divider(height: 1),
          _SettingsTile(
            icon: Icons.help_outline,
            title: 'Help & Support',
            subtitle: 'FAQs, contact us',
            onTap: () {},
          ),
          const Divider(height: 1),
          _SettingsTile(
            icon: Icons.info_outline,
            title: 'About',
            subtitle: 'Version 1.0.0',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _SettingsTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
