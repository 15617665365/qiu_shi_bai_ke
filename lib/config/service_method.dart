import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../config/server_url.dart';

Future request(url, {fromData}) async {
  print('开始获取数据${serverPath[url]}.........');

  try {
    Response response;
    Dio dio = Dio();
//    dio.options.contentType = ContentType.parse('text/html; charset=UTF-8');
    dio.options.responseType = ResponseType.plain;
    if (fromData == null) {
      response = await dio.get(serverPath[url]);
    } else {
      response = await dio.post(serverPath[url], data: fromData);
    }

    print('结束获取数据${serverPath[url]}..........${fromData}');
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('接口异常');
    }
  } catch (e) {
    return print("ERROR :===========>/n" + e.toString());
  }
}
