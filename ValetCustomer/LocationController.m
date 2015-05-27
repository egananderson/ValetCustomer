//
//  LocationController.m
//  ValetCustomer
//
//  Created by Egan Anderson on 5/27/15.
//  Copyright (c) 2015 Egan Anderson. All rights reserved.
//

#import "LocationController.h"

@interface LocationController ()

@property (nonatomic, strong) NSArray *locations;

@end

@implementation LocationController

+(instancetype) sharedInstance{
    static LocationController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[LocationController alloc]init];
        
        sharedInstance.locations = @[@{}];
        
        
    });
    
    return sharedInstance;
}

@end
