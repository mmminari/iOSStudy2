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
    if(self = [super initWithBaseURL:[NSURL URLWithString:@"https://pointapibeta.smtown.com"]]) //
    {
     //   LogYellow(@"return self");
    }
    
    return self;
    
}

-(void)GETWithUrlString:(NSString *)urlString parameters:(id)parameters
                success:(void (^)(id results))success
                failure:(void (^)(NSError *error))failure
{
    [self GET:urlString parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        if(success)
        {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
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
    [self POST:urlString parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        if(success)
        {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
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
    [self POST:URLString parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData)
    {
        [formData appendPartWithFileData:data name:@"iamge" fileName:@"image.jpg" mimeType:@"image/jpg"];

    }
       success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject)
    {
        if(success)
        {
            success(responseObject);
        }
    }
       failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error)
    {
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
    [self PUT:urlString parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        if(success)
        {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
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
    [self PATCH:urlString parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        if(success)
        {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        if(failure)
        {
            failure(error);
        }
    }];
}


@end
