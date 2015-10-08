//
//  ViewController.m
//  SGMTab
//
//  Created by 苏贵明 on 15/10/8.
//  Copyright (c) 2015年 苏贵明. All rights reserved.
//

#import "ViewController.h"
#import "ViewControllerTwo.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];

    
    UIButton* bt = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    [bt setTitle:@"点击 " forState:UIControlStateNormal];
    bt.center = self.view.center;
    [self.view addSubview:bt];
    
    [bt addTarget:self action:@selector(btTap) forControlEvents:UIControlEventTouchUpInside];
}

-(void)btTap{
    ViewControllerTwo* twoVC = [[ViewControllerTwo alloc]init];
    twoVC.hidesBottomBarWhenPushed = YES; //注意是用twoVC 而不是 self !!
    [self.navigationController pushViewController:twoVC animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
