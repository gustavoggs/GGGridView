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

enum GGGridViewOrientation {
    GGGridViewOrientationHorizontal,
    GGGridViewOrientationVertical
};
typedef enum GGGridViewOrientation GGGridViewOrientation;

@interface GGGridView : UIView

@property GGGridViewOrientation orientation;

- (void) addView:(UIView*)view;

@end
