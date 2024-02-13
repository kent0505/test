import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TermsPage extends StatefulWidget {
  const TermsPage({super.key});

  @override
  State<TermsPage> createState() => _TermsPageState();
}

class _TermsPageState extends State<TermsPage> {
  final controller = WebViewController()
    ..loadRequest(Uri.parse('https://pub.dev/'))
    ..setJavaScriptMode(JavaScriptMode.unrestricted);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms and Conditions, Privacy Policy'),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
