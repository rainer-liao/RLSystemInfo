//
//  RLSystemInfo.m
//  RLSystemInfo
//
//  Created by rainer_liao on 15/11/2.
//  Copyright © 2015年 rainer_liao. All rights reserved.
//

#import "RLSystemInfo.h"
#import <UIKit/UIKit.h>

#import "RLDeviceModel.h"
#import "RLNetworkType.h"
#import "RLLocationAuthorized.h"
#import "RLMemoryStatus.h"
#import "RLAppCPUUsage.h"

@implementation RLSystemInfo

@dynamic allSystemInformation, deviceModel, systemVersion, networkType, carrierType, isLocationAuthorized, freeMemory, cpuUsage, isJailbreaking, appVersion, appBuild, userPhoneName, appleIFV;

+ (id)sharedInstance
{
    static RLSystemInfo *_instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[RLSystemInfo alloc] init];
    });
    return _instance;
}

- (NSDictionary *)allSystemInformation
{
    return [self getAllSystemInformation];
}

- (NSString *)deviceModel
{
    return [RLDeviceModel deviceModel];
}

- (NSString *)systemVersion
{
    return [UIDevice currentDevice].systemVersion;
}

- (NSString *)networkType
{
    return [RLNetworkType networkType];
}

- (NSString *)carrierType
{
    return [RLNetworkType carrierType];
}

//- (BOOL)isFlightMode

- (BOOL)isLocationAuthorized
{
    return [RLLocationAuthorized locationAuthorized];
}

- (NSString *)freeMemory
{
    return [RLMemoryStatus availableMemory];
}

- (NSString *)cpuUsage
{
    if ([RLAppCPUUsage cpuUsage])
    {
        return [RLAppCPUUsage cpuUsage];
    }
    else
    {
        return @"CPU计算出错";
    }
}

- (BOOL)isJailbreaking
{
    static BOOL isJailBroken = NO;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString * cydiaPath = @"/Applications/Cydia.app";
        NSString * aptPath = @"/private/var/lib/apt/";
        if ([[NSFileManager defaultManager] fileExistsAtPath:cydiaPath])
        {
            isJailBroken = YES;
        }
        
        if ([[NSFileManager defaultManager] fileExistsAtPath:aptPath])
        {
            isJailBroken = YES;
        }
    });
    
    NSURL* url = [NSURL URLWithString:@"cydia://package/com.example.package"];
    BOOL cydiaJailBroken = [[UIApplication sharedApplication] canOpenURL:url];
    
    return isJailBroken || cydiaJailBroken;
}

- (NSString *)appVersion
{
    NSDictionary * dicInfo = [[NSBundle mainBundle] infoDictionary];
    NSString * strAppVer = [dicInfo objectForKey:@"CFBundleShortVersionString"];
    
    return strAppVer;
}

- (NSString *)appBuild
{
    NSDictionary * dicInfo = [[NSBundle mainBundle] infoDictionary];
    NSString * strAppBuild = [dicInfo objectForKey:@"CFBundleVersion"];
    
    return strAppBuild;
}

- (NSString *)userPhoneName
{
    return [[UIDevice currentDevice] name];
}

- (NSString *)appleIFV
{
    NSString * identifierForVendor = [[UIDevice currentDevice].identifierForVendor UUIDString];
    
    return identifierForVendor;
}

- (NSDictionary *)getAllSystemInformation
{
    NSDictionary *systemInfoDict;
    
    NSString *deviceModel = [self deviceModel];
    NSString *systemVersion = [self systemVersion];
    NSString *networkType = [self networkType];
    NSString *carrierType = [self carrierType];
    NSString *isLocationAuthorized = ([self isLocationAuthorized]) ? @"YES" : @"NO";
    NSString *freeMemory = [self freeMemory];
    NSString *cpuUsage = [self cpuUsage];
    NSString *isJailbreaking = ([self isJailbreaking]) ? @"YES" : @"NO";
    NSString *appVersion = [self appVersion];
    NSString *appBuild = [self appBuild];
    NSString *userPhoneName = [self userPhoneName];
    NSString *appleIFV = [self appleIFV];
    
    systemInfoDict = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:
                                                          deviceModel,
                                                          systemVersion,
                                                          networkType,
                                                          carrierType,
                                                          isLocationAuthorized,
                                                          freeMemory,
                                                          cpuUsage,
                                                          isJailbreaking,
                                                          appVersion,
                                                          appBuild,
                                                          userPhoneName,
                                                          appleIFV,
                                                          nil]
                                                 forKeys:[NSArray arrayWithObjects:
                                                          @"deviceModel",
                                                          @"systemVersion",
                                                          @"networkType",
                                                          @"carrierType",
                                                          @"isLocationAuthorized",
                                                          @"freeMemory",
                                                          @"cpuUsage",
                                                          @"isJailbreaking",
                                                          @"appVersion",
                                                          @"appBuild",
                                                          @"userPhoneName",
                                                          @"appleIFV",
                                                          nil]];
    
    if (systemInfoDict.count <= 0)
    {
        return nil;
    }
    
    return systemInfoDict;
}

@end
