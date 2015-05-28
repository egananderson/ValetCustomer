//
//  LocationFeedDataSource.m
//  ValetCustomer
//
//  Created by Egan Anderson on 5/27/15.
//  Copyright (c) 2015 Egan Anderson. All rights reserved.
//

#import "LocationFeedDataSource.h"
#import "LocationController.h"
#import "CustomTableViewCell.h"
@import UIKit;

@interface LocationFeedDataSource () 

@end

@implementation LocationFeedDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[CustomTableViewCell cellID]];
    
    LocationController *locationController = [LocationController sharedInstance];
    Location *location = [locationController locations][indexPath.row];
    
    if (!cell){
        cell = [[CustomTableViewCell alloc]initWithLocation:location reuseIdentifier:[CustomTableViewCell cellID]];
    } else {
        cell.locationNameLabel.text = location.name;
        cell.locationStreetLabel.text = location.street;
        cell.locationImageView.image = location.image;
    }

    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [LocationController sharedInstance].locations.count;
}

@end
