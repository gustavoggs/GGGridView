//
//  GGViewController.m
//  ExampleGGGridView
//
//  Created by Gustavo Graña on 01/04/13.
//

#import "GGViewController.h"
#import "GGGridView.h"

@implementation GGViewController {
    
    __weak IBOutlet GGGridView *gridView;
    __weak IBOutlet UITextField *tfSize;
    
    __weak IBOutlet UITextField *tfMarginTop;
    __weak IBOutlet UITextField *tfMarginRight;
    __weak IBOutlet UITextField *tfMarginBottom;
    __weak IBOutlet UITextField *tfMarginLeft;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [gridView setOrientation:GGGridViewOrientationHorizontal];
}

#pragma mark - Actions

- (IBAction)actionChangeOrientation:(UISegmentedControl*)sender {
    [UIView animateWithDuration:0.6 animations:^{
        [gridView setOrientation:sender.selectedSegmentIndex];        
    }];
}

- (IBAction)didEndEditing:(id)sender {
    CGRect newFrame = gridView.frame;
    switch ([gridView orientation]) {
        case GGGridViewOrientationVertical:
            newFrame.size.height = [tfSize.text floatValue];
            break;
        case GGGridViewOrientationHorizontal:
            newFrame.size.width = [tfSize.text floatValue];
            break;
        default:
            NSAssert(NO, @"How?");
            break;
    }
    [UIView animateWithDuration:0.6 animations:^{
        [gridView setFrame:newFrame];
    }];
}

- (IBAction)actionClear:(id)sender {
    for (UIView * v in [gridView subviews]) {
        [v removeFromSuperview];
    }
    CGRect frame = [gridView frame];
    frame.size = CGSizeZero;
    [gridView setFrame:frame];
}

- (IBAction)actionSetMargin:(id)sender {
    CGFloat top = [tfMarginTop.text floatValue];
    CGFloat right = [tfMarginRight.text floatValue];
    CGFloat bottom = [tfMarginBottom.text floatValue];
    CGFloat left = [tfMarginLeft.text floatValue];
    [gridView marginTop:top right:right bottom:bottom left:left];
}

- (IBAction)actionAddOneView:(id)sender {
    UIView* v;
    v = [self newGridView];
    [gridView addView:v];
}

#pragma mark - auxiliar methods
- (UIView*) newGridView {
    UIView* v;
    v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 128, 128)];
    
    int a = rand();
    CGFloat r = a/100. - a/100;
    [v setBackgroundColor:[UIColor colorWithRed:r green:r blue:r alpha:1.0]];
    
    UILabel* lbl = [[UILabel alloc] initWithFrame:[v frame]];
    [lbl setTextAlignment:NSTextAlignmentCenter];
    [lbl setTextColor:[UIColor whiteColor]];
    [lbl setText:[NSString stringWithFormat:@"%d",[[gridView subviews] count]]];
    [lbl setBackgroundColor:[UIColor clearColor]];
    [v addSubview:lbl];
    return v;
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self didEndEditing:textField];
    [textField resignFirstResponder];
    return YES;
}



@end
