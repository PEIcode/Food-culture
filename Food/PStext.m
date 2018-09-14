//
//  PStext.m
//  Food
//
//  Created by sunny&pei on 2017/9/19.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//

#import "PStext.h"

@implementation PStext

+(instancetype)textWithName:(NSString *)name content:(NSString *)content time:(NSString *)time {
    PStext *text = [[PStext alloc] init];
    text.name = name;
    text.content = content;
    text.time = time;
    return text;
}

+(instancetype)textWithDict:(NSDictionary *)dict {
    PStext *text = [[PStext alloc] init];
    [text setValuesForKeysWithDictionary:dict];
    return text;
    
}

@end
