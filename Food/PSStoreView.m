//
//  PSStoreView.m
//  Food
//
//  Created by sunny&pei on 2017/9/14.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//

#import "PSStoreView.h"
@interface PSStoreView()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@end
@implementation PSStoreView

-(void)awakeFromNib{
    [super awakeFromNib];
    self.scrollView.contentSize =  CGSizeMake(414, 1000);
    [self.scrollView setScrollEnabled:YES];
    self.scrollView.bounces = YES;
}
+(PSStoreView *)storeView{
    return [[[NSBundle mainBundle] loadNibNamed:@"PSStoreView" owner:nil options:nil] lastObject];
}

@end
