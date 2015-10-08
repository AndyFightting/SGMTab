//
//  SGMTabViewController.h
//  SGMTab
//
//  Created by 苏贵明 on 15/10/8.
//  Copyright (c) 2015年 苏贵明. All rights reserved.
//

#import <UIKit/UIKit.h>

#define NORMAL_IMAGE   @"normal_image"
#define SELECTED_IMAGE   @"selected_image"


@interface SGMTabViewController : UITabBarController

-(instancetype)initWithViewControllers:(NSArray *)controllers andImages:(NSArray *)images;

@end
