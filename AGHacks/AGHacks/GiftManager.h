//
//  GiftManager.h
//  AGHacks
//
//  Created by Jan Posz on 24.10.2015.
//  Copyright © 2015 VORM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Gift.h"
#import "ChoiceModel.h"

@interface GiftManager : NSObject

- (NSArray *)fetchGiftsForChoice:(ChoiceModel *)choice;

- (void)createDefaultGifts;

// Utility

+ (NSString *)stringValueForinterest:(Interest)interest;
+ (NSArray *)allInterests;

+ (NSString *)stringValueForCharacter:(Character)character;
+ (NSArray *)allCharacters;

@end