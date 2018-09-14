//
//  PSPageViewController.m
//  Food
//
//  Created by sunny&pei on 2017/9/12.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//

#import "PSPageViewController.h"
#import "ContentViewController.h"
#import "LDSegmentViewController.h"
#import "LDSegmentView.h"
@interface PSPageViewController ()
@property (nonatomic, strong) NSMutableArray *dataSource;
@end

@implementation PSPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationItem.title = @"吃货路线";
    self.navigationItem.backBarButtonItem.title = @" ";
    NSMutableArray *titles = [NSMutableArray arrayWithCapacity:0];
    NSArray *titlesss = @[@"经典路线",@"文艺路线",@"豪华路线",@"复古路线",@"地铁一号线",@"地铁二号线"];
    for (NSString *title in titlesss) {
        ContentViewController *con = [[ContentViewController alloc]init];
        con.cityN = self.name;
        [self.dataSource addObject:con];
        con.titleStr = title;
        [titles addObject:title];
        //
        
    }
    CGRect frame = self.view.frame;
    frame.origin.y += 64;
    frame.size.height -= 64;
    LDSegmentViewController *segVC = [[LDSegmentViewController alloc]init];
    segVC.viewControllers = self.dataSource;
    segVC.segmentTitles = titles;
    segVC.view.frame = frame;
    segVC.selectedIndex = 0;
    segVC.normalColor = [UIColor blackColor];
    
    [self addChildViewController:segVC];
    [self.view addSubview:segVC.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSMutableArray *)dataSource{
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray arrayWithCapacity:0];
    }
    return _dataSource;
}


@end
