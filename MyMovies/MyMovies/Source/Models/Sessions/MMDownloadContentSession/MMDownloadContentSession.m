//
//  MMDownloadContentSession.m
//  MyMovies
//
//  Created by Serhii Kostiuk on 28.12.16.
//  Copyright © 2016 Serhii Kostiuk. All rights reserved.
//

#import "MMDownloadContentSession.h"

@implementation MMDownloadContentSession

+ (MMDownloadContentSession *)sharedSession {
    static dispatch_once_t onceToken;
    static MMDownloadContentSession *instance = nil;
    
    dispatch_once(&onceToken, ^{
        instance = [[MMDownloadContentSession alloc] init];
    });
    return instance;
}

- (void)downloadContentWithJSONString:(NSString *)JSONString {
    
}

@end
