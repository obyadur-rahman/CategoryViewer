//
//  SettingsViewController.m
//  CategoryViewer
//
//  Created by Obyadur Rahman on 2/7/14.
//  Copyright (c) 2014 IMpulse (BD) Ltd. All rights reserved.
//

#import "SettingsViewController.h"
#import "KeyboardAvoidingScrollView.h"

@interface SettingsViewController ()

@property (weak, nonatomic) IBOutlet UITextField *appNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *appLogoTextField;
@property (weak, nonatomic) IBOutlet UITextField *appBannerTextField;
@property (weak, nonatomic) IBOutlet UITextField *categoryTextField;
@property (weak, nonatomic) IBOutlet UITextField *subcategoryTextField;
@property (weak, nonatomic) IBOutlet UITextField *websocketTextField;

@property (weak, nonatomic) IBOutlet KeyboardAvoidingScrollView *scrollView;

@property (nonatomic, strong) NSArray *textFields;

- (IBAction)cancelSettingsButtonPressed:(id)sender;
- (IBAction)saveSettingsButtonPressed:(id)sender;

@end


@implementation SettingsViewController

@synthesize scrollView;
@synthesize appNameTextField,appLogoTextField,appBannerTextField,categoryTextField,subcategoryTextField,websocketTextField;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background2.png"]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.textFields = @[appNameTextField,appLogoTextField,appBannerTextField,categoryTextField,subcategoryTextField,websocketTextField];
    
    CGRect applicationFrame = [[UIScreen mainScreen] applicationFrame];
    [scrollView setContentSize:CGSizeMake(scrollView.frame.size.width, CGRectGetMaxY(websocketTextField.frame)-50)];
    //[scrollView setContentSize:CGSizeaMake(scrollView.frame.size.width, scrollView.frame.size.height)];
    [scrollView setBackgroundColor:[UIColor blueColor]];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if (isIpad)
    {
        return  UIInterfaceOrientationMaskLandscape;
    }
    else
    {
        return  UIInterfaceOrientationMaskPortrait;
    }
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if (isIpad)
    {
        return  UIInterfaceOrientationMaskLandscape;
    }
    else
    {
        return  UIInterfaceOrientationMaskPortrait;
    }
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}


- (IBAction)cancelSettingsButtonPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)saveSettingsButtonPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSInteger textFieldIndex = [self.textFields indexOfObject:textField];
    
    if (textFieldIndex < self.textFields.count - 1) {
        [(UITextField *)self.textFields[textFieldIndex + 1] becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
    }
    
    return YES;
}


@end
