//
//  PSFoods2.m
//  Food
//
//  Created by sunny&pei on 2017/9/9.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//

#import "PSFoods2.h"

@implementation PSFoods2
+(instancetype)foodWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}
-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        self.title = dict[@"title"];
        self.icon = dict[@"icon"];
        self.detials = dict[@"details"];
    }
    return self;
}
+(instancetype)foodsDestVcClass:(Class)destVcClass{
    PSFoods2 *food = [[PSFoods2 alloc ]init];
    food.destVcClass = destVcClass;
    return food;
}
@end
