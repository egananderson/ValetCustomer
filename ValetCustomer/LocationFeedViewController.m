//
//  ViewController.m
//  ValetCustomer
//
//  Created by Egan Anderson on 5/27/15.
//  Copyright (c) 2015 Egan Anderson. All rights reserved.
//

#import "LocationFeedViewController.h"
#import "LocationFeedDataSource.h"
#import "LocationDetailViewController.h"
#import "LocationController.h"

@interface LocationFeedViewController () <UITableViewDelegate, UISearchBarDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) LocationFeedDataSource *dataSource;
@property (nonatomic, strong) UISearchBar *searchBar;

@end

@implementation LocationFeedViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, -44, self.view.frame.size.width, self.view.frame.size.height + 44) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.dataSource = [LocationFeedDataSource new];
    self.tableView.dataSource = self.dataSource;
    [self.view addSubview:self.tableView];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    
    UIView *whiteRectangle = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 20)];
    whiteRectangle.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:whiteRectangle];
   
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(30, 50, self.view.frame.size.width - 60, 30)];
    self.searchBar.delegate = self;
  //  self.navigationController.navigationController.navigationItem.titleView = self.searchBar;
    [self.view addSubview:self.searchBar];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 305;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [self.searchBar resignFirstResponder];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    LocationDetailViewController *detailViewController = [LocationDetailViewController new];
    
    LocationController *locationController = [LocationController sharedInstance];
//    Location *movie = movieController.resultMovies[indexPath.row];
    
    detailViewController.locationName = locationController.locations[indexPath.row][@"locationName"];
    detailViewController.locationStreet = locationController.locations[indexPath.row][@"locationStreet"];
    detailViewController.locationImage = locationController.locations[indexPath.row][@"locationImage"];
    [self.navigationController pushViewController:detailViewController animated:YES];
}



@end
