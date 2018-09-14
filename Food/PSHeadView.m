//
//  PSHeadView.m
//  Food
//
//  Created by sunny&pei on 2017/9/8.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//
#define imageCount 3
#import "PSHeadView.h"
#import "PSPubButton.h"
#import "PSPageViewController.h"
@interface PSHeadView()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *btnView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
/**
 *  定时器
 */
@property(strong,nonatomic) NSTimer *timer;
@end
@implementation PSHeadView
-(void)awakeFromNib{
    [super awakeFromNib];
    self.scrollView.scrollEnabled = YES;
    [self setScrooll];
    
}
-(void)layoutSubviews{
    [self addMainBtn];
}
#pragma mark 加载功能按钮
-(void)addMainBtn{
    PSPubButton *routeBtn = [PSPubButton buttonWithType:UIButtonTypeCustom frame:CGRectMake(34.8, 10, 60, 70) title:@"吃货路线" titleColor:[UIColor blackColor] titleFont:13 textAlignment:NSTextAlignmentCenter image:[UIImage imageNamed:@"btn_route"] imageViewContentMode:UIViewContentModeCenter];
    [self.btnView addSubview:routeBtn];
    [routeBtn addTarget:self action:@selector(routeBtnClick) forControlEvents:UIControlEventTouchDown];
    
    PSPubButton *eatBtn = [PSPubButton buttonWithType:UIButtonTypeCustom frame:CGRectMake(34.8*2+60, 10, 60, 70) title:@"优选店铺" titleColor:[UIColor blackColor] titleFont:13 textAlignment:NSTextAlignmentCenter image:[UIImage imageNamed:@"btn_eat"] imageViewContentMode:UIViewContentModeCenter];
    [self.btnView addSubview:eatBtn];
//    [eatBtn addTarget:self action:@selector(eatBtnClick) forControlEvents:UIControlEventTouchDown];
    PSPubButton *specialBtn = [PSPubButton buttonWithType:UIButtonTypeCustom frame:CGRectMake(34.8*3+120, 10, 60, 70) title:@"特色小吃" titleColor:[UIColor blackColor] titleFont:13 textAlignment:NSTextAlignmentCenter image:[UIImage imageNamed:@"btn_special"] imageViewContentMode:UIViewContentModeCenter];
    [self.btnView addSubview:specialBtn];
    
    PSPubButton *recomBtn = [PSPubButton buttonWithType:UIButtonTypeCustom frame:CGRectMake(34.8*4+180, 10, 60, 70) title:@"大咖推荐" titleColor:[UIColor blackColor] titleFont:13 textAlignment:NSTextAlignmentCenter image:[UIImage imageNamed:@"btn_recom"] imageViewContentMode:UIViewContentModeCenter];
    [self.btnView addSubview:recomBtn];
    
}
-(void)routeBtnClick{

    if (self.delegate && [self.delegate respondsToSelector:@selector(sureDidSeclectl)]) {
        [self.delegate sureDidSeclectl];
    }
    
}
#pragma mark 轮播器
-(void)setScrooll{
    //添加图片
    CGFloat imageW = 414;
    CGFloat imageH = 205;
    CGFloat imageY = 0;
    for(int i= 1;i<=imageCount;i++){
        CGFloat imageX = (i-1) * imageW;
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"banner%d",i]];
        [self.scrollView addSubview:imageView];
    }
    //设置内容尺寸
    self.scrollView.contentSize = CGSizeMake(imageCount*imageW,0 );
    //分页
    self.scrollView.pagingEnabled = YES;
    //隐藏水平滚动条
    self.scrollView.showsHorizontalScrollIndicator = NO;
    //设置pageControl的总页数
    self.pageControl.numberOfPages = imageCount;
    //设置定时器
    [self addTimer];
    
}
/**
 * 添加计时器
 */
-(void)addTimer{
    _timer= [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(NextImage) userInfo:nil repeats:YES];//要返回给timer 才能结束计时器
        [[NSRunLoop currentRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
}
/**
 *  移除计时器
 */
-(void)removeTimer{
    [self.timer invalidate];
    self.timer = nil;
}
-(void)NextImage{
    //设置页码
    int page = 0;
    if (self.pageControl.currentPage == imageCount -1){
        page = 0;
    }else {
        page = self.pageControl.currentPage+1;
    }
    CGFloat x1 = self.scrollView.frame.size.width*page;
    CGPoint x = CGPointMake(x1, 0);
    [self.scrollView setContentOffset:x animated:YES];
    
}

#pragma mark - 代理方法
/**
 *  当scrollView正在滚动时就会调用
 */
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //  根据滚动位置决定pageControl的页数
    CGFloat scrollW = scrollView.frame.size.width;
    int page = (scrollView.contentOffset.x+scrollW*0.5)/scrollW;
    self.pageControl.currentPage = page;
}
/**
 *  开始拖拽时，调用
 */
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    //停止定时器（一旦停止 就无法调用定时器了）
    [self removeTimer];
   
}
/**
 *  结束拖拽时
 */
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    //启动计时器
    [self addTimer];
  
}

+(PSHeadView *)headView{
    return [[[NSBundle mainBundle] loadNibNamed:@"PSHeadView" owner:nil options:nil]lastObject];
}
@end
