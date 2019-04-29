#import <Flutter/Flutter.h>
#import "MoxieSDK.h"

@interface MoxieResult: NSObject<MoxieSDKDelegate>
- (instancetype) initWithResult:(FlutterResult) result;
@end
