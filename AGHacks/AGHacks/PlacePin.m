//
//  PlacePin.m
//  Woolet
//
//  Created by Jan Posz on 03.04.2015.
//  Copyright (c) 2015 janposz. All rights reserved.
//

#import "PlacePin.h"

@implementation PlacePin

@synthesize coordinate,title,subtitle;
@synthesize nTag;

- (id)initWithLocation:(CLLocationCoordinate2D)coord {
    
    self = [super init];
    if (self) {
        coordinate = coord;
    }
    return self;    
}

@end
