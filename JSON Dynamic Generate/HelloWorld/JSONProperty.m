//
//  JSONProperty.m
//  HelloWorld
//
//  Created by Obyadur Rahman on 7/3/15.
//  Copyright (c) 2015 IMpulse BD Ltd. All rights reserved.
//

#import "JSONProperty.h"

@interface JSONProperty ()
{
    NSMutableArray *_propertiesName;
    NSMutableDictionary *_allPropertiesName;
    
    NSMutableDictionary *_propertiesNameType;
}

@end


@implementation JSONProperty

@synthesize propertiesName      = _propertiesName;
@synthesize propertiesNameType  = _propertiesNameType;

- (id)init
{
    if (self = [super init])
    {
        _propertiesName = [NSMutableArray new];
        _allPropertiesName = [NSMutableDictionary new];
        
        _propertiesNameType= [NSMutableDictionary new];
    }
    return self;
}

- (id)initWithJSONArray:(NSArray *)jsonArray
{
    if (self = [self init])
    {
        [self parseJSONArray:jsonArray];
    }
    return self;
}

- (void)parseJSONArray:(NSArray *)jsonArray
{
    for (NSDictionary *jsonDict in jsonArray)
    {
        [self parseJSONDictionary:jsonDict];
    }
    
    _propertiesName = [[_allPropertiesName allKeys] mutableCopy];
}

- (void)parseJSONDictionary:(NSDictionary *)jsonDict
{
    for (NSString *key in [jsonDict allKeys])
    {
        if (![_allPropertiesName objectForKey:key])
        {
            [_allPropertiesName setObject:@"" forKey:key];
            
            [self setPropertyTypeForKey:key value:jsonDict[key]];
        }
    }
}

- (void)setPropertyTypeForKey:(NSString *)key value:(id)value
{
    NSString *propertyType = @"";
    
    if ([value isKindOfClass:[NSNumber class]])
    {
        NSNumber *numberValue = value;
    
        if (numberValue == (void*)kCFBooleanFalse || numberValue == (void*)kCFBooleanTrue)
        {
            propertyType = @"BOOL";
        }
        else
        {
            CFNumberType numberType = CFNumberGetType((CFNumberRef)numberValue);
            
            propertyType = [self getNumberType:numberType];
        }
    }
    else if ([value isKindOfClass:[NSString class]])
    {
        propertyType = @"NSString";
    }
    else if ([value isKindOfClass:[NSNull class]])
    {
        propertyType = @"NSNull";
    }
    else
    {
        propertyType = @"Unknown";
    }
    
    //
    // Check for empty/ unknown/ null data type
    //
    if (propertyType.length == 0 || [propertyType isEqualToString:@"Unknown"] || [propertyType isEqualToString:@"NSNull"])
    {
        [_propertiesNameType setObject:@"NSString" forKey:key];
    }
    else
    {
        [_propertiesNameType setObject:propertyType forKey:key];
    }
}

- (NSString *)getNumberType:(CFNumberType)numberType
{
    if (numberType == kCFNumberSInt8Type ||
        numberType == kCFNumberSInt16Type ||
        numberType == kCFNumberSInt32Type ||
        numberType == kCFNumberSInt64Type ||
        numberType == kCFNumberIntType ||
        numberType == kCFNumberLongType ||
        numberType == kCFNumberLongLongType ||
        numberType == kCFNumberNSIntegerType)
    {
        return @"NSInteger";
    }
    else if (numberType == kCFNumberFloat32Type ||
             numberType == kCFNumberFloat64Type ||
             numberType == kCFNumberFloatType ||
             numberType == kCFNumberCGFloatType)
    {
        return @"float";
    }
    else if (numberType == kCFNumberDoubleType)
    {
        return @"double";
    }
    else
    {
        return @"NSNumber";
    }
}

@end
