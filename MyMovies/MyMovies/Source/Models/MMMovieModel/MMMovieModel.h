//
//  MMMovieModel.h
//  MyMovies
//
//  Created by Serhii Kostiuk on 29.12.16.
//  Copyright © 2016 Serhii Kostiuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMMovieModel : NSObject

@property (nonatomic, copy) NSString    *movieTitle;
@property (nonatomic, copy) NSString    *movieId;
@property (nonatomic, copy) NSString    *movieSynopsis;
@property (nonatomic, copy) NSString    *movieYear;
@property (nonatomic, copy) NSString    *movieOriginalBackdropImageUrl;
@property (nonatomic, copy) NSString    *movieOriginalPosterImageUrl;
@property (nonatomic, copy) NSString    *movieThumbnailPosterImageUrl;
@property (nonatomic, copy) NSString    *movieThumbnailBackdropImageUrl;
@property (nonatomic, copy) NSString    *movieGenresString;
@property (nonatomic, copy) NSString    *movieVoteCount;
@property (nonatomic, copy) NSString    *movieVoteAverage;
@property (nonatomic, copy) NSString    *moviePopularity;

- (instancetype)initWithDictionary:(NSDictionary*)dictionary;

@end
