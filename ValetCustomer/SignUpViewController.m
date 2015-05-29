//
//  SignUpViewController.m
//  ValetCustomer
//
//  Created by Egan Anderson on 5/28/15.
//  Copyright (c) 2015 Egan Anderson. All rights reserved.
//

#import "SignUpViewController.h"
#import "NonVIP.h"
#import "CustomerController.h"
#import "PaymentSignUpViewController.h"
#import "LocationFeedViewController.h"

@interface SignUpViewController ()
@property (nonatomic, strong) UITextField *firstNameField;
@property (nonatomic, strong) UITextField *lastNameField;
@property (nonatomic, strong) UITextField *emailField;
@property (nonatomic, strong) UITextField *passwordField;
@property (nonatomic, strong) UILabel *passwordInstructionsLabel;



@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *nextBarButtonItem =[[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStyleDone target:self action:@selector(nextButtonPressed)];
    self.navigationItem.rightBarButtonItem = nextBarButtonItem;
    
    NonVIP *nonVIP = [NonVIP sharedInstance];

    nonVIP.firstName = @"Taylor";
    nonVIP.lastName = @"Mott";
    
    self.firstNameField = [[UITextField alloc]initWithFrame:CGRectMake(20, 80, self.view.frame.size.width - 40, 40)];
    self.firstNameField.borderStyle = UITextBorderStyleRoundedRect;
    self.firstNameField.placeholder = @"First Name";
    
    if (nonVIP.firstName){
        [self.firstNameField setText:nonVIP.firstName];
    }
    
    [self.view addSubview:self.firstNameField];
    
    self.lastNameField = [[UITextField alloc]initWithFrame:CGRectMake(20, 130, self.view.frame.size.width - 40, 40)];
    self.lastNameField.borderStyle = UITextBorderStyleRoundedRect;
    self.lastNameField.placeholder = @"Last Name";
    
    if (nonVIP.lastName){
        [self.lastNameField setText:nonVIP.lastName];
    }
    
    [self.view addSubview:self.lastNameField];
    
    self.emailField = [[UITextField alloc]initWithFrame:CGRectMake(20, 180, self.view.frame.size.width - 40, 40)];
    self.emailField.borderStyle = UITextBorderStyleRoundedRect;
    self.emailField.placeholder = @"Email";
    [self.view addSubview:self.emailField];
    
    self.passwordField = [[UITextField alloc]initWithFrame:CGRectMake(20, 230, self.view.frame.size.width - 40, 40)];
    self.passwordField.borderStyle = UITextBorderStyleRoundedRect;
    self.passwordField.placeholder = @"Password";
    self.passwordField.secureTextEntry = YES;
    [self.view addSubview:self.passwordField];
    
    self.passwordInstructionsLabel = [[UILabel alloc]initWithFrame:CGRectMake(22, 265, self.view.frame.size.width - 40, 30)];
    self.passwordInstructionsLabel.font = [UIFont systemFontOfSize:13];
    self.passwordInstructionsLabel.textColor = [UIColor grayColor];
    self.passwordInstructionsLabel.text = @"Your password must contain at least 5 characters";
    [self.view addSubview:self.passwordInstructionsLabel];
    
    UIButton *signUpButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    signUpButton.frame = CGRectMake(20, 305, self.view.frame.size.width - 40, 40);
    [signUpButton setTitle:@"Sign Up" forState:UIControlStateNormal];
    [signUpButton addTarget:self action:@selector(nextButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    signUpButton.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:signUpButton];

   
}

- (void)nextButtonPressed{
    if (self.firstNameField.text.length == 0
        || self.lastNameField.text.length == 0
        || self.emailField.text.length == 0) {
        
        UILabel *missingFieldsLabel = [[UILabel alloc]initWithFrame:CGRectMake(22, 245, self.view.frame.size.width - 40, 30)];
        missingFieldsLabel.font = [UIFont systemFontOfSize:13];
        missingFieldsLabel.textColor = [UIColor redColor];
        missingFieldsLabel.text = @"All fields are required";
        [self.view addSubview:missingFieldsLabel];
    } else if (self.passwordField.text.length < 5) {
        self.passwordField.text = @"";
        self.passwordInstructionsLabel.textColor = [UIColor redColor];
    } else {
        CustomerController *customerController = [CustomerController sharedInstance];
        
        Customer *customer = customerController.customer;
        customer.firstName = self.firstNameField.text;
        customer.lastName = self.lastNameField.text;
        customer.email = self.emailField.text;
        customer.password = self.passwordField.text;
        
        self.passwordInstructionsLabel.textColor = [UIColor grayColor];
        
        PaymentSignUpViewController *paymentSignUpViewController = [PaymentSignUpViewController new];
        //LocationFeedViewController *locationFeed = [[LocationFeedViewController alloc] init];
        
        [customerController saveToDBWithCompletion:^(BOOL success) {
            if (success) {
                NSLog(@"did this much");
                //[self.navigationController presentViewController:paymentSignUpViewController animated:YES completion:nil];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.navigationController pushViewController:paymentSignUpViewController animated:YES];
                });
            } else {
                NSLog(@"ERROR SAVING CUSTOMER INFO TO DB");
            }
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
