import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../pages/live_details_page/banners_web.dart';

Handler bannersWebHandler = Handler(
  handlerFunc: (BuildContext contest,Map<String,List<String>> params){

    print('------Ppppppppppp---${params['url'].first}===========');
    return BannersWeb(url: params['url'].first,);
  }
);