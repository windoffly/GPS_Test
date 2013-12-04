//
//  ViewController.h
//  GPS_Test
//
//  Created by 張晉綱 on 2013/11/28.
//  Copyright (c) 2013年 張晉綱. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
@interface ViewController : UIViewController<
CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *Location;
@property (weak, nonatomic) IBOutlet UILabel *adress;

@end
