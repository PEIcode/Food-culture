//
//  PSLocController.h
//  Food
//
//  Created by sunny&pei on 2017/7/22.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^ablock)(NSString *str);
@interface PSLocController : UIViewController
@property (nonatomic,copy)ablock block;
//block声明方法二
@property (nonatomic,copy)void (^ablock)(NSString *str);
@end
