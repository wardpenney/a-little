#import "StarGuyView.h"
#import "KitStarGuy.h"

@implementation StarGuyView

- (void)awakeFromNib
{
    self.topX = 160;
    self.topY = 63.13;
    self.userInteractionEnabled = YES;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint touchLoc = [touch locationInView:self];
    self.topX = touchLoc.x;
    self.topY = touchLoc.y;
}

- (void)setTopY:(CGFloat)topY {
    _topY = topY;
    [self setNeedsDisplay];
}

- (void)setTopX:(CGFloat)topX {
    _topX = topX;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    [KitStarGuy drawStarGuyWithTopPointX:self.topX topPointY:self.topY];
}

@end
