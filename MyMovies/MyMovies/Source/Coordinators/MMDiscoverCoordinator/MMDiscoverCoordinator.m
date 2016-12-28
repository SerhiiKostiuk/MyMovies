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

@interface MMDiscoverCoordinator ()
@property (nonatomic, strong)   UINavigationController              *navigationController;
@property (nonatomic, strong)  MMDownloadContentSession             *session;
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

@end
