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
    });
    
    return sharedInstance;
}

- (void)loadFromDatabaseWithCompletion:(void (^)(BOOL success))completion {
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:@"http:127.0.0.1:8888/valet/select_location.php"] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (data.length > 0 && error == nil) {
            NSArray *responseArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            
            if (responseArray.count > 0) {
                NSMutableArray *mutEntriesArray = [[NSMutableArray alloc] init];
                
                for (NSDictionary *dict in responseArray) {
                    Location *newLocation = [[Location alloc] initWithDictionary:dict];
                    [mutEntriesArray addObject:newLocation];
                }
                
                self.locations = mutEntriesArray;
                completion(YES);
            }
        } else {
            completion(NO);
        }
        
    }];
    
    [dataTask resume];
}

@end
