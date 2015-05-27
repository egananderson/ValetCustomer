//
//  CustomerController.m
//  ValetCustomer
//
//  Created by Egan Anderson on 5/27/15.
//  Copyright (c) 2015 Egan Anderson. All rights reserved.
//

#import "CustomerController.h"


@implementation CustomerController

+(instancetype) sharedInstance{
    static CustomerController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[CustomerController alloc]init];
        
        sharedInstance.customer = [[Customer alloc]init];
        
    });
    
    return sharedInstance;
}

@end
