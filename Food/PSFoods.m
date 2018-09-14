//
//  PSFoods.m
//  Food
//
//  Created by sunny&pei on 2017/9/4.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//

#import "PSFoods.h"

@implementation PSFoods
+(instancetype)foodWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}
-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        self.name = dict[@"name"];
        self.title = dict[@"title"];
        self.icon = dict[@"icon"];
        self.detials = dict[@"details"];
    }
    return self;
}
@end
