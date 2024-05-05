#define UIColorFromHex(hexColor) [UIColor colorWithRed:((float)((hexColor & 0xFF0000) >> 16))/255.0 green:((float)((hexColor & 0xFF00) >> 8))/255.0 blue:((float)(hexColor & 0xFF))/255.0 alpha:1.0]
#import <Foundation/Foundation.h>
#import "switches.h"

@implementation View {
    UIWindow *mainWindow;
    CGPoint lastMenuLocation;
    UIView *background;
    UIView *button; 
}
UIView *header;
NSUserDefaults *defaults;
NSData *donedata;
NSData *poloskadata;
UIView *onaimbotv;
UIView *offaimbotv;
UIView *onlrv;
UIView *offlrv;
UIView *onvisv;
UIView *offvisv;
UIView *onmisv;
UIView *offmisv;
UIView *oninfov;
UIView *offinfov;
UIScrollView *targetpan;
UIScrollView *aimpan;
UIScrollView *espselfpan;
UIScrollView *espenemypan;
UIScrollView *playermpan;
UIScrollView *otherpan;
UIScrollView *aimbots;
UIScrollView *visuals;
UIScrollView *misc;

float scrollViewHeight = 0;
float teamesp = 0;
float enemyesp = 0;
float gg = 0;
float miscplayer = 0;
float otherp = 0;

-(id)initWithTitle {
mainWindow = [UIApplication sharedApplication].keyWindow;
defaults = [NSUserDefaults standardUserDefaults];
NSURL *doneurl = [NSURL URLWithString:@"https://i.ibb.co/F89gSRX/939684-B1-5-C26-4-D7-D-9434-BEBDDBB0-C944.png"];
donedata = [NSData dataWithContentsOfURL: doneurl];
NSURL *poloskaurl = [NSURL URLWithString:@"https://i.ibb.co/M7jhJRm/8-E2717-F8-8408-4-A8-B-9454-5024-D9-D386-AF.png"];
poloskadata = [NSData dataWithContentsOfURL: poloskaurl];

    button = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
    button.backgroundColor = [UIColor clearColor];
    button.center = mainWindow.center;
    [mainWindow addSubview: button];

    UITapGestureRecognizer *show = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(showMenu:)];
    [button addGestureRecognizer: show];

    self = [super initWithFrame:CGRectMake(0, 0, 320, 300)]; 
    self.center = mainWindow.center;
    self.layer.opacity = 0.0f;

    header = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 55)];
    header.backgroundColor = UIColorFromHex(0x34343c);
    CAShapeLayer *headerLayer = [CAShapeLayer layer];
    headerLayer.path = [UIBezierPath bezierPathWithRoundedRect: header.bounds byRoundingCorners: UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii: (CGSize){15.0, 15.0}].CGPath;
    header.layer.mask = headerLayer;
    [self addSubview: header];

    UIView *backgroundline = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 11)];
    backgroundline.layer.shadowOpacity = 1;
    backgroundline.layer.shadowColor = UIColorFromHex(0x1482ff).CGColor;
    backgroundline.layer.shadowRadius = 7;
    [header addSubview: backgroundline];
UIImage *poloskaimage = [UIImage imageWithData: poloskadata];
UIImageView *lineimage = [[UIImageView alloc] initWithImage: poloskaimage];
lineimage.frame = backgroundline.bounds;
[backgroundline addSubview: lineimage];

    UIView *handle = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 55)];
    handle.backgroundColor = [UIColor clearColor];
    [header addSubview: handle];

    UITapGestureRecognizer *close = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideMenu:)];
    close.numberOfTapsRequired = 1;
    [handle addGestureRecognizer: close];

    UIPanGestureRecognizer *dragMenuRecognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(menuDragged:)];
    [header addGestureRecognizer:dragMenuRecognizer];

    UIView *linevert = [[UIView alloc]initWithFrame:CGRectMake(100, 21, 1.5, 22.5)];
    linevert.backgroundColor = UIColorFromHex(0x3b3e47);
    [header addSubview: linevert];

    onaimbotv = [[UIView alloc]initWithFrame:CGRectMake(116.5, 22.5, 65, 20)];
    onaimbotv.backgroundColor = UIColorFromHex(0x3b3e47);
CAShapeLayer *onaimbotvLayer = [CAShapeLayer layer];
    onaimbotvLayer.path = [UIBezierPath bezierPathWithRoundedRect: onaimbotv.bounds byRoundingCorners: UIRectCornerAllCorners cornerRadii: (CGSize){7.0}].CGPath;
    onaimbotv.layer.mask = onaimbotvLayer;
    [header addSubview: onaimbotv];

    offaimbotv = [[UIView alloc]initWithFrame:CGRectMake(116.5, 22.5, 65, 20)];
    offaimbotv.backgroundColor = UIColorFromHex(0x34343c);
    offaimbotv.alpha = 0;
CAShapeLayer *offaimbotvLayer = [CAShapeLayer layer];
    offaimbotvLayer.path = [UIBezierPath bezierPathWithRoundedRect: offaimbotv.bounds byRoundingCorners: UIRectCornerAllCorners cornerRadii: (CGSize){7.0}].CGPath;
    offaimbotv.layer.mask = offaimbotvLayer;
    [header addSubview: offaimbotv];

    UITapGestureRecognizer *taponav = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(taponAimbotV:)];
    taponav.numberOfTapsRequired = 1;
    [offaimbotv addGestureRecognizer: taponav];

    onvisv = [[UIView alloc]initWithFrame:CGRectMake(186.5, 22.5, 62, 20)];
    onvisv.backgroundColor = UIColorFromHex(0x3b3e47);
