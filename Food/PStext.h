//
//  PStext.h
//  Food
//
//  Created by sunny&pei on 2017/9/19.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PStext : NSObject

@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *content;
@property (nonatomic,copy) NSString *time;

+(instancetype)textWithName:(NSString *)name content:(NSString *)content time:(NSString *)time;

+(instancetype)textWithDict:(NSDictionary *)dict;

@end
