//
//  HTTPClient.m
//  NavigationController
//
//  Created by 김민아 on 2016. 6. 14..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "HTTPClient.h"

@implementation HTTPClient

-(instancetype)initWithBaseURL
{
    if(self = [super initWithBaseURL:[NSURL URLWithString:@""]])
    {
        
    }
    
    return self;
    
}



-(void)GETWithUrlString:(NSString *)urlString parameters:(id)parameters
                success:(void (^)(id results))success
                failure:(void (^)(NSError *error))failure
{
    [self GET:urlString parameters:parameters progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        if(success)
        {
            success(responseObject);
        }
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        if(failure)
        {
            failure(error);
        }
    }];
}

-(void)POSTWithUrlString:(NSString *)urlString parameters:(id)parameters
                 success:(void (^)(id results))success
                 failure:(void (^)(NSError *error))failure
{
    [self POST:urlString parameters:parameters progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        if(success)
        {
            success(responseObject);
        }
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        if(failure)
        {
            failure(error);
           // LogRed(@"error : %@", error);
        }
    }];
}

-(void)UPLOADWithUrlString:(NSString *)URLString
                      data:(NSData *)data
                   success:(void (^)(id responseObject))success
                   failure:(void (^)(NSError *error))failure
{
    
    
    [self POST:URLString parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:data name:@"iamge" fileName:@"image.jpg" mimeType:@"image/jpg"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if(success)
        {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if(failure)
        {
            failure(error);
        }
    }];
}

-(void)PUTWithUrlString:(NSString *)urlString parameters:(id)parameters
                success:(void (^)(id results))success
                failure:(void (^)(NSError *error))failure
{
    
    [self PUT:urlString parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if(success)
        {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if(failure)
        {
            failure(error);
        }
    }];
    
}

-(void)PATCHWithUrlString:(NSString *)urlString parameters:(id)parameters
                  success:(void (^)(id results))success
                  failure:(void (^)(NSError *error))failure
{
    
    [self PATCH:urlString parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if(success)
        {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if(failure)
        {
            failure(error);
        }
    }];
    
}


@end
