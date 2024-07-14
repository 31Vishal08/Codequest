import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class gfgpotd extends StatefulWidget {
  const gfgpotd({super.key});

  @override
  State<gfgpotd> createState() => _gfgpotdState();

}

class _gfgpotdState extends State<gfgpotd> {
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
            if (request.url.startsWith('https://www.geeksforgeeks.org/problem-of-the-day')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://www.geeksforgeeks.org/problem-of-the-day'));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: controller,),
    );
  }
}
