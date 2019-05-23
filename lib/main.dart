import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provide/provide.dart';
import 'package:qiu_shi_bai_ke/routers/routes.dart';
import 'pages/index_page.dart';
import 'routers/application.dart';
import 'provides/currentIndex.dart';
import 'provides/home_content_provide.dart';

import 'package:fluro/fluro.dart';


void main() {
  var currentIndexProvide = CurrentIndexProvide();
  var homeContentProvide = HomeContentProvide();

  var provide = Providers();
  provide..provide(Provider.value(currentIndexProvide))
         ..provide(Provider.value(homeContentProvide));

  runApp(ProviderNode(child: MyApp(), providers: provide));

  SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor:Colors.transparent);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;

    return Container(
      child: MaterialApp(
        title: '',
        onGenerateRoute: Application.router.generator,
        theme: ThemeData(primaryColor: Colors.orange),
        home: IndexPage(),

      ),
    );
  }
}
