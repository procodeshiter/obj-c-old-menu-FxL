#import "switches.h"
@implementation pidoras

static View *osiris = [[View alloc]init];

- (void)onMiscOther:(NSString *)hackName_ offsets:(std::initializer_list<uint64_t>)offsets_ bytes:(std::initializer_list<uint64_t>)bytes_ {    
    std::vector<uint64_t> offsetVector;
    std::vector<uint64_t> bytesVector;    
    offsetVector.insert(offsetVector.begin(), offsets_.begin(), offsets_.end());
    bytesVector.insert(bytesVector.begin(), bytes_.begin(), bytes_.end());    
    OffsetPatcher * enOtherPlayr = [[OffsetPatcher alloc]initHackNamed:hackName_ offsets:offsetVector bytes:bytesVector];
    [osiris miscOtherPan: enOtherPlayr];
}

-(void)emptySwitchPlayerm:(NSString *)hackName_ {
    OffsetPatcher *eplayerm = [[OffsetPatcher alloc]initHackNamed:hackName_ offsets:std::vector<uint64_t>{} bytes:std::vector<uint64_t>{}];    
    [osiris miscPlayerPan: eplayerm];    
}

-(void)emtySwitchOtherm:(NSString *)hackName_ {
    OffsetPatcher *eotherm = [[OffsetPatcher alloc]initHackNamed:hackName_ offsets:std::vector<uint64_t>{} bytes:std::vector<uint64_t>{}];    
    [osiris miscOtherPan:eotherm];    
}

- (void)onMiscPlayer:(NSString *)hackName_ offsets:(std::initializer_list<uint64_t>)offsets_ bytes:(std::initializer_list<uint64_t>)bytes_ { 
    std::vector<uint64_t> offsetVector;
    std::vector<uint64_t> bytesVector;   
    offsetVector.insert(offsetVector.begin(), offsets_.begin(), offsets_.end());
    bytesVector.insert(bytesVector.begin(), bytes_.begin(), bytes_.end());    
    OffsetPatcher *enMiscPlayr = [[OffsetPatcher alloc]initHackNamed:hackName_ offsets:offsetVector bytes:bytesVector];    
    [osiris miscPlayerPan: enMiscPlayr];
}

-(void)onEspEnemy:(NSString *)hackName_ {
    OffsetPatcher *enEnemyEsp = [[OffsetPatcher alloc]initHackNamed:hackName_ offsets:std::vector<uint64_t>{} bytes:std::vector<uint64_t>{}];
    [osiris enemyEspPan: enEnemyEsp];    
}
- (void)addOffsetEnemyEsp:(NSString *)hackName_ offsets:(std::initializer_list<uint64_t>)offsets_ bytes:(std::initializer_list<uint64_t>)bytes_ {    
    std::vector<uint64_t> offsetVector;
    std::vector<uint64_t> bytesVector;    
    offsetVector.insert(offsetVector.begin(), offsets_.begin(), offsets_.end());
    bytesVector.insert(bytesVector.begin(), bytes_.begin(), bytes_.end());    
    OffsetPatcher *enemyespsw = [[OffsetPatcher alloc]initHackNamed:hackName_ offsets:offsetVector bytes:bytesVector];
    [osiris enemyEspPan: enemyespsw];
}

-(void)onEspTeam:(NSString *)hackName_ {
    OffsetPatcher *enTeamEsp = [[OffsetPatcher alloc]initHackNamed:hackName_ offsets:std::vector<uint64_t>{} bytes:std::vector<uint64_t>{}];    
    [osiris teamEspPan: enTeamEsp];    
}

- (void)addOffsetTeamEsp:(NSString *)hackName_ offsets:(std::initializer_list<uint64_t>)offsets_ bytes:(std::initializer_list<uint64_t>)bytes_ {    
    std::vector<uint64_t> offsetVector;
    std::vector<uint64_t> bytesVector;    
    offsetVector.insert(offsetVector.begin(), offsets_.begin(), offsets_.end());
    bytesVector.insert(bytesVector.begin(), bytes_.begin(), bytes_.end());    
    OffsetPatcher *teamespsw = [[OffsetPatcher alloc]initHackNamed:hackName_ offsets:offsetVector bytes:bytesVector];
    [osiris teamEspPan: teamespsw];
}

