//
//  MySearchController.m
//  ChickFinder
//
//  Created by Albert Insogna on 9/2/13.
//  Copyright (c) 2013 Albert Insogna. All rights reserved.
//

#import "MySearchController.h"

@implementation MySearchController

- (id) init {
    self = [super init];
    if (self != nil) {
        CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(37.33233141, -122.03121860);
        MKCoordinateSpan span = MKCoordinateSpanMake(2.0, 2.0);
        MKCoordinateRegion region = MKCoordinateRegionMake(coord, span);
        
        self.localSearchRequest = [[MKLocalSearchRequest alloc] init];
        self.localSearchRequest.region = region;
        self.localSearchRequest.naturalLanguageQuery = @"Chick-fil-A";
        
        self.localSearch = [[MKLocalSearch alloc] initWithRequest:self.localSearchRequest];
        [self.localSearch startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error) {
            if (error) {
                NSLog(@"MKLocalSearch startWithCompletionHandler failed with error: %@", error);
                return;
            } else {
                for (MKMapItem* mapItem in response.mapItems)
                {
                    NSLog(@"Result: %f, %f", mapItem.placemark.coordinate.latitude
                          , mapItem.placemark.coordinate.longitude);
                }
            }
        }];
    }
    return self;
}


@end
