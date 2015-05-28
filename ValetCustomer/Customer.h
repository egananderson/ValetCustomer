//
//  Customer.h
//  ValetCustomer
//
//  Created by Egan Anderson on 5/27/15.
//  Copyright (c) 2015 Egan Anderson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Customer : NSObject

@property (nonatomic, assign) NSInteger customerID;
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;

@end
