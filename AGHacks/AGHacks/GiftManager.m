//
//  GiftManager.m
//  AGHacks
//
//  Created by Jan Posz on 24.10.2015.
//  Copyright © 2015 VORM. All rights reserved.
//

#import "GiftManager.h"

#define kDefaultPriceRange 20

@interface GiftManager ()

@property (nonatomic, strong) NSArray *gifts;

@end

@implementation GiftManager

- (void)createDefaultGifts {
    
    Gift *g1 = [Gift giftWithName:@"Golarka" gender:GenderMan minimumAge:@15 maximumAge:@100 price:@200 interest:InterestUniversal character:CharacterUniversal practical:YES];
    
    Gift *g2 = [Gift giftWithName:@"Krem na zmarszczki" gender:GenderWoman minimumAge:@30 maximumAge:@100 price:@50 interest:InterestUniversal character:CharacterUniversal practical:YES];
    
    Gift *g3 = [Gift giftWithName:@"Darth Vader figure" gender:GenderUniversal minimumAge:@5 maximumAge:@100 price:@25 interest:InterestMovies character:CharacterGeek practical:NO];
    
    Gift *g4 = [Gift giftWithName:@"Ciastka" gender:GenderUniversal minimumAge:@0 maximumAge:@100 price:@10 interest:InterestFood character:CharacterUniversal practical:NO];
    
    Gift *g5 = [Gift giftWithName:@"Action man" gender:GenderUniversal minimumAge:@0 maximumAge:@100 price:@50 interest:InterestUniversal character:CharacterGeek practical:NO];
    
    self.gifts = @[g1, g2, g3, g4];
}

- (NSArray *)fetchGiftsWithGender:(Gender)gender age:(NSNumber *)age price:(NSNumber *)price interest:(Interest)interest character:(Character)character practical:(BOOL)practical {
    
    NSMutableArray *accurateGifts = [@[] mutableCopy];
    for (Gift *gift in self.gifts) {
        if (gift.gender == gender && gift.interest == interest && gift.character == character && gift.practical == practical && gift.minAge.intValue <= age.intValue && gift.maxAge.intValue >= gift.maxAge.intValue && abs(gift.price.intValue - price.intValue) < kDefaultPriceRange) {
            [accurateGifts addObject:gift];
        }
    }
    return [accurateGifts copy];
}

@end
