import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Baznas extends StatefulWidget {
  @override
  _BaznasState createState() => _BaznasState();
}

class _BaznasState extends State<Baznas> {
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
