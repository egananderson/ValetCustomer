//
//  LocationController.h
//  ValetCustomer
//
//  Created by Egan Anderson on 5/27/15.
//  Copyright (c) 2015 Egan Anderson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Location.h"

@interface LocationController : NSObject

@property (nonatomic, strong, readonly) NSArray *locations;

+(instancetype) sharedInstance;
- (void)loadFromDatabaseWithCompletion:(void (^)(BOOL success))completion;

@end
