//
//  MMDiscoverCoordinator.m
//  MyMovies
//
//  Created by Serhii Kostiuk on 28.12.16.
//  Copyright © 2016 Serhii Kostiuk. All rights reserved.
//
@import UIKit;

#import "MMDiscoverCoordinator.h"
#import "MMDownloadContentSession.h"
#import "MMDiscoverViewController.h"

@interface MMDiscoverCoordinator () <MMDiscoverViewControllerDelegate>
@property (nonatomic, strong) UINavigationController              *navigationController;
@property (nonatomic, strong) MMDownloadContentSession            *session;
@property (nonatomic, strong) MMDiscoverViewController            *discoverViewController;

@end

@implementation MMDiscoverCoordinator

- (instancetype)initWithNavigationController:(UINavigationController *)navigationController
                             downloadSession:(MMDownloadContentSession *)session
{
    self = [super init];
    
    if (self) {
        self.navigationController = navigationController;
        self.session = session;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (UIViewController *)initialViewController {
//    FMUser *user = [self.userPersistence savedUser];
    
    if (nil == self.discoverViewController) {
        self.discoverViewController = [[MMDiscoverViewController alloc] initWithSession:self.session];
        self.discoverViewController.delegate = self;
    }
    
    return self.discoverViewController;
}

@end
