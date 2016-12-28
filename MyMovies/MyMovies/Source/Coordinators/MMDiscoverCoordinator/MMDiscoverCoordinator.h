//
//  MMDiscoverCoordinator.h
//  MyMovies
//
//  Created by Serhii Kostiuk on 28.12.16.
//  Copyright © 2016 Serhii Kostiuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MMDownloadContentSession;

@interface MMDiscoverCoordinator : NSObject

- (instancetype)initWithNavigationController:(UINavigationController *)navigationController
                             downloadSession:(MMDownloadContentSession *)session;

@end
