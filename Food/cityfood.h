//
//  cityfood.h
//  Food
//
//  Created by sunny&pei on 2017/9/5.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PSFoods;

@interface cityfood : NSObject

@property (nonatomic,copy) NSString *cityname;
@property (nonatomic,strong) NSMutableArray *foods;

@end
