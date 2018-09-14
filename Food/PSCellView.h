//
//  PSCellView.h
//  Food
//
//  Created by sunny&pei on 2017/9/15.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol PSCellViewDelegate <NSObject>
@optional
-(void)cellBtnClick:(UIButton *)btn;
@end
@interface PSCellView : UIView
@property(nonatomic,weak)id<PSCellViewDelegate> delegate;
/**
 *  用来添加一个内部的按钮
 *
 *  @param name    按钮图片
 *  @param selName 按钮选中时的图片
 */
-(void )addCellButtonWithName:(NSString *)name selName:(NSString *)selName;
@end
