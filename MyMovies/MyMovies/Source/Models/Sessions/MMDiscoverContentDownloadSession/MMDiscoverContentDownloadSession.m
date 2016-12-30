//
//  MMDiscoverContentDownloadSession.m
//  MyMovies
//
//  Created by Serhii Kostiuk on 29.12.16.
//  Copyright © 2016 Serhii Kostiuk. All rights reserved.
//


#import "MMDiscoverContentDownloadSession.h"
#import "AFNetworking.h"
#import "MMSessionConfig.h"
#import "MMMovieModel.h"

static NSString * const kDiscoverUrlFormat = @"%@/discover/movie?api_key=%@&sort_by=popularity.desc";

@implementation MMDiscoverContentDownloadSession

#pragma mark -
#pragma mark Request Methods

- (void)getDiscoverList:(NSString *)pageLimit completion:(MMDiscoverListCompletionBlock)completionBlock {
    if (completionBlock) {
        NSDictionary* parameters = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:pageLimit, nil] forKeys:[NSArray arrayWithObjects:@"page", nil]];
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        
        [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        
        [manager GET:[self prepareUrl] parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"JSON: %@", responseObject);
            if ([responseObject isKindOfClass:[NSDictionary class]]) {
                NSDictionary* infosDictionary = responseObject;
                dispatch_async(dispatch_get_main_queue(), ^{
                    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                    completionBlock([self processResponseObject:infosDictionary], nil);
                });
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"Error: %@", error);
            dispatch_async(dispatch_get_main_queue(), ^{
                [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                
                NSString* errorString = error.localizedDescription;
                
                if ([errorString length] == 0) {
                    errorString = nil;
                }
                completionBlock(nil, errorString);
            });
        }];
    }
}

#pragma mark - Data Parsing

- (NSArray *)processResponseObject:(NSDictionary*)data {
    if (data)  {
        NSArray* itemsList = [NSArray arrayWithArray:[data objectForKey:@"results"]];
        NSMutableArray* sortedArray = [[NSMutableArray alloc] init];
        
        for (NSDictionary* item in itemsList) {
            MMMovieModel* movie = [[MMMovieModel alloc] initWithDictionary:item];
            [sortedArray addObject:movie];
        }
        
        return sortedArray;
    }
    return nil;
}

#pragma mark -
#pragma mark Private

- (NSString *)prepareUrl {
    return [NSString stringWithFormat:kDiscoverUrlFormat, [MMSessionConfig sharedSessionConfig].hostUrlString, [MMSessionConfig sharedSessionConfig].apiKey];
}

@end
