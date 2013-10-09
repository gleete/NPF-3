//
//  NPF_3AppDelegate.m
//  NPF-3
//
//  Created by Gordon Leete on 10/7/13.
//  Copyright (c) 2013 Gordon Leete. All rights reserved.
//

#import "NPF_3AppDelegate.h"
#import "Park.h"
#import "NPF_3ViewController.h"

@implementation NPF_3AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"data"ofType:@"plist"];
    NSDictionary *tempDictionary = [NSDictionary dictionaryWithContentsOfFile:path];
    
    NSArray *tempArray = [tempDictionary objectForKey:@"parks"];
    self.parks = [NSMutableArray array];
    
    //self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    //self.window.backgroundColor = [UIColor whiteColor];
    
    
    for (id dict in tempArray) {
        
        NSString *parkName = [dict objectForKey:@"parkName"];
        NSString *parkLocation = [dict objectForKey:@"parkLocation"];
        float latitude = [[dict objectForKey:@"latitude"] floatValue];
        float longitude = [[dict objectForKey:@"longitude"] floatValue];
        CLLocation *location = [[CLLocation alloc] initWithLatitude:latitude longitude:longitude];
        NSString *dateFormed        = [dict objectForKey:@"dateFormed"];
        NSString *area              = [dict objectForKey:@"area"];
        NSString *link              = [dict objectForKey:@"link"];
        NSString *imageLink         = [dict objectForKey:@"imageLink"];
        NSString *parkDescription   = [dict objectForKey:@"description"];
        
        //create Park
        Park *p = [Park park];
        p.area = area;
        p.dateFormed = dateFormed;
        p.parkDescription = parkDescription;
        p.imageLink = imageLink;
        p.link = link;
        p.parkLocation = parkLocation;
        p.location = location;
        p.parkName = parkName;
      
        
        
        //add to self.parks array
        [self.parks addObject:p];
        
    }
    
    //check if Parks were created properly
    for (Park *park in self.parks) {
        NSLog(@"park=%@",park);
    }
    //[self.window makeKeyAndVisible];
    NPF_3ViewController *navigationController = (NPF_3ViewController *)self.window.rootViewController;
    navigationController.parks = self.parks;

    return YES;
}

							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
