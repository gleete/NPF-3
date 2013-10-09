//
//  Park.h
//  NPF-1
//
//  Created by Gordon Leete on 9/5/13.
//  Copyright (c) 2013 Gordon Leete. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface Park : NSObject <MKAnnotation>{
    NSString *parkName;
    NSString *parkLocation;
    NSString *dateFormed;
    NSString *area;
    NSString *link;
    CLLocation *location;
    NSString *imageLink;
    NSString *parkDescription;
    NSMutableArray *parks;
}

@property (nonatomic, strong) NSString *parkName;
@property (nonatomic, strong) NSString *parkLocation;
@property (nonatomic, strong) NSString *dateFormed;
@property (nonatomic, strong) NSString *area;
@property (nonatomic, strong) NSString *link;
@property (nonatomic, strong) CLLocation *location;
@property (nonatomic, strong) NSString *imageLink;
@property (nonatomic, strong) NSString *parkDescription;
@property (nonatomic, strong) NSMutableArray *parks;


-(id)initWithName: (NSString *) p_name
         parkLocation: (NSString *) p_parkLocation
           formed: (NSString *) p_formed
             area: (NSString *) p_area
             link: (NSString *) p_link
        location: (CLLocation *) p_location
        imageLink: (NSString *) p_imageLink
  parkDescription: (NSString *) p_description;

+(id)park;

/*
//Park Name
-(NSString *) parkName;
-(void) setParkName:(NSString *) value;

//Park Location
-(NSString *) parkLocation;
-(void) setParkLocation:(NSString *) value;

//Date Formed
-(NSString *) dateFormed;
-(void) setDateFormed:(NSString *) value;

//Area
-(NSString *) area;
-(void) setArea:(NSString *) value;

//Link
-(NSString *) link;
-(void) setLink:(NSString *) value;
*/

@end
