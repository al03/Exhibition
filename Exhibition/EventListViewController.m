//
//  EventListViewController.m
//  Exhibition
//
//  Created by Albert on 12/17/13.
//  Copyright (c) 2013 Albert. All rights reserved.
//

#import "EventListViewController.h"
#import "ContentViewController.h"
@interface EventListViewController ()
@property(nonatomic,strong)ContentViewController *contentViewCon;
@end

@implementation EventListViewController

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
    self.contentViewCon = [[ContentViewController alloc]initWithNibName:@"ContentViewController" bundle:nil];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnEventBanner:(id)sender {
    self.contentViewCon.mIndex = 0;
    [self.navigationController pushViewController:self.contentViewCon animated:YES];
}
- (IBAction)btnEvent1:(id)sender {
    self.contentViewCon.mIndex = 1;
    [self.navigationController pushViewController:self.contentViewCon animated:YES];
}
- (IBAction)btnEvent2:(id)sender {
    self.contentViewCon.mIndex = 2;
    [self.navigationController pushViewController:self.contentViewCon animated:YES];
}
- (IBAction)btnEvent3:(id)sender {
    self.contentViewCon.mIndex = 3;
    [self.navigationController pushViewController:self.contentViewCon animated:YES];
    
}

@end
