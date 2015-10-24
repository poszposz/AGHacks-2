//
//  CharacterInfoViewController.m
//  AGHacks
//
//  Created by Magda on 24.10.2015.
//  Copyright © 2015 VORM. All rights reserved.
//

#import "CharacterInfoViewController.h"
#import "AppDelegate.h"

static NSString *cellIdentifier = @"characterCellIdentifier";

@interface CharacterInfoViewController ()

@property (nonatomic, strong) NSArray *characterTypes;
@property (nonatomic, strong) NSMutableArray *selectedCharacterTypes;

@end

@implementation CharacterInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor lightGrayColor];
    
    self.selectedCharacterTypes = [@[] mutableCopy];
    
    self.characterTypes = [GiftManager allCharacters];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)nextDidClick:(id)sender {
    [getApp().choice setSelectedCharacters:self.selectedCharacterTypes];
    [self performSegueWithIdentifier:@"giftSegue" sender:self];
}

-(void)setupBackgroundViewForCell:(UITableViewCell *)cell {
    UIView *view = [[UIView alloc]initWithFrame:cell.bounds];
    view.backgroundColor = [UIColor darkGrayColor];
    cell.selectedBackgroundView = view;
}

//MARK: table view

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.characterTypes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    Character character = [[self.characterTypes objectAtIndex:indexPath.row] intValue];
    cell.textLabel.text = [GiftManager stringValueForCharacter:character];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.selectedCharacterTypes addObject:[self.characterTypes objectAtIndex:indexPath.row]];
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.selectedCharacterTypes removeObject:[self.characterTypes objectAtIndex:indexPath.row]];
}


@end
