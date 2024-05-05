#import "mac.h"
void fuckyou() {
  [pidorasi onAim:@"enabled aim"];
  [pidorasi onEsp:@"enabled esp"];
  [pidorasi onMisc:@"enabled misc"];

//ВКЛАДКА target
  [pidorasi addSwitch:@"head"];                                                                                       
  [pidorasi addSwitch:@"chest"];
  [pidorasi addSwitch:@"legs"];
  [pidorasi addOffsetSwitch:@"switch v4" offsets:{} bytes:{}];

//ВКЛАДКА team
  [pidorasi onEspTeam:@"t-boxes"];
  [pidorasi onEspTeam:@"t-lines"];
  [pidorasi onEspTeam:@"t-distance"];
  [pidorasi onEspTeam:@"t-health"];
  [pidorasi addOffsetTeamEsp:@"switch v3" offsets:{} bytes:{}];

//ВКЛАДКА enemy
  [pidorasi onEspEnemy:@"e-boxes"];
  [pidorasi onEspEnemy:@"e-lines"];
  [pidorasi onEspEnemy:@"e-distance"];
  [pidorasi onEspEnemy:@"e-health"];
  [pidorasi addOffsetEnemyEsp:@"offset switch v2" offsets:{} bytes:{}];

//ВКЛАДКА player
  [pidorasi onMiscPlayer:@"jump" offsets:{} bytes:{}];
  [pidorasi onMiscPlayer:@"speed" offsets:{} bytes:{}];
  [pidorasi emptySwitchPlayerm:@"empty switch v3"];

//ВКЛАДКА other
  [pidorasi onMiscOther:@"no recoil" offsets:{} bytes:{}];
  [pidorasi onMiscOther:@"ammo" offsets:{} bytes:{}];
  [pidorasi emtySwitchOtherm:@"empty switch v2"];

//ВКЛАДКА main
  [pidorasi addSliderSwitch:@"fov" minimumValue:0 maximumValue:10];
  [pidorasi addOffsetAimbot:@"offset switch" offsets:{} bytes:{}];
  [pidorasi emptySwitchAimbot:@"empty switch"];
}
void fackyoux2() {
  osiris = [[View alloc]initWithTitle];
    fuckyou();
}
static void didFinishLaunching(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef info) { 
  timer(3) { 
        fackyoux2();
});
}

%ctor {
  CFNotificationCenterAddObserver(CFNotificationCenterGetLocalCenter(), NULL, &didFinishLaunching, (CFStringRef)UIApplicationDidFinishLaunchingNotification, NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
}