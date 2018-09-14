//
//  PSRockView.m
//  Food
//
//  Created by sunny&pei on 2017/9/19.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//

#import "PSRockCell.h"
#import "PStext.h"
@interface PSRockCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UILabel *timeLab;
@property (weak, nonatomic) IBOutlet UILabel *contentLab;

@end
@implementation PSRockCell

-(void)setText:(PStext *)text {
    _text = text;
    self.nameLab.text = text.name;
    self.timeLab.text = text.time;
    self.contentLab.text = text.content;
}

@end
