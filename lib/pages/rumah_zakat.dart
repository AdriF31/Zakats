import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RumahZakat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bayar Zakatmu'),
        centerTitle: true,
      ),
      body: WebView(
        initialUrl: "https://www.rumahzakat.org/donasi/#zakat-maal",
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
