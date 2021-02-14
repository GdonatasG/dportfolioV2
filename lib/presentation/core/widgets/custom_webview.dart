import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CustomWebViewArguments {
  final Key key;
  final String url;

  CustomWebViewArguments(this.key, @required this.url);
}

class CustomWebView extends StatefulWidget {
  final String url;

  const CustomWebView({Key key, @required this.url}) : super(key: key);

  @override
  _CustomWebViewState createState() => _CustomWebViewState();
}

class _CustomWebViewState extends State<CustomWebView> {
  Completer<WebViewController> _controller = Completer<WebViewController>();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsIconTheme: Theme.of(context).appBarTheme.actionsIconTheme,
        iconTheme: Theme.of(context).appBarTheme.iconTheme,
        actions: [
          NavigationControls(_controller.future),
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _refreshIndicatorKey.currentState.show();
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: () async {
          final Completer completer = Completer();
          await Future.delayed(Duration(seconds: 1));
          _controller.future.then((value) {
            value.reload();
            completer.complete();
          });
          return completer.future;
        },
        child: WebView(
          initialUrl: this.widget.url,
          javascriptMode: JavascriptMode.unrestricted,
          gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
            Factory<VerticalDragGestureRecognizer>(
              () => VerticalDragGestureRecognizer(),
            ),
          },
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        ),
      ),
    );
  }
}

class NavigationControls extends StatelessWidget {
  const NavigationControls(this._webViewControllerFuture)
      : assert(_webViewControllerFuture != null);

  final Future<WebViewController> _webViewControllerFuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
      future: _webViewControllerFuture,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> snapshot) {
        final bool webViewReady =
            snapshot.connectionState == ConnectionState.done;
        final WebViewController controller = snapshot.data;
        return Row(
          children: <Widget>[
            IconButton(
              icon: IconTheme(
                data: Theme.of(context).appBarTheme.actionsIconTheme,
                child: const Icon(Icons.arrow_back_ios),
              ),
              onPressed: !webViewReady
                  ? null
                  : () => navigate(context, controller, goBack: true),
            ),
            IconButton(
              icon: IconTheme(
                data: Theme.of(context).appBarTheme.actionsIconTheme,
                child: const Icon(Icons.arrow_forward_ios),
              ),
              onPressed: !webViewReady
                  ? null
                  : () => navigate(context, controller, goBack: false),
            ),
          ],
        );
      },
    );
  }

  navigate(BuildContext context, WebViewController controller,
      {bool goBack: false}) async {
    bool canNavigate =
        goBack ? await controller.canGoBack() : await controller.canGoForward();
    if (canNavigate) {
      goBack ? controller.goBack() : controller.goForward();
    } else {
      // no page in history
    }
  }
}
