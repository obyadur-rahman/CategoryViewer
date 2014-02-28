//
//  CategoryViewController.m
//  CategoryViewer
//
//  Created by Obyadur Rahman on 2/7/14.
//  Copyright (c) 2014 IMpulse (BD) Ltd. All rights reserved.
//

#import "CategoryViewController.h"
#import "SettingsLoginViewController.h"

@interface CategoryViewController ()
{
    SettingsLoginViewController *settingsLogViewController;
    
}

@property (nonatomic, strong) NSArray *textFields;

@end

@implementation CategoryViewController

@synthesize textField1,textField2,textField3,textField4,textField5,textField6,textField7,textField8,textField9,textField10;
@synthesize scrollView;

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
    
    self.textFields = @[textField1,textField2,textField3,textField4,textField5,textField6,textField7,textField8,textField9,textField10];
    
    CGRect applicationFrame = [[UIScreen mainScreen] applicationFrame];
    [scrollView setContentSize:CGSizeMake(applicationFrame.size.width, CGRectGetMaxY(textField10.frame) + 20)];
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

#pragma mark-
#pragma mark- Settings Button Handler
- (IBAction)settingsButtonPressed:(id)sender
{
    if (isIpad)
    {
        settingsLogViewController = [[SettingsLoginViewController alloc] initWithNibName:@"SettingsLoginViewController~ipad" bundle:nil];
    }
    else
    {
        settingsLogViewController = [[SettingsLoginViewController alloc] initWithNibName:@"SettingsLoginViewController~iphone" bundle:nil];
    }
    [self.navigationController pushViewController:settingsLogViewController animated:YES];
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
