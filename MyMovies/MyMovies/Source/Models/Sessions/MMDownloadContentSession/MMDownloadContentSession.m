//
//  MMDownloadContentSession.m
//  MyMovies
//
//  Created by Serhii Kostiuk on 28.12.16.
//  Copyright © 2016 Serhii Kostiuk. All rights reserved.
//

#import "MMDownloadContentSession.h"
#import "MMDiscoverContentDownloadSession.h"

@interface MMDownloadContentSession ()
@property (nonatomic, strong) NSOperationQueue* operationQueue;
@property (nonatomic, strong) MMDiscoverContentDownloadSession *discoverSession;

@end

@implementation MMDownloadContentSession

#pragma mark -
#pragma mark Class Methods

+ (MMDownloadContentSession *)sharedSession {
    static dispatch_once_t onceToken;
    static MMDownloadContentSession *instance = nil;
    
    dispatch_once(&onceToken, ^{
        instance = [[MMDownloadContentSession alloc] init];
    });
    return instance;
}

#pragma mark - 
#pragma mark Init Methods

- (id)init {
    self = [super init];
    
    if (self) {
        self.operationQueue = [[NSOperationQueue alloc] init];
        self.operationQueue.maxConcurrentOperationCount = 1;
        
        self.discoverSession = [MMDiscoverContentDownloadSession new];
    }
    
    return self;
}

#pragma mark - 
#pragma mark Response Data Parsing

- (void)getDiscoverListWithCompletion:(MMDiscoverListCompletionBlock)comletion {
    [self.discoverSession getDiscoverList:@"1" completion:comletion];
}

@end
