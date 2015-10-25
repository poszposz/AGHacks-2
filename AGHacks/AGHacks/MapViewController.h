//
//  MapViewController.h
//  AGHacks
//
//  Created by Magda on 24.10.2015.
//  Copyright © 2015 VORM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapKit/MapKit.h"
#import "PlacePin.h"
#import "GiftManager.h"

@interface MapViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic, retain) CLLocationManager *manager;
@property (nonatomic, readwrite) CLLocationCoordinate2D zoomLocation;
@property (nonatomic, strong) NSArray *gatheredGifts;
@property (nonatomic, strong) Gift *gift;

@end
