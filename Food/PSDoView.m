//
//  PSDoView.m
//  Food
//
//  Created by sunny&pei on 2017/9/14.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//

#import "PSDoView.h"
@interface PSDoView()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@end
@implementation PSDoView
-(void)awakeFromNib{
    [super awakeFromNib];
    self.scrollView.contentSize =  CGSizeMake(414, 2000);
//    self.scrollView.contentInset = UIEdgeInsetsMake(0, 119, 0, 0);
    [self.scrollView setScrollEnabled:YES];
    self.scrollView.bounces = YES;
}
+(PSDoView *)doView{
    return [[[NSBundle mainBundle] loadNibNamed:@"PSDoView" owner:nil options:nil] lastObject];
}

@end
