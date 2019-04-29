import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cl_moxie/cl_moxie.dart';

void main() {
  const MethodChannel channel = MethodChannel('cl_moxie');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    // expect(await ClMoxie.platformVersion, '42');
  });
}
