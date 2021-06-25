#line 1 "Tweak.x"
#import "Tweak.h"
#import "Colours.h"


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

@class SBFLockScreenDateView; 
static void (*_logos_orig$_ungrouped$SBFLockScreenDateView$setTextColor$)(_LOGOS_SELF_TYPE_NORMAL SBFLockScreenDateView* _LOGOS_SELF_CONST, SEL, UIColor *); static void _logos_method$_ungrouped$SBFLockScreenDateView$setTextColor$(_LOGOS_SELF_TYPE_NORMAL SBFLockScreenDateView* _LOGOS_SELF_CONST, SEL, UIColor *); 

#line 4 "Tweak.x"

static void _logos_method$_ungrouped$SBFLockScreenDateView$setTextColor$(_LOGOS_SELF_TYPE_NORMAL SBFLockScreenDateView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIColor * arg1) {
	UIColor *newColor = [UIColor colorFromHexString:@"#f587e4"];

	_logos_orig$_ungrouped$SBFLockScreenDateView$setTextColor$(self, _cmd, newColor);
}


static void loadPrefs(){
    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.soup.timechanger.plist"];

    if(prefs){
    	sizeValue = ([prefs objectForKey:@"kSize"] ? [[prefs objectForKey:@"kSize"] intValue] : sizeValue);
    }
}

static __attribute__((constructor)) void _logosLocalCtor_e641bec3(int __unused argc, char __unused **argv, char __unused **envp) {

if ([[[[NSProcessInfo processInfo] arguments] objectAtIndex:0] containsString:@"/Application"] || [[[[NSProcessInfo processInfo] arguments] objectAtIndex:0] containsString:@"SpringBoard.app"]) {
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.soup.timechanger/settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
	loadPrefs();

  	{Class _logos_class$_ungrouped$SBFLockScreenDateView = objc_getClass("SBFLockScreenDateView"); { MSHookMessageEx(_logos_class$_ungrouped$SBFLockScreenDateView, @selector(setTextColor:), (IMP)&_logos_method$_ungrouped$SBFLockScreenDateView$setTextColor$, (IMP*)&_logos_orig$_ungrouped$SBFLockScreenDateView$setTextColor$);}}
	}
}
