//
//  PSPopViewController.m
//  Food
//
//  Created by sunny&pei on 2017/8/11.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//

#import "PSPopViewController.h"

@interface PSPopViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation PSPopViewController

{
    UITableView *_tableView;
    NSArray *_array1;
    NSArray *_array2;
    NSArray *_dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    _array1 = @[@"我的消息",@"我的资料"];
    //准备图片
    _array2 = @[];
    _tableView = [[UITableView alloc ]initWithFrame:self.view.bounds];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.scrollEnabled = YES;
    _tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tableView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _array1.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *str = @"ID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    cell.textLabel.text = _array1[indexPath.row];
    return cell;
}

//重置控制器的大小
-(CGSize)preferredContentSize{
    if (self.popoverPresentationController !=nil) {
        CGSize tempSize ;
        tempSize.height = self.view.frame.size.height;
        tempSize.width  = 155;
        CGSize size = [_tableView sizeThatFits:tempSize];  //返回一个完美适应tableView的大小的 size
        return size;
    }else{
        return [super preferredContentSize];
    }
}
@end
