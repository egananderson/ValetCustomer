//
//  RequestCarViewController.m
//  ValetCustomer
//
//  Created by Egan Anderson on 5/28/15.
//  Copyright (c) 2015 Egan Anderson. All rights reserved.
//

#import "RequestCarViewController.h"
#import "PaymentInfoViewController.h"

@interface RequestCarViewController ()
@property (nonatomic, strong) UIButton *requestCarButton;
@property (nonatomic, strong) UIButton *payButton;
@property (nonatomic, strong) UILabel *carStatusLabel;

@end

@implementation RequestCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.navigationController.navigationItem.hidesBackButton = YES;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[[UIView alloc]initWithFrame:CGRectMake(0, 0, 20, 30)]] ;
//    self.navigationController.interactivePopGestureRecognizer.enabled = NO;

    
    self.requestCarButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.requestCarButton setTitle:@"Get my car ready" forState:UIControlStateNormal];
    self.requestCarButton.frame = CGRectMake(120, 300, self.view.frame.size.width - 240, 30);
    [self.requestCarButton addTarget:self action:@selector(transitionToPay) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.requestCarButton];
    
    self.carStatusLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 330, self.view.frame.size.width - 100, 30)];
    self.carStatusLabel.font = [UIFont systemFontOfSize:13];
    self.carStatusLabel.textColor = [UIColor grayColor];
    self.carStatusLabel.text = @"Give us about 5 minutes to get your car";
    [self.carStatusLabel setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:self.carStatusLabel];
    
    self.view.backgroundColor = [UIColor whiteColor];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)transitionToPay{
    [self.requestCarButton removeFromSuperview];
    
    self.payButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.payButton setTitle:@"Pay" forState:UIControlStateNormal];
    self.payButton.frame = CGRectMake(120, 300, self.view.frame.size.width - 240, 30);
    [self.payButton addTarget:self action:@selector(pushPaymentInfoView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.payButton];
    
    self.carStatusLabel.text = @"Your car will be ready shortly";
}

- (void)pushPaymentInfoView{
    PaymentInfoViewController *paymentInfoViewController = [PaymentInfoViewController new];
    [self.navigationController pushViewController:paymentInfoViewController animated:YES];
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
