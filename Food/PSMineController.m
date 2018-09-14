//
//  PSMineController.m
//  Food
//
//  Created by sunny&pei on 2017/7/19.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//

#import "PSMineController.h"
#import "PSIconBtn.h"
#import "PSPopViewController.h"
#import "PSPubButton.h"
#import "PSRockViewController.h"
@interface PSMineController () <UIPopoverPresentationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIView *funView;
- (IBAction)noticeBtn:(id)sender;
@property(nonatomic,weak)UIButton *cover;
@end

@implementation PSMineController

{
    PSPopViewController *_popVC;
}



- (void)viewDidLoad {
    [self.navigationController.navigationBar setTitleTextAttributes:@{UITextAttributeTextColor : [UIColor whiteColor]}];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault ];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.alpha = 0;
    [self addFunction];
}
-(void)addFunction{
    PSPubButton *rockBtn = [PSPubButton buttonWithType:UIButtonTypeCustom frame:CGRectMake(34.8, 20, 60, 70) title:@"我的发布" titleColor:[UIColor blackColor] titleFont:13 textAlignment:NSTextAlignmentCenter image:[UIImage imageNamed:@"rock"] imageViewContentMode:UIViewContentModeCenter];
    [self.funView addSubview:rockBtn];
    [rockBtn addTarget:self action:@selector(routeBtnClick) forControlEvents:UIControlEventTouchDown];
    PSPubButton *collectBtn = [PSPubButton buttonWithType:UIButtonTypeCustom frame:CGRectMake(172.8, 20, 60, 70) title:@"我的收藏" titleColor:[UIColor blackColor] titleFont:13 textAlignment:NSTextAlignmentCenter image:[UIImage imageNamed:@"collect"] imageViewContentMode:UIViewContentModeCenter];
    [self.funView addSubview:collectBtn];
    PSPubButton *aiteBtn = [PSPubButton buttonWithType:UIButtonTypeCustom frame:CGRectMake(310.8, 20, 60, 70) title:@"与我相关" titleColor:[UIColor blackColor] titleFont:13 textAlignment:NSTextAlignmentCenter image:[UIImage imageNamed:@"aite"] imageViewContentMode:UIViewContentModeCenter];
    [self.funView addSubview:aiteBtn];
}
-(void)routeBtnClick{
    PSRockViewController *rockVC = [[PSRockViewController alloc]init];
    rockVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:rockVC animated:YES];
}
- (IBAction)noticeBtn:(id)sender {
    _popVC = [[PSPopViewController alloc] init];
    _popVC.modalPresentationStyle = UIModalPresentationPopover;
    
    //设置依附的按钮
    _popVC.popoverPresentationController.barButtonItem = self.navigationItem.leftBarButtonItem;
    
    //可以指示小箭头颜色
    _popVC.popoverPresentationController.backgroundColor = [UIColor whiteColor];
    
    //content尺寸
    _popVC.preferredContentSize = CGSizeMake(400, 400);
    
    //pop方向
    _popVC.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionUp;
    //delegate
    _popVC.popoverPresentationController.delegate = self;
    
    [self presentViewController:_popVC animated:YES completion:nil];
}
//代理方法 ,点击即可dismiss掉每次init产生的PopViewController
-(UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller{
    return UIModalPresentationNone;
}

@end
