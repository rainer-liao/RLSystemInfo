//
//  RLSystemInfo.h
//  RLSystemInfo
//
//  Created by rainer_liao on 15/11/2.
//  Copyright © 2015年 rainer_liao. All rights reserved.
//  提供一些系统信息,比如手机型号,操作系统版本号等
//  Provide some system information.

#import <Foundation/Foundation.h>

@interface RLSystemInfo : NSObject

+ (id)sharedInstance;

@property (nonatomic, readonly) NSDictionary *allSystemInformation;

@property (nonatomic, readonly) NSString    *deviceModel;
@property (nonatomic, readonly) NSString    *systemVersion;
@property (nonatomic, readonly) NSString    *networkType;
@property (nonatomic, readonly) NSString    *carrierType;
@property (nonatomic, readonly) BOOL        isLocationAuthorized;
@property (nonatomic, readonly) NSString    *freeMemory;
@property (nonatomic, readonly) NSString    *cpuUsage;
@property (nonatomic, readonly) BOOL        isJailbreaking;
@property (nonatomic, readonly) NSString    *appVersion;
@property (nonatomic, readonly) NSString    *appBuild;
@property (nonatomic, readonly) NSString    *userPhoneName;
@property (nonatomic, readonly) NSString    *appleIFV;


@end
