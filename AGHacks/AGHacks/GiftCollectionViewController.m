//
//  GiftCollectionViewController.m
//  AGHacks
//
//  Created by Magda on 24.10.2015.
//  Copyright © 2015 VORM. All rights reserved.
//

#import "GiftCollectionViewController.h"

@interface GiftCollectionViewController ()

@end

@implementation GiftCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //self.giftCollectionView.delegate = self;
    //self.giftCollectionView.dataSource = self;
}

-(void)goToMapDidClick:(id)sender {
    [self performSegueWithIdentifier:@"mapSegue" sender:self];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.possibleGifts.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    
    //UILabel *giftName = (UILabel *)[cell viewForBaselineLayout]
    [cell.layer setBorderWidth:2.0f];
    [cell.layer setBorderColor:[UIColor whiteColor].CGColor];
    [cell.layer setCornerRadius:50.0f];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
