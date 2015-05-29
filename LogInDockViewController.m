//
//  LogInDockViewController.m
//  ValetCustomer
//
//  Created by Egan Anderson on 5/28/15.
//  Copyright (c) 2015 Egan Anderson. All rights reserved.
//

#import "LogInDockViewController.h"
#import "LogInViewController.h"
#import "SignUpViewController.h"

@interface LogInDockViewController ()

@end

@implementation LogInDockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImage *backgroundImage = [UIImage imageNamed:@"valet_driver_crop"];
    UIImageView *backgroundImageView = [[UIImageView alloc]initWithImage:backgroundImage];
    backgroundImageView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:backgroundImageView];
    [self.view sendSubviewToBack:backgroundImageView];
    
    UIButton *signUpButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    signUpButton.frame = CGRectMake(20, 520, self.view.frame.size.width - 40, 50);
    [signUpButton setTitle:@"Sign Up" forState:UIControlStateNormal];
    [signUpButton addTarget:self action:@selector(pushSignUpView) forControlEvents:UIControlEventTouchUpInside];
    signUpButton.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:signUpButton];
    
    UIButton *logInButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    logInButton.frame = CGRectMake(20, 590, self.view.frame.size.width - 40, 50);
    [logInButton setTitle:@"Log In" forState:UIControlStateNormal];
    [logInButton addTarget:self action:@selector(pushLogInView) forControlEvents:UIControlEventTouchUpInside];
    logInButton.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:logInButton];
    
//    UIView *whiteRectangle = [[UIView alloc]initWithFrame:CGRectMake(-200, 0, 200, 700)];
//    whiteRectangle.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:whiteRectangle];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushLogInView{
    LogInViewController *logInViewController = [LogInViewController new];
    [self.navigationController pushViewController:logInViewController animated:YES];
}

- (void)pushSignUpView{
    SignUpViewController *signUpViewController = [SignUpViewController new];
    [self.navigationController pushViewController:signUpViewController animated:YES];
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
