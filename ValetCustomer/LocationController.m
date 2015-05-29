//
//  LocationController.m
//  ValetCustomer
//
//  Created by Egan Anderson on 5/27/15.
//  Copyright (c) 2015 Egan Anderson. All rights reserved.
//

#import "LocationController.h"
@import CoreLocation;

@interface LocationController () <CLLocationManagerDelegate>

@property (nonatomic, strong) NSArray *locations;

@property (nonatomic, strong) CLLocationManager *locationManager;

@end

@implementation LocationController

+(instancetype) sharedInstance{
    static LocationController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[LocationController alloc]init];
        [sharedInstance settingCoreLocation];
        sharedInstance.locations = @[@{@"street": @"65 Regent Street", @"city": @"Salt Lake City", @"image": @"pf_chang", @"name":@"PF Changs", @"state": @"Utah", @"zip": @"84111"}];
        [sharedInstance locationGeocoder];
    });
    
    return sharedInstance;
}

- (void)settingCoreLocation{
    self.locationManager = [[CLLocationManager alloc]init];
    self.locationManager.delegate = self;
    
    switch ([CLLocationManager authorizationStatus]) {
        case kCLAuthorizationStatusNotDetermined:
            [self.locationManager requestWhenInUseAuthorization];
            break;
        default:
            break;
    }
    


}

-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    if ([CLLocationManager locationServicesEnabled]) {
        [self.locationManager startUpdatingLocation];
    }
}

- (void)locationGeocoder{
    
    CLGeocoder *geocoder = [[CLGeocoder alloc]init];
    
    __block NSArray *arrayOfPlacemarks = [NSArray new];
//    for (Location *location in self.locations){
//        NSString *address = [NSString stringWithFormat:@"%@ %@ USA", location.street, location.city];
        NSString *testString = @"2211 Laird Way, Salt Lake City, USA";
    
    [geocoder geocodeAddressString:testString completionHandler:^(NSArray *placemarks, NSError *error) {
        NSLog(@"PlaceMark : %@",placemarks[0]);
        

    }];
    NSLog(@"is GeoCoding? %d",geocoder.isGeocoding);
    
//        [geocoder geocodeAddressString:testString completionHandler:^(NSArray *placemarks, NSError *error) {
//            NSLog(@"PlaceMark : %@",placemarks[0]);
//            arrayOfPlacemarks = [arrayOfPlacemarks arrayByAddingObject:[placemarks lastObject]];
//        }];
//    }
    self.placemarks = arrayOfPlacemarks;
    
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    
    NSLog(@"Current Location: %@", [locations lastObject]);
}

//- (void)loadFromDatabaseWithCompletion:(void (^)(BOOL success))completion {
//    NSURLSession *session = [NSURLSession sharedSession];
//    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:@"http://192.168.1.247:4488/valet/select_location.php"] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//        if (data.length > 0 && error == nil) {
//            NSArray *responseArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
//            
//            if (responseArray.count > 0) {
//                NSMutableArray *mutEntriesArray = [[NSMutableArray alloc] init];
//                
//                for (NSDictionary *dict in responseArray) {
//                    Location *newLocation = [[Location alloc] initWithDictionary:dict];
//                    [mutEntriesArray addObject:newLocation];
//                }
//                
//                self.locations = mutEntriesArray;
//                completion(YES);
//                
//                [self locationGeocoder];
//            }
//        } else {
//            completion(NO);
//        }
//        
//    }];
//    
//    [dataTask resume];
//}

//- locat

@end
