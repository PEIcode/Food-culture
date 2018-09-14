//
//  PSTableViewController.m
//  Food
//
//  Created by sunny&pei on 2017/9/8.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//

#import "PSTableViewController.h"
#import "PSPageViewController.h"
#import "UISearchBar+PS.h"
#import "PSSearchBar.h"
#import "PSLocController.h"
#import "PSPubButton.h"
#import "cityfood.h"
#import "PSFoods2.h"
#import "PSHeadView.h"
#import "FoodsViewCell.h"
#import "PSCellContentController.h"
@interface PSTableViewController ()<UISearchBarDelegate,PSHeadViewDelegate>
@property(nonatomic,strong)UIBarButtonItem *locBarBtn;
@property(nonatomic,strong)NSArray *foods;
@property(nonatomic,strong)cityfood *cityCurrent;
//@property(nonatomic,strong)UITableView *tableView1;
@property(nonatomic,strong)NSMutableArray *foodMutaArray;
@property(nonatomic,strong)UIButton *locButton;
@end

@implementation PSTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navBg"] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.alpha = 0.5;
//    [self.navigationController.navigationBar setShadowImage:[UIImage imageNamed:@"navgationbg"]];
    self.tableView.delegate = self;
    self.tableView.dataSource =self;
    self.title = @"";
    
    
    [self setHeadView];
    
    [self setSearchBar];
    [self setLocBtn];
    
}
-(void)setHeadView{
    PSHeadView *vc = [PSHeadView headView];
    vc.delegate = self;
    self.tableView.tableHeaderView = vc;
}
#pragma mark 点击吃货路线
-(void)sureDidSeclectl{
    PSPageViewController *vc = [[PSPageViewController alloc]init];
    vc.name = self.locButton.titleLabel.text;
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)setLocBtn{
    self.locButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 44)];

    [_locButton setImage:[UIImage imageNamed:@"location"] forState:UIControlStateNormal];
    [_locButton setTitle:@"杭州" forState:UIControlStateNormal];

    [_locBarBtn setTitleTextAttributes:@{UITextAttributeFont:[UIFont systemFontOfSize:12]} forState:UIControlStateNormal];
    self.locBarBtn = [[UIBarButtonItem alloc]initWithCustomView:_locButton];
 
    [self.navigationItem setLeftBarButtonItem:_locBarBtn];
    [_locButton addTarget:self action:@selector(locBtn) forControlEvents:UIControlEventTouchDown];

}
-(void)locBtn{
    PSLocController *locVc = [[PSLocController alloc]init];
    locVc.block = ^(NSString *str){
        [_locButton setTitle:str forState:UIControlStateNormal];
        [self.tableView reloadData];
    };
    [self.navigationController presentViewController:locVc animated:YES completion:nil];
}
#pragma mark 添加searchBar
-(void)setSearchBar{
    UISearchBar *customSearchBar = [[UISearchBar alloc]init];
    [customSearchBar setAlpha:0.7];
    customSearchBar.frame = CGRectMake(100, 21, 310, 44);
    customSearchBar.delegate =self;
    customSearchBar.placeholder = @"输入你想要搜索的美食";
    // 设置背景颜色
    //这个操作是为了去掉上下黑线
    customSearchBar.backgroundImage = [[UIImage alloc]init];
    //设置SeachBar的颜色
    customSearchBar.barTintColor = [UIColor colorWithRed:236.0 green:127.0 blue:104.0 alpha:1.0];
    //2.设置圆角和边框颜色
    UITextField *searchField = [customSearchBar valueForKey:@"searchField"];
    if (searchField) {
        [searchField setBackgroundColor:[UIColor colorWithRed:236.0 green:127.0 blue:104.0 alpha:1.0]];
        searchField.layer.cornerRadius = 14.0f;
        searchField.layer.borderColor = [UIColor colorWithRed:247/255.0 green:75/255.0 blue:31/255.0 alpha:1].CGColor;
        searchField.layer.borderWidth = 1;
        searchField.layer.masksToBounds = YES;
    }
    //设置取消按钮
    //    [self.customSearchBar setShowsCancelButton:YES];
    //3.设置按钮文字和颜色
    [customSearchBar fm_setCancelButtonTitle:@"取消"];
    customSearchBar.tintColor = [UIColor grayColor];
    //设置取消按钮字体
    [customSearchBar fm_setCancelButtonFont:[UIFont systemFontOfSize:17]];
    //修正光标颜色
    [searchField setTintColor:[UIColor blackColor]];
    
    //4. 设置输入框文字颜色和字体
    [customSearchBar fm_setTextColor:[UIColor blackColor]];
    [customSearchBar fm_setTextFont:[UIFont systemFontOfSize:14]];
    self.navigationItem.titleView =customSearchBar ;
}
#pragma mark -UISearchBarDelegate
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    [searchBar setShowsCancelButton:YES animated:YES];
}
#pragma mark 懒加载
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    searchBar.text = @"";
    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar endEditing:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSArray *)foods{
    if (_foods == nil) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"CityFoods.plist" ofType:nil];
        
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *tempArray = [NSMutableArray array];
        for (NSDictionary *dict  in array) {
            cityfood *cf = [[cityfood alloc] init];
            cf.cityname = dict[@"cityname"];
            NSMutableArray *foodArray = [NSMutableArray array];
            for (NSDictionary *di in dict[@"foodsname"]) {
                PSFoods2 *food = [PSFoods2 foodWithDict:di];
                [foodArray addObject:food];
            }
            cf.foods = foodArray;
            [tempArray addObject:cf];
        }
        _foods = tempArray;
        
    }
    return _foods;
    
}
#pragma mark - Tableview 数据源

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSString *cityLabelName = _locButton.titleLabel.text;
    BOOL flg = NO;
    for (cityfood *cf in self.foods) {
        if ([cf.cityname isEqual: cityLabelName]) {
            self.cityCurrent = cf;
            flg = YES;
            break;
        }
    }
    if (flg == NO) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"友情提示" message:@"目前只提供北京、成都、杭州、长沙等城市数据" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:action];
        [self.navigationController presentViewController:alert animated:YES completion:nil];
        self.cityCurrent = nil;
    }
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
     return self.cityCurrent.foods.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    FoodsViewCell *cell = (FoodsViewCell *)[tableView dequeueReusableCellWithIdentifier:@"Foods"];
    // 2.传递模型
    if(!cell){
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"FoodsViewCell" owner:self options:nil] lastObject];
    }
    cell.foods = self.cityCurrent.foods[indexPath.row];
    
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 131;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    FoodsViewCell *cell = (FoodsViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    PSCellContentController *vc = [[PSCellContentController alloc]init];
    vc.title = cell.nameLabel.text;
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    //取消选中这行
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //删除
    UITableViewRowAction *deleteRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"收藏" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        
        NSLog(@"点击了删除");
    }];
    deleteRowAction.backgroundColor = [UIColor darkGrayColor];
    return @[deleteRowAction];
}
@end
