//
//  SubCategoryViewController.m
//  CategoryViewer
//
//  Created by Obyadur Rahman on 2/7/14.
//  Copyright (c) 2014 IMpulse (BD) Ltd. All rights reserved.
//

#import "SubCategoryViewController.h"

@interface SubCategoryViewController ()

@end

@implementation SubCategoryViewController

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

@end
