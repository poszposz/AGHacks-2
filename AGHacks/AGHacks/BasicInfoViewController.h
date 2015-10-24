//
//  BasicInfoViewController.h
//  AGHacks
//
//  Created by Magda on 24.10.2015.
//  Copyright © 2015 VORM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BEMCheckBox.h"

@interface BasicInfoViewController : UIViewController
@property (weak, nonatomic) IBOutlet BEMCheckBox *female;
@property (weak, nonatomic) IBOutlet BEMCheckBox *male;

@end