CAShapeLayer *onvisvLayer = [CAShapeLayer layer];
    onvisvLayer.path = [UIBezierPath bezierPathWithRoundedRect: onvisv.bounds byRoundingCorners: UIRectCornerAllCorners cornerRadii: (CGSize){7.0}].CGPath;
    onvisv.layer.mask = onvisvLayer;
    [header addSubview: onvisv];
    offvisv = [[UIView alloc]initWithFrame:CGRectMake(186.5, 22.5, 62, 20)];
    offvisv.backgroundColor = UIColorFromHex(0x34343c);
CAShapeLayer *offvisvLayer = [CAShapeLayer layer];
    offvisvLayer.path = [UIBezierPath bezierPathWithRoundedRect: offvisv.bounds byRoundingCorners: UIRectCornerAllCorners cornerRadii: (CGSize){7.0}].CGPath;
    offvisv.layer.mask = offvisvLayer;
    [header addSubview: offvisv];

    UITapGestureRecognizer *taponvv = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(taponVisV:)];
    taponvv.numberOfTapsRequired = 1;
    [offvisv addGestureRecognizer: taponvv];

    onmisv = [[UIView alloc]initWithFrame:CGRectMake(254, 22.5, 50, 20)];
    onmisv.backgroundColor = UIColorFromHex(0x3b3e47);
CAShapeLayer *onmisvLayer = [CAShapeLayer layer];
    onmisvLayer.path = [UIBezierPath bezierPathWithRoundedRect: onmisv.bounds byRoundingCorners: UIRectCornerAllCorners cornerRadii: (CGSize){7.0}].CGPath;
    onmisv.layer.mask = onmisvLayer;
    [header addSubview: onmisv];
    offmisv = [[UIView alloc]initWithFrame:CGRectMake(254, 22.5, 50, 20)];
    offmisv.backgroundColor = UIColorFromHex(0x34343c);
CAShapeLayer *offmisvLayer = [CAShapeLayer layer];
    offmisvLayer.path = [UIBezierPath bezierPathWithRoundedRect: offmisv.bounds byRoundingCorners: UIRectCornerAllCorners cornerRadii: (CGSize){7.0}].CGPath;
    offmisv.layer.mask = offmisvLayer;
    [header addSubview: offmisv];

    UITapGestureRecognizer *taponmv = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(taponMiscV:)];
    taponmv.numberOfTapsRequired = 1;
    [offmisv addGestureRecognizer: taponmv];

UILabel *aimbott = [[UILabel alloc]initWithFrame:CGRectMake(130, 4, header.bounds.size.width, header.bounds.size.height)];
aimbott.text = [NSString stringWithFormat:@"aimbot"];
aimbott.font = [UIFont fontWithName:@"Avenir" size:12.0f];
[header addSubview: aimbott];
UILabel *vist = [[UILabel alloc]initWithFrame:CGRectMake(200, 4, header.bounds.size.width, header.bounds.size.height)];
vist.text = [NSString stringWithFormat:@"visuals"];
vist.font = [UIFont fontWithName:@"Avenir" size:12.0f];
[header addSubview: vist];
UILabel *mist = [[UILabel alloc]initWithFrame:CGRectMake(267, 4, header.bounds.size.width, header.bounds.size.height)];
mist.text = [NSString stringWithFormat:@"misc"];
mist.font = [UIFont fontWithName:@"Avenir" size:12.0f];
[header addSubview: mist];
UILabel *namecheat = [[UILabel alloc]initWithFrame:CGRectMake(28.5, 4, handle.bounds.size.width, handle.bounds.size.height)];
namecheat.text = [NSString stringWithFormat:@"brutaltrip"];
namecheat.font = [UIFont fontWithName:@"Avenir-Heavy" size:12.0f];
[handle addSubview: namecheat];

    misc = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 65, self.bounds.size.width, 235)];
    misc.backgroundColor = UIColorFromHex(0x34343c);
    CAShapeLayer *miscLayer = [CAShapeLayer layer];
    miscLayer.path = [UIBezierPath bezierPathWithRoundedRect: misc.bounds byRoundingCorners: UIRectCornerAllCorners cornerRadii: (CGSize){15.0}].CGPath;
    misc.layer.mask = miscLayer;
    [self addSubview: misc];

    UIView *backgroundplayerm = [[UIView alloc]initWithFrame:CGRectMake(15, 50, misc.bounds.size.width/2 - 22.5, misc.bounds.size.height - 64)];
    CAShapeLayer *playermpanLayer = [CAShapeLayer layer];
    playermpanLayer.path = [UIBezierPath bezierPathWithRoundedRect: backgroundplayerm.bounds byRoundingCorners: UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii: (CGSize){10.0, 10.0}].CGPath;
    backgroundplayerm.layer.mask = playermpanLayer;
    [misc addSubview: backgroundplayerm];
