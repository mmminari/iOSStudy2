//
//  HTTPClient.h
//  NavigationController
//
//  Created by 김민아 on 2016. 6. 14..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface HTTPClient : AFHTTPRequestOperationManager

-(instancetype)initWithBaseURL;


-(void)GETWithUrlString:(NSString *)urlString parameters:(id)parameters
                success:(void (^)(id results))success
                failure:(void (^)(NSError *error))failure;

-(void)POSTWithUrlString:(NSString *)urlString parameters:(id)parameters
                 success:(void (^)(id results))success
                 failure:(void (^)(NSError *error))failure;

-(void)PUTWithUrlString:(NSString *)urlString parameters:(id)parameters
                success:(void (^)(id results))success
                failure:(void (^)(NSError *error))failure;

-(void)PATCHWithUrlString:(NSString *)urlString parameters:(id)parameters
                  success:(void (^)(id results))success
                  failure:(void (^)(NSError *error))failure;

-(void)UPLOADWithUrlString:(NSString *)URLString
                      data:(NSData *)data
                   success:(void (^)(id responseObject))success
                   failure:(void (^)(NSError *error))failure;


@end
