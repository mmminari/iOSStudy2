//
//  MHWaterfallLaoutImage.m
//
//  Created by   on 2016. 10. 26.
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MHWaterfallLaoutImage.h"
#import "MHThumbnailImage.h"
#import "MHOriginImage.h"


NSString *const kMHWaterfallLaoutImageKey = @"key";
NSString *const kMHWaterfallLaoutImageThumbnailImage = @"thumbnailImage";
NSString *const kMHWaterfallLaoutImageOriginImage = @"originImage";


@interface MHWaterfallLaoutImage ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MHWaterfallLaoutImage

@synthesize key = _key;
@synthesize thumbnailImage = _thumbnailImage;
@synthesize originImage = _originImage;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.key = [self objectOrNilForKey:kMHWaterfallLaoutImageKey fromDictionary:dict];
            self.thumbnailImage = [MHThumbnailImage modelObjectWithDictionary:[dict objectForKey:kMHWaterfallLaoutImageThumbnailImage]];
            self.originImage = [MHOriginImage modelObjectWithDictionary:[dict objectForKey:kMHWaterfallLaoutImageOriginImage]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.key forKey:kMHWaterfallLaoutImageKey];
    [mutableDict setValue:[self.thumbnailImage dictionaryRepresentation] forKey:kMHWaterfallLaoutImageThumbnailImage];
    [mutableDict setValue:[self.originImage dictionaryRepresentation] forKey:kMHWaterfallLaoutImageOriginImage];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.key = [aDecoder decodeObjectForKey:kMHWaterfallLaoutImageKey];
    self.thumbnailImage = [aDecoder decodeObjectForKey:kMHWaterfallLaoutImageThumbnailImage];
    self.originImage = [aDecoder decodeObjectForKey:kMHWaterfallLaoutImageOriginImage];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_key forKey:kMHWaterfallLaoutImageKey];
    [aCoder encodeObject:_thumbnailImage forKey:kMHWaterfallLaoutImageThumbnailImage];
    [aCoder encodeObject:_originImage forKey:kMHWaterfallLaoutImageOriginImage];
}

- (id)copyWithZone:(NSZone *)zone
{
    MHWaterfallLaoutImage *copy = [[MHWaterfallLaoutImage alloc] init];
    
    if (copy) {

        copy.key = [self.key copyWithZone:zone];
        copy.thumbnailImage = [self.thumbnailImage copyWithZone:zone];
        copy.originImage = [self.originImage copyWithZone:zone];
    }
    
    return copy;
}


@end
