//
//  ContentViewController.m
//  UIPageViewController-OC
//
//  Created by Artron_LQQ on 2017/2/17.
//  Copyright © 2017年 Artup. All rights reserved.
//

#import "ContentViewController.h"

@interface ContentViewController () {
    
    UILabel *titleLabel;
}

@end
@implementation ContentViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSString *path = self.cityN;
    NSString *route = self.titleStr;
    
    UIView *bigView = [[UIView alloc]initWithFrame:CGRectMake(0, 114, self.view.frame.size.width, 1200)];
    bigView.backgroundColor = [UIColor whiteColor];
    UIImageView *bgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@%@",path,route]]];
    UIImageView *lineView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 280, 45, 625)];
    lineView.image = [UIImage imageNamed:@"num"];
    
    CGFloat cellH = 200;
    for (int i = 0; i<4; i++) {
        UIImageView *cell1 = [[UIImageView alloc]initWithFrame:CGRectMake(50, 270+i*cellH, 360, 200)];
        NSString *imageName = [NSString stringWithFormat:@"%@%@%d",path,route,i];
        cell1.image = [UIImage imageNamed:imageName];
        [bigView addSubview:cell1];
    }
    [bigView addSubview:lineView];
    [bigView addSubview:bgView];
    [self.tableView setTableHeaderView:bigView];
}

- (void)setTitleStr:(NSString *)titleStr {
    _titleStr = titleStr;
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 40)];
    label.textColor = [UIColor whiteColor];
    label.text = titleStr;
}
@end
