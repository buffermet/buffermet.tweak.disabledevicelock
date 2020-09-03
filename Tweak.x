#import <UIKit/UIKit.h>
#import "DisableDeviceLock.h"

void onToggleTweak() {
  const NSDictionary * prefs = [[NSUserDefaults standardUserDefaults]
    persistentDomainForName:@"buffermet.tweak.disabledevicelockpreferences"];

  if (prefs) {
    const id isEnabled = [prefs valueForKey:@"isEnabled"];

    if ([isEnabled isEqual:@1]) {
      [DisableDeviceLock enableTweak];
    } else {
      [DisableDeviceLock disableTweak];
    }
  }
}

%hook SpringBoard

-(void)applicationDidFinishLaunching:(id)arg1 {
  %orig(arg1);

  CFNotificationCenterAddObserver(
    CFNotificationCenterGetDarwinNotifyCenter(),
    NULL,
    (CFNotificationCallback) onToggleTweak,
    CFSTR("buffermet.tweak.disabledevicelock/prefchange"),
    NULL,
    CFNotificationSuspensionBehaviorCoalesce);

  [DisableDeviceLock initSBSD];

  const NSMutableDictionary * prefsWriter = [[NSMutableDictionary alloc]
    initWithContentsOfFile:
      @"/var/mobile/Library/Preferences/DisableDeviceLockPreferences.plist"];

  if (prefsWriter) {
    if ([DisableDeviceLock isNeverLocking]) {
      [prefsWriter setObject:@YES forKey:@"isEnabled"];
    }
  }

  onToggleTweak();
}

%end

