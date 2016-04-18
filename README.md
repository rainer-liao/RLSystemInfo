# RLSystemInfo
# iOS System Information Collection. 

This is a singleton class to gather some available information about your iPhone, including: 【使用这个单例可以获取iPhone上的一些很有用的信息，包括：】
- deviceModel 【手机型号】
- systemVersion 【操作系统版本】
- networkType 【网络类型】
- carrierType 【运营商类型】
- isLocationAuthorized 【是否允许使用定位】
- freeMemory 【内存情况】
- cpuUsage 【CPU使用情况】
- isJailbreaking 【是否越狱】
- appVersion 【APP版本号】
- appBuild 【APPBuild号】
- userPhoneName 【用户手机名称】
- appleIFV 【苹果identifierForVendor】


MemoryInfo is from https://github.com/Shmoopi/iOS-System-Services . 

针对某些项目特定的信息, 比如自己的项目是否处于正式环境, 某些配置选项情况等, 也建议大家放在一起,方便调用.

## How To Use  使用方法
```objc
// All system Information
NSDictionary *dict = [[RLSystemInfo sharedInstance] allSystemInformation];

// userPhoneName
NSString *userPhoneName = [[RLSystemInfo sharedInstance] userPhoneName];
