//
//  Gift.h
//  AGHacks
//
//  Created by Jan Posz on 24.10.2015.
//  Copyright © 2015 VORM. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    GenderMan,
    GenderWoman,
    GenderUniversal
} Gender;

typedef enum {
    InterestMotorization,
    InterestFashion,
    InterestComputers,
    InterestUniversal,
    InterestMovies,
    InterestFood
} Interest;

typedef enum {
    CharacterIntrovert,
    CharacterCool,
    CharacterGeek,
    CharacterUniversal
} Character;

@interface Gift : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) Gender gender;
@property (nonatomic, assign) Interest interest;
@property (nonatomic, strong) NSNumber *price;
@property (nonatomic, strong) NSNumber *minAge;
@property (nonatomic, strong) NSNumber *maxAge;
@property (nonatomic, assign) Character character;
@property (nonatomic, assign) BOOL practical;

+ (Gift *)giftWithName:(NSString *)name gender:(Gender)gender minimumAge:(NSNumber *)minage maximumAge:(NSNumber *)maxage price:(NSNumber *)price interest:(Interest)interest character:(Character)character practical:(BOOL)practical;

@end
