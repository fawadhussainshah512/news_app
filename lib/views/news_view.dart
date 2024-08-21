import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../utils/constants.dart';

class NewsView extends StatefulWidget {
  final String url;

  const NewsView({required this.url});

  @override
  _NewsViewState createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  late String finalUrl;
  final Completer<WebViewController> controller = Completer<WebViewController>();

  @override
  void initState() {
    if (widget.url.contains("http://")) {
      finalUrl = widget.url.replaceAll("http://", "https://");
    } else {
      finalUrl = widget.url;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NEWSIFY"),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: WebView(
        initialUrl: finalUrl,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          controller.complete(webViewController);
        },
      ),
    );
  }
}