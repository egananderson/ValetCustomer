//
//  CustomTableViewCell.m
//  ValetCustomer
//
//  Created by Egan Anderson on 5/27/15.
//  Copyright (c) 2015 Egan Anderson. All rights reserved.
//

#import "CustomTableViewCell.h"
#import "LocationController.h"

@implementation CustomTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (NSString *)cellID{
    return @"cellID";
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
//        self.locationName = dictionary[@"locationName"];
//        self.locationImage = dictionary[@"locationImage"];
//        self.locationStreet = dictionary[@"locationStreet"];
        
        self.locationNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 250, 200, 30)];
        self.locationNameLabel.text = dictionary[@"locationName"];
        self.locationNameLabel.font = [UIFont systemFontOfSize:20];
        [self addSubview:self.locationNameLabel];
    
        self.locationImageView = [[UIImageView alloc]initWithImage:dictionary[@"locationImage"]];
        self.locationImageView.frame = CGRectMake(0, 0, 375, 250);
        [self addSubview:self.locationImageView];
        
        self.locationStreetLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 270, 200, 30)];
        self.locationStreetLabel.text = dictionary[@"locationStreet"];
        self.locationStreetLabel.font = [UIFont systemFontOfSize:13];
        self.locationStreetLabel.textColor = [UIColor grayColor];
        [self addSubview:self.locationStreetLabel];
    }
    return self;
}


@end
