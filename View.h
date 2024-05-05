#import <vector>
#import "UIKit/UIKit.h"
#import "KittyMemory/writeData.hpp"
#import "KittyMemory/MemoryPatch.hpp"
#import "KittyMemory/initializer_list"

@class OffsetPatcher;
@class TextFieldSwitch;
@class SliderSwitch;

@interface View : UIView

-(id)initWithTitle;

-(void)miscPlayerPan:(OffsetPatcher *)switchMiscPlayer;
-(void)enemyEspPan:(OffsetPatcher *)switchEnemyEsp;   
-(void)teamEspPan:(OffsetPatcher *)switchTeamEsp;
-(void)onAimToMenu:(OffsetPatcher *)onAimbot;
-(void)onEspToMenu:(OffsetPatcher *)onEsp;
-(void)onMiscToMenu:(OffsetPatcher *)onMisc;
-(void)addOffsetSwitchToMenu:(OffsetPatcher *)offsetPatcher;
-(void)addSliderSwitchToMenu:(SliderSwitch *)sliderSwitch;
-(void)addToMain:(OffsetPatcher *)offsetPatcher;
-(void)miscOtherPan:(OffsetPatcher *)switchOtherPlayer;
@end

@interface OffsetPatcher : UIButton
- (id)initHackNamed:(NSString *)hackName_ offsets:(std::vector<uint64_t>)offsets_ bytes:(std::vector<uint64_t>)bytes_;
-(NSString *)getPreferencesKey;
-(std::vector<uint64_t>)getOffsets;
- (std::vector<uint64_t>)getBytes;
- (std::vector<MemoryPatch>)getMemoryPatches;
@end

@interface SliderSwitch : UIButton
- (id)initSliderNamed:(NSString *)hackName_ minimumValue:(int)minimumValue_ maximumValue:(int)maximumValue_;
-(NSString *)getPreferencesKey;
-(NSString *)getSwitchValueKey;
@end
