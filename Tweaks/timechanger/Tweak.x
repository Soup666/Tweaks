#import "Tweak.h"
#import "Colours.h"

%hook SBFLockScreenDateView
-(void)setTextColor:(UIColor *)arg1 {
	UIColor *newColor = [UIColor colorWithHueDegrees:60 saturation:0.2 brightness:1.0];

	%orig(newColor);
}
%end

static void loadPrefs(){
    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.soup.timechanger.plist"];

    if(prefs){
    	sizeValue = ([prefs objectForKey:@"kSize"] ? [[prefs objectForKey:@"kSize"] intValue] : sizeValue);
    }
}

%ctor {

if ([[[[NSProcessInfo processInfo] arguments] objectAtIndex:0] containsString:@"/Application"] || [[[[NSProcessInfo processInfo] arguments] objectAtIndex:0] containsString:@"SpringBoard.app"]) {
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.soup.timechanger/settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
	loadPrefs();

  	%init;
	}
}