UIImageView *linepanplayerm = [[UIImageView alloc] initWithImage: poloskaimage];
linepanplayerm.frame = backgroundplayerm.bounds;
[backgroundplayerm addSubview: linepanplayerm];
UILabel *playerpant = [[UILabel alloc]initWithFrame:CGRectMake(108, 35.5, 120, 15)];
playerpant.text = [NSString stringWithFormat:@"player"];
playerpant.textColor = UIColorFromHex(0x01a7ff);
playerpant.font = [UIFont fontWithName:@"DamascusBold" size:12];
[misc addSubview: playerpant];
    playermpan = [[UIScrollView alloc]initWithFrame:CGRectMake(15, 61, misc.bounds.size.width/2 - 22.5, misc.bounds.size.height - 75)];
    playermpan.backgroundColor = UIColorFromHex(0x3a3a46);
    [misc addSubview: playermpan];

    UIView *backgroundotherpan = [[UIView alloc]initWithFrame:CGRectMake(playermpan.bounds.size.width + 30, 50, playermpan.bounds.size.width, playermpan.bounds.size.height)];
    CAShapeLayer *otherpanLayer = [CAShapeLayer layer];
    otherpanLayer.path = [UIBezierPath bezierPathWithRoundedRect: backgroundotherpan.bounds byRoundingCorners: UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii: (CGSize){10.0, 10.0}].CGPath;
    backgroundotherpan.layer.mask = otherpanLayer;
    [misc addSubview: backgroundotherpan];
UIImageView *linepanother = [[UIImageView alloc] initWithImage: poloskaimage];
linepanother.frame = backgroundotherpan.bounds;
[backgroundotherpan addSubview: linepanother];
UILabel *otherpant = [[UILabel alloc]initWithFrame:CGRectMake(265, 35.5, 120, 15)]; 
otherpant.text = [NSString stringWithFormat:@"other"];
otherpant.textColor = UIColorFromHex(0x01a7ff);
otherpant.font = [UIFont fontWithName:@"DamascusBold" size:12];
[misc addSubview: otherpant];
   otherpan = [[UIScrollView alloc]initWithFrame:CGRectMake(playermpan.bounds.size.width + 30, 61, playermpan.bounds.size.width, playermpan.bounds.size.height)];
    otherpan.backgroundColor = UIColorFromHex(0x3a3a46);
    [misc addSubview: otherpan];

    visuals = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 65, self.bounds.size.width, 235)];
    visuals.backgroundColor = UIColorFromHex(0x34343c);
    CAShapeLayer *visualsLayer = [CAShapeLayer layer];
    visualsLayer.path = [UIBezierPath bezierPathWithRoundedRect: visuals.bounds byRoundingCorners: UIRectCornerAllCorners cornerRadii: (CGSize){15.0}].CGPath;
    visuals.layer.mask = visualsLayer;
    [self addSubview: visuals];

    UIView *backgroundselfpan = [[UIView alloc]initWithFrame:CGRectMake(15, 50, visuals.bounds.size.width/2 - 22.5, visuals.bounds.size.height - 64)];
    CAShapeLayer *espselfpanLayer = [CAShapeLayer layer];
    espselfpanLayer.path = [UIBezierPath bezierPathWithRoundedRect: backgroundselfpan.bounds byRoundingCorners: UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii: (CGSize){10.0, 10.0}].CGPath;
    backgroundselfpan.layer.mask = espselfpanLayer;
    [visuals addSubview: backgroundselfpan];
UIImageView *linepanself = [[UIImageView alloc] initWithImage: poloskaimage];
linepanself.frame = backgroundselfpan.bounds;
[backgroundselfpan addSubview: linepanself];
UILabel *espselfpant = [[UILabel alloc]initWithFrame:CGRectMake(114, 35.5, 120, 15)];
espselfpant.text = [NSString stringWithFormat:@"team"];
espselfpant.textColor = UIColorFromHex(0x01a7ff); 
espselfpant.font = [UIFont fontWithName:@"DamascusBold" size:12];
[visuals addSubview: espselfpant];
    espselfpan = [[UIScrollView alloc]initWithFrame:CGRectMake(15, 61, visuals.bounds.size.width/2 - 22.5, visuals.bounds.size.height - 75)];
    espselfpan.backgroundColor = UIColorFromHex(0x3a3a46);
    [visuals addSubview: espselfpan];

    UIView *backgroundenemypan = [[UIView alloc]initWithFrame:CGRectMake(espselfpan.bounds.size.width + 30, 50, espselfpan.bounds.size.width, espselfpan.bounds.size.height)];
    CAShapeLayer *espenemypanLayer = [CAShapeLayer layer];
    espenemypanLayer.path = [UIBezierPath bezierPathWithRoundedRect: backgroundenemypan.bounds byRoundingCorners: UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii: (CGSize){10.0, 10.0}].CGPath;
    backgroundenemypan.layer.mask = espenemypanLayer;
    [visuals addSubview: backgroundenemypan];
UIImageView *linepanenemy = [[UIImageView alloc] initWithImage: poloskaimage];
linepanenemy.frame = backgroundenemypan.bounds;
[backgroundenemypan addSubview: linepanenemy];
UILabel *espenemypant = [[UILabel alloc]initWithFrame:CGRectMake(257, 35.5, 120, 15)];
espenemypant.text = [NSString stringWithFormat:@"enemy"];
espenemypant.textColor = UIColorFromHex(0x01a7ff);
espenemypant.font = [UIFont fontWithName:@"DamascusBold" size:12];
[visuals addSubview: espenemypant];
    espenemypan = [[UIScrollView alloc]initWithFrame:CGRectMake(espselfpan.bounds.size.width + 30, 61, espselfpan.bounds.size.width, espselfpan.bounds.size.height)];
    espenemypan.backgroundColor = UIColorFromHex(0x3a3a46);
    [visuals addSubview: espenemypan];

    aimbots = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 65, self.bounds.size.width, 235)];
    aimbots.backgroundColor = UIColorFromHex(0x34343c);
    CAShapeLayer *aimbotsLayer = [CAShapeLayer layer];
    aimbotsLayer.path = [UIBezierPath bezierPathWithRoundedRect: aimbots.bounds byRoundingCorners: UIRectCornerAllCorners cornerRadii: (CGSize){15.0}].CGPath;
    aimbots.layer.mask = aimbotsLayer;
    [self addSubview: aimbots];

    UIView *backgroundaim = [[UIView alloc]initWithFrame:CGRectMake(15, 50, aimbots.bounds.size.width/2 - 22.5, aimbots.bounds.size.height - 64)];
    CAShapeLayer *aimpanLayer = [CAShapeLayer layer];
    aimpanLayer.path = [UIBezierPath bezierPathWithRoundedRect: backgroundaim.bounds byRoundingCorners: UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii: (CGSize){10.0, 10.0}].CGPath;
    backgroundaim.layer.mask = aimpanLayer;
    [aimbots addSubview: backgroundaim];
