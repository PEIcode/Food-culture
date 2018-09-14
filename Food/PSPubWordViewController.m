//
//  PSPubWordViewController.m
//  Food
//
//  Created by sunny&pei on 2017/7/22.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//

#import "PSPubWordViewController.h"
#import "PStext.h"

@interface PSPubWordViewController ()<UITextFieldDelegate>
@property(nonatomic,weak)UIBarButtonItem *confirmBtn;

@property (nonatomic,weak) UITextField *textField;
@end

@implementation PSPubWordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //创建一个导航栏
    UINavigationBar *navigationBar=[[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, 414, 50)];
   
    [self.view addSubview:navigationBar];
    //创建导航控件内容
    UINavigationItem *navigationItem=[[UINavigationItem alloc]initWithTitle:@"发动态"];
    
    //左侧添加取消按钮
    UIBarButtonItem *cancelBtn=[[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(cancel)];
    navigationItem.leftBarButtonItem=cancelBtn;
    //右侧添加发布按钮
    UIBarButtonItem *surelBtn=[[UIBarButtonItem alloc]initWithTitle:@"发布" style:UIBarButtonItemStyleDone target:self action:@selector(sure)];
    surelBtn.enabled = NO;
    _confirmBtn = surelBtn;
    navigationItem.rightBarButtonItem=surelBtn;
    //添加内容到导航栏
    [navigationBar pushNavigationItem:navigationItem animated:NO];
    
    //添加发布栏
    UITextField *textFiled = [[UITextField alloc]initWithFrame:CGRectMake(0, 50, 414, 686)];
    textFiled.textAlignment = NSTextAlignmentLeft;
    textFiled.placeholder = @"分享最新动态...";
    textFiled.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    textFiled.clearButtonMode = UITextFieldViewModeWhileEditing;
    [textFiled addTarget:self action:@selector(textFieldDidEndEditing:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:textFiled];
    self.textField = textFiled;
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    _confirmBtn.enabled = YES;
}

-(void)cancel{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)sure{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *testPath = [paths objectAtIndex:0];
//     NSString *filepath =[testPath stringByAppendingPathComponent:@"text.plist"];
    NSString *filepath = [testPath stringByAppendingString:@"/text.plist"];
//    NSFileManager *fileMan = [NSFileManager defaultManager];
    
    //
//    NSString *home = NSHomeDirectory();
//    NSString *docPath = [home stringByAppendingPathComponent:@"Documents"];
//    NSString *filepath = [docPath stringByAppendingPathComponent:@"text.plist"];
    //
 
    NSMutableArray *textArray = [NSMutableArray array];
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"hh:mm"];
    NSString *time = [formatter stringFromDate:date];
    
    NSDictionary *textDict = [NSDictionary dictionaryWithObjects:@[@"Pei丶Code",time,self.textField.text] forKeys:@[@"name",@"time",@"content"]];
//    NSLog(@"%@",textDict);
    
    [textArray addObject:textDict];
    NSLog(@"%@",textArray);
    
    [textArray writeToFile:filepath atomically:YES];
    if ([textArray writeToFile:filepath atomically:YES]) {
        NSLog(@"写入成功");
    } else {
        NSLog(@"写入失败");
    }
    
    NSLog(@"%@",textArray);
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"发布成功！" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *suretAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self dismissViewControllerAnimated:YES completion:nil];
    
    }];
    [alertController addAction:suretAction];
    [self saveData];
    [self presentViewController:alertController animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)saveData{
    
}


@end
