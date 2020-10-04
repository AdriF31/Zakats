import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DompetDhuafa extends StatefulWidget {
  @override
  _DompetDhuafaState createState() => _DompetDhuafaState();
}

class _DompetDhuafaState extends State<DompetDhuafa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bayar Zakatmu'),
        centerTitle: true,
      ),
      body: WebView(
        initialUrl: "https://donasi.dompetdhuafa.org/",
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
