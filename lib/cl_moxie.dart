import 'dart:async';

import 'package:flutter/services.dart';
import 'src/carrier.dart';
import 'src/taobao.dart';
import 'src/zhifubao.dart';

export 'src/carrier.dart';
export 'src/taobao.dart';
export 'src/zhifubao.dart';

class ClMoxie {
  static const MethodChannel _channel = const MethodChannel('cl_moxie');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  /// 进行运营商认证，返回值如果是null，表示成功
  static Future<String> carrier(CarrierArgs args) async {
    final String ret = await _channel.invokeMethod('carrier', args.toJson());
    return ret;
  }

  /// 进行淘宝认证，返回值如果是null，表示成功
  static Future<String> taobao(TaobaoArgs args) async {
    final String ret = await _channel.invokeMethod('taobao', args.toJson());
    return ret;
  }

  /// 进行支付宝认证，返回值如果是null，表示成功
  static Future<String> zhifubao(ZhifubaoArgs args) async {
    final String ret = await _channel.invokeMethod('zhifubao', args.toJson());
    return ret;
  }
}
