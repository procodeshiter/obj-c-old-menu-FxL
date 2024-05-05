#import "View.h"
@interface pidoras : UIButton
-(void)addSwitch:(NSString *)hackName_;
-(void)emptySwitchAimbot:(NSString *)hackName_;
-(void)onAim:(NSString *)hackName_;

-(void)onEsp:(NSString *)hackName_;
-(void)onEspTeam:(NSString *)hackName_;
-(void)addOffsetTeamEsp:(NSString *)hackName_ offsets:(std::initializer_list<uint64_t>)offsets_ bytes:(std::initializer_list<uint64_t>)bytes_;
-(void)onEspEnemy:(NSString *)hackName_;
-(void)addOffsetEnemyEsp:(NSString *)hackName_ offsets:(std::initializer_list<uint64_t>)offsets_ bytes:(std::initializer_list<uint64_t>)bytes_;

-(void)onMisc:(NSString *)hackName_;
-(void)onMiscPlayer:(NSString *)hackName_ offsets:(std::initializer_list<uint64_t>)offsets_ bytes:(std::initializer_list<uint64_t>)bytes_;
-(void)onMiscOther:(NSString *)hackName_ offsets:(std::initializer_list<uint64_t>)offsets_ bytes:(std::initializer_list<uint64_t>)bytes_;
-(void)emptySwitchPlayerm:(NSString *)hackName_;
-(void)emtySwitchOtherm:(NSString *)hackName_;

-(void)addOffsetSwitch:(NSString *)hackName_ offsets:(std::initializer_list<uint64_t>)offsets_ bytes:(std::initializer_list<uint64_t>)bytes_;

-(void)addOffsetAimbot:(NSString *)hackName_ offsets:(std::initializer_list<uint64_t>)offsets_ bytes:(std::initializer_list<uint64_t>)bytes_;

-(void)addSliderSwitch:(NSString *)hackName_ minimumValue:(int)minimumValue_ maximumValue:(int)maximumValue_;

-(NSString *)getValueFromSwitch:(NSString *)name;
-(bool)isSwitchOn:(NSString *)switchName;

@end
