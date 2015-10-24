//
//  Gift.m
//  AGHacks
//
//  Created by Jan Posz on 24.10.2015.
//  Copyright © 2015 VORM. All rights reserved.
//

#import "Gift.h"

@implementation Gift

+ (Gift *)giftWithName:(NSString *)name gender:(Gender)gender minimumAge:(NSNumber *)minage maximumAge:(NSNumber *)maxage price:(NSNumber *)price interest:(Interest)interest character:(Character)character practical:(BOOL)practical {
    
    Gift *gift = [[Gift alloc] init];
    gift.name = name;
    gift.gender = gender;
    gift.minAge = minage;
    gift.maxAge = maxage;
    gift.price = price;
    gift.interest = interest;
    gift.character = character;
    gift.practical = practical;
    return gift;
}

@end
