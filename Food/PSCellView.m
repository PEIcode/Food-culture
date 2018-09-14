//
//  PSCellView.m
//  Food
//
//  Created by sunny&pei on 2017/9/15.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//

#import "PSCellView.h"
#import "PSTabbarButton.h"
@interface PSCellView()
/**
 *  纪录当前选中的按钮
 */
@property (nonatomic , weak) PSTabbarButton *selectBtn;

@end

@implementation PSCellView
-(void)addCellButtonWithName:(NSString *)name selName:(NSString *)selName{
    PSTabbarButton *btn = [[PSTabbarButton alloc]init];
    [btn setImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:selName] forState:UIControlStateSelected];
    [btn setBackgroundImage:[UIImage imageNamed:@"tabbar-light"] forState:UIControlStateNormal];
    [self addSubview:btn];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    //默认选中第0个按钮
    if (self.subviews.count == 1){
        [self btnClick:btn];
    }
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    for (int i = 0; i<3; i++) {
        PSTabbarButton *btn = self.subviews[i];
        btn.tag=i;
        CGFloat btnW = self.frame.size.width/3;
        CGFloat btnH = self.frame.size.height;
        CGFloat btnX = btnW * i;
        CGFloat btnY = 0; 
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    }
}
-(void)btnClick:(PSTabbarButton *)btn{
    if ([self.delegate respondsToSelector:@selector(cellBtnClick:)]) {
        [self.delegate cellBtnClick:btn];
    }
    self.selectBtn.selected = NO;
    btn.selected = YES;
    _selectBtn=btn;
}
@end
