//
//  JSONDownloader.m
//  HelloWorld
//
//  Created by Obyadur Rahman on 7/3/15.
//  Copyright (c) 2015 IMpulse BD Ltd. All rights reserved.
//

#import "JSONDownloader.h"
#import "JSONProperty.h"

@implementation JSONDownloader

+ (void)downloadJSONWithURL:(NSURL *)jsonURL
                 parameters:(NSDictionary *)param
                    success:(jsonSuccessBlock)successBlock
                    failure:(jsonFailureBlock)failureBlock;
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:jsonURL];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *jsonData, NSError *error) {
                               if ( !error )
                               {
                                   if (jsonData.length)
                                   {
                                       NSError *error = nil;
                                       NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
                                       
                                       if (error != nil)
                                       {
                                           successBlock(response, NO, @[]);
                                       }
                                       else {
                                           JSONProperty *properties = [[JSONProperty alloc] initWithJSONArray:jsonArray];
                                           NSLog(@"All Properties: %@", properties.propertiesName);
                                           NSLog(@"All Properties with Type: %@", properties.propertiesNameType);
                                           successBlock(response, YES, jsonArray);
                                       }
                                   }
                                   else {
                                       successBlock(response, NO, @[]);
                                   }
                               }
                               else {
                                   failureBlock(error);
                               }
                           }];
}




@end
