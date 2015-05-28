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
    CustomTableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:[CustomTableViewCell cellID]];
    if (!cell){
        cell = [[CustomTableViewCell alloc]initWithDictionary:[LocationController sharedInstance].locations[indexPath.row] reuseIdentifier:[CustomTableViewCell cellID]];
                                     
                                     
                                     //initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[CustomTableViewCell cellID]];
    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [LocationController sharedInstance].locations.count;
}

@end
