import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BannersWeb extends StatefulWidget {
  final String url;

  const BannersWeb({Key key, this.url}) : super(key: key);

//  final String title;

  @override
  BannersWebState createState() => new BannersWebState(url);
}

class BannersWebState extends State<BannersWeb> {
  final String url;

  BannersWebState(this.url);

  final _key = UniqueKey();

//  final String title;
//
//  BannersWebState(this.url, this.title);
  @override
  Widget build(BuildContext context) {
    print('-----${url}-----');
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            title:Text('网页'),
        ),
        body: Column(
          children: [
            Expanded(
                child: WebView(
                    key: _key,
                    javascriptMode: JavascriptMode.unrestricted,
                    initialUrl: url))
          ],
        ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
}
