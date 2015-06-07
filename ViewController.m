//
//  ViewController.m
//  test
//
//  Created by Akshay Kumar on 2015-06-06.
//  Copyright (c) 2015 Akshay Kumar. All rights reserved.
//

#import "ViewController.h"
#import <GoogleMaps/GoogleMaps.h>

@interface ViewController ()

@end

@implementation ViewController
GMSMapView *mapView_;

-(void)loadView{
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:45.494660 longitude:-73.562347 zoom:12];
    mapView_= [GMSMapView mapWithFrame:CGRectZero camera:camera];
    self.view = mapView_;
    
    // creates a marker in the center of the map
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(45.494660,-73.562347);
    marker.title = @"Your current locaton";
    marker.snippet = @"";
    marker.map = mapView_;
    
    GMSMarker *marker1 = [[GMSMarker alloc] init];
    marker1.position = CLLocationCoordinate2DMake(45.526774, -73.598535);
    marker1.title = @"5561 Rue Saint Dominique";
    marker1.snippet = @" Dentist Appointment @ 2pm";
    marker1.map = mapView_;
    
}


const double PIx = 3.141592653589793;
const double RADIO = 6371; // Mean radius of Earth in Km

double convertToRadians(double val) {
    
    return val * PIx / 180;
}

-(double)kilometresBetweenPlace1:(CLLocationCoordinate2D) marker andmarker1:(CLLocationCoordinate2D) place2 {
    
    double dlon = convertToRadians(marker.longitude - marker.longitude);
    double dlat = convertToRadians(marker.latitude - marker.latitude);
    
    double a = ( pow(sin(dlat / 2), 2) + cos(convertToRadians(marker.latitude))) * cos(convertToRadians(marker.latitude)) * pow(sin(dlon / 2), 2);
    double angle = 2 * asin(sqrt(a));
    
    
    return angle * RADIO;
}

double getDistanceMetresBetweenLocationCoordinates(CLLocationCoordinate2D coord1,
CLLocationCoordinate2D coord2)
{
    CLLocation* location1 =
    [[CLLocation alloc]
     initWithLatitude: coord1.latitude
     longitude: coord1.longitude];
    CLLocation* location2 =
    [[CLLocation alloc]
     initWithLatitude: coord2.latitude
     longitude: coord2.longitude];
    
    return [location1 distanceFromLocation: location2];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
