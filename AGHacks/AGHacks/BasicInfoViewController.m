//
//  BasicInfoViewController.m
//  AGHacks
//
//  Created by Magda on 24.10.2015.
//  Copyright © 2015 VORM. All rights reserved.
//

#import "BasicInfoViewController.h"
#import "UINavigationBar+GiftyNavigationBar.h"

@interface BasicInfoViewController ()

@end

@implementation BasicInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupCheckboxes];
    self.ageTextField.delegate = self;
    self.priceTextField.delegate = self;
    self.female.delegate = self;
    self.male.delegate = self;
    self.isPracticalCheckbox.delegate = self;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];

}

-(void)setupCheckboxes {
    
    self.female.onAnimationType = BEMAnimationTypeBounce;
    self.female.offAnimationType = BEMAnimationTypeBounce;
    self.male.onAnimationType = BEMAnimationTypeBounce;
    self.male.offAnimationType = BEMAnimationTypeBounce;
    self.isPracticalCheckbox.onAnimationType = BEMAnimationTypeBounce;
    self.isPracticalCheckbox.offAnimationType = BEMAnimationTypeBounce;
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [self.scrollView setContentOffset:CGPointMake(0, 100) animated:YES];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [self.scrollView setContentOffset:CGPointZero animated:YES];
    if (textField == self.ageTextField) {
        getApp().choice.selectedAge = [NSNumber numberWithInt:[self.ageTextField.text intValue]];
    }
    else if (textField == self.priceTextField) {
        getApp().choice.selectedMaxPrice = [NSNumber numberWithInt:[self.priceTextField.text intValue]];
    }
}

-(void)viewWillAppear:(BOOL)animated {
    [[self navigationController] setNavigationBarHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didTapCheckBox:(BEMCheckBox *)checkBox {
    
    if (checkBox == self.female) {
        getApp().choice.selectedGender = GenderWoman;
        self.male.on = NO;
    }
    
    if (checkBox == self.male) {
        getApp().choice.selectedGender = GenderMan;
        self.female.on = NO;
    }
    if (checkBox == self.isPracticalCheckbox) {
        getApp().choice.practical = YES;
    }
    
}

-(void)dismissKeyboard {
    [self.ageTextField resignFirstResponder];
    [self.priceTextField resignFirstResponder];
}

@end
