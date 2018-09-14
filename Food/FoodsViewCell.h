//
//  FoodsViewCell.h
//  Food
//
//  Created by sunny&pei on 2017/9/9.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PSFoods2;
@interface FoodsViewCell : UITableViewCell
@property(nonatomic,strong)PSFoods2 *foods;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *detailsLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@end
