//
//  MMSessionConfig.m
//  MyMovies
//
//  Created by Serhii Kostiuk on 29.12.16.
//  Copyright © 2016 Serhii Kostiuk. All rights reserved.
//

#import "MMSessionConfig.h"
#import "NSDictionary+KSExtensions.h"

static NSString * const kConfigPlistFileName = @"MMSourceConfig";
static NSString * const kConfigTheMovieDbHostKey = @"themoviedb_host";
static NSString * const kConfigApiKey = @"api_key";

@interface MMSessionConfig ()
@property (nonatomic, strong) NSString* hostUrlString;
@property (nonatomic, strong) NSString* apiKey;

@end

@implementation MMSessionConfig

#pragma mark - Init Methods
    
+ (MMSessionConfig *)sharedSessionConfig {
    static dispatch_once_t onceToken;
    static MMSessionConfig* instance = nil;
    
    dispatch_once(&onceToken, ^{
        instance = [[MMSessionConfig alloc] init];
    });
    
    return instance;
}
    
- (instancetype)init {
    self = [super init];
    
    if (self) {
        NSBundle* bundle = [NSBundle bundleForClass:[self class]];
        NSDictionary* config = [[NSDictionary alloc]initWithContentsOfFile:[bundle pathForResource:kConfigPlistFileName ofType:@"plist"]];
        
        self.hostUrlString = [config safeStringForKey:kConfigTheMovieDbHostKey];
        //            _version = [config safeStringForKey:kConfigVersionKey];
        //            _build = [config safeStringForKey:kConfigBuildKey];
        self.apiKey = [config safeStringForKey:kConfigApiKey];
    }
    
    return self;
}
    
@end
