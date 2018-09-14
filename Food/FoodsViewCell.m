//
//  FoodsViewCell.m
//  Food
//
//  Created by sunny&pei on 2017/9/9.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//

#import "FoodsViewCell.h"
#import "PSFoods2.h"
@interface FoodsViewCell()


@end
@implementation FoodsViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setFoods:(PSFoods2 *)foods{
    _foods = foods;
    self.iconView.image = [UIImage imageNamed:foods.icon];
    self.detailsLabel.text = foods.title;
    self.nameLabel.text = foods.detials;
}
@end
