//
//  NetWorkingTool.m
//  AFNetworkingDemo
//
//  Created by 周鹏钜 on 16/12/16.
//  Copyright © 2016年 周鹏钜. All rights reserved.
//

#import "NetWorkingTool.h"
#import "AFNetworking.h"

@implementation NetWorkingTool

+(void)getDataParams:(NSDictionary *)params urlPath:(NSString *)url success:(void (^)(id))success failure:(void (^)(NSError *))failure {

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success) {
        
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure) {
        
            failure(error);
        }
    }];
}

+(void)postDataParams:(NSDictionary *)params urlPath:(NSString *)url success:(void (^)(id))success failure:(void (^)(NSError *))failure {

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success) {
            
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure) {
            
            failure(error);
        }
    }];
}

+(void)uploadFileWithParams:(NSDictionary *)params urlPath:(NSString *)url uploadingFile:(NSData *)uploadingFile success:(void (^)(id))success
{

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];

    [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        // 汉唐乐上项目中 upfile 和 image/jpeg 都没有用, 服务器端没有容错机制, 直接解析
        [formData appendPartWithFileData:uploadingFile name:@"upfile" fileName:@"headerrrr.png" mimeType:@"image/jpeg"];
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSString *responseString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        if (success) {
            
            success(responseString);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@", error);
    }];
}

+ (void)downloadVoiceWithUrl:(NSString *)urlString
                    complete:(void(^)(NSString *filePath))fileLocalPath {

    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        
        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        
        NSDate *currentDate = [NSDate date];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"YYYY-MM-dd.hh.mm.ss.SS"];
        NSString *dateString = [dateFormatter stringFromDate:currentDate];
        
        return [documentsDirectoryURL URLByAppendingPathComponent:[NSString stringWithFormat:@"ileup%@.png", dateString]];
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        
        if (fileLocalPath) {
        
            fileLocalPath([filePath absoluteString]);
        }
    }];
    [downloadTask resume];
}

@end
