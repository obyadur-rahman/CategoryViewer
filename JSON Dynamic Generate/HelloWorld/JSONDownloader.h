//
//  JSONDownloader.h
//  HelloWorld
//
//  Created by Obyadur Rahman on 7/3/15.
//  Copyright (c) 2015 IMpulse BD Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^jsonSuccessBlock)(NSURLResponse *response, BOOL success, NSArray *jsonArray);
typedef void(^jsonFailureBlock)(NSError *error);


@interface JSONDownloader : NSObject

+ (void)downloadJSONWithURL:(NSURL *)jsonURL
                  parameters:(NSDictionary *)param
                     success:(jsonSuccessBlock)successBlock
                     failure:(jsonFailureBlock)failureBlock;
@end
