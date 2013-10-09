//
//  NPF_3ViewController.h
//  NPF-3
//
//  Created by Gordon Leete on 10/7/13.
//  Copyright (c) 2013 Gordon Leete. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CLLocation.h>
#import "Park.h"

@interface NPF_3ViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>

@property(nonatomic,strong) IBOutlet MKMapView *mapView;

@property(nonatomic, strong) IBOutlet UIActivityIndicatorView *activity;

@property (nonatomic, strong) CLLocationManager *locationManager;

@property (strong, nonatomic) NSMutableArray *parks;




@end
