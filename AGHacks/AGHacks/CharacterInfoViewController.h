//
//  CharacterInfoViewController.h
//  AGHacks
//
//  Created by Magda on 24.10.2015.
//  Copyright © 2015 VORM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CharacterInfoViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;

- (IBAction)nextDidClick:(id)sender;

@end
