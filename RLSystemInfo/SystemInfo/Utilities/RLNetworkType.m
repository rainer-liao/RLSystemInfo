
//
//  RLNetworkType.m
//  RLSystemInfo
//
//  Created by rainer_liao on 15/11/2.
//  Copyright © 2015年 rainer_liao. All rights reserved.
//

#import "RLNetworkType.h"

@implementation RLNetworkType

+(NSString *)networkType
{
    QNetworkType networktype = [[Reachability reachabilityForInternetConnection] netType];
    NSString *result;
    switch (networktype) // 在处理枚举类型的switch语句中不要实现default分支
    {
        case QNetworkTypeUnknown:
            result = @"未知类型";
            break;
            
        case QNetworkTypeNotReach:
            result = @"无网络";
            break;
            
        case QNetworkTypeWifi:
            result = @"Wifi";
            break;
        
        case QNetworkType4G:
            result = @"4G";
            break;
        
        case QNetworkType3G:
            result = @"3G";
            break;
        
        case QNetworkType2G:
            result = @"2G";
            break;
            
        case QNetworkTypeXG: // 不知道几G的非wifi网络都返回这个
            result = @"WWAN"; // 所以直接显示WWAN
            break;
    }
    return result;
}

+ (NSString *)carrierType
{
    CarrierType carrierType = [[Reachability reachabilityForInternetConnection] carrierType];
    NSString *result;
    switch (carrierType)
    {
        case UnknownCarrier:
            result = @"未知类型";
            break;
            
        case WIFI:
            result = @"Wifi";
            break;
            
        case ChinaMobile:
            result = @"中国移动";
            break;
            
        case ChinaUnicom:
            result = @"中国联通";
            break;
            
        case ChinaTelecom:
            result = @"中国电信";
            break;
            
        case ChinaTietong:
            result = @"中国铁通";
            break;
    }
    return result;
}



@end
