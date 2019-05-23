import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './router_handler.dart';

class Routes {
  static String root = '/';
  static String bannersWeb = 'bannersWeb';

  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext contest, Map<String, List<String>> params) {
      print('----${params}-----ERROR');
    });
    router.define(bannersWeb, handler: bannersWebHandler);
  }
}
