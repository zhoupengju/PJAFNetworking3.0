//
//  NetWorkingTool.h
//  AFNetworkingDemo
//
//  Created by 周鹏钜 on 16/12/16.
//  Copyright © 2016年 周鹏钜. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetWorkingTool : NSObject

/**
 *  发送一个GET请求
 *
 *  @param url     请求路径
 *  @param params  请求参数
 *  @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
 *  @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
 */
+ (void)getDataParams:(NSDictionary *)params urlPath:(NSString *)url success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure;

/**
 *  发送一个POST请求
 *
 *  @param url     请求路径
 *  @param params  请求参数
 *  @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
 *  @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
 */
+ (void)postDataParams:(NSDictionary *)params urlPath:(NSString *)url success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure;

/**
 *  上传一张图片
 *
 *  @param url           需要上传的图片的url
 *  @param uploadingFile 需要上传的图片的路径
 *  @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
 */
+ (void)uploadFileWithParams:(NSDictionary *)params urlPath:(NSString *)url uploadingFile:(NSData *)uploadingFile success:(void (^)(id responseObj))success;

+ (void)downloadVoiceWithUrl:(NSString *)urlString
                    complete:(void(^)(NSString *filePath))fileLocalPath;

@end