UIImageView *linepanaim = [[UIImageView alloc] initWithImage: poloskaimage];
linepanaim.frame = backgroundaim.bounds;
[backgroundaim addSubview: linepanaim];
UILabel *enaimt = [[UILabel alloc]initWithFrame:CGRectMake(114, 35.5, 120, 15)];
enaimt.text = [NSString stringWithFormat:@"main"];
enaimt.textColor = UIColorFromHex(0x01a7ff);
enaimt.font = [UIFont fontWithName:@"DamascusBold" size:12];
[aimbots addSubview: enaimt];
    aimpan = [[UIScrollView alloc]initWithFrame:CGRectMake(15, 61, aimbots.bounds.size.width/2 - 22.5, aimbots.bounds.size.height - 75)];
    aimpan.backgroundColor = UIColorFromHex(0x3a3a46);
    [aimbots addSubview: aimpan];

    UIView *backgroundtarget = [[UIView alloc]initWithFrame:CGRectMake(aimpan.bounds.size.width + 30, 50, aimpan.bounds.size.width, aimpan.bounds.size.height)];
    CAShapeLayer *backgroundtargetLayer = [CAShapeLayer layer];
    backgroundtargetLayer.path = [UIBezierPath bezierPathWithRoundedRect: backgroundtarget.bounds byRoundingCorners: UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii: (CGSize){10.0, 10.0}].CGPath;
    backgroundtarget.layer.mask = backgroundtargetLayer;
    [aimbots addSubview: backgroundtarget];
UIImageView *linepantarget = [[UIImageView alloc] initWithImage: poloskaimage];
linepantarget.frame = backgroundtarget.bounds;
[backgroundtarget addSubview: linepantarget];
UILabel *targettitle = [[UILabel alloc]initWithFrame:CGRectMake(261, 35.5, 120, 15)];
targettitle.text = [NSString stringWithFormat:@"target"];
targettitle.textColor = UIColorFromHex(0x01a7ff);
targettitle.font = [UIFont fontWithName:@"DamascusBold" size:12];
[aimbots addSubview: targettitle];
    targetpan = [[UIScrollView alloc]initWithFrame:CGRectMake(aimpan.bounds.size.width + 30, 61, aimpan.bounds.size.width, aimpan.bounds.size.height)];
    targetpan.backgroundColor = UIColorFromHex(0x3a3a46);
    [aimbots addSubview: targetpan];

    [mainWindow addSubview:self];
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    lastMenuLocation = CGPointMake(self.frame.origin.x, self.frame.origin.y);
    
    [super touchesBegan:touches withEvent:event];
}

- (void)menuDragged:(UIPanGestureRecognizer *)pan {
    CGPoint newLocation = [pan translationInView:self.superview];    
    self.frame = CGRectMake(lastMenuLocation.x + newLocation.x, lastMenuLocation.y + newLocation.y, self.frame.size.width, self.frame.size.height);
}

- (void)taponAimbotV:(UITapGestureRecognizer *)tapclos {
    if(tapclos.state == UIGestureRecognizerStateEnded) {
    offaimbotv.alpha = 0; 
    onaimbotv.alpha = 1;
    offvisv.alpha = 1; 
    onvisv.alpha = 0;
    offmisv.alpha = 1; 
    onmisv.alpha = 0;
    misc.alpha = 0;
    aimbots.alpha = 1;
    visuals.alpha = 0;
    }
  }

- (void)taponVisV:(UITapGestureRecognizer *)tapclos {
    if(tapclos.state == UIGestureRecognizerStateEnded) {
    offvisv.alpha = 0;
    onvisv.alpha = 1;
    offaimbotv.alpha = 1; 
    onaimbotv.alpha = 0;
    offmisv.alpha = 1; 
    onmisv.alpha = 0;
    aimbots.alpha = 0;
    misc.alpha = 0;
    visuals.alpha = 1;
    }
  }

- (void)taponMiscV:(UITapGestureRecognizer *)tapclos {
    if(tapclos.state == UIGestureRecognizerStateEnded) {
    aimbots.alpha = 0;
    misc.alpha = 1;
    visuals.alpha = 0;
    offmisv.alpha = 0; 
    onmisv.alpha = 1;
    offaimbotv.alpha = 1; 
    onaimbotv.alpha = 0;
    offvisv.alpha = 1; 
    onvisv.alpha = 0;
    }
}

- (void)hideMenu:(UITapGestureRecognizer *)tap {
    if(tap.state == UIGestureRecognizerStateEnded) {
           self.alpha = 0;
           background.alpha = 0;
           button.alpha = 1;
    }
}

