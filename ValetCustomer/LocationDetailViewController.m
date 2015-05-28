//
//  LocationDetailViewController.m
//  ValetCustomer
//
//  Created by Egan Anderson on 5/28/15.
//  Copyright (c) 2015 Egan Anderson. All rights reserved.
//

#import "LocationDetailViewController.h"
#import "CustomerController.h"
#import "RequestCarViewController.h"

@interface LocationDetailViewController ()

@property (nonatomic, strong) UIButton *parkHereButton;

@end

@implementation LocationDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.locationImageView = [[UIImageView alloc]initWithImage:self.locationImage];
    self.locationImageView.frame = CGRectMake(0, 65, 375, 250);
    [self.view addSubview:self.locationImageView];
    
    self.locationNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 315, 200, 30)];
    self.locationNameLabel.text = self.locationName;
    self.locationNameLabel.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:self.locationNameLabel];
    
    self.locationStreetLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 335, 200, 30)];
    self.locationStreetLabel.text = self.locationStreet;
    self.locationStreetLabel.font = [UIFont systemFontOfSize:13];
    self.locationStreetLabel.textColor = [UIColor grayColor];
    [self.view addSubview:self.locationStreetLabel];
    
    self.parkHereButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.parkHereButton setTitle:@"Park Here" forState:UIControlStateNormal];
    self.parkHereButton.frame = CGRectMake(120, 470, self.view.frame.size.width - 240, 30);
    [self.parkHereButton addTarget:self action:@selector(parkHereButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.parkHereButton];
    
    self.view.backgroundColor = [UIColor whiteColor];

}

- (void)parkHereButtonPressed{
    if (![CustomerController sharedInstance].customer.firstName || ![CustomerController sharedInstance].customer.lastName){
        UIAlertController *nameInputAlert = [UIAlertController alertControllerWithTitle:@"Please enter your first and last name" message:@"This will help us identify your car" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
        [nameInputAlert addAction:cancelAction];
        
        UIAlertAction *parkHereAction = [UIAlertAction actionWithTitle:@"Park Here" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            
            UITextField *firstNameTextField = nameInputAlert.textFields[0];
            NSString *firstName = firstNameTextField.text;
            
            UITextField *lastNameTextField = nameInputAlert.textFields[1];
            NSString *lastName = lastNameTextField.text;

            
            if([[NSString stringWithFormat:@"%@", firstName] isEqualToString:@""] || [[NSString stringWithFormat:@"%@", lastName] isEqualToString:@""]){
                [self.navigationController presentViewController:nameInputAlert animated:YES completion:nil];
            }else{
           
                [CustomerController sharedInstance].customer.firstName = firstName;
                [CustomerController sharedInstance].customer.lastName = lastName;
                [self pushLockedInView];
            }
        }];
        [nameInputAlert addAction:parkHereAction];

        [nameInputAlert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
            textField.placeholder = @"first name";
        }];
        
        [nameInputAlert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
            textField.placeholder = @"last name";
        }];
        
        [self.navigationController presentViewController:nameInputAlert animated:YES completion:nil];
    } else {
        [self pushLockedInView];
    }
    
    
}

- (void)pushLockedInView {
    RequestCarViewController *requestCarViewController = [RequestCarViewController new];
    [self.navigationController pushViewController:requestCarViewController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
