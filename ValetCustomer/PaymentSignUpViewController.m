//
//  paymentSignUpViewController.m
//  ValetCustomer
//
//  Created by Egan Anderson on 5/28/15.
//  Copyright (c) 2015 Egan Anderson. All rights reserved.
//

#import "PaymentSignUpViewController.h"

@interface PaymentSignUpViewController () <UITextFieldDelegate>

@property (nonatomic, strong) UITextField *cardNumberField;
@property (nonatomic, strong) UITextField *expirationDateField;
@property (nonatomic, strong) UITextField *expirationYearField;
@property (nonatomic, strong) UITextField *cvvField;


@end

@implementation PaymentSignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    self.cardNumberField = [[UITextField alloc]initWithFrame:CGRectMake(20, 80, self.view.frame.size.width - 40, 40)];
    self.cardNumberField.borderStyle = UITextBorderStyleRoundedRect;
    self.cardNumberField.placeholder = @"Credit Card Number";
    self.cardNumberField.delegate = self;
    [self.view addSubview:self.cardNumberField];
    
    self.cvvField = [[UITextField alloc]initWithFrame:CGRectMake(20, 130, self.view.frame.size.width - 40, 40)];
    self.cvvField.borderStyle = UITextBorderStyleRoundedRect;
    self.cvvField.placeholder = @"CVV Number";
    self.cvvField.delegate = self;
    [self.view addSubview:self.cvvField];
    
    self.expirationDateField = [[UITextField alloc]initWithFrame:CGRectMake(20, 180, self.view.frame.size.width - 40, 40)];
    self.expirationDateField.borderStyle = UITextBorderStyleRoundedRect;
    self.expirationDateField.placeholder = @"MM";
    self.expirationDateField.delegate = self;
    [self.view addSubview:self.expirationDateField];
    
    self.expirationYearField = [[UITextField alloc]initWithFrame:CGRectMake(70, 180, self.view.frame.size.width - 40, 40)];
    self.expirationYearField.placeholder = @"YY";
    self.expirationYearField.delegate = self;
    [self.view addSubview:self.expirationYearField];
    
    UILabel *slash = [[UILabel alloc]initWithFrame:CGRectMake(60, 180, 20, 40)];
    slash.text = @"/";
    [self.view addSubview:slash];
    
//    self.passwordInstructionsLabel = [[UILabel alloc]initWithFrame:CGRectMake(22, 265, self.view.frame.size.width - 40, 30)];
//    self.passwordInstructionsLabel.font = [UIFont systemFontOfSize:13];
//    self.passwordInstructionsLabel.textColor = [UIColor grayColor];
//    self.passwordInstructionsLabel.text = @"Your password must contain at least 5 characters";
//    [self.view addSubview:self.passwordInstructionsLabel];
    
    UIButton *addPaymentInfoButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    addPaymentInfoButton.frame = CGRectMake(20, 305, self.view.frame.size.width - 40, 40);
    [addPaymentInfoButton setTitle:@"Add Payment Info" forState:UIControlStateNormal];
    [addPaymentInfoButton addTarget:self action:@selector(nextButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    addPaymentInfoButton.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:addPaymentInfoButton];

    
}



- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if (textField == self.cardNumberField) {
        int limit = 16;
        return !([textField.text length]>=limit && [string length] > range.length);
    } else if (textField == self.cvvField) {
        int limit = 3;
        return !([textField.text length]>=limit && [string length] > range.length);
    } else if (textField == self.expirationYearField) {
        int limit = 2;
        return !([textField.text length]>=limit && [string length] > range.length);
    } else if (textField == self.expirationDateField) {
        if (textField.text.length == 2){
            [textField resignFirstResponder];
            [self.expirationYearField becomeFirstResponder];
//            textField.text = [textField.text stringByAppendingString:@"/"];
        }
        int limit = 2;
        return !([textField.text length]>=limit && [string length] > range.length);
    }

    return NO;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)nextButtonPressed{
    
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
