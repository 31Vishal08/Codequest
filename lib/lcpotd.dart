import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class lcpotd extends StatefulWidget {
  const lcpotd({super.key});

  @override
  State<lcpotd> createState() => _lcpotdState();

}

class _lcpotdState extends State<lcpotd> {
  final controller = WebViewController();
  bool isLoading = true;



  @override
  void initState() {
    super.initState();
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://leetcode.com/problemset/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://leetcode.com/problemset/'));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: controller,),
    );
  }
}
