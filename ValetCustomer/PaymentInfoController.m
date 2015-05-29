//
//  PaymentInfoController.m
//  ValetCustomer
//
//  Created by Egan Anderson on 5/29/15.
//  Copyright (c) 2015 Egan Anderson. All rights reserved.
//

#import "PaymentInfoController.h"

@implementation PaymentInfoController

+(instancetype) sharedInstance{
    static PaymentInfoController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[PaymentInfoController alloc]init];
    });
    
    return sharedInstance;
}

@end
