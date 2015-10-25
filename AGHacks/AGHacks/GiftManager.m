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
    
    Gift *g1 = [Gift giftWithName:@"Shaver" gender:GenderMan minimumAge:@18 maximumAge:@100 price:@200 interest:InterestUniversal character:CharacterUniversal practical:YES POIidentifier:@"AGD"];
    
    Gift *g2 = [Gift giftWithName:@"Cosmetics" gender:GenderWoman minimumAge:@15 maximumAge:@100 price:@50 interest:InterestUniversal character:CharacterUniversal practical:YES POIidentifier:@"Rossmann"];
    
    Gift *g3 = [Gift giftWithName:@"Darth Vader figure" gender:GenderMan minimumAge:@5 maximumAge:@30 price:@25 interest:InterestMovies character:CharacterGeek practical:NO POIidentifier:@"Empik"];
    
    Gift *g4 = [Gift giftWithName:@"Sweets" gender:GenderUniversal minimumAge:@0 maximumAge:@100 price:@10 interest:InterestFood character:CharacterUniversal practical:YES POIidentifier:@"sklep spożywczy"];
    
    Gift *g5 = [Gift giftWithName:@"Action Man" gender:GenderMan minimumAge:@0 maximumAge:@100 price:@50 interest:InterestUniversal character:CharacterUniversal practical:NO POIidentifier:@"sklep z zabawkami"];
    
    Gift *g6 = [Gift giftWithName:@"Wallet" gender:GenderMan minimumAge:@15 maximumAge:@100 price:@150 interest:InterestUniversal character:CharacterUniversal practical:YES POIidentifier:@"galanteria"];
    
    Gift *g7 = [Gift giftWithName:@"Board Game" gender:GenderUniversal minimumAge:@10 maximumAge:@100 price:@130 interest:InterestGames character:CharacterGeek practical:NO POIidentifier:@"Empik"];
    
    Gift *g8 = [Gift giftWithName:@"Book" gender:GenderUniversal minimumAge:@14 maximumAge:@100 price:@40 interest:InterestUniversal character:CharacterIntrovert practical:NO POIidentifier:@"Empik"];
    
    Gift *g9 = [Gift giftWithName:@"Plush Toy" gender:GenderWoman minimumAge:@3 maximumAge:@14 price:@30 interest:InterestUniversal character:CharacterUniversal practical:NO POIidentifier:@"sklep z zabawkami"];
    
    Gift *g10 = [Gift giftWithName:@"Perfume" gender:GenderWoman minimumAge:@16 maximumAge:@100 price:@160 interest:InterestUniversal character:CharacterUniversal practical:YES POIidentifier:@"Sephora"];
    
    Gift *g11 = [Gift giftWithName:@"Alcohol" gender:GenderMan minimumAge:@18 maximumAge:@100 price:@70 interest:InterestUniversal character:CharacterTalkative practical:YES POIidentifier:@"sklep monopolowy"];
    
    Gift *g12 = [Gift giftWithName:@"DVD movie" gender:GenderMan minimumAge:@15 maximumAge:@100 price:@30 interest:InterestMovies character:CharacterIntrovert practical:NO POIidentifier:@"Empik"];
    
    Gift *g13 = [Gift giftWithName:@"Clothing" gender:GenderWoman minimumAge:@5 maximumAge:@100 price:@100 interest:InterestUniversal character:CharacterUniversal practical:YES POIidentifier:@"galeria handlowa"];
    
    Gift *g14 = [Gift giftWithName:@"Watch" gender:GenderMan minimumAge:@15 maximumAge:@100 price:@300 interest:InterestGadgets character:CharacterPerfectionist practical:YES POIidentifier:@"sklep jubilerski"];
    
    Gift *g15 = [Gift giftWithName:@"Jewelery" gender:GenderWoman minimumAge:@17 maximumAge:@100 price:@300 interest:InterestUniversal character:CharacterUniversal practical:NO POIidentifier:@"sklep jubilerski"];
    
    Gift *g16 = [Gift giftWithName:@"Music CD" gender:GenderMan minimumAge:@15 maximumAge:@100 price:@30 interest:InterestMusic character:CharacterIntrovert practical:NO POIidentifier:@"Empik"];
    
    Gift *g17 = [Gift giftWithName:@"Foreign Tour" gender:GenderUniversal minimumAge:@20 maximumAge:@40 price:@2000 interest:InterestUniversal character:CharacterUniversal practical:NO POIidentifier:@"biuro podróży"];
    
    Gift *g18 = [Gift giftWithName:@"Sunglasses" gender:GenderUniversal minimumAge:@15 maximumAge:@100 price:@60 interest:InterestGadgets character:CharacterCool practical:YES POIidentifier:@"galeria handlowa"];
    
    Gift *g19 = [Gift giftWithName:@"Headphones" gender:GenderMan minimumAge:@15 maximumAge:@100 price:@100 interest:InterestGadgets character:CharacterGeek practical:YES POIidentifier:@"Media Markt"];
    
    Gift *g20 = [Gift giftWithName:@"Fishing Accessories" gender:GenderMan minimumAge:@15 maximumAge:@100 price:@100 interest:InterestFishing character:CharacterIntrovert practical:YES POIidentifier:@"sklep wędkarski"];
    
    self.gifts = @[g1, g2, g3, g4, g5, g6, g7, g8, g9, g10, g11, g12, g13, g14, g15, g16, g17, g18, g19, g20];
}

