//
//  GGGridView.h
//
//  Created by Gustavo Grana on 3/28/13.
//

#import <UIKit/UIKit.h>
/*
 * The GGGridViewOrientation define also how the view will expand,
 * if the grid orientation is Vertical, the view will expand horizontally
 * if the grid orientation is Horizontal, the view will expand verticall
 */

typedef enum {
    GGGridViewOrientationVertical,
    GGGridViewOrientationHorizontal
} GGGridViewOrientation;

@interface GGGridView : UIView

@property (nonatomic) GGGridViewOrientation orientation;
@property (nonatomic) CGSize sizeGridItem;

- (void) addView:(UIView*)view;
- (void) marginTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left;

@end
