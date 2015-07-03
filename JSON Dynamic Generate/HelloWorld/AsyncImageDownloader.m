//
//  AsyncImageDownloader.m
//  HelloWorld
//
//  Created by Obyadur Rahman on 6/25/15.
//  Copyright (c) 2015 IMpulse BD Ltd. All rights reserved.
//

#import "AsyncImageDownloader.h"

@implementation AsyncImageDownloader

- (void)downloadImageWithURL:(NSURL *)imageURL
                  parameters:(NSDictionary *)param
                     success:(successBlock)successBlock
                     failure:(failureBlock)failureBlock
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:imageURL];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                               if ( !error )
                               {
                                   if (data.length) {
                                       successBlock(response, YES, data);
                                   }
                                   else {
                                       successBlock(response, NO, data);
                                   }
                               }
                               else {
                                   failureBlock(error);
                               }
                           }];
}

@end

/*
 dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
 dispatch_async(queue, ^{
	NSData *data = [NSData dataWithContentsOfURL:imageURL];
	UIImage *image = [UIImage imageWithData:data];
	dispatch_async(dispatch_get_main_queue(), ^{
 cell.imageView.image = image;
	});
 });
 */
