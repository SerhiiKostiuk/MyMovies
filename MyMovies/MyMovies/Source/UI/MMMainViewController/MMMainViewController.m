//
//  MMMainViewController.m
//  MyMovies
//
//  Created by Serhii Kostiuk on 28.12.16.
//  Copyright © 2016 Serhii Kostiuk. All rights reserved.
//

#import "MMMainViewController.h"

#import "MMMainView.h"

@interface MMMainViewController ()
@property (nonatomic, strong) MMMainView *rootView;
@property (nonatomic, weak) UIViewController *currentShowingVC;
@end

@implementation MMMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

#pragma mark -
#pragma mark Accessors

- (MMMainView *)rootView {
    return (MMMainView *)self.view;
}

- (void)presentChildController:(UIViewController*)childVC {
    
    //0. Remove the current Detail View Controller showed
    if(self.currentShowingVC){
        [self removeCurrentDetailViewController];
    }
    
    //1. Add the detail controller as child of the container
    [self addChildViewController:childVC];
    
    //2. Define the detail controller's view size
    childVC.view.frame = self.rootView.frame;
    
    //3. Add the Detail controller's view to the Container's detail view and save a reference to the detail View Controller
    [self.rootView addSubview:childVC.view];
    self.currentShowingVC = childVC;
    
    //4. Complete the add flow calling the function didMoveToParentViewController
    [childVC didMoveToParentViewController:self];
    
}

- (void)removeCurrentDetailViewController{
    
    //1. Call the willMoveToParentViewController with nil
    //   This is the last method where your detailViewController can perform some operations before neing removed
    [self.currentShowingVC willMoveToParentViewController:nil];
    
    //2. Remove the DetailViewController's view from the Container
    [self.currentShowingVC.view removeFromSuperview];
    
    //3. Update the hierarchy"
    //   Automatically the method didMoveToParentViewController: will be called on the detailViewController)
    [self.currentShowingVC removeFromParentViewController];
}

@end
