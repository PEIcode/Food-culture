//
//  PSHeadView.h
//  Food
//
//  Created by sunny&pei on 2017/9/8.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol PSHeadViewDelegate <NSObject>
@optional
-(void)sureDidSeclectl;
@end
@interface PSHeadView : UIView
@property(nonatomic,assign) id <PSHeadViewDelegate>delegate;
+(PSHeadView *)headView;
@end