-(void)showMenu:(UITapGestureRecognizer *)tapGestureRecognizer {
    if(tapGestureRecognizer.state == UIGestureRecognizerStateEnded) {
            self.alpha = 1;
            button.alpha = 0;
            background.alpha = 1;
            restoreLastSession();      
    }
}

void restoreLastSession() {
for(SliderSwitch *sl in aimpan.subviews) {
        if([sl isKindOfClass:[SliderSwitch class]]) {
            if([defaults boolForKey:[sl getPreferencesKey]]) {
                sl.layer.contents = (id)[UIImage imageWithData: donedata].CGImage;
            } else {
                sl.layer.contents = nil;
            }
        }
    }
for(OffsetPatcher *op in targetpan.subviews) {
        if([op isKindOfClass:[OffsetPatcher class]]) {            
            std::vector<uint64_t> offsets = [op getOffsets];
            std::vector<uint64_t>bytes = [op getBytes];
            std::vector<MemoryPatch> memoryPatches = [op getMemoryPatches];           
            if([defaults boolForKey:[op getPreferencesKey]]) {
                op.layer.contents = (id)[UIImage imageWithData: donedata].CGImage;                
                for(int i = 0; i < offsets.size(); i++) {
                    if(memoryPatches[i].Modify()) {
                       NSLog(@"[Mod Menu] - Patched succesfully!");
                    } else {
                        NSLog(@"[Mod Menu] - Patched unsuccesfully...");
                    }
                }
            } 
            else {
                op.layer.contents = nil;                
                for(int i = 0; i < offsets.size(); i++) {
                    if(memoryPatches[i].Restore()) {
                        NSLog(@"[Mod Menu] - Restored succesfully!");
                    } else {
                        NSLog(@"[Mod Menu] - Restored unsuccesfully...");
                    }
                }
            }
        }
    }
    for(OffsetPatcher *aim in aimbots.subviews) {
        if([aim isKindOfClass:[OffsetPatcher class]]) {            
            std::vector<uint64_t> offsets = [aim getOffsets];
            std::vector<uint64_t>bytes = [aim getBytes];
            std::vector<MemoryPatch> memoryPatches = [aim getMemoryPatches];           
            if([defaults boolForKey:[aim getPreferencesKey]]) {
                aim.layer.contents = (id)[UIImage imageWithData: donedata].CGImage;                
                for(int i = 0; i < offsets.size(); i++) {
                    if(memoryPatches[i].Modify()) {
                       NSLog(@"[Mod Menu] - Patched succesfully!");
                    } else {
                        NSLog(@"[Mod Menu] - Patched unsuccesfully...");
                    }
                }
            } 
            else {
                aim.layer.contents = nil;                
                for(int i = 0; i < offsets.size(); i++) {
                    if(memoryPatches[i].Restore()) {
                        NSLog(@"[Mod Menu] - Restored succesfully!");
                    } else {
                        NSLog(@"[Mod Menu] - Restored unsuccesfully...");
                    }
                }
            }
        }
    }
    for(OffsetPatcher *esp in visuals.subviews) {
        if([esp isKindOfClass:[OffsetPatcher class]]) {            
            std::vector<uint64_t> offsets = [esp getOffsets];
            std::vector<uint64_t>bytes = [esp getBytes];
            std::vector<MemoryPatch> memoryPatches = [esp getMemoryPatches];           
            if([defaults boolForKey:[esp getPreferencesKey]]) {
                esp.layer.contents = (id)[UIImage imageWithData: donedata].CGImage;                
                for(int i = 0; i < offsets.size(); i++) {
                    if(memoryPatches[i].Modify()) {
                       NSLog(@"[Mod Menu] - Patched succesfully!");
                    } else {
                        NSLog(@"[Mod Menu] - Patched unsuccesfully...");
                    }
                }
            } 
            else {
                esp.layer.contents = nil;                
                for(int i = 0; i < offsets.size(); i++) {
                    if(memoryPatches[i].Restore()) {
                        NSLog(@"[Mod Menu] - Restored succesfully!");
                    } else {
                        NSLog(@"[Mod Menu] - Restored unsuccesfully...");
                    }
                }
            }
        }
    }
for(OffsetPatcher *teamp in espselfpan.subviews) {
        if([teamp isKindOfClass:[OffsetPatcher class]]) {            
            std::vector<uint64_t> offsets = [teamp getOffsets];
            std::vector<uint64_t>bytes = [teamp getBytes];
            std::vector<MemoryPatch> memoryPatches = [teamp getMemoryPatches];           
            if([defaults boolForKey:[teamp getPreferencesKey]]) {
                teamp.layer.contents = (id)[UIImage imageWithData: donedata].CGImage;                
                for(int i = 0; i < offsets.size(); i++) {
                    if(memoryPatches[i].Modify()) {
                       NSLog(@"[Mod Menu] - Patched succesfully!");
                    } else {
                        NSLog(@"[Mod Menu] - Patched unsuccesfully...");
                    }
                }
            } 
            else {
                teamp.layer.contents = nil;                
                for(int i = 0; i < offsets.size(); i++) {
                    if(memoryPatches[i].Restore()) {
                        NSLog(@"[Mod Menu] - Restored succesfully!");
                    } else {
                        NSLog(@"[Mod Menu] - Restored unsuccesfully...");
                    }
                }
            }
        }
    }
for(OffsetPatcher *enemyp in espenemypan.subviews) {
        if([enemyp isKindOfClass:[OffsetPatcher class]]) {            
            std::vector<uint64_t> offsets = [enemyp getOffsets];
            std::vector<uint64_t>bytes = [enemyp getBytes];
            std::vector<MemoryPatch> memoryPatches = [enemyp getMemoryPatches];           
            if([defaults boolForKey:[enemyp getPreferencesKey]]) {
                enemyp.layer.contents = (id)[UIImage imageWithData: donedata].CGImage;                
                for(int i = 0; i < offsets.size(); i++) {
                    if(memoryPatches[i].Modify()) {
                       NSLog(@"[Mod Menu] - Patched succesfully!");
                    } else {
                        NSLog(@"[Mod Menu] - Patched unsuccesfully...");
                    }
                }
            } 
            else {
                enemyp.layer.contents = nil;                
                for(int i = 0; i < offsets.size(); i++) {
                    if(memoryPatches[i].Restore()) {
                        NSLog(@"[Mod Menu] - Restored succesfully!");
                    } else {
                        NSLog(@"[Mod Menu] - Restored unsuccesfully...");
                    }
                }
            }
        }
    }
for(OffsetPatcher *miscc in misc.subviews) {
        if([miscc isKindOfClass:[OffsetPatcher class]]) {            
            std::vector<uint64_t> offsets = [miscc getOffsets];
            std::vector<uint64_t>bytes = [miscc getBytes];
            std::vector<MemoryPatch> memoryPatches = [miscc getMemoryPatches];           
            if([defaults boolForKey:[miscc getPreferencesKey]]) {
                miscc.layer.contents = (id)[UIImage imageWithData: donedata].CGImage;                
                for(int i = 0; i < offsets.size(); i++) {
                    if(memoryPatches[i].Modify()) {
                       NSLog(@"[Mod Menu] - Patched succesfully!");
                    } else {
                        NSLog(@"[Mod Menu] - Patched unsuccesfully...");
                    }
                }
            } 
            else {
                miscc.layer.contents = nil;                
                for(int i = 0; i < offsets.size(); i++) {
                    if(memoryPatches[i].Restore()) {
                        NSLog(@"[Mod Menu] - Restored succesfully!");
                    } else {
                        NSLog(@"[Mod Menu] - Restored unsuccesfully...");
                    }
                }
            }
        }
    }
for(OffsetPatcher *miscpp in playermpan.subviews) {
        if([miscpp isKindOfClass:[OffsetPatcher class]]) {            
            std::vector<uint64_t> offsets = [miscpp getOffsets];
            std::vector<uint64_t>bytes = [miscpp getBytes];
            std::vector<MemoryPatch> memoryPatches = [miscpp getMemoryPatches];           
            if([defaults boolForKey:[miscpp getPreferencesKey]]) {
                miscpp.layer.contents = (id)[UIImage imageWithData: donedata].CGImage;                
                for(int i = 0; i < offsets.size(); i++) {
                    if(memoryPatches[i].Modify()) {
                       NSLog(@"[Mod Menu] - Patched succesfully!");
                    } else {
                        NSLog(@"[Mod Menu] - Patched unsuccesfully...");
                    }
                }
            } 
            else {
                miscpp.layer.contents = nil;                
                for(int i = 0; i < offsets.size(); i++) {
                    if(memoryPatches[i].Restore()) {
                        NSLog(@"[Mod Menu] - Restored succesfully!");
                    } else {
                        NSLog(@"[Mod Menu] - Restored unsuccesfully...");
                    }
                }
            }
        }
    }
for(OffsetPatcher *otherp in otherpan.subviews) {
        if([otherp isKindOfClass:[OffsetPatcher class]]) {            
            std::vector<uint64_t> offsets = [otherp getOffsets];
            std::vector<uint64_t>bytes = [otherp getBytes];
            std::vector<MemoryPatch> memoryPatches = [otherp getMemoryPatches];           
            if([defaults boolForKey:[otherp getPreferencesKey]]) {
                otherp.layer.contents = (id)[UIImage imageWithData: donedata].CGImage;                
                for(int i = 0; i < offsets.size(); i++) {
                    if(memoryPatches[i].Modify()) {
                       NSLog(@"[Mod Menu] - Patched succesfully!");
                    } else {
                        NSLog(@"[Mod Menu] - Patched unsuccesfully...");
                    }
                }
            } 
            else {
                otherp.layer.contents = nil;                
                for(int i = 0; i < offsets.size(); i++) {
                    if(memoryPatches[i].Restore()) {
                        NSLog(@"[Mod Menu] - Restored succesfully!");
                    } else {
                        NSLog(@"[Mod Menu] - Restored unsuccesfully...");
                    }
                }
            }
        }
    }
for(OffsetPatcher *offmain in aimpan.subviews) {
        if([offmain isKindOfClass:[OffsetPatcher class]]) {            
            std::vector<uint64_t> offsets = [offmain getOffsets];
            std::vector<uint64_t>bytes = [offmain getBytes];
            std::vector<MemoryPatch> memoryPatches = [offmain getMemoryPatches];           
            if([defaults boolForKey:[offmain getPreferencesKey]]) {
                offmain.layer.contents = (id)[UIImage imageWithData: donedata].CGImage;                
                for(int i = 0; i < offsets.size(); i++) {
                    if(memoryPatches[i].Modify()) {
                       NSLog(@"[Mod Menu] - Patched succesfully!");
                    } else {
                        NSLog(@"[Mod Menu] - Patched unsuccesfully...");
                    }
                }
            } 
            else {
                offmain.layer.contents = nil;                
                for(int i = 0; i < offsets.size(); i++) {
                    if(memoryPatches[i].Restore()) {
                        NSLog(@"[Mod Menu] - Restored succesfully!");
                    } else {
                        NSLog(@"[Mod Menu] - Restored unsuccesfully...");
                    }
                }
            }
        }
    }
}

