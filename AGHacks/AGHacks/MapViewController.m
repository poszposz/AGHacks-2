//
//  MapViewController.m
//  AGHacks
//
//  Created by Magda on 24.10.2015.
//  Copyright © 2015 VORM. All rights reserved.
//

#import "MapViewController.h"
#import "AppDelegate.h"

static NSString *mapAnnotationId = @"mapAnnotation";

#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

@import MapKit;
@import CoreLocation;

@interface MapViewController ()

@property (nonatomic, assign) CLLocationCoordinate2D selectedCoordinate;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.mapView setDelegate:self];
    self.manager = [[CLLocationManager alloc] init];
    self.manager.delegate = self;

    if([self.manager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.manager requestWhenInUseAuthorization];
    }
    [self.manager startUpdatingLocation];
    
    self.gatheredGifts = [getApp().giftManager fetchGiftsForChoice:getApp().choice];
}

- (void)searchPOIWithPhrase:(NSString *)phrase inLocation:(CLLocationCoordinate2D)coords {
    MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc] init];
    request.region = MKCoordinateRegionMake(coords, MKCoordinateSpanMake(0.5, 0.5));
    request.naturalLanguageQuery = self.gift.POIidentifier; // or business name
    MKLocalSearch *localSearch = [[MKLocalSearch alloc] initWithRequest:request];
    [localSearch startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error) {
        for (MKMapItem *mapItem in response.mapItems) {
            MKPlacemark *placemark = mapItem.placemark;
//            PlacePin *mapPoint = [[PlacePin alloc] initWithLocation:placemark.coordinate];
//            [mapPoint setTitle:self.gift.POIidentifier];
//            [self.mapView addAnnotation:mapPoint];
            
            MKPointAnnotation *annotation = [[MKPointAnnotation alloc]init];
            [annotation setCoordinate:placemark.coordinate];
            [annotation setTitle:placemark.name];
//            [annotation setSubtitle:placemark.add];
            [self.mapView viewForAnnotation:annotation];
            [self.mapView addAnnotation:annotation];
//            [self.mapView selectAnnotation:annotation animated:YES];
        }
    }];
}


- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    if (locations.count) {
        CLLocation *location = [locations objectAtIndex:0];
        if (location.coordinate.latitude != 0 && location.coordinate.longitude != 0) {
            MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(location.coordinate, 800, 800);
            [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
            [self searchPOIWithPhrase:@"restauracja" inLocation:location.coordinate];
            [self.manager stopUpdatingLocation];
        }
    }
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    
    self.selectedCoordinate = view.annotation.coordinate;
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hey" message:@"Do you want to get route to this place?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Yes!", nil];
    [alert show];
}

- (NSString *)deviceLocation {
    return [NSString stringWithFormat:@"latitude: %f longitude: %f", self.manager.location.coordinate.latitude, self.manager.location.coordinate.longitude];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        [self openMaps];
    }
}

- (void)openMaps {
    CLLocationCoordinate2D endingCoord = self.selectedCoordinate;
    MKPlacemark *endLocation = [[MKPlacemark alloc] initWithCoordinate:endingCoord addressDictionary:nil];
    MKMapItem *endingItem = [[MKMapItem alloc] initWithPlacemark:endLocation];
    
    [endingItem setName:self.gift.POIidentifier];
    
    NSMutableDictionary *launchOptions = [[NSMutableDictionary alloc] init];
    [launchOptions setObject:MKLaunchOptionsDirectionsModeDriving forKey:MKLaunchOptionsDirectionsModeKey];
    
    [endingItem openInMapsWithLaunchOptions:launchOptions];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
