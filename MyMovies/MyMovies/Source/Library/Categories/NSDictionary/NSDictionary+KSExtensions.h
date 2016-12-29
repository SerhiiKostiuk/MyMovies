//
//  NSDictionary+KSExtensions.h
//  MyMovies
//
//  Created by Serhii Kostiuk on 29.12.16.
//  Copyright © 2016 Serhii Kostiuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (KSExtensions)

- (NSString *)safeStringForKey:(id)key;
- (NSNumber *)safeNumberForKey:(id)key;
- (NSArray *)safeArrayForKey:(id)key;
- (NSDictionary *)safeDictionaryForKey:(id)key;


@end
