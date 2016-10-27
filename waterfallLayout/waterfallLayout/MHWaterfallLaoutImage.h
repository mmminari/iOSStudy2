//
//  MHWaterfallLaoutImage.h
//
//  Created by   on 2016. 10. 26.
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MHThumbnailImage, MHOriginImage;

@interface MHWaterfallLaoutImage : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *key;
@property (nonatomic, strong) MHThumbnailImage *thumbnailImage;
@property (nonatomic, strong) MHOriginImage *originImage;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
