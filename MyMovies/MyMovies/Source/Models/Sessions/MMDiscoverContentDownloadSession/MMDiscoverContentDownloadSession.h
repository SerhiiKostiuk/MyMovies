//
//  MMDiscoverContentDownloadSession.h
//  MyMovies
//
//  Created by Serhii Kostiuk on 29.12.16.
//  Copyright © 2016 Serhii Kostiuk. All rights reserved.
//

#import "MMDownloadContentSession.h"

//  `MMDiscoverListCompletionBlock` is a completion handler block for the `MMDiscoverContentDownloadSession`

//  @param dataArray   An array of `MMMovieModel` objects

typedef void (^MMDiscoverListCompletionBlock)(NSArray* _Nullable dataArray, NSString* _Nullable errorString);


@interface MMDiscoverContentDownloadSession : MMDownloadContentSession

@end
