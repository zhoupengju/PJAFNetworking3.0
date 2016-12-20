//
//  HTRequestHelper.h
//  AFNetworkingDemo
//
//  Created by 周鹏钜 on 16/12/16.
//  Copyright © 2016年 周鹏钜. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTRequestHelper : NSObject

+ (void)LoginDataParams:(NSDictionary *)dict success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure;

+ (void)RefreshDataSuccess:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure;

+ (void)uploadSingleFileSuccess:(void (^)(id responseObj))success;

+ (void)downloadVWithFilePath:(void(^)(NSString *filePath))fileLocalPath;

@end
