//
//  JSONProperty.h
//  HelloWorld
//
//  Created by Obyadur Rahman on 7/3/15.
//  Copyright (c) 2015 IMpulse BD Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSONProperty : NSObject

@property (nonatomic, readonly) NSMutableArray      *propertiesName;
@property (nonatomic, readonly) NSMutableDictionary *propertiesNameType;

- (id)initWithJSONArray:(NSArray *)jsonArray;

@end
