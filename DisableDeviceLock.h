@interface DisableDeviceLock : NSObject
+(void)enableTweak;
+(void)disableTweak;
+(void)initSBSD;
+(BOOL)isNeverLocking;
+(void)showAlert;
@end