- (void)addOffsetSwitchToMenu:(OffsetPatcher *)offsetPatcher {
    [offsetPatcher addTarget:self action:@selector(hackClicked:) forControlEvents:UIControlEventTouchDown];  
    scrollViewHeight += 27;
    targetpan.contentSize = CGSizeMake(137.5, scrollViewHeight + 10);
    [targetpan addSubview:offsetPatcher];
}

- (void)onAimToMenu:(OffsetPatcher *)onAimbot {
     onAimbot.frame = CGRectMake(15, 15, 17, 17);  
    [onAimbot addTarget:self action:@selector(hackClicked:) forControlEvents:UIControlEventTouchDown];    
    [aimbots addSubview: onAimbot];
}

- (void)onEspToMenu:(OffsetPatcher *)onEsp {
     onEsp.frame = CGRectMake(15, 15, 17, 17);  
    [onEsp addTarget:self action:@selector(hackClicked:) forControlEvents:UIControlEventTouchDown];    
    [visuals addSubview: onEsp];
}

- (void)onMiscToMenu:(OffsetPatcher *)onMisc {
     onMisc.frame = CGRectMake(15, 15, 17, 17);  
    [onMisc addTarget:self action:@selector(hackClicked:) forControlEvents:UIControlEventTouchDown];    
    [misc addSubview: onMisc];
}