- (NSArray *)fetchGiftsForChoice:(ChoiceModel *)choice {
    return [self fetchGiftsWithGender:choice.selectedGender age:choice.selectedAge price:choice.selectedMaxPrice interests:choice.selectedInterests characters:choice.selectedCharacters practical:choice.practical];
}

- (NSArray *)fetchGiftsWithGender:(Gender)gender age:(NSNumber *)age price:(NSNumber *)price interests:(NSArray *)interests characters:(NSArray *)characters practical:(BOOL)practical {
    
    NSMutableArray *accurateGifts = [@[] mutableCopy];
    for (Gift *gift in self.gifts) {
        
        if ([self hasRightGender:gender gift:gift] &&
            [self hasRightInterests:interests gift:gift] &&
            [self hasRightCharacterTypes:characters gift:gift] &&
            [self hasRightAge:age gift:gift] &&
            [self hasRightPrice:price gift:gift] &&
            [self hasRightPracticality:practical gift:gift]) {
            
            [accurateGifts addObject:gift];
        }
    }
    return [accurateGifts copy];
}

- (BOOL)hasRightGender:(Gender)gender gift:(Gift *)gift {
    if (gift.gender == gender || gift.gender == GenderUniversal) {
        return YES;
    }
    return NO;
}

- (BOOL)hasRightInterests:(NSArray *)interests gift:(Gift *)gift {
    if ([interests containsObject:[NSNumber numberWithInt:gift.interest]] || gift.interest == InterestUniversal) {
        return YES;
    }
    return NO;
}

- (BOOL)hasRightCharacterTypes:(NSArray *)characterTypes gift:(Gift *)gift {
    if ([characterTypes containsObject:[NSNumber numberWithInt:gift.character]] || gift.character == CharacterUniversal) {
        return YES;
    }
    return NO;
}

- (BOOL)hasRightPracticality:(BOOL)practicality gift:(Gift *)gift {
    if (gift.practical == practicality) {
        return YES;
    }
    return NO;
}

- (BOOL)hasRightPrice:(NSNumber *)price gift:(Gift *)gift {
    if (gift.price.intValue <= price.intValue) {
        return YES;
    }
    return NO;
}

- (BOOL)hasRightAge:(NSNumber *)age gift:(Gift *)gift {
    if (gift.minAge.intValue <= age.intValue && gift.maxAge.intValue >= gift.maxAge.intValue) {
        return YES;
    }
    return NO;
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

//if (gift.gender == gender || gift.gender == GenderUniversal) {
//    if ([interests containsObject:[NSNumber numberWithInt:gift.interest]] || gift.interest == InterestUniversal) {
//        if ([characters containsObject:[NSNumber numberWithInt:gift.character]] || gift.character == CharacterUniversal) {
//            if (gift.practical == practical) {
//                if (gift.minAge.intValue <= age.intValue && gift.maxAge.intValue >= gift.maxAge.intValue) {
//                    if (gift.price.intValue <= price.intValue) {
//                        [accurateGifts addObject:gift];
//                    }
//                }
//            }
//        }
//    }
//}