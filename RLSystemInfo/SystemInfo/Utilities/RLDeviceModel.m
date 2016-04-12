//
//  RLDeviceModel.m
//  RLSystemInfo
//
//  Created by rainer_liao on 15/11/2.
//  Copyright © 2015年 rainer_liao. All rights reserved.
//

#import "RLDeviceModel.h"
#import "sys/utsname.h"

@implementation RLDeviceModel

+ (NSString *)deviceModel
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    if ([deviceString isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([deviceString isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([deviceString isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([deviceString isEqualToString:@"iPhone3,1"])    return @"iPhone 4";//GSM
    if ([deviceString isEqualToString:@"iPhone3,3"])    return @"iPhone 4";//CDMA/Verizon/Sprint
    if ([deviceString isEqualToString:@"iPhone3,2"])    return @"Verizon iPhone 4";
    if ([deviceString isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([deviceString isEqualToString:@"iPhone5,1"])    return @"iPhone 5";//model A1428, AT&T/Canada
    if ([deviceString isEqualToString:@"iPhone5,2"])    return @"iPhone 5";//model A1429, everything else
    if ([deviceString isEqualToString:@"iPhone5,3"])    return @"iPhone 5c";// (model A1456, A1532 | GSM)
    if ([deviceString isEqualToString:@"iPhone5,4"])    return @"iPhone 5c";// (model A1507, A1516, A1526 (China), A1529 | Global)
    if ([deviceString isEqualToString:@"iPhone6,1"])    return @"iPhone 5s";// (model A1433, A1533 | GSM)
    if ([deviceString isEqualToString:@"iPhone6,2"])    return @"iPhone 5s";// (model A1457, A1518, A1528 (China), A1530 | Global)
    if ([deviceString isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([deviceString isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([deviceString isEqualToString:@"iPhone8,1"])    return @"iPhone 6S";
    if ([deviceString isEqualToString:@"iPhone8,2"])    return @"iPhone 6S Plus";
    
    if ([deviceString isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([deviceString isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([deviceString isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([deviceString isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([deviceString isEqualToString:@"iPod7,1"])      return @"iPod Touch 6G";
    if ([deviceString isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([deviceString isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([deviceString isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([deviceString isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([deviceString isEqualToString:@"iPad3,1"])      return @"iPad 3";
    if ([deviceString isEqualToString:@"i386"])         return @"Simulator";
    if ([deviceString isEqualToString:@"x86_64"])       return @"Simulator";
    NSLog(@"NOTE: Unknown device type: %@", deviceString);
    //    return deviceString;
    return @"Unknown device type";
}


@end
