//
//  TestViewController.m
//  HelloWorld
//
//  Created by Obyadur Rahman on 6/22/15.
//  Copyright (c) 2015 IMpulse BD Ltd. All rights reserved.
//

#import "TestViewController.h"
#import "IImageView.h"
#import "AsyncImageDownloader.h"

@interface TestViewController ()

@property (weak, nonatomic) IBOutlet IImageView *imageView;

@property (strong, nonatomic) IBOutlet IImageView *imageViewDragger;


- (IBAction)Close:(id)sender;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.imageView.transform = CGAffineTransformMakeRotation(-0.2f);
    
    [self testImageDownload2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)testImageDownload2
{
    NSURL *imgURl = [NSURL URLWithString:@"https://upload.wikimedia.org/wikipedia/commons/c/cf/Frog_on_river_4000x3000_26-09-2010_11-01am_2mb.jpg"];
    
    AsyncImageDownloader *imgManager1 = [[AsyncImageDownloader alloc] init];
    [imgManager1 downloadImageWithURL:imgURl parameters:nil success:^(NSURLResponse *response, BOOL success, NSData *imageData) {
        NSLog(@"2Success1: %d",success);
        if (success) {
            UIImage *img = [[UIImage alloc] initWithData:imageData];
            self.imageView.image = img;
        }
    } failure:^(NSError *error) {
        NSLog(@"2Error1: %@",[error description]);
    }];
    
    /*
    AsyncImageDownloader *imgManager2 = [[AsyncImageDownloader alloc] init];
    [imgManager2 downloadImageWithURL:imgURl parameters:nil success:^(NSURLResponse *response, BOOL success, NSData *imageData) {
        NSLog(@"2Success2: %d",success);
        if (success) {
            UIImage *img = [[UIImage alloc] initWithData:imageData];
            self.imageView.image = img;
        }
    } failure:^(NSError *error) {
        NSLog(@"2Error2: %@",[error description]);
    }];
    
    AsyncImageDownloader *imgManager3 = [[AsyncImageDownloader alloc] init];
    [imgManager3 downloadImageWithURL:imgURl parameters:nil success:^(NSURLResponse *response, BOOL success, NSData *imageData) {
        NSLog(@"2Success3: %d",success);
        if (success) {
            UIImage *img = [[UIImage alloc] initWithData:imageData];
            self.imageView.image = img;
        }
    } failure:^(NSError *error) {
        NSLog(@"2Error3: %@",[error description]);
    }];
    
    AsyncImageDownloader *imgManager4 = [[AsyncImageDownloader alloc] init];
    [imgManager4 downloadImageWithURL:imgURl parameters:nil success:^(NSURLResponse *response, BOOL success, NSData *imageData) {
        NSLog(@"2Success4: %d",success);
        if (success) {
            UIImage *img = [[UIImage alloc] initWithData:imageData];
            self.imageView.image = img;
        }
    } failure:^(NSError *error) {
        NSLog(@"2Error4: %@",[error description]);
    }];
    
    AsyncImageDownloader *imgManager5 = [[AsyncImageDownloader alloc] init];
    [imgManager5 downloadImageWithURL:imgURl parameters:nil success:^(NSURLResponse *response, BOOL success, NSData *imageData) {
        NSLog(@"2Success5: %d",success);
        if (success) {
            UIImage *img = [[UIImage alloc] initWithData:imageData];
            self.imageView.image = img;
        }
    } failure:^(NSError *error) {
        NSLog(@"2Error5: %@",[error description]);
    }]; */
}


- (IBAction)Close:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
