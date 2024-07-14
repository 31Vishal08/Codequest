import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class c2ladder extends StatefulWidget {
  const c2ladder({super.key});

  @override
  State<c2ladder> createState() => _c2ladderState();

}

class _c2ladderState extends State<c2ladder> {
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
            if (request.url.startsWith('https://c2-ladders-juol.onrender.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://c2-ladders-juol.onrender.com/'));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: controller,),
    );
  }
}