- (void)teamEspPan:(OffsetPatcher *)switchTeamEsp {    
    [switchTeamEsp addTarget:self action:@selector(hackClicked:) forControlEvents:UIControlEventTouchDown];    
    teamesp += 27;
    switchTeamEsp.frame = CGRectMake(10,teamesp - 17, 17, 17);
    espselfpan.contentSize = CGSizeMake(espselfpan.bounds.size.width, teamesp+10);
    [espselfpan addSubview: switchTeamEsp];
}

- (void)enemyEspPan:(OffsetPatcher *)switchEnemyEsp {    
    [switchEnemyEsp addTarget:self action:@selector(hackClicked:) forControlEvents:UIControlEventTouchDown];    
    enemyesp += 27;
    switchEnemyEsp.frame = CGRectMake(10, enemyesp - 17, 17, 17);
    espenemypan.contentSize = CGSizeMake(espenemypan.bounds.size.width, enemyesp+10);
    [espenemypan addSubview: switchEnemyEsp];
}

- (void)miscPlayerPan:(OffsetPatcher *)switchMiscPlayer {    
    [switchMiscPlayer addTarget:self action:@selector(hackClicked:) forControlEvents:UIControlEventTouchDown];    
    miscplayer += 27;
    switchMiscPlayer.frame = CGRectMake(10, miscplayer - 17, 17, 17);
    playermpan.contentSize = CGSizeMake(playermpan.bounds.size.width, miscplayer+10);
    [playermpan addSubview: switchMiscPlayer];
}

- (void)miscOtherPan:(OffsetPatcher *)switchOtherPlayer {    
    [switchOtherPlayer addTarget:self action:@selector(hackClicked:) forControlEvents:UIControlEventTouchDown];    
    otherp += 27;
    switchOtherPlayer.frame = CGRectMake(10, otherp - 17, 17, 17);
    otherpan.contentSize = CGSizeMake(otherpan.bounds.size.width, otherp+10);
    [otherpan addSubview: switchOtherPlayer];
}

-(void)hackClicked:(OffsetPatcher *)offsetPatcher {    
    std::vector<uint64_t> offsets = [offsetPatcher getOffsets];
    std::vector<uint64_t>bytes = [offsetPatcher getBytes];
    std::vector<MemoryPatch> memoryPatches = [offsetPatcher getMemoryPatches];    
    bool isOn = [defaults boolForKey:[offsetPatcher getPreferencesKey]];    
    if(!isOn) {        
        for(int i = 0; i < offsets.size(); i++) {
            if(memoryPatches[i].Modify()) {
                NSLog(@"[Mod Menu] - Patched succesfully!");
            } else {
                NSLog(@"[Mod Menu] - Patched unsuccesfully...");
            }
        }     
            offsetPatcher.layer.contents = (id)[UIImage imageWithData: donedata].CGImage;        
        [defaults setBool:true forKey:[offsetPatcher getPreferencesKey]];
    } else {    
        for(int i = 0; i < offsets.size(); i++) {
            if(memoryPatches[i].Restore()) {
                NSLog(@"[Mod Menu] - Restored succesfully!");
            } else {
                NSLog(@"[Mod Menu] - Restored unsuccesfully...");
            }
        } 
            offsetPatcher.layer.contents = nil;      
        [defaults setBool:false forKey:[offsetPatcher getPreferencesKey]]; 
    }
}

- (void)addSliderSwitchToMenu:(SliderSwitch *)sliderSwitch {    
    [sliderSwitch addTarget:self action:@selector(sliderSwitchClicked:) forControlEvents:UIControlEventTouchDown];    
    gg += 33;
    aimpan.contentSize = CGSizeMake(aimpan.bounds.size.width, gg + 10);
    [aimpan addSubview:sliderSwitch];
}

- (void)addToMain:(OffsetPatcher *)offsetPatcher {    
    [offsetPatcher addTarget:self action:@selector(hackClicked:) forControlEvents:UIControlEventTouchDown];   
    gg += 27;
    offsetPatcher.frame = CGRectMake(10, gg - 17, 17, 17);
    aimpan.contentSize = CGSizeMake(aimpan.bounds.size.width, gg + 10);
    [aimpan addSubview: offsetPatcher];
}

