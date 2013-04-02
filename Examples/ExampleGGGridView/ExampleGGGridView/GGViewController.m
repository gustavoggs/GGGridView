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
    switch (gridView.orientation) {
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

- (IBAction)actionAddOneView:(id)sender {
    int a = rand();
    CGFloat r = a/100. - a/100;
    UIView* v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 128, 128)];
    [v setBackgroundColor:[UIColor colorWithRed:r green:r blue:r alpha:1.0]];
    [gridView addView:v];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self didEndEditing:textField];
    [textField resignFirstResponder];
    return YES;
}

@end
