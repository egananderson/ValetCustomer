//
//  NonVIP.h
//  ValetCustomer
//
//  Created by Egan Anderson on 5/28/15.
//  Copyright (c) 2015 Egan Anderson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NonVIP : NSObject

@property (nonatomic, strong) NSString *firstName;

@property (nonatomic, strong) NSString *lastName;

+ (instancetype)sharedInstance;

@end
