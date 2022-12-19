import 'dart:convert';

import 'package:flutter/services.dart';


class NativeHelper {
  static NativeHelper? nativeHelper;

  static init() {
    nativeHelper = NativeHelper();
  }

  static const nativeChannel = MethodChannel('server_api/native');

  static sdkInit() async {
    print('Start SDK init');
    String result = await nativeChannel.invokeMethod('sdkInit');
    print('SDK init Successfully ${result}');
  }



  static Future<String> readRFID() async{
    String result = await nativeChannel.invokeMethod('readRFID');
    return result;
  }

  static Future<String> sendCommand() async{
    String result = await nativeChannel.invokeMethod('sendCommand');
    print(result);
    return result;
  }

  static Future<String> receiveCommand() async{
    String result = await nativeChannel.invokeMethod('receiveCommand');
    print(result);
    return result;
  }
}
