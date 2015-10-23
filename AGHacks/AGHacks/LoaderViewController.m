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
    
    CBZSplashView *splashView = [CBZSplashView splashViewWithIcon:[UIImage imageNamed:@"SplashIcon"] backgroundColor:[UIColor grayColor]];
    
    splashView.animationDuration = 1.4;
    
    [self.view addSubview:splashView];
    
    self.splashView = splashView;
    
    [self performSegueWithIdentifier:@"moveToMain" sender:nil];
}

- (void)onRemoteDataFetchSuccess {
    
//    if(self.dataManager.getResponseCode == 1) {
//        [self.view makeToast:@"No Internet connection. Cached data is loading." duration:3.0 position:@"bottom"];
//    }
    
    double delayInSeconds = 1.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t) (delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void) {
        
        [self performSegueWithIdentifier:@"moveToMain" sender:nil];
        
    });
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.splashView startAnimation];
    });

}


@end
