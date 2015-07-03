//
//  AsyncImageDownloader.h
//  HelloWorld
//
//  Created by Obyadur Rahman on 6/25/15.
//  Copyright (c) 2015 IMpulse BD Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^successBlock)(NSURLResponse *response, BOOL success, NSData *imageData);
typedef void(^failureBlock)(NSError *error);


@interface AsyncImageDownloader : NSObject

- (void)downloadImageWithURL:(NSURL *)imageURL
                  parameters:(NSDictionary *)param
                     success:(successBlock)successBlock
                     failure:(failureBlock)failureBlock;

@end
