//
//  ImageCell.m
//  Exhibition
//
//  Created by Albert on 1/5/14.
//  Copyright (c) 2014 Albert. All rights reserved.
//

#import "ImageCell.h"

@implementation ImageCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.mImageView = [[UIImageView alloc]init];
        [self.mImageView setContentMode:UIViewContentModeCenter];
        [self addSubview:self.mImageView];
    }
    return self;
}

-(void)setMImage:(UIImage *)mImage
{
    _mImage = mImage;
    self.imageView.image = _mImage;
    self.imageView.frame = CGRectMake(0, 0, self.frame.size.width, mImage.size.height);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
