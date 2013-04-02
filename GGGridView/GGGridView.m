//
//  GGGridView.m
//
//  Created by Gustavo Grana on 3/28/13.
//

#import "GGGridView.h"

@implementation GGGridView

- (id)initWithFrame: (CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self defaultInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self defaultInit];
    }
    return self;
}

- (id)init {
    self = [super init];
    if (self) {
        [self defaultInit];
    }
    return self;
}

#pragma mark - auxiliar methods;

- (void) defaultInit {
    _orientation = GGGridViewOrientationHorizontal;
}

- (void) buildView {
    if ([[self subviews] count] == 0) {
        return;
    }
    UIView* referenceView = [[self subviews] objectAtIndex:0];
    CGFloat widthCell = [referenceView frame].size.width;
    CGFloat heightCell = [referenceView frame].size.height;
    CGFloat lastX = 0;
    CGFloat lastY = 0;
    CGRect newFrame = self.frame;
    if (_orientation == GGGridViewOrientationHorizontal) {
        for (UIView* view in [self subviews]) {
            if (lastX + widthCell > self.frame.size.width) {
                lastX = 0;
                lastY += heightCell;
            }
            [view setCenter:CGPointMake(lastX + widthCell/2, lastY + heightCell/2)];
            lastX+= widthCell;
        }
        if (lastX != 0) {
            lastY += heightCell;
        }
        newFrame.size.height = lastY;
    } else {
        for (UIView* view in [self subviews]) {
            if (lastY + heightCell > self.frame.size.height) {
                lastY = 0;
                lastX += widthCell;
            }
            [view setCenter:CGPointMake(lastX + widthCell/2, lastY + heightCell/2)];
            lastY+= heightCell;
        }
        if (lastY != 0) {
            lastX += widthCell;
        }
        newFrame.size.width = lastX;
    }
    super.frame = newFrame;
}


#pragma mark - api methods

- (void) setOrientation:(GGGridViewOrientation)orientation{
    NSLog(@"orientation: %d",orientation);
    _orientation = orientation;
    [self buildView];
}

-(void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    [self buildView];
}

- (void) addView:(UIView*)view{
    [self addSubview:view];
    [self buildView];
}

@end
