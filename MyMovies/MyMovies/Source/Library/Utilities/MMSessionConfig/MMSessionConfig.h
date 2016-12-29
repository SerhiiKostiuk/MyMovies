//
//  MMSessionConfig.h
//  MyMovies
//
//  Created by Serhii Kostiuk on 29.12.16.
//  Copyright © 2016 Serhii Kostiuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMSessionConfig : NSObject

@property (nonatomic, readonly) NSString* hostUrlString;
@property (nonatomic, readonly) NSString* apiKey;
    
+ (MMSessionConfig *)sharedSessionConfig;
 
@end
