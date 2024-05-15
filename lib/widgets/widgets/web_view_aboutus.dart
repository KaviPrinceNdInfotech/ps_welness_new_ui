import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WebViewPswebsiteabout extends StatefulWidget {
  const WebViewPswebsiteabout({Key? key}) : super(key: key);

  @override
  State<WebViewPswebsiteabout> createState() => _WebViewPswebsiteaboutState();
}

class _WebViewPswebsiteaboutState extends State<WebViewPswebsiteabout> {
  double _progress = 0;

  ///late InAppWebViewController inAppWebViewController;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        // var isLastPage = await inAppWebViewController.canGoBack();
        // if (isLastPage) {
        //inAppWebViewController.goBack();
        //return false;
        // }

        return true;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Text('Ps About Us'),
            backgroundColor: Colors.cyan,
            centerTitle: true,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _launchURL,
                child: Text('About Us'),
              ),
              // InAppWebView(
              //   initialUrlRequest: URLRequest(
              //       url: Uri.parse(
              //           "http://pswellness.in/Home/About?a=%27AboutUs%27")),
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

void _launchURL() async {
  const url = 'http://pswellness.in/Home/About?a=%27AboutUs%27';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
