//
//  UINavigationBar+GiftyNavigationBar.m
//  AGHacks
//
//  Created by Magda on 24.10.2015.
//  Copyright © 2015 VORM. All rights reserved.
//

#import "UINavigationBar+GiftyNavigationBar.h"

@implementation UINavigationBar_GiftyNavigationBar

+ (UINavigationBar* )setNavigationBarColor: (UINavigationBar *) bar {
    bar.barTintColor = [UIColor grayColor];
    bar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    
    return bar;
}


@end
