//
//  ViewController.m
//  HelloWorld
//
//  Created by Obyadur Rahman on 2/16/15.
//  Copyright (c) 2015 IMpulse BD Ltd. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"
#import "HelloWorld-Swift.h"
#import "IImageView.h"
#import "AsyncImageDownloader.h"

#import "Animal.h"
#import "Bird.h"
#import "Dog.h"

#import "JSONDownloader.h"
#import "DynamicClassBinder.h"


#define kTest @"http://google.com"

#define kWellVineWebUrl          @"http://www.wellvine.co.uk"
#define kWellVineFeedbackUrl     @"http://www.wellvine.co.uk/my-account/lessons?act=complete-lesson&id=%@"
#define kWellVineConsultationUrl @"http://www.wellvine.co.uk/my-account/lessons"

#define kWellVineWebUrl1          @"https://www.wellvine.co.uk"
#define kWellVineFeedbackUrl1     @"https://www.wellvine.co.uk/my-account/lessons?act=complete-lesson&id=%@"
#define kWellVineConsultationUrl1 @"https://www.wellvine.co.uk/my-account/lessons"

@interface ViewController () <UIActionSheetDelegate>

@property (weak, nonatomic) IBOutlet IImageView *imageView;

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (weak, nonatomic) TestViewController *tst;

- (IBAction)showAction:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.imageView.transform = CGAffineTransformMakeRotation(0.2f);
    
    [UIView setAnimationsEnabled:NO];
    
    /*
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:kWellVineWebUrl]]) {
        NSLog(@"1");
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:kWellVineWebUrl]]];
    }
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:kWellVineFeedbackUrl]]) {
        NSLog(@"2");
    }
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:kWellVineConsultationUrl]]) {
        NSLog(@"3");
    }
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:kWellVineWebUrl1]]) {
        NSLog(@"11");
    }
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:kWellVineFeedbackUrl1]]) {
        NSLog(@"22");
    }
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:kWellVineConsultationUrl1]]) {
        NSLog(@"33");
    }
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:kTest]]];
    
    
    NSString * userAgent = [self.webView stringByEvaluatingJavaScriptFromString:@"navigator.userAgent"];
    NSLog(@" ++ %@ ++",userAgent);
*/
    
    //
    //[self performSelector:@selector(showAction) withObject:nil afterDelay:2.0];
    
    [self myClassTest];
    
    [self testImageDownload1];
    
    [self jsonDownload];
}

- (void)testImageDownload1
{
    NSURL *imgURl = [NSURL URLWithString:@"https://upload.wikimedia.org/wikipedia/commons/2/2b/Kingsborough_CC_MB.JPG"];
    
    AsyncImageDownloader *imgManager1 = [[AsyncImageDownloader alloc] init];
    [imgManager1 downloadImageWithURL:imgURl parameters:nil success:^(NSURLResponse *response, BOOL success, NSData *imageData) {
        NSLog(@"Success1: %d",success);
        if (success) {
            UIImage *img = [[UIImage alloc] initWithData:imageData];
            self.imageView.image = img;
        }
    } failure:^(NSError *error) {
        NSLog(@"Error1: %@",[error description]);
    }];
    
    /*
    AsyncImageDownloader *imgManager2 = [[AsyncImageDownloader alloc] init];
    [imgManager2 downloadImageWithURL:imgURl parameters:nil success:^(NSURLResponse *response, BOOL success, NSData *imageData) {
        NSLog(@"Success2: %d",success);
        if (success) {
            UIImage *img = [[UIImage alloc] initWithData:imageData];
            self.imageView.image = img;
        }
    } failure:^(NSError *error) {
        NSLog(@"Error2: %@",[error description]);
    }];
    
    AsyncImageDownloader *imgManager3 = [[AsyncImageDownloader alloc] init];
    [imgManager3 downloadImageWithURL:imgURl parameters:nil success:^(NSURLResponse *response, BOOL success, NSData *imageData) {
        NSLog(@"Success3: %d",success);
        if (success) {
            UIImage *img = [[UIImage alloc] initWithData:imageData];
            self.imageView.image = img;
        }
    } failure:^(NSError *error) {
        NSLog(@"Error3: %@",[error description]);
    }];
    
    AsyncImageDownloader *imgManager4 = [[AsyncImageDownloader alloc] init];
    [imgManager4 downloadImageWithURL:imgURl parameters:nil success:^(NSURLResponse *response, BOOL success, NSData *imageData) {
        NSLog(@"Success4: %d",success);
        if (success) {
            UIImage *img = [[UIImage alloc] initWithData:imageData];
            self.imageView.image = img;
        }
    } failure:^(NSError *error) {
        NSLog(@"Error4: %@",[error description]);
    }];
    
    AsyncImageDownloader *imgManager5 = [[AsyncImageDownloader alloc] init];
    [imgManager5 downloadImageWithURL:imgURl parameters:nil success:^(NSURLResponse *response, BOOL success, NSData *imageData) {
        NSLog(@"Success5: %d",success);
        if (success) {
            UIImage *img = [[UIImage alloc] initWithData:imageData];
            self.imageView.image = img;
        }
    } failure:^(NSError *error) {
        NSLog(@"Error5: %@",[error description]);
    }];*/
}


