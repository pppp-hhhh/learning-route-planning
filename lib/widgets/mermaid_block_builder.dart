import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'mermaid_widget.dart';

/// flutter_markdown 自定义 builder，拦截 ```mermaid 代码块渲染为图表
///
/// 用法：
/// ```dart
/// MarkdownBody(
///   data: markdownSource,
///   builders: { 'pre': MermaidBlockBuilder() },
/// )
/// ```
class MermaidBlockBuilder extends MarkdownElementBuilder {
  @override
  Widget? visitElementAfter(element, TextStyle? preferredStyle) {
    // 代码块语言存储在 element.attributes['language'] 中
    final language = _attr(element, 'language') ?? '';
    if (language != 'mermaid') {
      return null; // 非 mermaid 走默认渲染
    }

    final code = _text(element);
    if (code.trim().isEmpty) return null;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: MermaidWidget(code: code.trim()),
      ),
    );
  }

  String? _attr(dynamic el, String key) {
    // 兼容不同版本的 flutter_markdown Element 类型
    if (el is Map) return el[key] as String?;
    try {
      return (el as dynamic).attributes?[key] as String?;
    } catch (_) {
      return null;
    }
  }

  String _text(dynamic el) {
    try {
      return (el as dynamic).textContent as String? ?? '';
    } catch (_) {
      return '';
    }
  }
}
