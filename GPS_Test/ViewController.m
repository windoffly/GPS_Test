//
//  ViewController.m
//  GPS_Test
//
//  Created by 張晉綱 on 2013/11/28.
//  Copyright (c) 2013年 張晉綱. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    CLGeocoder*geocder;
    CLLocationManager*manger;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    geocder=[[CLGeocoder alloc]init];
    manger=[[CLLocationManager alloc]init];
    manger.delegate=self;
    manger.desiredAccuracy=kCLLocationAccuracyBestForNavigation;
    //manger.distanceFilter=kCLDistanceFilterNone;
    manger.distanceFilter=1;
    [manger startUpdatingLocation];
    
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    CLLocation*location =[locations lastObject];
    self.Location.text=[NSString stringWithFormat:@"%f,%f",location.coordinate.latitude,location.coordinate.longitude];
    
[geocder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
    
   
    
    if (!error) {
        CLPlacemark*mark=[placemarks lastObject];
        self.adress.text=[NSString stringWithFormat:@"%@%@%@%@",mark.locality,mark.subLocality==nil?@"":mark.subLocality,mark.thoroughfare,mark.subThoroughfare];

    }else{NSLog(@"%@",error);}
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
