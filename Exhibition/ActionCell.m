//
//  ActionCell.m
//  Exhibition
//
//  Created by Albert on 12/18/13.
//  Copyright (c) 2013 Albert. All rights reserved.
//

#import "ActionCell.h"
#import "ItemViewController.h"
@implementation ActionCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.scrollContainer = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 102)];
        self.scrollContainer.showsHorizontalScrollIndicator = NO;
        [self addSubview:self.scrollContainer];
        
        ItemViewController *item = [[ItemViewController alloc]initWithNibName:@"ItemViewController" bundle:nil];
        [self.scrollContainer addSubview:item.view];
        [self.scrollContainer setContentSize:CGSizeMake(item.view.frame.size.width, 1)];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
