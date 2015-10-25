//
//  PlacePin.h
//  Woolet
//
//  Created by Jan Posz on 03.04.2015.
//  Copyright (c) 2015 janposz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface PlacePin : NSObject<MKAnnotation> {
    CLLocationCoordinate2D coordinate;
    NSString *title;
    NSString *subtitle;
    int nTag;
}

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *subtitle;
@property (nonatomic) int nTag;

- (id)initWithLocation:(CLLocationCoordinate2D)coord;

@end