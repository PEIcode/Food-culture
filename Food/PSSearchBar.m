//
//  PSSearchBar.m
//  Food
//
//  Created by sunny&pei on 2017/9/8.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//

#import "PSSearchBar.h"

@implementation PSSearchBar


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
}

-(void)layoutSubviews{
    [super layoutSubviews];
    UIView *searchTextField = nil;
    // 经测试, 需要设置barTintColor后, 才能拿到UISearchBarTextField对象
    self.barTintColor = [UIColor whiteColor];
    searchTextField = [[[self.subviews firstObject] subviews] lastObject];
    searchTextField.frame = CGRectMake(0, 0, 300, 35);
//    self.searchTextPositionAdjustment
}

@end
