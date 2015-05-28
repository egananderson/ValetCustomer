//
//  Location.m
//  ValetCustomer
//
//  Created by Egan Anderson on 5/27/15.
//  Copyright (c) 2015 Egan Anderson. All rights reserved.
//

#import "Location.h"

static NSString *IDKey = @"id";
static NSString *NameKey = @"name";
static NSString *ImageKey = @"photo";
static NSString *StreetKey = @"street";
static NSString *CityKey = @"city";
static NSString *StateKey = @"state";
static NSString *ZipKey = @"zip";

@implementation Location

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super self];
    
    if (self) {
        self.locationID = [dictionary[IDKey] integerValue];
        self.name = dictionary[NameKey];
        self.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", dictionary[ImageKey]]];
        self.street = dictionary[StreetKey];
        self.city = dictionary[CityKey];
        self.state = dictionary[StateKey];
        self.zip = dictionary[ZipKey];
    }
    
    return self;
}

@end
