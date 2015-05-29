//
//  LogInViewController.m
//  ValetCustomer
//
//  Created by Egan Anderson on 5/28/15.
//  Copyright (c) 2015 Egan Anderson. All rights reserved.
//

#import "LogInViewController.h"

@interface LogInViewController ()

@property (nonatomic, strong) UITextField *emailField;

@property (nonatomic, strong) UITextField *passwordField;

@end

@implementation LogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.emailField = [[UITextField alloc]initWithFrame:CGRectMake(20, 80, self.view.frame.size.width - 40, 40)];
    self.emailField.borderStyle = UITextBorderStyleRoundedRect;
    self.emailField.placeholder = @"Email";
    [self.view addSubview:self.emailField];
    
    self.passwordField = [[UITextField alloc]initWithFrame:CGRectMake(20, 130, self.view.frame.size.width - 40, 40)];
    self.passwordField.borderStyle = UITextBorderStyleRoundedRect;
    self.passwordField.placeholder = @"Password";
    self.passwordField.secureTextEntry = YES;
    [self.view addSubview:self.passwordField];
    
    UIButton *logInButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    logInButton.frame = CGRectMake(20, 180, self.view.frame.size.width - 40, 40);
    [logInButton setTitle:@"Log In" forState:UIControlStateNormal];
    [logInButton addTarget:self action:@selector(popLocationFeedView) forControlEvents:UIControlEventTouchUpInside];
    logInButton.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:logInButton];

    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)popLocationFeedView{
    [self.navigationController popToRootViewControllerAnimated:YES];
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
