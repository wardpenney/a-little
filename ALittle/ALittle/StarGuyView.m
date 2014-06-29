#import "StarGuyView.h"
#import "KitStarGuy.h"

@implementation StarGuyView

- (void)awakeFromNib
{
    self.pointAX = 160;
    self.pointAY = 63.13;
    self.userInteractionEnabled = YES;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint touchLoc = [touch locationInView:self];
    self.pointAX = touchLoc.x;
    self.pointAY = touchLoc.y;
}

- (void)setPointAX:(CGFloat)pointAX {
    _pointAX = pointAX;
    [self setNeedsDisplay];
}

- (void)setPointAY:(CGFloat)pointAY {
    _pointAY = pointAY;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    [KitStarGuy drawStarGuyWithPointAX:self.pointAX pointAY:self.pointAY pointBX:209.0 pointBY:182.0 pointCX:319.0 pointCY:201.0 pointDX:227.0 pointDY:293.0 pointEX:258.0 pointEY:424.0 pointFX:161.0 pointFY:362.0 pointGX:63.0 pointGY:424.0 pointHX:81.0 pointHY:293.0 pointIX:2.5 pointIY:201.0 pointJX:112.0 pointJY:182.0];
}

@end