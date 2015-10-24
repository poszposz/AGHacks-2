//
//  ChoiceModel.h
//  AGHacks
//
//  Created by Jan Posz on 24.10.2015.
//  Copyright © 2015 VORM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Gift.h"

@interface ChoiceModel : NSObject

@property (nonatomic, strong) NSArray *selectedCharacters;
@property (nonatomic, strong) NSArray *selectedInterests;
@property (nonatomic, assign) Gender *selectedGender;
@property (nonatomic, strong) NSNumber *selectedAge;
@property (nonatomic, strong) NSNumber *selectedMinPrice;
@property (nonatomic, strong) NSNumber *selectedMaxPrice;
@property (nonatomic, assign) BOOL practical;

- (void)cancelChoice;

@end
