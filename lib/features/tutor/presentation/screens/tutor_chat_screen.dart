import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TutorChatScreen extends ConsumerStatefulWidget {
  const TutorChatScreen({super.key});

  @override
  ConsumerState<TutorChatScreen> createState() => _TutorChatScreenState();
}

class _TutorChatScreenState extends ConsumerState<TutorChatScreen> {
  final _messageController = TextEditingController();
  final List<Map<String, String>> _messages = [];
  bool _isTyping = false;

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add({'role': 'user', 'content': text});
      _isTyping = true;
    });

    _messageController.clear();

    // Simulate AI response
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          _messages.add({
            'role': 'assistant',
            'content': _generateResponse(text),
          });
          _isTyping = false;
        });
      }
    });
  }

  String _generateResponse(String question) {
    // Mock AI responses for demonstration
    if (question.toLowerCase().contains('machine learning')) {
      return 'Machine Learning is a fascinating field! Based on your roadmap, you\'re currently learning the fundamentals. Would you like me to explain how supervised learning differs from unsupervised learning?';
    } else if (question.toLowerCase().contains('help')) {
      return 'I\'m here to help! You can ask me about concepts in your current roadmap, request explanations of technical terms, or ask me to quiz you on what you\'ve learned so far.';
    } else if (question.toLowerCase().contains('roadmap')) {
      return 'Your roadmap progress looks great! You\'re currently in Phase 2: Core Concepts. Do you want me to suggest which task to focus on next?';
    }
    return 'That\'s a great question! As you continue with your learning journey, you\'ll find that this concept becomes clearer with practice. Would you like me to provide some examples or additional resources?';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('AI Tutor'),
            Text(
              'Learning: Machine Learning',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Chat messages
          Expanded(
            child: _messages.isEmpty
                ? _EmptyChat()
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: _messages.length + (_isTyping ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == _messages.length && _isTyping) {
                        return _TypingIndicator();
                      }
                      final message = _messages[index];
                      return _MessageBubble(
                        content: message['content']!,
                        isUser: message['role'] == 'user',
                      );
                    },
                  ),
          ),

          // Input area
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: SafeArea(
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: 'Ask me anything...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                      ),
                      textInputAction: TextInputAction.send,
                      onSubmitted: (_) => _sendMessage(),
                    ),
                  ),
                  const SizedBox(width: 12),
                  CircleAvatar(
                    backgroundColor:
                        Theme.of(context).colorScheme.primary,
                    child: IconButton(
                      icon: const Icon(Icons.send, color: Colors.white),
                      onPressed: _sendMessage,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MessageBubble extends StatelessWidget {
  final String content;
  final bool isUser;

  const _MessageBubble({
    required this.content,
    required this.isUser,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        decoration: BoxDecoration(
          color: isUser
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: isUser ? const Radius.circular(16) : Radius.zero,
            bottomRight: isUser ? Radius.zero : const Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Text(
          content,
          style: TextStyle(
            color: isUser ? Colors.white : null,
          ),
        ),
      ),
    );
  }
}

class _TypingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: Radius.zero,
            bottomRight: Radius.circular(16),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildDot(0),
            const SizedBox(width: 4),
            _buildDot(1),
            const SizedBox(width: 4),
            _buildDot(2),
          ],
        ),
      ),
    );
  }

  Widget _buildDot(int index) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: 600 + (index * 200)),
      builder: (context, value, child) {
        return Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: Colors.grey[400]?.withValues(alpha: 0.3 + (value * 0.7)),
            shape: BoxShape.circle,
          ),
        );
      },
    );
  }
}

class _EmptyChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.auto_awesome,
                size: 48,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Your AI Learning Tutor',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Ask me anything about your learning topics, request explanations, or get help with difficult concepts!',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[600],
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: [
                _SuggestionChip(
                  label: 'Explain neural networks',
                  onTap: () {},
                ),
                _SuggestionChip(
                  label: 'Quiz me on Phase 1',
                  onTap: () {},
                ),
                _SuggestionChip(
                  label: 'Suggest next task',
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SuggestionChip extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _SuggestionChip({
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      label: Text(label),
      onPressed: onTap,
    );
  }
}
