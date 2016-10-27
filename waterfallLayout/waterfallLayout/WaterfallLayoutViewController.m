//
//  WaterfallLayoutViewController.m
//  waterfallLayout
//
//  Created by 김민아 on 2016. 10. 26..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "WaterfallLayoutViewController.h"
#import "CHTCollectionViewWaterfallLayout.h"
#import "ImageCell.h"
#import "HTTPClient.h"
#import  <AFNetworking/AFNetworking.h>
#import "UIImageView+WebCache.h"


#import "DataModels.h"

@interface WaterfallLayoutViewController () < CHTCollectionViewDelegateWaterfallLayout>

@property (strong, nonatomic) IBOutlet UICollectionView *cvMain;
@property (strong, nonatomic) IBOutlet CHTCollectionViewWaterfallLayout *watarfallLayout;

@property (strong, nonatomic) NSMutableArray *ImageList;
@property (strong, nonatomic) HTTPClient *httpClient;
@property (strong, nonatomic) NSMutableArray *cellHeights;

@end

@implementation WaterfallLayoutViewController

static NSString * const reuseIdentifier = @"ImageCell";

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    self.httpClient = [[HTTPClient alloc]init];
    self.ImageList = [NSMutableArray array];
    self.cellHeights = [NSMutableArray array];
    
    [self.cvMain registerNib:[UINib nibWithNibName:@"ImageCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    
    self.watarfallLayout.columnCount = 2;
    
    [self request];
}

#pragma mark - Request
- (void)request
{
    [self.httpClient POSTWithUrlString:@"https://y3zhm4ntme.execute-api.ap-northeast-1.amazonaws.com/prod2" parameters:nil success:^(id results) {
        [self successCompletionOfRequstImageListWithResult:results];
    } failure:^(NSError *error) {
        NSLog(@"error : %@", error);
    }];
    
}

- (void)successCompletionOfRequstImageListWithResult:(id)result
{
    
    for (id object in (NSArray *)result) {
        MHWaterfallLaoutImage *imageInfo = [[MHWaterfallLaoutImage alloc]initWithDictionary:object];
        [self.ImageList addObject:imageInfo];
        
    }
    
    NSLog(@"imageList : %@", self.ImageList);
    
    for (MHWaterfallLaoutImage *resultList in self.ImageList)
    {
        
        CGFloat height = resultList.thumbnailImage.height;
        CGFloat width = resultList.thumbnailImage.width;
        
        CGFloat maxWidth = ([UIScreen mainScreen].bounds.size.width - 10.0f)/2;
        
        CGFloat newHeight = height * maxWidth / width;
        
        [self.cellHeights addObject:@(newHeight)];
        
    }
    
    NSLog(@"cellHeights : %@", self.cellHeights);

    [self.cvMain reloadData];
    

}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.ImageList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    MHWaterfallLaoutImage *data = self.ImageList[indexPath.row];
    
    NSLog(@"url :%@", data.thumbnailImage.url);
    
    NSURL *url = [NSURL URLWithString:data.thumbnailImage.url];
    
    [cell.ivImage sd_setImageWithURL:url];
    
    return cell;
}


#pragma mark - CHCollectionViewDelegateWaterfallLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize result = CGSizeMake(0, 0);
    
    CGFloat width = ([UIScreen mainScreen].bounds.size.width - 30.0f)/2;
    
    CGFloat height = 0.0f;
    
    if(self.cellHeights.count == 0)
    {
        height = 30.0f;
    }
    else
    {
        height = [self.cellHeights[indexPath.row] floatValue];
    }
        
    result = CGSizeMake(width, height);
    
    return result;
}


-(void)setImageView:(UIImageView *)imageView urlString:(NSString *)urlString placeholderImage:(UIImage *)image animation:(BOOL)ani completed:(void (^)(BOOL complete))completed
{
    NSURL *url = [NSURL URLWithString:urlString];
    [imageView sd_setImageWithURL:url placeholderImage:image completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL)
     {
         if(cacheType == SDImageCacheTypeNone)
         {
             if(ani)
             {
                 //[imageView.layer addAnimation:[self fadeOutAnimationForChangeImage] forKey:@"fadeOutAnimationForChangeImage"];
             }
         }
         if(completed)
         {
             completed(1);
         }
     }];
}


@end
