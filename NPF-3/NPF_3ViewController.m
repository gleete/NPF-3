//
//  NPF_3ViewController.m
//  NPF-3
//
//  Created by Gordon Leete on 10/7/13.
//  Copyright (c) 2013 Gordon Leete. All rights reserved.
//

#import "NPF_3ViewController.h"
#import "Park.h"
#import "NPF_3AppDelegate.h"

@interface NPF_3ViewController ()

@end

@implementation NPF_3ViewController

-(id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    return self;
}

- (void)viewDidLoad
{

    [super viewDidLoad];

	// Do any additional setup after loading the view, typically from a nib.
    
    // Map and Location initialization
   
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    self.locationManager.distanceFilter = 1000;

    
    self.mapView.delegate = self;
    
    [self.mapView addAnnotations:self.parks];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (void)startUpdating{
}//start location manager updating plus…

- (void)stopUpdating {
}//stop location manager updating plus…

- (IBAction)refresh:(id)sender{
    [self.locationManager startUpdatingLocation];
    NSLog(@"Starting to update locaton");
}//call startUpdating


- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
	NSLog(@"locationManager failed with error=%@",error);
	[self stopUpdating];
    
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Location Manager Failed!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [alert show];
	
}

#pragma mark -
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark MKMapViewDelegate protocol
- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view{
    id<MKAnnotation> annotation = view.annotation;
    NSLog(@"The title of the tapped annotation is %@",annotation.title);
}

#pragma mark MKMapViewDelegate Methods

// This delegate method is called once for every annotation that is created.
// If no view is returned by this method, then only the default pin is seen by the user
- (MKAnnotationView *)mapView:(MKMapView *)mv viewForAnnotation:(id <MKAnnotation>)annotation{
	MKAnnotationView *view = nil;
	if(annotation != mv.userLocation) {
		// if it's NOT the user's current location pin, create the annotation
        Park *parkAnnotation = (Park*)annotation;
		// Look for an existing view to reuse
		view = [mv dequeueReusableAnnotationViewWithIdentifier:@"parkAnnotation"];
		// If an existing view is not found, create a new one
		if(view == nil) {
			view = [[MKPinAnnotationView alloc] initWithAnnotation:(id) parkAnnotation
                                                   reuseIdentifier:@"parkAnnotation"];
		}
		
		// Now we have a view for the annotation, so let's set some properties
		[(MKPinAnnotationView *)view setPinColor:MKPinAnnotationColorRed];
		[(MKPinAnnotationView *)view setAnimatesDrop:YES];
		[view setCanShowCallout:YES];
        
		// Now create buttons for the annotation view
		// The 'tag' properties are set so that we can identify which button was tapped later
		UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
		leftButton.tag = 0;
        
		UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
		rightButton.tag = 1;
		
		// Add buttons to annotation view
		[view setLeftCalloutAccessoryView:leftButton];
		[view setRightCalloutAccessoryView:rightButton];
	}
	
	// send this annotation view back to MKMapView so it can add it to the pin
	return view;
}


// This method is called when one of the two buttons added to the annotation view is tapped
- (void)mapView:(MKMapView *)mv annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control{
	Park *parkAnnotation = (Park *)[view annotation];
	switch ([control tag]) {
		case 0: // left button
		{
            NSURL *url = [NSURL URLWithString:parkAnnotation.link];
            [[UIApplication sharedApplication] openURL:url];
		}
            break;
            
		case 1: // right button
		{
            CLLocationManager *locationManager = [[CLLocationManager alloc] init];
            
            CLLocationCoordinate2D coordinate = locationManager.location.coordinate;
            NSString *url2 = [NSString stringWithFormat:@"http://maps.apple.com/maps?saddr=%f,%f&daddr=%f,%f",coordinate.latitude,coordinate.longitude,parkAnnotation.location.coordinate.latitude,parkAnnotation.location.coordinate.longitude];
            
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url2]];
            
		}
            break;
            
		default:
            NSLog(@"Should not be here in calloutAccessoryControlTapped, tag=%d!",[control tag]);
            break;
	}
}

@end
