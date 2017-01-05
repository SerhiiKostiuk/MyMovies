//
//  UIStoryboard+KSExtensions.m
//  MyMovies
//
//  Created by Serhii Kostiuk on 28.12.16.
//  Copyright © 2016 Serhii Kostiuk. All rights reserved.
//

#import "UIStoryboard+KSExtensions.h"

#import "MMMainViewController.h"
#import "MMDiscoverViewController.h"

@implementation UIStoryboard (KSExtensions)

+ (instancetype)mainStoryboard {
    return [UIStoryboard storyboardWithName:NSStringFromClass([MMMainViewController class])
                                     bundle:nil];
}

+ (instancetype)discoverStoryboard {
    return [UIStoryboard storyboardWithName:NSStringFromClass([MMDiscoverViewController class])
                                     bundle:nil];
}

@end
