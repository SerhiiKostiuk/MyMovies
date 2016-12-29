//
//  MMMovieModel.m
//  MyMovies
//
//  Created by Serhii Kostiuk on 29.12.16.
//  Copyright © 2016 Serhii Kostiuk. All rights reserved.
//

#import "MMMovieModel.h"
#import "NSDictionary+KSExtensions.h"

static NSString * const kMovieTitle = @"original_title";
static NSString * const kMovieId = @"id";
static NSString * const kMovieYearDate = @"year";
static NSString * const kMovieSynopsis = @"overview";
static NSString * const kMovieOriginalPosterImageUrl = @"poster_path";
static NSString * const kMovieBackdropPosterImageUrl = @"backdrop_path";
static NSString * const kMovieDetailedPosterImageUrl = @"thumbnail";
static NSString * const kMoviePosterRelatedMovies = @"similar";
static NSString * const kMovieGenres = @"genres";
static NSString * const kMoviePopularity = @"popularity";
static NSString * const kMovieVoteCount = @"vote_count";
static NSString * const kMovieVoteAverage = @"vote_average";

@implementation MMMovieModel

#pragma mark -
#pragma mark Init Methods

- (instancetype)initWithDictionary:(NSDictionary*)dictionary {
    self = [super init];
    
    if (self) {
        [self initialiseWithSafeValues];
        [self fillModelWithDictionary:dictionary];
    }
    
    return self;
}

- (void)initialiseWithSafeValues {
    self.movieId = @"";
    self.movieSynopsis = @"";
    self.movieYear = @"";
    self.movieOriginalPosterImageUrl = @"";
    self.movieThumbnailPosterImageUrl = @"";
    self.movieOriginalBackdropImageUrl = @"";
    self.movieThumbnailBackdropImageUrl = @"";
    self.movieGenresString = @"";
    self.moviePopularity = @"";
    self.movieVoteAverage = @"";
    self.movieVoteCount = @"";
    self.movieTitle = @"";
}

#pragma mark -
#pragma mark Dictionary Parsing

- (void)fillModelWithDictionary:(NSDictionary*)dictionary {
    if (dictionary) {
        self.movieId = [NSString stringWithFormat:@"%d", [[dictionary safeNumberForKey:kMovieId] intValue]];
        self.movieTitle = [dictionary safeStringForKey:kMovieTitle];
        self.movieSynopsis = [dictionary safeStringForKey:kMovieSynopsis];
        
        self.movieThumbnailPosterImageUrl = [NSString stringWithFormat:@"http://image.tmdb.org/t/p/w92/%@", [dictionary safeStringForKey:kMovieOriginalPosterImageUrl]];
        self.movieOriginalBackdropImageUrl = [NSString stringWithFormat:@"http://image.tmdb.org/t/p/w780/%@", [dictionary safeStringForKey:kMovieBackdropPosterImageUrl]];
        self.movieThumbnailBackdropImageUrl = [NSString stringWithFormat:@"http://image.tmdb.org/t/p/w300/%@", [dictionary safeStringForKey:kMovieBackdropPosterImageUrl]];
        self.movieOriginalPosterImageUrl = [NSString stringWithFormat:@"http://image.tmdb.org/t/p/w500/%@", [dictionary safeStringForKey:kMovieOriginalPosterImageUrl]];
        
        self.movieGenresString = [self processGenresIntoString:[dictionary safeArrayForKey:kMovieGenres]];
        self.movieVoteCount = [NSString stringWithFormat:@"%d", [[dictionary safeNumberForKey:kMovieVoteCount] intValue]];
        
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
        [formatter setPositiveFormat:@"#0.0"];
        
        self.moviePopularity = [formatter stringFromNumber:[dictionary safeNumberForKey:kMoviePopularity]];
        self.movieVoteAverage = [formatter stringFromNumber:[dictionary safeNumberForKey:kMovieVoteAverage]];
        
        if ([self.moviePopularity length] >= 2) {
            [self.moviePopularity substringToIndex:2];
        }
        
        if ([self.movieVoteAverage length] >= 2) {
            [self.movieVoteAverage substringToIndex:2];
        }
    }
}


- (NSString*)processGenresIntoString:(NSArray*)genres {
    if ([genres count] == 0) {
        return @"";
    }
    
    NSMutableString* genresString = [[NSMutableString alloc] init];
    
    for (NSDictionary* genre in genres) {
        [genresString appendFormat:@"%@, ", [genre safeStringForKey:@"name"]];
    }
    
    [genresString replaceCharactersInRange:NSMakeRange([genresString length]-2, 2) withString:@""];
    
    return genresString;
}

@end
