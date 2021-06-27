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
static void (*_logos_orig$Enabled$SBIconBadgeView$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL SBIconBadgeView* _LOGOS_SELF_CONST, SEL); static void _logos_method$Enabled$SBIconBadgeView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL SBIconBadgeView* _LOGOS_SELF_CONST, SEL); 


static void _logos_method$Enabled$SBIconBadgeView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL SBIconBadgeView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
     self.backgroundColor = [UIColor blueColor];
}




static void loadPrefs() {
	NSMutableDictionary *settings = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.soup.colourbadges.plist"];

	NSLog(@"Exists = %i",[settings objectForKey:@"kEnabled"] ? [[settings objectForKey:@"kEnabled"] boolValue] : NO);

	if ([settings objectForKey:@"kEnabled"] ? [[settings objectForKey:@"kEnabled"] boolValue] : NO) {




		{Class _logos_class$Enabled$SBIconBadgeView = objc_getClass("SBIconBadgeView"); { MSHookMessageEx(_logos_class$Enabled$SBIconBadgeView, @selector(layoutSubviews), (IMP)&_logos_method$Enabled$SBIconBadgeView$layoutSubviews, (IMP*)&_logos_orig$Enabled$SBIconBadgeView$layoutSubviews);}} } }  static __attribute__((constructor)) void _logosLocalCtor_2584b7b6(int __unused argc, char __unused **argv, char __unused **envp) {
    loadPrefs();
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("bundleID/saved"), NULL, CFNotificationSuspensionBehaviorCoalesce);

}