- (IBAction)showAction:(id)sender
{
    NSString *actionSheetTitle = @"Do you really want to Finish the consulatation?"; //Action Sheet Title
    NSString *endConsultationTitle = @"End Consultation";
    NSString *skipTitle = @"Skip";
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:actionSheetTitle
                                  delegate:self
                                  cancelButtonTitle:nil
                                  destructiveButtonTitle:nil
                                  otherButtonTitles:endConsultationTitle, skipTitle, nil];
    [actionSheet showInView:self.view];
}

#pragma mark- ActionSheet Delegate
- (void)actionSheet:(UIActionSheet *)popup clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex)
    {
        case 0: {
            //NSLog(@"index 0 -== end consultation");
            
            TestViewController *st = [self.storyboard instantiateViewControllerWithIdentifier:@"TestViewController"];
            st.view.backgroundColor = [UIColor clearColor];
            self.modalPresentationStyle = UIModalPresentationCurrentContext;
            //[st.view setAlpha:0.5];
            //st.view.backgroundColor = [UIColor clearColor];
            //st.modalPresentationStyle = UIModalPresentationCurrentContext;
            st.modalPresentationStyle = UIModalPresentationFormSheet;
            
            self.tst = nil;
            self.tst = st;
            st = nil;
            [self presentViewController:self.tst animated:YES completion:nil];
            break;
        }
        case 1:
            //NSLog(@"Index 1  == skip button");
            break;
            
        default:
            break;
    }
}


    /*
    Foo *foo = [[Foo alloc] init];
    [foo bar];
    
    
    NSString* plistFilePath = nil;
    NSFileManager* manager = [NSFileManager defaultManager];
    if ((plistFilePath = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"info.plist"]))
    {
        if ([manager isWritableFileAtPath:plistFilePath])
        {
            NSMutableDictionary* infoDictioio = [NSMutableDictionary dictionaryWithContentsOfFile:plistFilePath];
            [infoDictioio setObject:@"foo object" forKey:@"fookey"];
            [infoDictioio writeToFile:plistFilePath atomically:YES];
            NSError *error = nil;
            //[manager setAttributes:[NSDictionary dictionaryWithObject:[NSDate date] forKey:NSFileModificationDate] ofItemAtPath:[[NSBundle mainBundle] bundlePath] error:&error];
            if (error) {
                NSLog(@"%@", [error description]);
            }
        }
    }
    */



- (void)jsonDownload
{
    NSURL *jsonURL = [NSURL URLWithString:@"http://localhost/xcodeJSON/news.json"];
    [JSONDownloader downloadJSONWithURL:jsonURL parameters:nil success:^(NSURLResponse *response, BOOL success, NSArray *jsonArray) {
        if (success) {
            //NSLog(@"JSON: %@", jsonArray);
        }
        
    } failure:^(NSError *error) {
        
    }];
    
}



- (void)myClassTest {
    
    
//    Bird *bird1 = [[Bird alloc] init];
//    bird1.birdName = @"Tia";
//    [bird1 log];
//
//    Bird *bird2 = [[Bird alloc] initWithName:@"Moina"];
//    [bird2 log];
//
//
//    Bird *bird3 = [[Bird alloc] initWithName:@"Doel"];
//    [bird3 log];
//    
//    Animal *anim = (Animal *)bird3;
//    anim.animalName = @"Tota";
//    [anim log];
    
    
//    
//    [DynamicClassBinder buildClassFromDictionary:@[@"FirstName", @"LastName", @"Age", @"Gender"] withName:@"Person"];
//    id object = [[NSClassFromString(@"Person") alloc] init];
//    NSLog(@"%@", object);
//    
//    
//    
//    [self setFirstName:@"Fuck" forObject:object];
//    
//    //id value = [object valueForKey:@"FirstName"];
//    NSLog(@"FirstName: %@", [self firstNameForObject:object]);
    
}

- (void)setFirstName:(NSString *)firstname forObject:(id)obj
{
    objc_setAssociatedObject(obj, @"FirstName", firstname, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)firstNameForObject:(id)obj
{
    return objc_getAssociatedObject(obj, @"FirstName");
}






- (void)test {
    Foo *foo = [[Foo alloc] init];
    [foo bar];
    
    
    NSString* plistFilePath = nil;
    NSFileManager      * manager = [NSFileManager defaultManager];
    if ((plistFilePath    = [[[NSBundle      mainBundle] bundlePath]          stringByAppendingPathComponent:@"info.plist"]))
    {
        if ([manager  isWritableFileAtPath:     plistFilePath])
        {
            NSMutableDictionary* infoDictioio = [NSMutableDictionary dictionaryWithContentsOfFile:plistFilePath];
            [infoDictioio setObject:@"foo object"     forKey:      @"fookey"];
            [infoDictioio writeToFile:    plistFilePath atomically:YES];
            NSError *error =           nil;
            //[manager setAttributes:[NSDictionary dictionaryWithObject:[NSDate date] forKey:NSFileModificationDate] ofItemAtPath:[[NSBundle mainBundle] bundlePath] error:&error];
            if (error) {
                NSLog(@"%@", [error       description]);
            }
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
