//
//  GGGridScrollView.m
//  ExampleGGGridView
//
//  Created by Gustavo Grana on 6/12/13.
//  Copyright (c) 2013 Gustavo Graña. All rights reserved.
//

#import "GGGridScrollView.h"

@implementation GGGridScrollView

- (id)initWithFrame:(CGRect)frame
{
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

- (void) defaultInit {
    grid = [[GGGridView alloc] init];
    [self addSubview:grid];
    CGRect frame = grid.frame;
    frame.origin.x = 0;
    frame.origin.y = 0;
    [grid setFrame:frame];
}

#pragma mark - encapsulate the GGGridView

- (void)setOrientation:(GGGridViewOrientation)orientation {
    [grid setOrientation:orientation];
}

- (GGGridViewOrientation) orientation {
    return [grid orientation];
}

- (void)setSizeGridItem:(CGSize)sizeGridItem {
    [grid setSizeGridItem:sizeGridItem];
}

- (CGSize)sizeGridItem {
    return [grid sizeGridItem];
}

- (void) addView:(UIView*)view {
    [grid addView:view];
    [self setContentSize:grid.frame.size];
}

- (void) marginTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left {
    [grid marginTop:top right:right bottom:bottom left:left];
}

@end
