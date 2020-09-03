#import <UIKit/UIKit.h>
#import "DisableDeviceLock.h"

@interface SBSecurityDefaults
@property (nonatomic,assign,readonly) BOOL dontLockEver;
-(void)setDontLockEver:(BOOL)arg1;
@end

@interface SBThermalController : NSObject {
  SBSecurityDefaults * _securityDefaults;
}
+(id)sharedInstance;
@end

const SBSecurityDefaults * sbsd;

@implementation DisableDeviceLock

+(void)enableTweak {
  [sbsd setDontLockEver:YES];
  [self showAlert];
}

+(void)disableTweak {
  [sbsd setDontLockEver:NO];
}

+(void)initSBSD {
  SBThermalController * sbtc = (SBThermalController *) [%c(SBThermalController)
    sharedInstance];
  sbsd = (SBSecurityDefaults *) [sbtc
    valueForKey:@"_securityDefaults"];
}

+(BOOL)isNeverLocking {
  return sbsd.dontLockEver;
}

+(void)showAlert {
  UIAlertView * alert = [[UIAlertView alloc]
    initWithTitle:@"⚠️ Warning"
    message:@"This device will stay unlocked and the screen will remain on until the DisableDeviceLock tweak is disabled in settings."
    delegate:nil
    cancelButtonTitle:@"OK"
    otherButtonTitles:nil];
  [alert show];
}

@end

