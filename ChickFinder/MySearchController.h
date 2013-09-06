//
//  MySearchController.h
//  ChickFinder
//
//  Created by Albert Insogna on 9/2/13.
//  Copyright (c) 2013 Albert Insogna. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MySearchController : NSObject

@property (nonatomic, retain) MKLocalSearch* localSearch;
@property (nonatomic, retain) MKLocalSearchRequest* localSearchRequest;

@end
