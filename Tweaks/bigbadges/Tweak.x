#import "Tweak.h"

%group Enabled

BOOL Big = 1;

%hook SBIconBadgeView
-(CGSize)badgeSize {


	if (Big)  {
		return CGSizeMake(50, 50);
	}

	NSLog(@"Value of Big = %i", Big);
	return CGSizeMake(20, 20);
}
%end

%end

static void loadPrefs() {
	NSMutableDictionary *settings = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.soup.bigbadges.plist"];

	NSLog(@"Exists = %i",[settings objectForKey:@"kEnabled"] ? [[settings objectForKey:@"kEnabled"] boolValue] : NO);
	NSLog(@"Big %@", [settings objectForKey:@"kLarge"]);
	NSLog(@"Small %@", [settings objectForKey:@"kSmall"]);

	if ([settings objectForKey:@"kEnabled"] ? [[settings objectForKey:@"kEnabled"] boolValue] : NO) {
		if ([[settings objectForKey:@"kLarge"] boolValue]) {
			NSLog(@":Big %@", [settings objectForKey:@"kLarge"]);
			Big = YES;
		}

		if ([[settings objectForKey:@"kSmall"] boolValue]) {
			NSLog(@":Small %@", [settings objectForKey:@"kSmall"]);
			Big = NO;
		}

		%init(Enabled)
	}
}

%ctor {
    loadPrefs();
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("bundleID/saved"), NULL, CFNotificationSuspensionBehaviorCoalesce);

}