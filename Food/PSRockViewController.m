//
//  PSRockViewController.m
//  Food
//
//  Created by sunny&pei on 2017/9/19.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//

#import "PSRockViewController.h"
#import "PSRockCell.h"
#import "PStext.h"

@interface PSRockViewController ()

@property(nonatomic,strong)NSArray *textArray;
@end

@implementation PSRockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navBg"] forBarMetrics:UIBarMetricsDefault];
//    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.view.backgroundColor = [UIColor grayColor];
    self.tableView.rowHeight = 145;
}



-(NSArray *)textArray {
    if (_textArray == nil) {
//        NSString *home = NSHomeDirectory();
//        NSString *docPath = [home stringByAppendingPathComponent:@"Documents"];
//        NSString *filepath = [docPath stringByAppendingPathComponent:@"text.plist"];
//        NSArray *data = [NSArray arrayWithContentsOfFile:filepath];
//        NSString *path = [[NSBundle mainBundle] pathForResource:@"text.plist" ofType:nil];
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *testPath = [paths objectAtIndex:0];
        NSString *filepath = [testPath stringByAppendingString:@"/text.plist"];
//        NSFileManager *fileMan = [NSFileManager defaultManager];
//        NSString *home = NSHomeDirectory();
//        NSString *docPath = [home stringByAppendingPathComponent:@"Documents"];
//        NSString *filepath = [docPath stringByAppendingPathComponent:@"text.plist"];
        
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:filepath];
        NSMutableArray *tempArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            PStext *text = [PStext textWithDict:dict];
            [tempArray addObject:text];
        }
        _textArray = tempArray;
    }
    return _textArray;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.textArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID =@"text";
    PSRockCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"PSRockCell" owner:nil options:nil] lastObject];
    }
    PStext *text = self.textArray[indexPath.row];
    cell.text = text;
    return cell;
}




@end
