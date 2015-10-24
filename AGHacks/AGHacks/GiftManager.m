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

// MARK interest utility

+ (NSArray *)allInterests {
    return @[[NSNumber numberWithInt:InterestUniversal],
             [NSNumber numberWithInt:InterestFood],
             [NSNumber numberWithInt:InterestMovies],
             [NSNumber numberWithInt:InterestComputers],
             [NSNumber numberWithInt:InterestMotorization],
             [NSNumber numberWithInt:InterestFishing],
             [NSNumber numberWithInt:InterestGadgets],
             [NSNumber numberWithInt:InterestGames],
             [NSNumber numberWithInt:InterestMusic],
             [NSNumber numberWithInt:InterestSport]
             ];
}

+ (NSString *)stringValueForinterest:(Interest)interest {
    switch (interest) {
        case InterestUniversal:
            return @"Universal";
            break;
        case InterestFood:
            return @"Food";
            break;
        case InterestMovies:
            return @"Movies";
            break;
        case InterestComputers:
            return @"Computers";
            break;
        case InterestFashion:
            return @"Fashion";
            break;
        case InterestMotorization:
            return @"Motorization";
            break;
        case InterestFishing:
            return @"Fishing";
            break;
        case InterestGadgets:
            return @"Gadgets";
            break;
        case InterestGames:
            return @"Games";
            break;
        case InterestMusic:
            return @"Music";
            break;
        case InterestSport:
            return @"Sport";
            break;
        default:
            break;
    }
    return @"";
}

// MARK character utility

+ (NSArray *)allCharacters {
    return @[[NSNumber numberWithInt:CharacterCool],
             [NSNumber numberWithInt:CharacterIntrovert],
             [NSNumber numberWithInt:CharacterGeek],
             [NSNumber numberWithInt:CharacterUniversal],
             [NSNumber numberWithInt:CharacterTalkative],
             [NSNumber numberWithInt:CharacterAltruist],
             [NSNumber numberWithInt:CharacterExtrovert],
             [NSNumber numberWithInt:CharacterPerfectionist]
             ];
}

+ (NSString *)stringValueForCharacter:(Character)character {
    
    switch (character) {
        case CharacterCool:
            return @"Cool";
            break;
        case CharacterIntrovert:
            return @"Introvert";
            break;
        case CharacterGeek:
            return @"Geek";
            break;
        case CharacterUniversal:
            return @"Universal";
            break;
        case CharacterAltruist:
            return @"Altruist";
            break;
        case CharacterExtrovert:
            return @"Extrovert";
            break;
        case CharacterPerfectionist:
            return @"Perfectionist";
            break;
        case CharacterTalkative:
            return @"Talkative";
            break;
        default:
            break;
    }
    return @"";
}

@end
