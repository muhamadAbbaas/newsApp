// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors_in_immutables, avoid_web_libraries_in_flutter
// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, override_on_non_overriding_member

import "package:flutter/material.dart";
import "package:webview_universal/webview_controller/webview_controller.dart";
import "package:webview_universal/widget/webview.dart";

class WebViewScreen extends StatelessWidget {
  WebViewController webViewController = WebViewController();
  WebViewScreen(
    this.webViewController,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        controller: webViewController,
      ),
    );
  }
}
