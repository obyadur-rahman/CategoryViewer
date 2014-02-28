//
//  SettingsLoginViewController.m
//  CategoryViewer
//
//  Created by Obyadur Rahman on 2/11/14.
//  Copyright (c) 2014 IMpulse (BD) Ltd. All rights reserved.
//

#import "SettingsLoginViewController.h"
#import "CustomTextField.h"
#import "SettingsViewController.h"

#define kUsernameKey @"username"
#define kPasswordKey @"password"

@interface SettingsLoginViewController ()

@property IBOutlet UIView *loginView;

@property IBOutlet CustomTextField *usernameTextField;
@property IBOutlet CustomTextField *passwordTextField;

@property IBOutlet UILabel *usernameLabel;
@property IBOutlet UILabel *passwordLabel;

@property IBOutlet UIButton *loginButton;

// Button Action
- (IBAction)loginPressed:(id)sender;

- (IBAction)cancelPressed:(id)sender;
- (IBAction)infoPressed:(id)sender;

@end

@implementation SettingsLoginViewController
{
@private
	
	NSString *strUsername;
	NSString *strPassword;
}

@synthesize loginView,loginButton,passwordTextField, usernameTextField, usernameLabel, passwordLabel;


#pragma mark-
#pragma mark- View Life Cycle
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // Add gesture if touch outside of textfield
    UITapGestureRecognizer *tapInView = [[UITapGestureRecognizer alloc]
                                         initWithTarget:self
                                         action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tapInView];
    tapInView.cancelsTouchesInView = NO;
    
    
    [self viewConfigure];
    
    [self animateLoginView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self resetTextField];
    [self configureLoginButton];
    [super viewWillAppear:animated];
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
#pragma mark- Dissmiss Keyboard
-(void)dismissKeyboard
{
    [usernameTextField resignFirstResponder];
    [passwordTextField resignFirstResponder];
}

#pragma mark-
#pragma mark- Animate Login View
- (void)animateLoginView
{
    loginView.alpha = 0.0;
    
    [UIView animateWithDuration:2.0
     
                     animations:^{
                         loginView.alpha = 0.5;
                     }
     
                     completion:^(BOOL  completed){
                         loginView.alpha = 1.0;
                     }
     ];
}

#pragma mark-
#pragma mark- View Configuration
- (void)viewConfigure
{
    // View background color image
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background1.png"]];
    
    // Hide initially
    loginView.alpha = 0.0;
    
    // Log view
    [loginView.layer setCornerRadius:5.0f];
    [loginView.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [loginView.layer setBorderWidth:1.5f];
    [loginView.layer setShadowColor:[UIColor blackColor].CGColor];
    [loginView.layer setShadowOpacity:0.8];
    [loginView.layer setShadowRadius:3.0];
    [loginView.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
    
    // Log view background image
    [loginView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_sand"]]];
    
    
    // Log button
    [loginButton.layer setCornerRadius:5.0f];
    
    // Log button Title
    [self configureLoginButton];
}

// Log button config
- (void)configureLoginButton
{
    if ([self hasPreviousSettings])
    {
        [loginButton setTitle:@"Unlock Settings" forState:UIControlStateNormal];
    }
    else
    {
        [loginButton setTitle:@"Save & Unlock Settings" forState:UIControlStateNormal];
    }
}

// Reset Fields
- (void)resetTextField
{
    usernameTextField.text = @"";
    passwordTextField.text = @"";
}

// initial validation check for given password/username
- (BOOL)isValidInput
{
	if (strUsername.length == 0 || strPassword.length == 0)
		return NO;
    
	return YES;
}

// Check if previous settings
- (BOOL)hasPreviousSettings
{
    NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
    
    NSString *username = [userdefaults objectForKey:kUsernameKey];
    NSString *password = [userdefaults objectForKey:kPasswordKey];
    
    if (username.length == 0)
    {
        return NO;
    }
    
    if (password.length == 0)
    {
        return NO;
    }
    
    return YES;
}

// Check given settings with userdefaults
- (BOOL)isSettingsMatched
{
    NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
    if ([[userdefaults objectForKey:kUsernameKey] isEqualToString:strUsername] && [[userdefaults objectForKey:kPasswordKey] isEqualToString:strPassword])
    {
        return YES;
    }
    return NO;
}

// Save settings to userdefaults
- (void)saveSettings
{
    NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
    [userdefaults setObject:strUsername forKey:kUsernameKey];
    [userdefaults setObject:strPassword forKey:kPasswordKey];
    [userdefaults synchronize];
}

- (void)pushSettingsViewController
{
    SettingsViewController *settingsViewController;
    if (isIpad)
    {
        settingsViewController = [[SettingsViewController alloc] initWithNibName:@"SettingsViewController~ipad" bundle:nil];
    }
    else
    {
        settingsViewController = [[SettingsViewController alloc] initWithNibName:@"SettingsViewController~iphone" bundle:nil];
    }
    [self.navigationController pushViewController:settingsViewController animated:YES];
}

#pragma mark-
#pragma mark- Button Handler
- (IBAction)loginPressed:(id)sender
{
	strUsername = usernameTextField.text;
	strPassword = passwordTextField.text;
	
    if ( [self isValidInput] )
	{
        if ([self hasPreviousSettings])
        {
            if ([self isSettingsMatched])
            {
                [self pushSettingsViewController];
            }
            else
            {
                [self alertWithTitle:@"Validation Failed!" withMessage:@"Enter valid username and password to unlock settings."];
            }
        }
        else
        {
            [self saveSettings];
        }
    }
    else
    {
        [self alertWithTitle:@"Invalid input!" withMessage:@"Enter username and password to access settings."];
	}
}

- (IBAction)infoPressed:(id)sender
{
    [self alertWithTitle:@"Login Info" withMessage:@"\nApplication will ask you to set username and password only one time.\n\nOnce you saved username and password you can use that username and password to change settings.\n\nIf you forget this username and password, and wants to access settings then you need to reinstall this Application."];
}

- (IBAction)cancelPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark-
#pragma mark- AlertView
- (void)alertWithTitle:(NSString *)title withMessage:(NSString *)message
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

@end
