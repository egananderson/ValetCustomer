//
//  CustomerController.m
//  ValetCustomer
//
//  Created by Egan Anderson on 5/27/15.
//  Copyright (c) 2015 Egan Anderson. All rights reserved.
//

#import "CustomerController.h"


@implementation CustomerController

+(instancetype) sharedInstance{
    static CustomerController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[CustomerController alloc]init];
        
        sharedInstance.customer = [[Customer alloc]init];
        
    });
    
    return sharedInstance;
}

- (void)saveToDBWithCompletion:(void (^)(BOOL success))completion {
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSString *firstName = self.customer.firstName;
    NSString *lastName = self.customer.lastName;
    NSString *email = self.customer.email;
    NSString *password = self.customer.password;
    
    NSString *post = [NSString stringWithFormat:@"fname=%@&lname=%@&email=%@&passwd=%@", firstName, lastName, email, password];
    
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http:127.0.0.1:8888/valet/insert_customer.php"]];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    NSURLSessionUploadTask *uploadTask = [session uploadTaskWithRequest:request fromData:postData completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (data.length > 0 && error == nil) {
            NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            
            NSString *returnCode = [[responseDict objectForKey:@"returnCode"] stringValue];
            
            if ( [returnCode isEqualToString: @"10"] ) {
                NSLog(@"Worked");
                NSInteger customerIDReturned = [[responseDict objectForKey:@"id"] integerValue];
                self.customer.customerID = customerIDReturned;
            } else {
                NSLog(@"Didn't work");
            }
        }
    }];
    
    [uploadTask resume];

}

@end