-(void)onMisc:(NSString *)hackName_ {
    OffsetPatcher *enMisc = [[OffsetPatcher alloc]initHackNamed:hackName_ offsets:std::vector<uint64_t>{} bytes:std::vector<uint64_t>{}];
    [osiris onMiscToMenu:enMisc];    
}

-(void)onEsp:(NSString *)hackName_ {
    OffsetPatcher *enEsp = [[OffsetPatcher alloc]initHackNamed:hackName_ offsets:std::vector<uint64_t>{} bytes:std::vector<uint64_t>{}];
    [osiris onEspToMenu:enEsp];    
}

-(void)onAim:(NSString *)hackName_ {
    OffsetPatcher *enAim = [[OffsetPatcher alloc]initHackNamed:hackName_ offsets:std::vector<uint64_t>{} bytes:std::vector<uint64_t>{}];
    [osiris onAimToMenu:enAim];    
}

-(void)emptySwitchAimbot:(NSString *)hackName_ {
    OffsetPatcher *swicth = [[OffsetPatcher alloc]initHackNamed:hackName_ offsets:std::vector<uint64_t>{} bytes:std::vector<uint64_t>{}];
    [osiris addToMain: swicth];
}

-(void)addSwitch:(NSString *)hackName_ {
    OffsetPatcher *offsetPatch = [[OffsetPatcher alloc]initHackNamed:hackName_ offsets:std::vector<uint64_t>{} bytes:std::vector<uint64_t>{}];
    [osiris addOffsetSwitchToMenu:offsetPatch];    
}

- (void)addOffsetSwitch:(NSString *)hackName_ offsets:(std::initializer_list<uint64_t>)offsets_ bytes:(std::initializer_list<uint64_t>)bytes_ {    
    std::vector<uint64_t> offsetVector;
    std::vector<uint64_t> bytesVector;    
    offsetVector.insert(offsetVector.begin(), offsets_.begin(), offsets_.end());
    bytesVector.insert(bytesVector.begin(), bytes_.begin(), bytes_.end());    
    OffsetPatcher *offsetPatch = [[OffsetPatcher alloc]initHackNamed:hackName_ offsets:offsetVector bytes:bytesVector];
    [osiris addOffsetSwitchToMenu:offsetPatch];
}

- (void)addOffsetAimbot:(NSString *)hackName_ offsets:(std::initializer_list<uint64_t>)offsets_ bytes:(std::initializer_list<uint64_t>)bytes_ {    
    std::vector<uint64_t> offsetVector;
    std::vector<uint64_t> bytesVector;    
    offsetVector.insert(offsetVector.begin(), offsets_.begin(), offsets_.end());
    bytesVector.insert(bytesVector.begin(), bytes_.begin(), bytes_.end());    
    OffsetPatcher *aimbotsw = [[OffsetPatcher alloc]initHackNamed:hackName_ offsets:offsetVector bytes:bytesVector];
    [osiris addToMain: aimbotsw];
}

- (void)addSliderSwitch:(NSString *)hackName_ minimumValue:(int)minimumValue_ maximumValue:(int)maximumValue_ {   
    SliderSwitch *sliderSwitch = [[SliderSwitch alloc] initSliderNamed:hackName_ minimumValue:minimumValue_ maximumValue:maximumValue_];    
    [osiris addSliderSwitchToMenu:sliderSwitch];
}

- (NSString *)getValueFromSwitch:(NSString *)name {
    NSString *correctKey =  [name stringByApplyingTransform:NSStringTransformLatinToCyrillic reverse:false];
    if([[NSUserDefaults standardUserDefaults] objectForKey:correctKey]) {
        return [[NSUserDefaults standardUserDefaults] objectForKey:correctKey];
    }
    else if([[NSUserDefaults standardUserDefaults] floatForKey:correctKey]) {
        NSString *sliderValue = [NSString stringWithFormat:@"%f", [[NSUserDefaults standardUserDefaults] floatForKey:correctKey]];
        return sliderValue;
    }
    return 0;
}

-(bool)isSwitchOn:(NSString *)switchName {
    return [[NSUserDefaults standardUserDefaults] boolForKey:switchName];
}

@end
