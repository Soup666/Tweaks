#import "Tweak.h"

%hook SBDockView
-(void)setBackgroundAlpha:(double)arg1 {
	%orig(1);
	if (testSwitch) {
		%orig(0);
	}
}
%end

static void loadPrefs(){
    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.soup.test.plist"];

    if(prefs){
    	testSwitch = ([prefs objectForKey:@"testSwitch"] ? [[prefs objectForKey:@"testSwitch"] boolValue] : testSwitch);
    }
}

%ctor {

if ([[[[NSProcessInfo processInfo] arguments] objectAtIndex:0] containsString:@"/Application"] || [[[[NSProcessInfo processInfo] arguments] objectAtIndex:0] containsString:@"SpringBoard.app"]) {
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.soup.test/settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
	loadPrefs();

  	%init;
	}
}
