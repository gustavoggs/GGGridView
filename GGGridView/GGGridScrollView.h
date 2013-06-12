//
//  GGGridScrollView.h
//  ExampleGGGridView
//
//  Created by Gustavo Grana on 6/12/13.
//  Copyright (c) 2013 Gustavo Graña. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GGGridView.h"

@interface GGGridScrollView : UIScrollView {
    GGGridView* grid;
}

@property (nonatomic) GGGridViewOrientation orientation;
@property (nonatomic) CGSize sizeGridItem;

- (void) addView:(UIView*)view;
- (void) marginTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left;

@end
