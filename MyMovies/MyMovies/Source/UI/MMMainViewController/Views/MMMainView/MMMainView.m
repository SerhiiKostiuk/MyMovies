//
//  MMMainView.m
//  MyMovies
//
//  Created by Serhii Kostiuk on 04.01.17.
//  Copyright © 2017 Serhii Kostiuk. All rights reserved.
//

#import "MMMainView.h"
#import "MMBottomButtonView.h"

@interface MMMainView ()
@property (nonatomic, strong) MMBottomButtonView *tabBarView;

@end

@implementation MMMainView

- (void)awakeFromNib {
    [super awakeFromNib];
    
     self.tabBarView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([MMBottomButtonView class]) owner:self options:nil]objectAtIndex:0];
    
    [self.buttonView addSubview:self.tabBarView];
}

@end
