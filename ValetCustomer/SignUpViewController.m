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
    
    self.firstNameField = [[UITextField alloc]initWithFrame:CGRectMake(20, 80, self.view.frame.size.width - 40, 30)];
    self.firstNameField.borderStyle = UITextBorderStyleRoundedRect;
    self.firstNameField.placeholder = @"First Name";
    
    if (nonVIP.firstName){
        [self.firstNameField setText:nonVIP.firstName];
    }
    
    [self.view addSubview:self.firstNameField];
    
    self.lastNameField = [[UITextField alloc]initWithFrame:CGRectMake(20, 120, self.view.frame.size.width - 40, 30)];
    self.lastNameField.borderStyle = UITextBorderStyleRoundedRect;
    self.lastNameField.placeholder = @"Last Name";
    
    if (nonVIP.lastName){
        [self.lastNameField setText:nonVIP.lastName];
    }
    
    [self.view addSubview:self.lastNameField];
    
    self.emailField = [[UITextField alloc]initWithFrame:CGRectMake(20, 160, self.view.frame.size.width - 40, 30)];
    self.emailField.borderStyle = UITextBorderStyleRoundedRect;
    self.emailField.placeholder = @"Email";
    [self.view addSubview:self.emailField];
    
    self.passwordField = [[UITextField alloc]initWithFrame:CGRectMake(20, 200, self.view.frame.size.width - 40, 30)];
    self.passwordField.borderStyle = UITextBorderStyleRoundedRect;
    self.passwordField.placeholder = @"Password";
    self.passwordField.secureTextEntry = YES;
    [self.view addSubview:self.passwordField];
    
    self.passwordInstructionsLabel = [[UILabel alloc]initWithFrame:CGRectMake(22, 225, self.view.frame.size.width - 40, 30)];
    self.passwordInstructionsLabel.font = [UIFont systemFontOfSize:13];
    self.passwordInstructionsLabel.textColor = [UIColor grayColor];
    self.passwordInstructionsLabel.text = @"Your password must contain at least 5 characters";
    [self.view addSubview:self.passwordInstructionsLabel];

   
}

- (void)nextButtonPressed{
    if (self.passwordField.text.length < 5){
        self.passwordField.text = @"";
        self.passwordInstructionsLabel.textColor = [UIColor redColor];
    } else if (self.firstNameField.text.length > 0 && self.lastNameField.text.length > 0 && self.emailField.text.length > 0){
        Customer *customer = [CustomerController sharedInstance].customer;
        customer.firstName = self.firstNameField.text;
        customer.lastName = self.lastNameField.text;
        customer.email = self.emailField.text;
        customer.password = self.passwordField.text;
        
        PaymentSignUpViewController *paymentSignUpViewController = [PaymentSignUpViewController new];
        [self.navigationController presentViewController:paymentSignUpViewController animated:YES completion:nil];
        
        self.passwordInstructionsLabel.textColor = [UIColor grayColor];
    }
    if ((self.firstNameField.text.length == 0 || self.lastNameField.text.length == 0 || self.emailField.text.length == 0) && (self.passwordField.text.length < 5)){
        UILabel *missingFieldsLabel = [[UILabel alloc]initWithFrame:CGRectMake(22, 245, self.view.frame.size.width - 40, 30)];
        missingFieldsLabel.font = [UIFont systemFontOfSize:13];
        missingFieldsLabel.textColor = [UIColor redColor];
        missingFieldsLabel.text = @"All fields are required";
        [self.view addSubview:missingFieldsLabel];
        
        self.passwordField.text = @"";
        self.passwordInstructionsLabel.textColor = [UIColor redColor];
    } else if (self.firstNameField.text.length == 0 || self.lastNameField.text.length == 0 || self.emailField.text.length == 0){
        UILabel *missingFieldsLabel = [[UILabel alloc]initWithFrame:CGRectMake(22, 245, self.view.frame.size.width - 40, 30)];
        missingFieldsLabel.font = [UIFont systemFontOfSize:13];
        missingFieldsLabel.textColor = [UIColor redColor];
        missingFieldsLabel.text = @"All fields are required";
        [self.view addSubview:missingFieldsLabel];
        
        self.passwordInstructionsLabel.textColor = [UIColor grayColor];
    } else {
        self.passwordField.text = @"";
        self.passwordInstructionsLabel.textColor = [UIColor redColor];
    }
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
