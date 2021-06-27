#import "Tweak.h"

%group Enabled

%hook SBIconBadgeView
-(void)layoutSubviews {
     self.backgroundColor = [UIColor blueColor];
}
%end

%end

static void loadPrefs() {
	NSMutableDictionary *settings = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.soup.colourbadges.plist"];

	NSLog(@"Exists = %i",[settings objectForKey:@"kEnabled"] ? [[settings objectForKey:@"kEnabled"] boolValue] : NO);

	if ([settings objectForKey:@"kEnabled"] ? [[settings objectForKey:@"kEnabled"] boolValue] : NO) {
		%init(Enabled)
	}
}

%ctor {
    loadPrefs();
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("bundleID/saved"), NULL, CFNotificationSuspensionBehaviorCoalesce);

}