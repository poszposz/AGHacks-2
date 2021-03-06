//
//  InterestsViewController.m
//  AGHacks
//
//  Created by Magda on 24.10.2015.
//  Copyright © 2015 VORM. All rights reserved.
//

#import "InterestsViewController.h"
#import "UINavigationBar+GiftyNavigationBar.h"

static NSString *cellIdentifier = @"cellIdentifier";

@interface InterestsViewController ()

@property (nonatomic, strong) NSArray *interests;
@property (nonatomic, strong) NSMutableArray *selectedInterests;

@end

@implementation InterestsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
    
    self.selectedInterests = [@[] mutableCopy];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor lightGrayColor];
    
    self.interests = [GiftManager allInterests];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
}

- (void)nextDidClick:(id)sender {
    // handle saving selected data
    [getApp().choice setSelectedInterests:self.selectedInterests];
    [self performSegueWithIdentifier:@"characterSegue" sender:self];
}

-(void)setupBackgroundViewForCell:(UITableViewCell *)cell {
    UIView *view = [[UIView alloc]initWithFrame:cell.bounds];
    view.backgroundColor = [UIColor darkGrayColor];
    cell.selectedBackgroundView = view;
}

// MARK: tableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.interests.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    Interest interest = [[self.interests objectAtIndex:indexPath.row] intValue];
    cell.textLabel.text = [GiftManager stringValueForinterest:interest];
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:17];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.backgroundColor = [UIColor lightGrayColor];
    [self setupBackgroundViewForCell:cell];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.selectedInterests addObject:[self.interests objectAtIndex:indexPath.row]];
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.selectedInterests removeObject:[self.interests objectAtIndex:indexPath.row]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
