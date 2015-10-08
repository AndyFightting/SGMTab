//
//  SGMTabViewController.m
//  SGMTab
//
//  Created by 苏贵明 on 15/10/8.
//  Copyright (c) 2015年 苏贵明. All rights reserved.
//

#import "SGMTabViewController.h"

@interface SGMTabViewController ()

@end

@implementation SGMTabViewController{
    
    UIView* tabBarView;
    NSArray* imageArray;

}

-(instancetype)initWithViewControllers:(NSArray *)controllers andImages:(NSArray *)images{
    self = [super init];
    if (self) {
        self.viewControllers = controllers;
        imageArray = [NSArray arrayWithArray:images];
        [self initCustomTabBarView];
    }
    return self;
}

-(void)initCustomTabBarView{
    
    CGRect tabBarFrame = self.tabBar.bounds;
    for (UIView* v in self.tabBar.subviews) {
        [v removeFromSuperview];
    }
    
    float itemWidth = tabBarFrame.size.width/imageArray.count;
    float itemHeight = tabBarFrame.size.height;
    
    tabBarView = [[UIView alloc]initWithFrame:tabBarFrame];
    tabBarView.backgroundColor = [UIColor whiteColor]; //tab bar 背景色
    [self.tabBar addSubview:tabBarView];
    
    for (int i=0; i<imageArray.count; i++) {
        UIButton* itemBt = [[UIButton alloc]initWithFrame:CGRectMake(itemWidth*i, 0, itemWidth, itemHeight)];
        itemBt.tag = i;
        [itemBt addTarget:self action:@selector(itemBtTaped:) forControlEvents:UIControlEventTouchUpInside];
        itemBt.backgroundColor = [UIColor clearColor];
        [tabBarView addSubview:itemBt];
        
        UIImageView* itemImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 7, itemWidth, itemHeight-12)];
        itemImgView.tag = 100+i;
        itemImgView.image = [UIImage imageNamed:[[imageArray objectAtIndex:i] objectForKey:NORMAL_IMAGE]];
        itemImgView.contentMode = UIViewContentModeScaleAspectFit;
        [itemBt addSubview:itemImgView];
        
        UILabel* numLabel = [[UILabel alloc]initWithFrame:CGRectMake(itemWidth/2+8, 4, 16, 16)];
        numLabel.tag =150 + i;
        numLabel.backgroundColor = [UIColor redColor];
        numLabel.textColor = [UIColor whiteColor];
        numLabel.font = [UIFont systemFontOfSize:11];
        numLabel.layer.masksToBounds = YES;
        numLabel.layer.cornerRadius = 8.0f;
        numLabel.textAlignment = NSTextAlignmentCenter;
        numLabel.text = [NSString stringWithFormat:@"%d",i+1];
        [itemBt addSubview:numLabel];
        
    }
    
    UILabel* upLine = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, tabBarFrame.size.width, 0.5)];
    upLine.backgroundColor = [UIColor lightGrayColor];
    [tabBarView addSubview:upLine];
    
}

-(void)itemBtTaped:(UIButton*)bt{
    
    if (bt.tag == self.selectedIndex) {
        return;
    }
    
    //取消之前itme高亮图片
    UIButton* preItemBt = (UIButton*)[tabBarView viewWithTag:self.selectedIndex];
    UIImageView* preItemImg = (UIImageView*)[preItemBt viewWithTag:100+self.selectedIndex];
    preItemImg.image =[UIImage imageNamed:[[imageArray objectAtIndex:self.selectedIndex] objectForKey:NORMAL_IMAGE]];
    
    //显示当前item高亮图片
    self.selectedIndex = (int)bt.tag;
    UIButton* currentItemBt = (UIButton*)[tabBarView viewWithTag:self.selectedIndex];
    UIImageView* currentImgView = (UIImageView*)[currentItemBt viewWithTag:100+self.selectedIndex];
    currentImgView.image =[UIImage imageNamed:[[imageArray objectAtIndex:self.selectedIndex] objectForKey:SELECTED_IMAGE]];

    [self hideNumLabelAtIndex:(int)bt.tag];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //显示当前item高亮图片
    UIButton* currentItemBt = (UIButton*)[tabBarView viewWithTag:self.selectedIndex];
    UIImageView* currentImgView = (UIImageView*)[currentItemBt viewWithTag:100+self.selectedIndex];
    currentImgView.image =[UIImage imageNamed:[[imageArray objectAtIndex:self.selectedIndex] objectForKey:SELECTED_IMAGE]];

    [self hideNumLabelAtIndex:(int)self.selectedIndex];
}

-(void)hideNumLabelAtIndex:(int)index{
    UIButton* itemBt = (UIButton*)[tabBarView viewWithTag:index];
    UILabel* numLabel = (UILabel*)[itemBt viewWithTag:150+index];
    numLabel.hidden = YES;
}

-(void)showNumLabelAtIndex:(int)index withNumber:(int)num{
    UIButton* itemBt = (UIButton*)[tabBarView viewWithTag:index];
    UILabel* numLabel = (UILabel*)[itemBt viewWithTag:150+index];
    numLabel.hidden = NO;
    numLabel.text = [NSString stringWithFormat:@"%d",num];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
