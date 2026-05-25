import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:ai_learning_route_planner/widgets/mermaid_block_builder.dart';
import 'package:ai_learning_route_planner/features/roadmap/presentation/providers/providers.dart';
import 'package:ai_learning_route_planner/l10n/app_localizations.dart';

class TutorChatScreen extends ConsumerStatefulWidget {
  const TutorChatScreen({super.key});

  @override
  ConsumerState<TutorChatScreen> createState() => _TutorChatScreenState();
}

class _TutorChatScreenState extends ConsumerState<TutorChatScreen>
    with SingleTickerProviderStateMixin {
  final _messageController = TextEditingController();
  final List<Map<String, String>> _messages = [];
  final _listKey = GlobalKey<AnimatedListState>();
  final _scrollController = ScrollController();
  late final AnimationController _typingAnimCtrl;
  bool _isTyping = false;

  @override
  void initState() {
    super.initState();
    _typingAnimCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    _typingAnimCtrl.dispose();
    super.dispose();
  }

  void _addMessage(Map<String, String> msg) {
    _messages.add(msg);
    _listKey.currentState?.insertItem(
      _messages.length - 1,
      duration: const Duration(milliseconds: 350),
    );
    // 滚动到底部
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  void _sendSuggestion(String text) {
    _addMessage({'role': 'user', 'content': text});
    setState(() => _isTyping = true);
    _typingAnimCtrl.repeat();
    _callAi(text);
  }

  void _sendMessage() {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;
    _addMessage({'role': 'user', 'content': text});
    _messageController.clear();
    setState(() => _isTyping = true);
    _typingAnimCtrl.repeat();
    _callAi(text);
  }

  Future<void> _callAi(String text) async {
    final aiService = ref.read(aiServiceProvider);
    if (aiService == null) {
      if (mounted) {
        _addMessage({
          'role': 'assistant',
          'content': 'API key not configured. Please add your API key in Settings.',
        });
        setState(() => _isTyping = false);
        _typingAnimCtrl.stop();
      }
      return;
    }

    final result = await aiService.answerQuestion(question: text, context: '');
    if (mounted) {
      _addMessage({
        'role': 'assistant',
        'content': result.content ?? result.error ?? 'No response',
      });
      setState(() => _isTyping = false);
      _typingAnimCtrl.stop();
    }
  }



  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.aiTutor),
            Text(
              l10n.learningTopics,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => context.push('/settings'),
          ),
        ],
      ),
      body: Column(
        children: [
          // Chat messages
          Expanded(
            child: _messages.isEmpty
                ? _EmptyChat(onSendSuggestion: _sendSuggestion)
                : AnimatedList(
                    key: _listKey,
                    controller: _scrollController,
                    padding: const EdgeInsets.all(16),
                    initialItemCount: _messages.length,
                    itemBuilder: (context, index, animation) {
                      // 最后一个位置可能是打字指示器
                      if (index == _messages.length && _isTyping) {
                        return SizeTransition(
                          sizeFactor: animation,
                          child: FadeTransition(
                            opacity: animation,
                            child: const _TypingIndicator(),
                          ),
                        );
                      }
                      if (index >= _messages.length) {
                        return const SizedBox.shrink();
                      }
                      final message = _messages[index];
                      return SizeTransition(
                        sizeFactor: animation,
                        child: FadeTransition(
                          opacity: animation,
                          child: _MessageBubble(
                            content: message['content']!,
                            isUser: message['role'] == 'user',
                          ),
                        ),
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
                        hintText: l10n.askMeAnything,
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
    final theme = Theme.of(context);
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
              ? theme.colorScheme.primary
              : theme.colorScheme.surface,
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
        child: isUser
            ? Text(
                content,
                style: TextStyle(color: Colors.white),
              )
            : MarkdownBody(
                data: content,
                selectable: true,
                builders: {'pre': MermaidBlockBuilder()},
                styleSheet: MarkdownStyleSheet(
                  p: TextStyle(color: theme.textTheme.bodyMedium?.color),
                  code: TextStyle(
                    backgroundColor: theme.colorScheme.surfaceContainerHighest,
                    color: theme.colorScheme.primary,
                    fontSize: 13,
                  ),
                  codeblockDecoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  blockquoteDecoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: theme.colorScheme.primary,
                        width: 3,
                      ),
                    ),
                  ),
                  h1: theme.textTheme.titleLarge,
                  h2: theme.textTheme.titleMedium,
                  h3: theme.textTheme.titleSmall,
                ),
              ),
      ),
    );
  }
}

class _TypingIndicator extends StatelessWidget {
  const _TypingIndicator();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
            _BounceDot(delay: 0),
            const SizedBox(width: 5),
            _BounceDot(delay: 200),
            const SizedBox(width: 5),
            _BounceDot(delay: 400),
          ],
        ),
      ),
    );
  }
}

class _BounceDot extends StatefulWidget {
  final int delay;
  const _BounceDot({required this.delay});

  @override
  State<_BounceDot> createState() => _BounceDotState();
}

class _BounceDotState extends State<_BounceDot>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);
    _anim = CurvedAnimation(
      parent: _ctrl,
      curve: Interval(
        widget.delay / 1200,
        1.0,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _anim,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, -3 * _anim.value),
          child: Opacity(
            opacity: 0.3 + (0.7 * _anim.value),
            child: child,
          ),
        );
      },
      child: Container(
        width: 8,
        height: 8,
        decoration: const BoxDecoration(
          color: Colors.grey,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class _EmptyChat extends StatelessWidget {
  final void Function(String) onSendSuggestion;

  const _EmptyChat({required this.onSendSuggestion});
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
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
              l10n.yourAiLearningTutor,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              l10n.askMeAnything,
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
                  label: l10n.explainNeuralNetworks,
                  onTap: () => onSendSuggestion(l10n.explainNeuralNetworks),
                ),
                _SuggestionChip(
                  label: l10n.quizMeOnPhase,
                  onTap: () => onSendSuggestion(l10n.quizMeOnPhase),
                ),
                _SuggestionChip(
                  label: l10n.suggestNextTask,
                  onTap: () => onSendSuggestion(l10n.suggestNextTask),
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
