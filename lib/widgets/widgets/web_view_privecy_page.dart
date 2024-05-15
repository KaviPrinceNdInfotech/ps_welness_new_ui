import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewPswebsiteprivecy extends StatefulWidget {
  const WebViewPswebsiteprivecy({Key? key}) : super(key: key);

  @override
  State<WebViewPswebsiteprivecy> createState() =>
      _WebViewPswebsiteprivecyState();
}

class _WebViewPswebsiteprivecyState extends State<WebViewPswebsiteprivecy> {
  double _progress = 0;
  //late InAppWebViewController inAppWebViewController;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);

        ///var isLastPage = await inAppWebViewController.canGoBack();
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
            title: const Text('PS Privacy Policy'),
            backgroundColor: Colors.cyan,
            centerTitle: true,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _launchURL2,
                child: Text('Privecy Policy'),
              ),
              // InAppWebView(
              //   initialUrlRequest: URLRequest(
              //       url: Uri.parse("http://pswellness.in/Home/PrivacyPolicy")),
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

void _launchURL2() async {
  const url = 'http://pswellness.in/Home/PrivacyPolicy';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
