//
//  NSDictionary+KSExtensions.m
//  MyMovies
//
//  Created by Serhii Kostiuk on 29.12.16.
//  Copyright © 2016 Serhii Kostiuk. All rights reserved.
//

#import "NSDictionary+KSExtensions.h"

@implementation NSDictionary (KSExtensions)

- (NSString *)safeStringForKey:(id)key {
    NSString* string = nil;
    id obj = [self objectForKey:key];
    
    if ([obj isKindOfClass:[NSString class]]) {
        string = obj;
    } else {
        string = @"";
    }
    
    return [string stringByRemovingPercentEncoding];
}

- (NSNumber *)safeNumberForKey:(id)key {
    NSNumber* number = nil;
    id obj = [self objectForKey:key];
    
    if ([obj isKindOfClass:[NSNumber class]]) {
        number = obj;
    } else {
        number = [NSNumber numberWithInt:0];
    }
    
    return number;
}

- (NSArray *)safeArrayForKey:(id)key {
    NSArray* array = nil;
    id obj = [self objectForKey:key];
    
    if ([obj isKindOfClass:[NSArray class]]) {
        array = obj;
    } else {
        array = [NSArray array];
    }
    
    return array;
}

- (NSDictionary *)safeDictionaryForKey:(id)key {
    NSDictionary* dictionary = nil;
    id obj = [self objectForKey:key];
    
    if ([obj isKindOfClass:[NSDictionary class]]) {
        dictionary = obj;
    } else {
        dictionary = [NSDictionary dictionary];
    }
    
    return dictionary;
}

@end
