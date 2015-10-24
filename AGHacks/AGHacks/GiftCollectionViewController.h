//
//  GiftCollectionViewController.h
//  AGHacks
//
//  Created by Magda on 24.10.2015.
//  Copyright © 2015 VORM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GiftManager.h"

@interface GiftCollectionViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *giftCollectionView;
@property (nonatomic, strong) NSArray *possibleGifts;

- (IBAction)goToMapDidClick:(id)sender;

@end
