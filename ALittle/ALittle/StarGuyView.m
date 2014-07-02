#import "StarGuyView.h"
#import "KitStarGuy.h"

@implementation StarGuyView

- (void)awakeFromNib
{
    self.userInteractionEnabled = YES;
    self.pathSourcePoints = [NSMutableArray arrayWithObjects:
                             [NSValue valueWithCGPoint:CGPointMake(160, 63.13)],
                             [NSValue valueWithCGPoint:CGPointMake(209.0, 182.0)],
                             [NSValue valueWithCGPoint:CGPointMake(319.0, 201.0)],
                             [NSValue valueWithCGPoint:CGPointMake(227.0, 293.0)],
                             [NSValue valueWithCGPoint:CGPointMake(258.0, 424.0)],
                             [NSValue valueWithCGPoint:CGPointMake(161.0, 362.0)],
                             [NSValue valueWithCGPoint:CGPointMake(63.0, 424.0)],
                             [NSValue valueWithCGPoint:CGPointMake(81.0, 293.0)],
                             [NSValue valueWithCGPoint:CGPointMake(2.5, 201.0)],
                             [NSValue valueWithCGPoint:CGPointMake(112.0, 182.0)],
                             nil];
    
    NSInteger i = 0;
    for (NSValue *point in self.pathSourcePoints)
    {
        NSValue *val = point;
        CGPoint p = [val CGPointValue];
            
        UIControl *control = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
        control.center = p;
        [control setBackgroundColor:[[UIColor blueColor] colorWithAlphaComponent:.25]];
        control.layer.cornerRadius = 22.f;
        [self addSubview:control];
        control.tag = i++;
        [control addTarget:self action:@selector(moved:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    }
}

- (void)drawRect:(CGRect)rect
{
    [KitStarGuy drawStarGuyWithPointAX:[[self.pathSourcePoints objectAtIndex:0] CGPointValue].x
                               pointAY:[[self.pathSourcePoints objectAtIndex:0] CGPointValue].y
                               pointBX:[[self.pathSourcePoints objectAtIndex:1] CGPointValue].x
                               pointBY:[[self.pathSourcePoints objectAtIndex:1] CGPointValue].y
                               pointCX:[[self.pathSourcePoints objectAtIndex:2] CGPointValue].x
                               pointCY:[[self.pathSourcePoints objectAtIndex:2] CGPointValue].y
                               pointDX:[[self.pathSourcePoints objectAtIndex:3] CGPointValue].x
                               pointDY:[[self.pathSourcePoints objectAtIndex:3] CGPointValue].y
                               pointEX:[[self.pathSourcePoints objectAtIndex:4] CGPointValue].x
                               pointEY:[[self.pathSourcePoints objectAtIndex:4] CGPointValue].y
                               pointFX:[[self.pathSourcePoints objectAtIndex:5] CGPointValue].x
                               pointFY:[[self.pathSourcePoints objectAtIndex:5] CGPointValue].y
                               pointGX:[[self.pathSourcePoints objectAtIndex:6] CGPointValue].x
                               pointGY:[[self.pathSourcePoints objectAtIndex:6] CGPointValue].y
                               pointHX:[[self.pathSourcePoints objectAtIndex:7] CGPointValue].x
                               pointHY:[[self.pathSourcePoints objectAtIndex:7] CGPointValue].y
                               pointIX:[[self.pathSourcePoints objectAtIndex:8] CGPointValue].x
                               pointIY:[[self.pathSourcePoints objectAtIndex:8] CGPointValue].y
                               pointJX:[[self.pathSourcePoints objectAtIndex:9] CGPointValue].x
                               pointJY:[[self.pathSourcePoints objectAtIndex:9] CGPointValue].y];
}

- (void)moved:(UIControl *)control withEvent:(UIEvent *)event {
    UITouch *touch = [[[event touchesForWindow:self.window] allObjects] lastObject];
    CGPoint touchLoc = [touch locationInView:self];
    control.center = touchLoc;
    
    NSValue *anchor = [NSValue valueWithCGPoint:touchLoc];
    self.pathSourcePoints[control.tag] = anchor;
    [self setNeedsDisplay];
}

@end