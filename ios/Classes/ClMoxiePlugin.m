#import "ClMoxiePlugin.h"
#import "MoxieResult.h"

@implementation ClMoxiePlugin {
    MoxieResult* _moxieResult;
}
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"cl_moxie"
            binaryMessenger:[registrar messenger]];
  ClMoxiePlugin* instance = [[ClMoxiePlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
    
}

- (instancetype) init {
    self = [super init];
    return self;
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"carrier" isEqualToString:call.method]) {
    // result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
      [self methodCarrier:call result:result];
  } else if ([@"taobao" isEqualToString:call.method]) {
      [self methodTaobao:call result:result];
  } else if ([@"zhifubao" isEqualToString:call.method]) {
      [self methodZhifubao:call result:result];
  } else {
    result(FlutterMethodNotImplemented);
  }
}

- (void) setCommonParams:(FlutterMethodCall*)call type:(NSString*)taskType result:(FlutterResult)result {
    [MoxieSDK shared].userId = [call.arguments objectForKey:@"userId"];
    [MoxieSDK shared].apiKey = [call.arguments objectForKey:@"MOXIE_APIKEY"];
    [MoxieSDK shared].taskType = taskType;
    [MoxieSDK shared].useNavigationPush = NO;
    _moxieResult = [[MoxieResult alloc] initWithResult:result];
    [MoxieSDK shared].delegate = _moxieResult;

    UIViewController* rootController = [UIApplication sharedApplication].keyWindow.rootViewController;
    [MoxieSDK shared].fromController = rootController;

}

- (void) methodCarrier:(FlutterMethodCall*)call result:(FlutterResult)result {
    [self setCommonParams:call type:@"carrier" result:result];
    [MoxieSDK shared].phone = [call.arguments objectForKey:@"phone"];
    [MoxieSDK shared].name = [call.arguments objectForKey:@"idCardName"];
    [MoxieSDK shared].idcard = [call.arguments objectForKey:@"idCard"];
    [[MoxieSDK shared] start];
}


- (void) methodTaobao:(FlutterMethodCall*)call result:(FlutterResult)result {
    [self setCommonParams:call type:@"taobao" result:result];
    [[MoxieSDK shared] start];
}

- (void) methodZhifubao:(FlutterMethodCall*)call result:(FlutterResult)result {
    [self setCommonParams:call type:@"alipay" result:result];
    [[MoxieSDK shared] start];
}


@end
