//
//  PSCultureView.m
//  Food
//
//  Created by sunny&pei on 2017/9/14.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//

#import "PSCultureView.h"

@implementation PSCultureView

+(PSCultureView *)culture{
    return [[[NSBundle mainBundle]loadNibNamed:@"PSCultureView" owner:nil options:nil]lastObject];
}

@end
