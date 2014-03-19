//
//  BackTabelViewController.m
//  Exhibition
//
//  Created by Albert on 12/18/13.
//  Copyright (c) 2013 Albert. All rights reserved.
//

#import "BackTabelViewController.h"

@interface BackTabelViewController ()

@end

@implementation BackTabelViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back_item"] style:UIBarButtonItemStylePlain target:self action:@selector(backItemClick)];

}
-(void)backItemClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
