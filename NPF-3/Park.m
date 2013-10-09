//
//  Park.m
//  NPF-1
//
//  Created by Gordon Leete on 9/5/13.
//  Copyright (c) 2013 Gordon Leete. All rights reserved.
//

#import "Park.h"

@implementation Park
@synthesize parkName, parkLocation, dateFormed, area, link, location, imageLink, parkDescription, parks;

-(id) init {
    /*
    self = [super init];
    if (self) {
        //init code here
        self.parkName = nil;
        self.parkLocation = nil;
        self.dateFormed = nil;
        self.area = nil;
        self.link = nil;
    }
    return self;
     */
    return[self initWithName:@"unknown" parkLocation:@"unknown" formed:@"unknown" area:@"unknown" link:@"unknown" location:nil imageLink:@"unknown" parkDescription:@"unknown"];
}

-(id) initWithName:(NSString *)p_name parkLocation:(NSString *)p_parkLocation formed:(NSString *)p_formed area:(NSString *)p_area link:(NSString *)p_link location:(CLLocation *)p_location imageLink:(NSString *)p_imageLink parkDescription:(NSString *)p_description{
    self = [super init];
    if (self != nil){
        //init code here
        [self setParkName: p_name];
        [self setParkLocation: p_parkLocation ];
        self.dateFormed = p_formed;
        self.area = p_area;
        self.link = p_link;
        self.location = p_location;
        self.imageLink = p_imageLink;
        self.parkDescription = p_description;
    }
    return self;
}

+(id)park{
    return [[self alloc] init];
}

-(void) setDescription:(NSString *)value {
    parkDescription = value;
}

-(NSString *) description {
    return [NSString stringWithFormat:@"\nparkName=%@,\n parkLocation=%@,\n dateFormed=%@,\n area=%@,\n link=%@,\n gpsLocation=%@,\n imageLink=%@,\n parkDescription=%@", self.parkName, self.parkLocation, self.dateFormed, self.area, self.link, self.location, self.imageLink, self.parkDescription];
}

//Accessor for Park Name
-(NSString *) parkName {
    return parkName;
}
//Mutator for Park Name
-(void) setParkName:(NSString *)value {
    //Get length of inputted string
    NSInteger len = [value length];
    //Determine whitespace character set
    NSCharacterSet *set = [NSCharacterSet whitespaceCharacterSet];
    //Check for condition
    //If value is less than 3, greater than 75 Log to console and set to TBD
    if (len <= 2 || len >= 76) {
        NSLog(@"Bad value of: %@ %@", value, @"in setParkName: setting to TBD");
        parkName = @"TBD";
    }
    //Value is only whitespace, log to console and set TBD
    else if ([[value stringByTrimmingCharactersInSet:set] length] == 0 ){
        NSLog(@"Bad value of: %@ %@", value, @"in setParkName: setting to TBD");
        NSLog(@"You are using nothing but spaces. Please input Latin characters.");
        parkName = @"TBD";
    }
    else  {
        parkName = value;
    }
}

//Accessor for Park Location
-(NSString *) parkLocation {
    return parkLocation;
}
//Mutator for Park Location
-(void) setParkLocation:(NSString *)value {
    //Get length of inputted string
    NSUInteger len = [value length];
    //Determine whitespace character set
    NSCharacterSet *set = [NSCharacterSet whitespaceCharacterSet];
    //Check for condition
    //If value is less than 3, greater than 75 Log to console and set to TBD
    if (len <= 2 || len >= 76) {
        NSLog(@"Bad value of: %@ %@", value, @"in setParkName: setting to TBD");
        parkLocation = @"TBD";
    }
    //Value is only whitespace, log to console and set TBD
    else if ([[value stringByTrimmingCharactersInSet:set] length] == 0 ){
        NSLog(@"Bad value of: %@ %@", value, @"in setParkName: setting to TBD");
        NSLog(@"You are using nothing but spaces. Please input Latin characters.");
        parkLocation = @"TBD";
    }
    else  {
        parkLocation = value;
    }
}

-(CLLocationCoordinate2D) coordinate {
    return self.location.coordinate;
}

-(NSString *) title {
    return self.parkName;
}

-(NSString *) subtitle {
    return self.parkLocation;
}

/*
//Accessor for Park Date Formed
-(NSString *) dateFormed {
    return dateFormed;
}
//Mutator for Park Date Formed
-(void) setDateFormed:(NSString *)value {
    dateFormed = value;
}
//Accessor for Park Area
-(NSString *) area {
    return area;
}
//Mutator for Park Area
-(void) setArea:(NSString *)value {
    area = value;
}
//Accessor for Park Link
-(NSString *) link {
    return link;
}
//Mutator for Park Link
-(void) setLink:(NSString *)value {
    link = value;
}
*/
 
@end
