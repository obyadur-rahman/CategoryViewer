//
//  HomeViewController.m
//  CategoryViewer
//
//  Created by Obyadur Rahman on 2/7/14.
//  Copyright (c) 2014 IMpulse (BD) Ltd. All rights reserved.
//

#import "HomeViewController.h"
#import "CategoryViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

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
    
    // Swipe gesture on View
    UISwipeGestureRecognizer* viewLeftSwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(viewSwipeRightGesture:)];
    viewLeftSwipeGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:viewLeftSwipeGesture];
    
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
#pragma mark- View Swipe Gesture
- (void)viewSwipeRightGesture:(UISwipeGestureRecognizer *)gestureRecognizer
{
    UISwipeGestureRecognizerDirection direction = [gestureRecognizer direction];
    if(direction == UISwipeGestureRecognizerDirectionLeft)
    {
        CategoryViewController *categoryViewController;
        if (isIpad)
        {
            categoryViewController = [[CategoryViewController alloc] initWithNibName:@"CategoryViewController~ipad" bundle:nil];
        }
        else
        {
            categoryViewController = [[CategoryViewController alloc] initWithNibName:@"CategoryViewController~iphone" bundle:nil];
        }
        
        [self.navigationController pushViewController:categoryViewController animated:YES];
    }
}


@end
