//
//  ItemViewController.m
//  Exhibition
//
//  Created by Albert on 1/5/14.
//  Copyright (c) 2014 Albert. All rights reserved.
//

#import "ItemViewController.h"

@interface ItemViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btnMore;

@end

@implementation ItemViewController

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
    [self.btnMore addTarget:self action:@selector(btnMoreClick:) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)btnMoreClick:(id)sender {
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center postNotificationName:@"moreEvent" object:nil userInfo:nil];
}

@end
