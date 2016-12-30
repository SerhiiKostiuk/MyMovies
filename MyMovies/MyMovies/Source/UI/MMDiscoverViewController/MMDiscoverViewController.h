//
//  MMDiscoverViewController.h
//  MyMovies
//
//  Created by Serhii Kostiuk on 28.12.16.
//  Copyright © 2016 Serhii Kostiuk. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MMDiscoverViewControllerDelegate <NSObject>

@optional
//- (void)discoverViewControllerDidPressPhotoUploadButton;
//- (void)homeViewControllerDidPressVideoUploadButton;
//- (void)homeViewControllerDidPressSettingsButton;

@end

@interface MMDiscoverViewController : UIViewController
@property (nonatomic, weak) id<MMDiscoverViewControllerDelegate>        delegate;

@end
