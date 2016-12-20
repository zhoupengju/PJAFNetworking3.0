//
//  HTRequestHelper.m
//  AFNetworkingDemo
//
//  Created by 周鹏钜 on 16/12/16.
//  Copyright © 2016年 周鹏钜. All rights reserved.
//

#import "NetWorkingTool.h"
#import "HTRequestHelper.h"

@implementation HTRequestHelper

+(void)LoginDataParams:(NSDictionary *)dict success:(void (^)(id))success failure:(void (^)(NSError *))failure {
    
    [NetWorkingTool getDataParams:dict urlPath:USER_LOGIN success:^(id responseObj) {
        
        if (success) {
            
            success(responseObj);
        }
    } failure:^(NSError *error) {
        
        if (failure) {
            
            failure(error);
        }
    }];
}

+(void)RefreshDataSuccess:(void (^)(id))success failure:(void (^)(NSError *))failure {

    NSDictionary *dict = @{@"uid" : @"10011"};
    [NetWorkingTool getDataParams:dict urlPath:Refresh_Index success:^(id responseObj) {
        
        if (success) {
            
            success(responseObj);
        }
    } failure:^(NSError *error) {
        
        if (failure) {
        
            failure(error);
        }
    }];
}

+(void)uploadSingleFileSuccess:(void (^)(id))success {
    
    NSDictionary *parameters = @{@"uid" : @"10011"};
    NSData *imageData = UIImageJPEGRepresentation([UIImage imageNamed:@"2.jpg"], 1.0);
    
    [NetWorkingTool uploadFileWithParams:parameters urlPath:HTUploadImage uploadingFile:imageData success:^(id responseObj) {
        
        if (success) {
            
            success(responseObj);
        }
    }];
}

+ (void)downloadVWithFilePath:(void(^)(NSString *filePath))fileLocalPath {

    [NetWorkingTool downloadVoiceWithUrl:@"https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2523609456,3175868881&fm=23&gp=0.jpg" complete:^(NSString *filePath) {
        
        if (fileLocalPath) {
        
            fileLocalPath(filePath);
        }
     }];
}

@end
