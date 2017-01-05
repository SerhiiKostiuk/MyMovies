//
//  MMDiscoverViewController.m
//  MyMovies
//
//  Created by Serhii Kostiuk on 28.12.16.
//  Copyright © 2016 Serhii Kostiuk. All rights reserved.
//

#import "MMDiscoverViewController.h"
#import "MMDownloadContentSession.h"
#import "MMDiscoverView.h"

#import "UIStoryboard+KSExtensions.h"

@interface MMDiscoverViewController ()
@property (nonatomic, weak) MMDownloadContentSession *session;
@property (nonatomic, strong) MMDiscoverView *rootView;
@property (nonatomic, strong) NSMutableArray *movieModelArray;
@end

@implementation MMDiscoverViewController

#pragma mark -
#pragma mark View Controller Lifecycle

#pragma mark -
#pragma mark Class Methods

+ (instancetype)controllerWithSession:(MMDownloadContentSession *)session {
    UIStoryboard *storyboard = [UIStoryboard discoverStoryboard];
    NSString *identifier = NSStringFromClass([MMDiscoverViewController class]);
    
    MMDiscoverViewController *discoverViewController = nil;
    discoverViewController = [storyboard instantiateViewControllerWithIdentifier:identifier];
    discoverViewController.session = session;
    
    return discoverViewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self requestDiscoverMoviesList];
}

#pragma mark -
#pragma mark Accessors

- (MMDiscoverView *)rootView {
    return (MMDiscoverView *)self.view;
}

#pragma mark - 
#pragma mark Network Request Methods

- (void)requestDiscoverMoviesList {
    MMDiscoverListCompletionBlock completionBlock = ^(NSArray* dataArray, NSString* errorString) {
        if (dataArray != nil) {
            [self processData:dataArray];
        }
    };
    
    [self.session getDiscoverListWithCompletion:completionBlock];
}

- (void)processData:(NSArray *)data {
    if(!self.movieModelArray) {
        self.movieModelArray = [NSMutableArray array];
    }
    self.movieModelArray = [NSMutableArray arrayWithArray:data];
    
//    [self.rootView.discoverTableView reloadData];
}


@end
