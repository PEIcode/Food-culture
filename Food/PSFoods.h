//
//  PSFoods.h
//  Food
//
//  Created by sunny&pei on 2017/9/4.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PSFoods : NSObject
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *icon;
@property (nonatomic,copy)NSString *detials;


+(instancetype)foodWithDict:(NSDictionary *)dict;
-(instancetype)initWithDict:(NSDictionary *)dict;
@end
