//
//  PSFoods2.h
//  Food
//
//  Created by sunny&pei on 2017/9/9.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PSFoods2 : NSObject
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *icon;
@property (nonatomic,copy)NSString *detials;

@property (nonatomic,assign)Class destVcClass;
+(instancetype)foodsDestVcClass:(Class )destVcClass;
+(instancetype)foodWithDict:(NSDictionary *)dict;
-(instancetype)initWithDict:(NSDictionary *)dict;
@end
