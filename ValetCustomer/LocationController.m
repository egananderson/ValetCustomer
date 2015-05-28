//
//  LocationController.m
//  ValetCustomer
//
//  Created by Egan Anderson on 5/27/15.
//  Copyright (c) 2015 Egan Anderson. All rights reserved.
//

#import "LocationController.h"
@import UIKit;

@interface LocationController ()

@property (nonatomic, strong) NSArray *locations;

@end

@implementation LocationController

+(instancetype) sharedInstance{
    static LocationController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[LocationController alloc]init];
        
        sharedInstance.locations = @[
                                     @{@"locationName": @"PF Chang's", @"locationImage": [UIImage imageNamed:@"pfChangs"], @"locationStreet": @"300 South 200 West"},
                                     @{@"locationName": @"City Creek", @"locationImage": [UIImage imageNamed:@"cityCreek"], @"locationStreet": @"65 Regent St."},
                                     @{@"locationName": @"Station Park", @"locationImage": [UIImage imageNamed:@"stationPark"], @"locationStreet": @"320 North Station Parkway"}];
        
    });
    
    return sharedInstance;
}

@end
