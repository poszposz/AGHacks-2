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
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
    [[self navigationController] setTitle:@"Basic Info"];
    [self setupCheckboxes];
    self.female.delegate = self;
    self.male.delegate = self;
    self.isPracticalCheckbox.delegate = self;

}

-(void)setupCheckboxes {
    
    self.female.onAnimationType = BEMAnimationTypeBounce;
    self.female.offAnimationType = BEMAnimationTypeBounce;
    self.male.onAnimationType = BEMAnimationTypeBounce;
    self.male.offAnimationType = BEMAnimationTypeBounce;
    self.isPracticalCheckbox.onAnimationType = BEMAnimationTypeBounce;
    self.isPracticalCheckbox.offAnimationType = BEMAnimationTypeBounce;
    
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
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
