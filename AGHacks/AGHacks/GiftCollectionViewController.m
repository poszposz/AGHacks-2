//
//  GiftCollectionViewController.m
//  AGHacks
//
//  Created by Magda on 24.10.2015.
//  Copyright © 2015 VORM. All rights reserved.
//

#import "GiftCollectionViewController.h"
#import "MapViewController.h"

static NSString *colCellId = @"cellid";

@interface GiftCollectionViewController ()

@property (nonatomic, strong) NSArray *gatheredGifts;

@end

@implementation GiftCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gatheredGifts = [getApp().giftManager fetchGiftsForChoice:getApp().choice];
    NSLog(@"%@", self.gatheredGifts);
    self.giftCollectionView.delegate = self;
    self.giftCollectionView.dataSource = self;
    
    [self.giftCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:colCellId];
}

-(void)goToMapDidClick:(id)sender {
    [self performSegueWithIdentifier:@"mapSegue" sender:self];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.gatheredGifts.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:colCellId forIndexPath:indexPath];
    
    Gift *gift = [self.gatheredGifts objectAtIndex:indexPath.row];
    
    UILabel *label = [[UILabel alloc] initWithFrame:cell.bounds];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:12];
    label.text = gift.name;
    label.numberOfLines = 2;
    [cell.contentView addSubview:label];
    [cell.layer setBorderWidth:2.0f];
    [cell.layer setBorderColor:[UIColor whiteColor].CGColor];
    [cell.layer setCornerRadius:50.0f];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    Gift *gift = [self.gatheredGifts objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"mapSegue" sender:gift];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    MapViewController *mapvc = (MapViewController *)segue.destinationViewController;
    mapvc.gift = (Gift *)sender;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
