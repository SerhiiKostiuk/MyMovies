//
//  MMDownloadContentSession.h
//  MyMovies
//
//  Created by Serhii Kostiuk on 28.12.16.
//  Copyright © 2016 Serhii Kostiuk. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^MMDiscoverListCompletionBlock)(NSArray *dataArray, NSString *errorString);

@interface MMDownloadContentSession : NSObject

+ (MMDownloadContentSession *)sharedSession;



@end
