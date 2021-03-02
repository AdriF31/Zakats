import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Baznas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bayar Zakatmu'),
        centerTitle: true,
      ),
      body: WebView(
        initialUrl: "https://baznas.go.id/bayarzakat",
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
