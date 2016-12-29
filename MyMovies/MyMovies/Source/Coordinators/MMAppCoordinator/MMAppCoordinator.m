//
//  MMAppCoordinator.m
//  MyMovies
//
//  Created by Serhii Kostiuk on 28.12.16.
//  Copyright © 2016 Serhii Kostiuk. All rights reserved.
//

#import "MMAppCoordinator.h"
#import "MMDiscoverCoordinator.h"
#import "MMDownloadContentSession.h"
#import "UIStoryboard+KSExtensions.h"

@interface MMAppCoordinator ()
@property (nonatomic, strong)   UINavigationController      *rootNavigationController;
@property (nonatomic, strong)   MMDiscoverCoordinator       *discoverCoordinator;
@property (nonatomic, strong)   MMDownloadContentSession    *session;

@end

@implementation MMAppCoordinator

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        [self compositionRootSetup];
    }
    
    return self;
}

#pragma mark -
#pragma mark Private

- (void)compositionRootSetup {
    UIStoryboard *storyboard = [UIStoryboard mainStoryboard];
    
    UINavigationController *navigationController = [storyboard instantiateInitialViewController];
    MMDownloadContentSession *session = [MMDownloadContentSession sharedSession];
    
    self.discoverCoordinator = [[MMDiscoverCoordinator alloc] initWithNavigationController:navigationController downloadSession:session];
    
}

@end
