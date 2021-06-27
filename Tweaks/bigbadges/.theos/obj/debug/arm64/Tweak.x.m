#line 1 "Tweak.x"
#import "Tweak.h"


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class SBIconBadgeView; 


#line 3 "Tweak.x"
static CGSize (*_logos_orig$Enabled$SBIconBadgeView$badgeSize)(_LOGOS_SELF_TYPE_NORMAL SBIconBadgeView* _LOGOS_SELF_CONST, SEL); static CGSize _logos_method$Enabled$SBIconBadgeView$badgeSize(_LOGOS_SELF_TYPE_NORMAL SBIconBadgeView* _LOGOS_SELF_CONST, SEL); 

BOOL Big = 1;


static CGSize _logos_method$Enabled$SBIconBadgeView$badgeSize(_LOGOS_SELF_TYPE_NORMAL SBIconBadgeView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {


	if (Big)  {
		return CGSizeMake(50, 50);
	}

	NSLog(@"Value of Big = %i", Big);
	return CGSizeMake(20, 20);
}




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





		{Class _logos_class$Enabled$SBIconBadgeView = objc_getClass("SBIconBadgeView"); { MSHookMessageEx(_logos_class$Enabled$SBIconBadgeView, @selector(badgeSize), (IMP)&_logos_method$Enabled$SBIconBadgeView$badgeSize, (IMP*)&_logos_orig$Enabled$SBIconBadgeView$badgeSize);}} } }  static __attribute__((constructor)) void _logosLocalCtor_59e7c8b3(int __unused argc, char __unused **argv, char __unused **envp) {
    loadPrefs();
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("bundleID/saved"), NULL, CFNotificationSuspensionBehaviorCoalesce);

}
