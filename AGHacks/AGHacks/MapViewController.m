//
//  MapViewController.m
//  AGHacks
//
//  Created by Magda on 24.10.2015.
//  Copyright © 2015 VORM. All rights reserved.
//

#import "MapViewController.h"

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
    
    self.mapView.showsUserLocation = YES;

    self.manager.desiredAccuracy = kCLLocationAccuracyBest;
    self.manager.distanceFilter = kCLLocationAccuracyKilometer;
}

- (void)searchPOIWithPhrase:(NSString *)phrase inLocation:(CLLocationCoordinate2D)coords {
    MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc] init];
    request.region = MKCoordinateRegionMake(coords, MKCoordinateSpanMake(0.5, 0.5));
    request.naturalLanguageQuery = phrase; // or business name
    MKLocalSearch *localSearch = [[MKLocalSearch alloc] initWithRequest:request];
    [localSearch startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error) {
        for (MKMapItem *mapItem in response.mapItems) {
            MKPlacemark *placemark = mapItem.placemark;
            PlacePin *mapPoint = [[PlacePin alloc] initWithLocation:placemark.coordinate];
            [self.mapView addAnnotation:mapPoint];
        }
    }];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapview viewForAnnotation:(id <MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    MKAnnotationView *annotationView = [self.mapView dequeueReusableAnnotationViewWithIdentifier:mapAnnotationId];
    if(annotationView) {

        return annotationView;
    }
    else {
        MKAnnotationView *annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation
                                                                        reuseIdentifier:mapAnnotationId];
        CGRect r = annotationView.frame;
        r.size.width = 40;
        r.size.height = 40;
        annotationView.frame = r;
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        [imgView setImage:[UIImage imageNamed:@"mapPin.png"]];
        [annotationView addSubview:imgView];
        return annotationView;
    }
    return nil;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    if (locations.count) {
        CLLocation *location = [locations objectAtIndex:0];
        if (location.coordinate.latitude != 0 && location.coordinate.longitude != 0) {
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

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 800, 800);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
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
    
    NSMutableDictionary *launchOptions = [[NSMutableDictionary alloc] init];
    [launchOptions setObject:MKLaunchOptionsDirectionsModeDriving forKey:MKLaunchOptionsDirectionsModeKey];
    
    [endingItem openInMapsWithLaunchOptions:launchOptions];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
