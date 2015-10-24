//
//  ChoiceModel.m
//  AGHacks
//
//  Created by Jan Posz on 24.10.2015.
//  Copyright © 2015 VORM. All rights reserved.
//

#import "ChoiceModel.h"

@implementation ChoiceModel

- (void)cancelChoice {
    self.selectedAge = nil;
    self.selectedCharacters = nil;
    self.selectedInterests = nil;
    self.selectedGender = nil;
    self.selectedMinPrice = nil;
    self.selectedMaxPrice = nil;
    self.practical = NO;
}

@end
