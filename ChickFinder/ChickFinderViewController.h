//
//  ChickFinderViewController.h
//  ChickFinder
//
//  Created by Albert Insogna on 8/14/13.
//  Copyright (c) 2013 Albert Insogna. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "MyCLController.h"

@interface ChickFinderViewController : UIViewController

@property (strong, nonatomic) MyCLController* locationController;

@end
