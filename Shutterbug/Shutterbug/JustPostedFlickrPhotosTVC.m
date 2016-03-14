//
//  JustPostedFlickrPhotosTVC.m
//  Shutterbug
//
//  Created by iOS Entwickler on 14.03.16.
//  Copyright (c) 2016 noorg. All rights reserved.
//

#import "JustPostedFlickrPhotosTVC.h"
#import "FlickrFetcher.h"
@interface JustPostedFlickrPhotosTVC ()

@end

@implementation JustPostedFlickrPhotosTVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self fetchPhotos];
}

- (void)fetchPhotos{
    
    NSURL *url = [FlickrFetcher URLforRecentGeoreferencedPhotos];
    
#warning blocks main thread
    NSData *jsonResults = [NSData dataWithContentsOfURL:url];
    NSDictionary *propertyListResults = [NSJSONSerialization JSONObjectWithData:jsonResults options:0 error:NULL];
    
    NSArray *photos = [propertyListResults valueForKeyPath:FLICKR_RESULTS_PHOTOS];
    
    self.photos = photos;
}

@end
