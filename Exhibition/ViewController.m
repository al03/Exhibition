//
//  ViewController.m
//  Exhibition
//
//  Created by Albert on 12/8/13.
//  Copyright (c) 2013 Albert. All rights reserved.
//

#import "ViewController.h"
#import "UIScrollView+ParallaxEffect.h"
#import "ActionCell.h"
#import "ImageCell.h"
#import "CXColor.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tabelMain;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImage *im = [UIImage imageNamed:@"main.png"];
    UIImageView *imv = [[UIImageView alloc]initWithFrame:CGRectMake(0, -64, im.size.width, im.size.height)];
    imv.image = im;
//    [self.tabelMain insertSubview:imv atIndex:0];
    self.tabelMain.backgroundColor = [UIColor clearColor];
    self.tabelMain.backgroundView = nil;
    [self.tabelMain addBackgroundView:imv withWindowHeight:145.0f dragDistanceLimit:0 parallaxFactor:0.25];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"bar_item_user"] style:UIBarButtonItemStylePlain target:self action:nil];
     self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"bar_item_list"] style:UIBarButtonItemStylePlain target:self action:nil];
    
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moreEvent) name:@"moreEvent" object:nil];
    
}

-(void)moreEvent
{
    NSLog(@"no");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 2) {
        return 7;
    }
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
            return 57;
            break;
        case 1:
            return 102;
            break;
        case 2:
            if (indexPath.row == 3) {
                return 61;
            }else
                return 78;
            break;
            
        default:
            return 0;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = nil;
    UITableViewCell *cell = nil;
    
    if (indexPath.section == 0) {
        CellIdentifier = @"textCell";
    }else if(indexPath.section == 1){
        CellIdentifier = @"galleryCell";
    }else if(indexPath.section == 2){
        if (indexPath.row == 6) {
            CellIdentifier = @"actionCell";
        }else
            CellIdentifier = @"docCell";
    }
    
	cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
	if (cell == nil) {
        if ([CellIdentifier isEqualToString:@"galleryCell"]) {
//            cell = (ActionCell *)[[ActionCellViewController alloc]initWithNibName:@"ActionCellViewController" bundle:nil].view;
            ActionCell* AcCell = [[ActionCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            UIButton *btn1 = [[UIButton alloc]initWithFrame:CGRectMake(5, 0, 73, 74)];
            [btn1 addTarget:self action:@selector(btnMoreClick) forControlEvents:UIControlEventTouchUpInside];
            [AcCell.scrollContainer addSubview:btn1];
            UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(575, 0, 73, 74)];
            [btn setBackgroundImage:[UIImage imageNamed:@"more_1.png"] forState:UIControlStateNormal];
            [btn setBackgroundImage:[UIImage imageNamed:@"more_2.png"] forState:UIControlStateHighlighted];
            [btn addTarget:self action:@selector(btnMoreClick) forControlEvents:UIControlEventTouchUpInside];
            [AcCell.scrollContainer addSubview:btn];
            cell = AcCell;
            return cell;
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            UIScrollView *sc = [[UIScrollView alloc]initWithFrame:cell.bounds];
            sc.contentSize = CGSizeMake(500, 1);
            sc.backgroundColor = [UIColor grayColor];
            [cell addSubview:sc];
        }
        
	}
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}
-(void)btnMoreClick
{
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vic = [story instantiateViewControllerWithIdentifier:@"TicketListViewCon"];
    [self.navigationController pushViewController:vic animated:YES];
}

#define HEIGHT_HEADER 40.0f

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
//    UIImageView *imv = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"main.png"]];
    UIView *viewHeader = [[UIView alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, HEIGHT_HEADER)];
    viewHeader.backgroundColor = [UIColor colorWithHexString:@"#181818" andAlpha:1.0f];
    UILabel *labelTitle = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, viewHeader.frame.size.width, viewHeader.frame.size.height)];
    labelTitle.textColor = [UIColor whiteColor];
    labelTitle.font = [UIFont systemFontOfSize:17.0f];
    [viewHeader addSubview:labelTitle];
    switch (section) {
        case 0:
            labelTitle.text = @"金瑞奖－颁奖典礼";
            break;
        case 1:
            labelTitle.text = @"近期会议";
            break;
        case 2:
            labelTitle.text = @"现场文库";
            break;
        default:
            break;
    }
    return viewHeader;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return HEIGHT_HEADER;
}


@end
