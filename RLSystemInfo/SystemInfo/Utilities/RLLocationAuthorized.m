//
//  RLLocationAuthorized.m
//  RLSystemInfo
//
//  Created by rainer_liao on 15/11/2.
//  Copyright © 2015年 rainer_liao. All rights reserved.
//

#import "RLLocationAuthorized.h"
#import <CoreLocation/CoreLocation.h>
#import <CoreLocation/CLLocationManagerDelegate.h>

@implementation RLLocationAuthorized

+ (BOOL)locationAuthorized
{
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    if (status == kCLAuthorizationStatusNotDetermined || status == kCLAuthorizationStatusRestricted || status == kCLAuthorizationStatusDenied)
    {
        return NO;
    }
    //(status == kCLAuthorizationStatusAuthorizedAlways || status == kCLAuthorizationStatusAuthorizedWhenInUse)
    else
    {
        return YES;
    }
}

@end
