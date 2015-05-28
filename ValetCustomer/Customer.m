//
//  Customer.m
//  ValetCustomer
//
//  Created by Egan Anderson on 5/27/15.
//  Copyright (c) 2015 Egan Anderson. All rights reserved.
//

#import "Customer.h"

static NSString *IDKey = @"id";
static NSString *FirstNameKey = @"firstName";
static NSString *LastNameKey = @"lastName";
static NSString *EmailKey = @"email";

@implementation Customer

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    
    if (self) {
        self.customerID = [dictionary[IDKey] integerValue];
        self.firstName = dictionary[FirstNameKey];
        self.lastName = dictionary[LastNameKey];
        self.email = dictionary[EmailKey];
    }
    
    return self;
}

@end
