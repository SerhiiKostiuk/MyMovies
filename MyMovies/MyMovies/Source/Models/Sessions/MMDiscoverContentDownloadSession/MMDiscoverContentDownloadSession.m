//
//  MMDiscoverContentDownloadSession.m
//  MyMovies
//
//  Created by Serhii Kostiuk on 29.12.16.
//  Copyright © 2016 Serhii Kostiuk. All rights reserved.
//


#import "MMDiscoverContentDownloadSession.h"
#import "AFNetworking.h"

@implementation MMDiscoverContentDownloadSession

#pragma mark - Request Methods

- (void)getDiscoverList:(NSString *)pageLimit completion:(MMDiscoverListCompletionBlock)completionBlock {
    if (completionBlock)
    {
        NSDictionary* parameters = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:pageLimit, nil] forKeys:[NSArray arrayWithObjects:@"page", nil]];
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        
//        AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager];
        [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        
        [manager GET:[self prepareUrl] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
         {
             NSLog(@"JSON: %@", responseObject);
             NSDictionary* infosDictionary = [self dictionaryFromResponseData:operation.responseData jsonPatternFile:@"KMDiscoverSourceJsonPattern.json"];
             
             dispatch_async(dispatch_get_main_queue(), ^{
                 [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                 completionBlock([self processResponseObject:infosDictionary], nil);
             });
         }
             failure:^(AFHTTPRequestOperation *operation, NSError *error)
         {
             NSLog(@"Error: %@", error);
             dispatch_async(dispatch_get_main_queue(), ^{
                 [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                 
                 NSString* errorString = error.localizedDescription;
                 
                 if ([errorString length] == 0)
                 {
                     errorString = nil;
                 }
                 completionBlock(nil, errorString);
             });
         }];
    }
}

@end
