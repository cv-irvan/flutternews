part of 'importview.dart';

class Detail extends StatefulWidget {
  String data;
  Detail({this.data});
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: WebView(
          initialUrl: widget.data,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
          onProgress: (int progress) {
            print("WebView is loading (progress : $progress%)");
          },
          onPageStarted: (_) {
            showLoading(context);
          },
          onPageFinished: (_) {
            Navigator.pop(context);
          },
          javascriptMode: JavascriptMode.disabled,
        ),
      ),
    );
  }
}
