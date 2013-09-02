//
//  MyCLController.m
//  ChickFinder
//
//  Created by Albert Insogna on 8/14/13.
//  Copyright (c) 2013 Albert Insogna. All rights reserved.
//

#import "MyCLController.h"
#import <MapKit/MKCircle.h>

@implementation MyCLController

- (id) init {
    self = [super init];
    if (self != nil) {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self; // send loc updates to myself
    }
    return self;
}

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"Location: %@", [newLocation description]);
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
	NSLog(@"Error: %@", [error description]);
}

- (void)locationManager:(CLLocationManager *)manager
         didEnterRegion:(CLRegion *)region
{
    NSLog(@"Region entered");
}

- (void)locationManager:(CLLocationManager *)manager
          didExitRegion:(CLRegion *)region
{
    NSLog(@"Region exited");
}

- (void)    locationManager:(CLLocationManager *)manager
didStartMonitoringForRegion:(CLRegion *)region
{
    NSLog(@"Region monitoring started");
}

- (BOOL)registerRegionWithCircularOverlay:(MKCircle*)overlay
                            andIdentifier:(NSString*)identifier {
    // Do not create regions if support is unavailable or disabled
    if ( ![CLLocationManager regionMonitoringAvailable])
        return NO;
    
    // Check the authorization status
    if (([CLLocationManager authorizationStatus] != kCLAuthorizationStatusAuthorized) &&
        ([CLLocationManager authorizationStatus] != kCLAuthorizationStatusNotDetermined))
        return NO;
    
    // Clear out any old regions to prevent buildup.
    if ([self.locationManager.monitoredRegions count] > 0) {
        for (id obj in self.locationManager.monitoredRegions)
            [self.locationManager stopMonitoringForRegion:obj];
    }
    
    // If the overlay's radius is too large, registration fails automatically,
    // so clamp the radius to the max value.
    CLLocationDegrees radius = overlay.radius;
    if (radius > self.locationManager.maximumRegionMonitoringDistance) {
        radius = self.locationManager.maximumRegionMonitoringDistance;
    }
    
    // Create the region to be monitored.
    CLRegion* region = [[CLRegion alloc] initCircularRegionWithCenter:overlay.coordinate
                                                               radius:radius identifier:identifier];
    [self.locationManager startMonitoringForRegion:region];
    return YES;
}

@end