-(void)sliderSwitchClicked:(SliderSwitch *)sliderSwitch {    
    bool isOn = [defaults boolForKey:[sliderSwitch getPreferencesKey]];    
    if(!isOn) {
    sliderSwitch.layer.contents = (id)[UIImage imageWithData:donedata].CGImage;       
    [defaults setBool:true forKey:[sliderSwitch getPreferencesKey]];        
    } else {
            sliderSwitch.layer.contents = nil;        
        [defaults setBool:false forKey:[sliderSwitch getPreferencesKey]];
    }
    
}
@end

@implementation OffsetPatcher {
    NSString *preferencesKey;
    std::vector<uint64_t> offsets;
    std::vector<uint64_t> bytes;
    std::vector<MemoryPatch> memoryPatches;
    UILabel *offsetPatchSwitch;
}

- (id)initHackNamed:(NSString *)hackName_ offsets:(std::vector<uint64_t>)offsets_ bytes:(std::vector<uint64_t>)bytes_ {    
    offsets = offsets_;
    bytes = bytes_;
    for(int i = 0; i < offsets.size(); i++) {
        if(bytes[i] < 0xFFFFFFFF) {
            bytes[i] = _OSSwapInt32(bytes[i]);
            memoryPatches.push_back(MemoryPatch(NULL,offsets[i], &bytes[i], sizeof(uint32_t)));
        } else {
            bytes[i] = _OSSwapInt64(bytes[i]);
            memoryPatches.push_back(MemoryPatch(NULL,offsets[i], &bytes[i], sizeof(uint64_t)));
        }
    }    
    preferencesKey = hackName_;
  
    self = [super initWithFrame:CGRectMake(10, scrollViewHeight + 10, 17, 17)];
    self.backgroundColor = [UIColor clearColor];
    self.layer.borderWidth = 0.5f;
    self.layer.borderColor = [UIColor whiteColor].CGColor;
    offsetPatchSwitch = [[UILabel alloc]initWithFrame:CGRectMake(23, 3, 120, 17)];
    offsetPatchSwitch.text = hackName_;
    offsetPatchSwitch.textColor = [UIColor whiteColor];
    offsetPatchSwitch.font = [UIFont fontWithName:@"Damascus" size:14];
    [self addSubview:offsetPatchSwitch];
    
    return self;
}

-(NSString *)getPreferencesKey {
    return preferencesKey;
}

- (std::vector<uint64_t>)getOffsets {
    return offsets;
}

- (std::vector<uint64_t>)getBytes {
    return bytes;
}

- (std::vector<MemoryPatch>)getMemoryPatches {
    return memoryPatches;
}

@end

@implementation SliderSwitch {
    NSString *hackName;
    NSString *preferencesKey;
    NSString *switchValueKey;
    UILabel *sliderSwitch;
    UISlider *sliderValue;
    float valueOfSlider;
    UIView *slider;
}

- (id)initSliderNamed:(NSString *)hackName_ minimumValue:(int)minimumValue_ maximumValue:(int)maximumValue_{    
    preferencesKey = hackName_;
    switchValueKey = [hackName_ stringByApplyingTransform:NSStringTransformLatinToCyrillic reverse:false];


    self = [super initWithFrame:CGRectMake(10, gg + 10, 17, 17)];
    self.backgroundColor = [UIColor clearColor];
    self.layer.borderWidth = 0.5f;
    self.layer.borderColor = [UIColor whiteColor].CGColor;
    
    sliderSwitch = [[UILabel alloc]initWithFrame:CGRectMake(23, 3, 120, 20)];
    sliderSwitch.text = [NSString stringWithFormat:@"%@ %.2f", hackName_, sliderValue.value];
    sliderSwitch.textColor = [UIColor whiteColor];
    sliderSwitch.font = [UIFont fontWithName:@"Damascus" size:14];
    [self addSubview:sliderSwitch];

    
    sliderValue = [[UISlider alloc]initWithFrame:CGRectMake(7, gg + 28, 122, 8)];
    sliderValue.maximumTrackTintColor = [UIColor blackColor];
    sliderValue.minimumValue = minimumValue_;
    sliderValue.maximumValue = maximumValue_;
    UIImage *poloskaimage = [UIImage imageWithData: poloskadata];
    [sliderValue setThumbImage:[UIImage new] forState:UIControlStateNormal];
    [sliderValue setMinimumTrackImage:poloskaimage forState:UIControlStateNormal];
    [sliderValue addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    valueOfSlider = sliderValue.value;    
    if([[NSUserDefaults standardUserDefaults] objectForKey:switchValueKey] != nil) {
        sliderValue.value = [[NSUserDefaults standardUserDefaults] floatForKey:switchValueKey];
        sliderSwitch.text = [NSString stringWithFormat:@"%@ %.0f", hackName_, sliderValue.value];
    }

    [aimpan addSubview:sliderValue]; 
    return self;
}

-(void)sliderValueChanged:(UISlider *)slider_ {    
    switchValueKey = [[self getPreferencesKey] stringByApplyingTransform:NSStringTransformLatinToCyrillic reverse:false];
    sliderSwitch.text = [NSString stringWithFormat:@"%@ %.0f", [self getPreferencesKey], slider_.value];   
    [defaults setFloat:slider_.value forKey:[self getSwitchValueKey]];
}

-(NSString *)getPreferencesKey {
    return preferencesKey;
}

-(NSString *)getSwitchValueKey {
    return switchValueKey;
}
@end
