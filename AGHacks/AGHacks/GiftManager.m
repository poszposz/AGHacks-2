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
    
    Gift *g6 = [Gift giftWithName:@"Portfel" gender:GenderMan minimumAge:@15 maximumAge:@100 price:@150 interest:InterestUniversal character:CharacterUniversal practical:YES];
    
    Gift *g7 = [Gift giftWithName:@"Gra planszowa" gender:GenderMan minimumAge:@10 maximumAge:@100 price:@130 interest:InterestUniversal character:CharacterUniversal practical:NO];
    
    Gift *g8 = [Gift giftWithName:@"Ksiazka (beletrystyka)" gender:GenderMan minimumAge:@14 maximumAge:@100 price:@40 interest:InterestUniversal character:CharacterUniversal practical:NO];
    
    Gift *g9 = [Gift giftWithName:@"Pluszak" gender:GenderMan minimumAge:@3 maximumAge:@14 price:@30 interest:InterestUniversal character:CharacterUniversal practical:NO];
    
    Gift *g10 = [Gift giftWithName:@"Perfumy" gender:GenderMan minimumAge:@16 maximumAge:@100 price:@160 interest:InterestUniversal character:CharacterUniversal practical:YES];
    
    Gift *g11 = [Gift giftWithName:@"Alkohol" gender:GenderMan minimumAge:@18 maximumAge:@100 price:@70 interest:InterestUniversal character:CharacterUniversal practical:NO];
    
    Gift *g12 = [Gift giftWithName:@"Film na DVD" gender:GenderMan minimumAge:@15 maximumAge:@100 price:@30 interest:InterestUniversal character:CharacterUniversal practical:NO];
    
    Gift *g13 = [Gift giftWithName:@"Odzież - dodatki" gender:GenderMan minimumAge:@5 maximumAge:@100 price:@100 interest:InterestUniversal character:CharacterUniversal practical:YES];
    
    Gift *g14 = [Gift giftWithName:@"Zegarek" gender:GenderMan minimumAge:@15 maximumAge:@100 price:@300 interest:InterestUniversal character:CharacterUniversal practical:YES];
    
    Gift *g15 = [Gift giftWithName:@"Biżuteria" gender:GenderWoman minimumAge:@17 maximumAge:@100 price:@300 interest:InterestUniversal character:CharacterUniversal practical:NO];
    
    Gift *g16 = [Gift giftWithName:@"Płyta z muzyką" gender:GenderMan minimumAge:@15 maximumAge:@100 price:@30 interest:InterestUniversal character:CharacterUniversal practical:NO];
    
    Gift *g17 = [Gift giftWithName:@"Wycieczka zagraniczna" gender:GenderMan minimumAge:@20 maximumAge:@40 price:@2000 interest:InterestUniversal character:CharacterUniversal practical:NO];
    
    Gift *g18 = [Gift giftWithName:@"Okulary przeciwsłoneczne" gender:GenderMan minimumAge:@15 maximumAge:@100 price:@60 interest:InterestUniversal character:CharacterUniversal practical:YES];
    
    Gift *g19 = [Gift giftWithName:@"Sluchawki multimedialne" gender:GenderMan minimumAge:@15 maximumAge:@100 price:@100 interest:InterestUniversal character:CharacterUniversal practical:YES];
    
    Gift *g20 = [Gift giftWithName:@"Akcesoria wędkarskie" gender:GenderMan minimumAge:@15 maximumAge:@100 price:@100 interest:InterestUniversal character:CharacterUniversal practical:NO];
    
    self.gifts = @[g1, g2, g3, g4, g5, g6, g7, g8, g9, g10, g11, g12, g13, g14, g15, g16, g17, g18, g19, g20];
}

- (NSArray *)fetchGiftsForChoice:(ChoiceModel *)choice {
    return [self fetchGiftsWithGender:choice.selectedGender age:choice.selectedAge price:choice.selectedMaxPrice interests:choice.selectedInterests characters:choice.selectedCharacters practical:choice.practical];
}

- (NSArray *)fetchGiftsWithGender:(Gender)gender age:(NSNumber *)age price:(NSNumber *)price interests:(NSArray *)interests characters:(NSArray *)characters practical:(BOOL)practical {
    
    NSMutableArray *accurateGifts = [@[] mutableCopy];
    for (Gift *gift in self.gifts) {
        if (gift.gender == gender || gift.gender == GenderUniversal) {
            if ([interests containsObject:[NSNumber numberWithInt:gift.interest]] || gift.interest == InterestUniversal) {
                if ([characters containsObject:[NSNumber numberWithInt:gift.character]] || gift.character == CharacterUniversal) {
                    if (gift.practical == practical) {
                        if (gift.minAge.intValue <= age.intValue && gift.maxAge.intValue >= gift.maxAge.intValue) {
                            if (gift.price.intValue <= price.intValue) {
                                [accurateGifts addObject:gift];
                            }
                        }
                    }
                }
            }
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
