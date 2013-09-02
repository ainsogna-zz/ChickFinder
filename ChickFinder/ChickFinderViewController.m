//
//  ChickFinderViewController.m
//  ChickFinder
//
//  Created by Albert Insogna on 8/14/13.
//  Copyright (c) 2013 Albert Insogna. All rights reserved.
//

#import "ChickFinderViewController.h"
#import <MapKit/MKCircle.h>

@interface ChickFinderViewController ()

@end

@implementation ChickFinderViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)testAction:(id)sender {
    self.locationController = [[MyCLController alloc] init];
    //[self.locationController.locationManager startUpdatingLocation];
    
    CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(37.33233141, -122.03121860);
    MKCircle* circle = [MKCircle circleWithCenterCoordinate:coord radius:2000.0];
    
    [self.locationController registerRegionWithCircularOverlay:circle
                                                 andIdentifier:@"testRegion"];
                                     
}

@end
