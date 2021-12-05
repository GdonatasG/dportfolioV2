import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:ez_localization/src/extension.dart';

import '../locale_keys.dart';

class CustomWebView extends StatefulWidget {
  final String url;

  const CustomWebView({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  _CustomWebViewState createState() => _CustomWebViewState();
}

class _CustomWebViewState extends State<CustomWebView> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsIconTheme: Theme.of(context).appBarTheme.actionsIconTheme,
        iconTheme: Theme.of(context).appBarTheme.iconTheme,
        actions: widget.url.isNotEmpty
            ? [
                NavigationControls(_controller.future),
                IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: () {
                    _refreshIndicatorKey.currentState?.show();
                  },
                ),
              ]
            : [],
      ),
      body: widget.url.isNotEmpty
          ? ShowWebView(
              url: this.widget.url,
              controller: _controller,
              refreshIndicatorKey: _refreshIndicatorKey)
          : ShowEmptyUrlMessageLayout(),
    );
  }
}

class ShowEmptyUrlMessageLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(context.getString(LocaleKeys.ERROR_EMPTY_WEBVIEW_URL),
          style: Theme.of(context).textTheme.bodyText1),
    );
  }
}

class ShowWebView extends StatefulWidget {
  final String url;
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey;
  final Completer<WebViewController> controller;

  const ShowWebView({
    Key? key,
    required this.url,
    required this.refreshIndicatorKey,
    required this.controller,
  }) : super(key: key);

  @override
  _ShowWebViewState createState() => _ShowWebViewState();
}

class _ShowWebViewState extends State<ShowWebView> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: widget.refreshIndicatorKey,
      onRefresh: () async {
        final Completer completer = Completer();
        await Future.delayed(const Duration(seconds: 1));
        this.widget.controller.future.then((value) {
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
          this.widget.controller.complete(webViewController);
        },
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
        final WebViewController? controller = snapshot.data;
        return Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: !webViewReady
                  ? null
                  : () => controller != null
                      ? navigate(context, controller, goBack: true)
                      : null,
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: !webViewReady
                  ? null
                  : () =>
                      controller != null ? navigate(context, controller) : null,
            ),
          ],
        );
      },
    );
  }

  navigate(
    BuildContext context,
    WebViewController controller, {
    bool goBack = false,
  }) async {
    bool canNavigate =
        goBack ? await controller.canGoBack() : await controller.canGoForward();
    if (canNavigate) {
      goBack ? controller.goBack() : controller.goForward();
    } else {
      // no page in history
    }
  }
}
