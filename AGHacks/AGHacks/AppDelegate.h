//
//  AppDelegate.h
//  AGHacks
//
//  Created by Jan Posz on 23.10.2015.
//  Copyright © 2015 VORM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GiftManager.h"
#import "ChoiceModel.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ChoiceModel *choice;
@property (strong, nonatomic) GiftManager *giftManager;

@end

extern AppDelegate *getApp(void);