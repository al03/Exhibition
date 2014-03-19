//
//  ContentViewController.m
//  Exhibition
//
//  Created by Albert on 12/16/13.
//  Copyright (c) 2013 Albert. All rights reserved.
//

#import "ContentViewController.h"

@interface ContentViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollContainer;
@property (strong, nonatomic) IBOutlet UIImageView *viewInfo_1;
@property (strong, nonatomic) IBOutlet UIImageView *viewInfo_2;
@property (strong, nonatomic) IBOutlet UIImageView *viewInfo_3;
@property (strong, nonatomic) IBOutlet UIView *viewInfo_4;

@property (weak, nonatomic) IBOutlet UIView *pageControl;
@property (nonatomic, strong)UIImageView *imvFlag;
@end

@implementation ContentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"艾瑞会展";
    self.view.backgroundColor = [UIColor colorWithHue:0 saturation:0 brightness:0.94f alpha:1.0f];
    
    UIBarButtonItem *bar_font = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"bar_item_font"] style:UIBarButtonItemStylePlain target:self action:nil];
    UIBarButtonItem *bar_share = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"bar_item_share"] style:UIBarButtonItemStylePlain target:self action:nil];
    [self.navigationItem setRightBarButtonItems:@[bar_share,bar_font] animated:NO];
    
    NSArray *arrImages = @[@"detail_1",@"detail_2",@"detail_3",@"detail_4"];
    NSArray *arrViews = @[self.viewInfo_1,self.viewInfo_2,self.viewInfo_3,self.viewInfo_4];
    for (int i = 0; i < arrImages.count; i++) {
        UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(self.scrollContainer.frame.size.width * i, -64, self.scrollContainer.frame.size.width, self.scrollContainer.frame.size.height)];
        UIView *vi = [arrViews objectAtIndex:i];
        [scroll addSubview:vi];
        [scroll setContentSize:CGSizeMake(scroll.frame.size.width, vi.frame.size.height)];
        [self.scrollContainer addSubview:scroll];
        
    }
    [self.scrollContainer setContentSize:CGSizeMake(arrImages.count * self.scrollContainer.frame.size.width,
                                                    1)];
    self.scrollContainer.pagingEnabled = YES;
    
    [self thePageControl];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.scrollContainer setContentOffset:CGPointMake(self.mIndex * self.scrollContainer.frame.size.width, 0) animated:NO];
    [self pageEvent];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//fy_1 fy_2

const CGFloat space = 6.0f;
-(void)thePageControl
{
    for (int i = 0; i < 9; i++) {
        UIImage *im = [UIImage imageNamed:@"fy_2"];
        
        UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake((im.size.width + space)*i, 0, im.size.width, im.size.height)];
        iv.image = im;
        [self.pageControl addSubview:iv];
    }
    
    self.imvFlag = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"fy_1"]];
    [self.pageControl addSubview:self.imvFlag];
}

-(void)pageEvent
{
    [self.imvFlag setFrame:CGRectMake((self.imvFlag.frame.size.width + space)*self.mIndex, 0, self.imvFlag.frame.size.width, self.imvFlag.frame.size.height)];
}


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.mIndex = (int) scrollView.contentOffset.x / scrollView.frame.size.width;
    [self pageEvent];
}

@end
