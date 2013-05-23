//
//  GGGridView.m
//
//  Created by Gustavo Grana on 3/28/13.
//

#import "GGGridView.h"

@implementation GGGridView {
    GGGridViewOrientation _orientation;
    CGFloat marginTop;
    CGFloat marginRight;
    CGFloat marginBottom;
    CGFloat marginLeft;
}

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
    _sizeGridItem = CGSizeMake(-1, -1);
    _orientation = GGGridViewOrientationHorizontal;
}

- (void) buildView {
    if ([[self subviews] count] == 0) {
        return;
    }
    if ([self sizeGridItem].width == -1 && [self sizeGridItem].height == -1) {
        UIView* referenceView = [[self subviews] objectAtIndex:0];
        [self setSizeGridItem:[referenceView frame].size];
    }
    CGFloat widthCell = [self sizeGridItem].width;
    CGFloat heightCell = [self sizeGridItem].height;
    CGFloat lastX = 0;
    CGFloat lastY = 0;
    CGRect newFrame = self.frame;
    if (_orientation == GGGridViewOrientationHorizontal) {
        lastY = marginTop;
        for (UIView* view in [self subviews]) {
            if (lastX + widthCell + marginLeft > self.frame.size.width) {
                lastX = 0;
                lastY += (marginBottom + heightCell + marginTop);
            }
            [view setCenter:CGPointMake(lastX + marginLeft + widthCell/2, lastY + heightCell/2)];
            lastX+= (marginLeft + widthCell + marginRight);
        }
        if (lastX != 0) {
            lastY += (heightCell+ marginBottom);
        }
        newFrame.size.height = lastY;
    } else {
        lastX = marginLeft;
        for (UIView* view in [self subviews]) {
            if (lastY + heightCell + marginTop > self.frame.size.height) {
                lastY = 0;
                lastX += (marginRight + widthCell + marginLeft);
            }
            [view setCenter:CGPointMake(lastX + widthCell/2, lastY + marginTop + heightCell/2)];
            lastY+= ( marginTop + heightCell + marginBottom);
        }
        if (lastY != 0) {
            lastX += widthCell + marginRight;
        }
        newFrame.size.width = lastX;
    }
    super.frame = newFrame;
}


#pragma mark - api methods

- (void) setOrientation:(GGGridViewOrientation)orientation{
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

- (void) marginTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left {
    marginTop = top;
    marginRight = right;
    marginBottom = bottom;
    marginLeft = left;
    [self buildView];
}

@end
