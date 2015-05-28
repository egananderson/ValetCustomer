//
//  Location.h
//  ValetCustomer
//
//  Created by Egan Anderson on 5/27/15.
//  Copyright (c) 2015 Egan Anderson. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface Location : NSObject

@property (nonatomic, strong) NSString *locationID;
@property (nonatomic, strong) NSString *locationName;
@property (nonatomic, strong) NSString *locationStreet;
@property (nonatomic, strong) NSString *locationCity;
@property (nonatomic, strong) NSString *locationState;
@property (nonatomic, strong) NSString *locationZip;
@property (nonatomic, strong) UIImage *locationImage;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
