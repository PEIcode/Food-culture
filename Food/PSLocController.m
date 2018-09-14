//
//  PSLocController.m
//  Food
//
//  Created by sunny&pei on 2017/7/22.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//

#import "PSLocController.h"
#import <CoreLocation/CoreLocation.h>
@interface PSLocController ()<UIPickerViewDelegate,UIPickerViewDataSource,CLLocationManagerDelegate>
- (IBAction)confirmBtn:(id)sender;
//@property (weak, nonatomic) IBOutlet UILabel *showLab;
//@property (weak, nonatomic) IBOutlet UIPickerView *pikerView;
@property (strong, nonatomic)  UILabel *showLab;
@property (strong, nonatomic)  UIPickerView *pikerView;
@property (nonatomic,copy) NSString  *cityName;
@property (nonatomic,strong) NSArray  *items; /**< 数据源*/
- (IBAction)autoLoc:(id)sender;

@property (nonatomic,strong) NSArray  *cityArray; /**< 当前展示省份的城市数组*/
@property (nonatomic, strong) CLLocationManager* locationManager;
@end

@implementation PSLocController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addTitleLabel];
    [self addConfirmBtn];
    [self add_PSPickerView];

}
-(void)add_PSPickerView{
    self.pikerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 117, 414, 216)];
    _pikerView.dataSource = self;
    _pikerView.delegate = self;
    [self.view addSubview:_pikerView];
    
}
-(void)addConfirmBtn{
    UIButton *confirm = [[UIButton alloc]initWithFrame:CGRectMake(184, 522, 46, 30)];
    [confirm setTitle:@"确定" forState:UIControlStateNormal];
    [confirm setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [confirm addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:confirm];
}
-(void)btnClick{
    [self dismissViewControllerAnimated:YES completion:nil];
    if (self.block) {
        self.block(self.cityName);
    }
}
-(void)addTitleLabel{
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(164, 88, 120, 60)];
    titleLabel.text = @"请选择地点：";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:titleLabel];
    UILabel *choseLabel = [[UILabel alloc]initWithFrame:CGRectMake(33, 360, 120, 60)];
    choseLabel.text = @"您的选择是：";
    choseLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:choseLabel];
    self.showLab = [[UILabel alloc]initWithFrame:CGRectMake(90, 386, 233, 60)];
    self.showLab.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_showLab];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark pickerView数据源方法
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0) {
        return self.items.count;
    }else{
        return self.cityArray.count;
    }
}

#pragma mark pickerView代理方法
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == 0) {
        NSDictionary *province = self.items[row];
        return province[@"State"];
    }else{
        return self.cityArray[row][@"city"];
    }
    return nil;
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component == 0) {
        self.cityArray = self.items[row][@"Cities"];
        [pickerView reloadComponent:1];
        [pickerView selectRow:0 inComponent:1 animated:YES];
        NSLog(@"省份===%@,城市===%@",self.items[row][@"State"],self.cityArray[[pickerView selectedRowInComponent:1]][@"city"]);
        NSString *prv =self.items[row][@"State"];
        NSString *cit =self.cityArray[[pickerView selectedRowInComponent:1]][@"city"];
        NSString *txt = [NSString stringWithFormat:@"%@%@",prv,cit];
        self.cityName = cit;
        self.showLab.text = txt;
    }else
    {
        NSLog(@"省份===%@,城市===%@",self.items[[pickerView selectedRowInComponent:0]][@"State"],self.cityArray[row][@"city"]);
        NSString *prv =self.items[[pickerView selectedRowInComponent:0]][@"State"];
        NSString *cit =self.cityArray[row][@"city"];
        NSString *txt = [NSString stringWithFormat:@"%@%@",prv,cit];
        self.cityName = cit;
        self.showLab.text = txt;
    }

}
#pragma mark - 懒加载
-(NSArray *)items{
    if (_items==nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"ProvincesAndCities.plist" ofType:nil];
        _items = [NSArray arrayWithContentsOfFile:path];
    }
    return _items;
}




-(NSArray *)cityArray{
    if (!_cityArray) {
        _cityArray = self.items[0][@"Cities"];
    }
    return _cityArray;
}
- (IBAction)confirmBtn:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    if (self.block) {
        self.block(self.cityName);
    }
    
    
}
#pragma mark 定位模块
- (IBAction)autoLoc:(id)sender {
    if([CLLocationManager locationServicesEnabled]){
        if(!_locationManager){
            self.locationManager = [[CLLocationManager alloc] init];
            if([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]){
                
                [self.locationManager requestWhenInUseAuthorization];
                [self.locationManager requestAlwaysAuthorization];
            }
            //设置代理
            [self.locationManager setDelegate:self];
            //设置定位精度
            [self.locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
            //设置距离筛选
            [self.locationManager setDistanceFilter:100];
            //开始定位
            [self.locationManager startUpdatingLocation];
            //设置开始识别方向
            [self.locationManager startUpdatingHeading];
        }
    }else{
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:nil message:@"您没有开启定位功能" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sure = [UIAlertAction actionWithTitle:@"sure" style:UIAlertActionStyleDefault handler:nil];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:nil];
        [alertVC addAction:sure ];
        [alertVC addAction:cancel ];

        [self presentViewController:alertVC animated:YES completion:nil];
        //        UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:nil
        //                                                             message:@"您没有开启定位功能"
        //                                                            delegate:nil
        //                                                   cancelButtonTitle:@"确定"
        //                                                   otherButtonTitles:nil, nil];
        //        [alertView show];
    }

}
#pragma mark - CLLocationManangerDelegate
//定位成功以后调用
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    
    [self.locationManager stopUpdatingLocation];
    CLLocation* location = locations.lastObject;
    [self reverseGeocoder:location];
    
}

#pragma mark Geocoder
//反地理编码
- (void)reverseGeocoder:(CLLocation *)currentLocation {
    
    CLGeocoder* geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        if(error || placemarks.count == 0){
            NSLog(@"error = %@",error);
//            NSLog(@"%@",placemark.name);
        }else{
            
            CLPlacemark * placemark = placemarks.firstObject;
            NSLog(@"placemark:%@",[[placemark addressDictionary] objectForKey:@"City"]);
            UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"你的位置"  message:[[placemark addressDictionary] objectForKey:@"City"] preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancelBtn  = [UIAlertAction actionWithTitle:@"sure" style:UIAlertActionStyleCancel handler:nil];
            [alertVC addAction:cancelBtn];
            [self presentViewController:alertVC animated:YES completion:nil];
//            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"你的位置" message:[[placemark addressDictionary] objectForKey:@"City"] delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//            [alert show];
            NSLog(@"%@",placemark.name);
        }
    }];
}
@end
