//
//  MHThumbnailImage.m
//
//  Created by   on 2016. 10. 26.
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MHThumbnailImage.h"


NSString *const kMHThumbnailImageUrl = @"url";
NSString *const kMHThumbnailImageWidth = @"width";
NSString *const kMHThumbnailImageHeight = @"height";


@interface MHThumbnailImage ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MHThumbnailImage

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
            self.url = [self objectOrNilForKey:kMHThumbnailImageUrl fromDictionary:dict];
            self.width = [[self objectOrNilForKey:kMHThumbnailImageWidth fromDictionary:dict] doubleValue];
            self.height = [[self objectOrNilForKey:kMHThumbnailImageHeight fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.url forKey:kMHThumbnailImageUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.width] forKey:kMHThumbnailImageWidth];
    [mutableDict setValue:[NSNumber numberWithDouble:self.height] forKey:kMHThumbnailImageHeight];

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

    self.url = [aDecoder decodeObjectForKey:kMHThumbnailImageUrl];
    self.width = [aDecoder decodeDoubleForKey:kMHThumbnailImageWidth];
    self.height = [aDecoder decodeDoubleForKey:kMHThumbnailImageHeight];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_url forKey:kMHThumbnailImageUrl];
    [aCoder encodeDouble:_width forKey:kMHThumbnailImageWidth];
    [aCoder encodeDouble:_height forKey:kMHThumbnailImageHeight];
}

- (id)copyWithZone:(NSZone *)zone
{
    MHThumbnailImage *copy = [[MHThumbnailImage alloc] init];
    
    if (copy) {

        copy.url = [self.url copyWithZone:zone];
        copy.width = self.width;
        copy.height = self.height;
    }
    
    return copy;
}


@end
