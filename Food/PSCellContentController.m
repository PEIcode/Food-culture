//
//  PSCellContentController.m
//  Food
//
//  Created by sunny&pei on 2017/9/12.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//

#import "PSCellContentController.h"
#import "PSTabbarButton.h"
#import "PSTabbar.h"
#import "PSCultureView.h"
#import "PSDoView.h"
#import "PSCellView.h"
#import "PSStoreView.h"
#define PSSCREEW [UIScreen mainScreen].bounds.size.width
#define PSSCREEH [UIScreen mainScreen].bounds.size.height
@interface PSCellContentController () <PSCellViewDelegate>
@property(nonatomic,strong)UIButton *selectBtn;
@property(nonatomic,strong)PSTabbarButton *cultureBtn;
@property(nonatomic,strong)PSTabbarButton *doBtn;
@property(nonatomic,strong)PSTabbarButton *storeBtn;
@property(nonatomic,strong)UIView *bgView;
@end

@implementation PSCellContentController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    PSCellView *cellView = [[PSCellView alloc]init];
    cellView.delegate = self;
    cellView.frame = CGRectMake(0, 64, PSSCREEW,55);
    cellView.backgroundColor = [UIColor redColor];
    [self.view addSubview:cellView];
    for (int i = 0; i<3; i++) {
        NSString *name = [NSString stringWithFormat:@"cellBtn%d",i];
        NSString *selName = [NSString stringWithFormat:@"cellBtnSel%d",i];
        [cellView addCellButtonWithName:name selName:selName];
    }
}
-(void)cellBtnClick:(UIButton *)btn{
    self.bgView= [[UIView alloc]initWithFrame:CGRectMake(0, 119, PSSCREEW, PSSCREEH-119)];
    if(btn.tag == 0){
        PSCultureView *cul = [PSCultureView culture];
//        [self.bgView addSubview:cul];
        cul.frame = CGRectMake(0, 119, PSSCREEW, PSSCREEH-119);
        [self.view addSubview:cul];
    }else if (btn.tag == 1){
//        UIScrollView *scrll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 119, 414, 800)];
//        scrll.contentSize = CGSizeMake(414, 2000);
        PSDoView *make = [PSDoView doView];
        make.frame = CGRectMake(0, 119, PSSCREEW, PSSCREEH-119);
//        [scrll addSubview:scrll];
        [self.view addSubview:make];
    }else if (btn.tag == 2){
//        UIScrollView *scrll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 119, 414, 662)];
//        scrll.contentSize = CGSizeMake(414, 1000);
        PSStoreView *store = [PSStoreView storeView];
//        [scrll addSubview:store];
        store.frame = CGRectMake(0, 119, PSSCREEW, PSSCREEH-119);
        [self.view addSubview:store];
        
    }
    
}
@end
