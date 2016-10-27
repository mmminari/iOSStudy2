//
//  MHOriginImage.m
//
//  Created by   on 2016. 10. 26.
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MHOriginImage.h"


NSString *const kMHOriginImageUrl = @"url";
NSString *const kMHOriginImageWidth = @"width";
NSString *const kMHOriginImageHeight = @"height";


@interface MHOriginImage ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MHOriginImage

@synthesize url = _url;
@synthesize width = _width;
@synthesize height = _height;


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
            self.url = [self objectOrNilForKey:kMHOriginImageUrl fromDictionary:dict];
            self.width = [[self objectOrNilForKey:kMHOriginImageWidth fromDictionary:dict] doubleValue];
            self.height = [[self objectOrNilForKey:kMHOriginImageHeight fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.url forKey:kMHOriginImageUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.width] forKey:kMHOriginImageWidth];
    [mutableDict setValue:[NSNumber numberWithDouble:self.height] forKey:kMHOriginImageHeight];

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

    self.url = [aDecoder decodeObjectForKey:kMHOriginImageUrl];
    self.width = [aDecoder decodeDoubleForKey:kMHOriginImageWidth];
    self.height = [aDecoder decodeDoubleForKey:kMHOriginImageHeight];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_url forKey:kMHOriginImageUrl];
    [aCoder encodeDouble:_width forKey:kMHOriginImageWidth];
    [aCoder encodeDouble:_height forKey:kMHOriginImageHeight];
}

- (id)copyWithZone:(NSZone *)zone
{
    MHOriginImage *copy = [[MHOriginImage alloc] init];
    
    if (copy) {

        copy.url = [self.url copyWithZone:zone];
        copy.width = self.width;
        copy.height = self.height;
    }
    
    return copy;
}


@end
