//
//  LocationDetailViewController.h
//  ValetCustomer
//
//  Created by Egan Anderson on 5/28/15.
//  Copyright (c) 2015 Egan Anderson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LocationDetailViewController : UIViewController

@property (nonatomic, strong) UILabel *locationNameLabel;
@property (nonatomic, strong) UILabel *locationStreetLabel;
@property (nonatomic, strong) UIImageView *locationImageView;

@property (nonatomic, strong) NSString *locationName;
@property (nonatomic, strong) NSString *locationStreet;
@property (nonatomic, strong) UIImage *locationImage;

@end
