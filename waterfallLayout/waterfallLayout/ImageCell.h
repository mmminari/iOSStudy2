//
//  ImageCell.h
//  waterfallLayout
//
//  Created by 김민아 on 2016. 10. 26..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *ivImage;
@property (weak, nonatomic) IBOutlet UIView *colorView;

@end
