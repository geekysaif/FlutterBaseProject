import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutterbaseproject/businessUtils/colors/colors.dart';

class WebViewPage extends StatefulWidget {
  final String url;
  final Function(String) onPageLoadedCallback;

  const WebViewPage({Key? key, required this.url, required this.onPageLoadedCallback}) : super(key: key);

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late final WebViewController _controller;
  bool isLoading = true;
  bool hasError = false;

  @override
  void initState() {
    super.initState();

    // Initialize WebViewController
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() {
              isLoading = true;
              hasError = false;
            });
            widget.onPageLoadedCallback(url);
          },
          onPageFinished: (String url) {
            setState(() {
              isLoading = false;
            });
          },
          onWebResourceError: (WebResourceError error) {
            setState(() {
              hasError = true;
              isLoading = false;
            });
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  // Method to go back in WebView history
  Future<void> _goBack() async {
    if (await _controller.canGoBack()) {
      _controller.goBack();
    } else {
      Navigator.pop(context);
    }
  }

  // Refresh the WebView
  Future<void> _reloadPage() async {
    _controller.reload();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await _goBack();
        return false;
      },
      child: Scaffold(
        body: Stack(
          children: [
            // Pull to Refresh Wrapper
            RefreshIndicator(
              onRefresh: _reloadPage,
              child: WebViewWidget(controller: _controller),
            ),

            // Show error message if there's an issue loading the page
            if (hasError)
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error, color: Colors.red, size: 50),
                    SizedBox(height: 10),
                    Text("Failed to load page", style: TextStyle(fontSize: 18)),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: _reloadPage,
                      child: Text("Retry"),
                    ),
                  ],
                ),
              ),

            // Show loader when loading
            if (isLoading)
              Center(
                child: CircularProgressIndicator(color: AppColors.primaryColor),
              ),
          ],
        ),
      ),
    );
  }
}
