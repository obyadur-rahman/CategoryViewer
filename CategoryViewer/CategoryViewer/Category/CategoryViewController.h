//
//  CategoryViewController.h
//  CategoryViewer
//
//  Created by Obyadur Rahman on 2/7/14.
//  Copyright (c) 2014 IMpulse (BD) Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "KeyboardAvoidingScrollView.h"

@interface CategoryViewController : UIViewController


@property (weak, nonatomic) IBOutlet UITextField *textField1;
@property (weak, nonatomic) IBOutlet UITextField *textField2;
@property (weak, nonatomic) IBOutlet UITextField *textField3;
@property (weak, nonatomic) IBOutlet UITextField *textField4;
@property (weak, nonatomic) IBOutlet UITextField *textField5;
@property (weak, nonatomic) IBOutlet UITextField *textField6;
@property (weak, nonatomic) IBOutlet UITextField *textField7;
@property (weak, nonatomic) IBOutlet UITextField *textField8;
@property (weak, nonatomic) IBOutlet UITextField *textField9;
@property (weak, nonatomic) IBOutlet UITextField *textField10;

@property (weak, nonatomic) IBOutlet KeyboardAvoidingScrollView *scrollView;

// Settings Button Tap
- (IBAction)settingsButtonPressed:(id)sender;

@end
