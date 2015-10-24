//
//  InterestsViewController.m
//  AGHacks
//
//  Created by Magda on 24.10.2015.
//  Copyright © 2015 VORM. All rights reserved.
//

#import "InterestsViewController.h"
#import "UINavigationBar+GiftyNavigationBar.h"

@interface InterestsViewController ()

@end

@implementation InterestsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView setUserInteractionEnabled:YES];
    [[self navigationController] setTitle:@"Interests"];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
