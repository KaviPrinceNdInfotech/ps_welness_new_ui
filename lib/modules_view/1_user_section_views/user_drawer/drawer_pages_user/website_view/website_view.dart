import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewPswebsite extends StatefulWidget {
  const WebViewPswebsite({Key? key}) : super(key: key);

  @override
  State<WebViewPswebsite> createState() => _WebViewPswebsiteState();
}

class _WebViewPswebsiteState extends State<WebViewPswebsite> {
  double _progress = 0;
  //late InAppWebViewController inAppWebViewController;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);

        // var isLastPage = await inAppWebViewController.canGoBack();
        // if (isLastPage) {
        //   inAppWebViewController.goBack();
        //   return false;
        // }

        return true;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Text('Ps Wellness'),
            backgroundColor: Colors.cyan,
            centerTitle: true,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // InAppWebView(
              //   initialUrlRequest:
              //       URLRequest(url: Uri.parse("http://pswellness.in")),
              //   onWebViewCreated: (InAppWebViewController controller) {
              //     inAppWebViewController = controller;
              //   },
              //   onProgressChanged:
              //       (InAppWebViewController controller, int progress) {
              //     setState(() {
              //       _progress = progress / 100;
              //     });
              //   },
              // ),

              ElevatedButton(
                onPressed: _launchURL3,
                child: Text('Ps Wellness'),
              ),
              _progress < 1
                  ? Container(
                      child: LinearProgressIndicator(
                        value: _progress,
                      ),
                    )
                  : SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}

void _launchURL3() async {
  const url = 'http://pswellness.in';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
