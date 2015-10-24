//
//  LoaderViewController.m
//  AGHacks
//
//  Created by Magda on 23.10.2015.
//  Copyright © 2015 VORM. All rights reserved.
//

#import "LoaderViewController.h"
#import "UIColor+HexString.h"
#import "UIBezierPath+Shapes.h"

@interface LoaderViewController ()

@end

@implementation LoaderViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self performSegueWithIdentifier:@"moveToMain" sender:nil];
}

- (void)onRemoteDataFetchSuccess {
    
    double delayInSeconds = 1.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t) (delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void) {
        
        [self performSegueWithIdentifier:@"moveToMain" sender:nil];
        
    });
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];

}


@end
