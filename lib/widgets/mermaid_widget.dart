import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// 在 WebView 中使用 Mermaid.js 渲染图表
///
/// 用法：
/// ```dart
/// MermaidWidget(
///   code: 'flowchart LR\nA[Start] --> B[End]',
///   height: 300,
/// )
/// ```
class MermaidWidget extends StatelessWidget {
  final String code;
  final double? height;

  const MermaidWidget({
    super.key,
    required this.code,
    this.height,
  });

  static const _htmlTemplate = '''
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="https://cdn.jsdelivr.net/npm/mermaid@11/dist/mermaid.min.js">
  </script>
  <script>
    mermaid.initialize({
      startOnLoad: true,
      theme: 'default',
      securityLevel: 'loose',
    });
  </script>
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body {
      display: flex;
      justify-content: center;
      align-items: flex-start;
      padding: 8px;
      font-family: sans-serif;
    }
    .mermaid {
      max-width: 100%;
    }
    svg { max-width: 100%; height: auto; }
  </style>
</head>
<body>
  <div class="mermaid">
    %CODE%
  </div>
</body>
</html>
''';

  String get _htmlContent {
    // 转义反引号和 ${} 防止 HTML 模板冲突
    final escaped = code
        .replaceAll('&', '&amp;')
        .replaceAll('<', '&lt;')
        .replaceAll('>', '&gt;');
    return _htmlTemplate.replaceAll('%CODE%', escaped);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 250,
      child: WebViewWidget(
        controller: WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..loadHtmlString(_htmlContent),
      ),
    );
  }
}
