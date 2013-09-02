//
//  MyCLController.h
//  ChickFinder
//
//  Created by Albert Insogna on 8/14/13.
//  Copyright (c) 2013 Albert Insogna. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MKCircle.h>

@interface MyCLController : NSObject <CLLocationManagerDelegate>

@property (nonatomic, retain) CLLocationManager *locationManager;

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation;

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error;

- (void)locationManager:(CLLocationManager *)manager
         didEnterRegion:(CLRegion *)region;

- (void)locationManager:(CLLocationManager *)manager
          didExitRegion:(CLRegion *)region;

- (void)    locationManager:(CLLocationManager *)manager
didStartMonitoringForRegion:(CLRegion *)region;

- (BOOL)registerRegionWithCircularOverlay:(MKCircle*)overlay
                            andIdentifier:(NSString*)identifier;

@end
