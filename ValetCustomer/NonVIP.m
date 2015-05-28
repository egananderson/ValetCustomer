//
//  NonVIP.m
//  ValetCustomer
//
//  Created by Egan Anderson on 5/28/15.
//  Copyright (c) 2015 Egan Anderson. All rights reserved.
//

#import "NonVIP.h"

@implementation NonVIP

+(instancetype) sharedInstance{
    static NonVIP *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[NonVIP alloc]init];
    });
    
    return sharedInstance;
}

- (NSDictionary *) nonVIPToDictionary{
    NSDictionary *nonVIPDictionary = @{@"firstName": self.firstName, @"lastName": self.lastName};
    return nonVIPDictionary;
}

@end
