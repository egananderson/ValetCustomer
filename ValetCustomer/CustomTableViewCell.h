//
//  CustomTableViewCell.h
//  ValetCustomer
//
//  Created by Egan Anderson on 5/27/15.
//  Copyright (c) 2015 Egan Anderson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocationController.h"

@interface CustomTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *locationNameLabel;
@property (nonatomic, strong) UILabel *locationStreetLabel;
@property (nonatomic, strong) UIImageView *locationImageView;

+ (NSString *)cellID;

- (instancetype)initWithLocation:(Location *)location reuseIdentifier:(NSString *)reuseIdentifier;

@end
