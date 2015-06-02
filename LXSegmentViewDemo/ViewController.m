//
//  ViewController.m
//  LXSegmentViewDemo
//
//  Created by MacAir2 on 15/6/2.
//  Copyright (c) 2015年 lixiang. All rights reserved.
//

#import "ViewController.h"
#import "LXSegmentView.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) LXSegmentView *segmentView;

@property (strong, nonatomic) UITableView *tableView1;
@property (strong, nonatomic) UITableView *tableView2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initUI];
    
}

- (void)initUI{
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    CGFloat sW = self.view.frame.size.width;
    CGFloat sH = self.view.frame.size.height-64;
    ///segmentView
    _segmentView = [[LXSegmentView alloc] initWithFrame:CGRectMake(0, 64, sW, sH)];
    
    _segmentView.tabBgImageView.image = [UIImage imageNamed:@"bg_tab_selected.png"];
    _segmentView.tabButtonSeclectImageView.image = [UIImage imageNamed:@"select_flag.png"];
    _segmentView.tabButtonColor = [UIColor blackColor];
    _segmentView.tabButtonSelectCorlor = [UIColor redColor];
    [_segmentView setTabButton1Title:@"当前活动" andButton2Title:@"历史活动"];
    [self.view addSubview:_segmentView];
    
    ///tableView1
    _tableView1 = [[UITableView alloc] initWithFrame:CGRectMake(0, -34, sW, sH-42+34) style:UITableViewStyleGrouped];
    _tableView1.delegate = self;
    _tableView1.dataSource = self;
    _tableView1.backgroundColor = [UIColor clearColor];
    [_segmentView.mainScrollView addSubview:_tableView1];
    
    
    ///tableView2
    _tableView2 = [[UITableView alloc] initWithFrame:CGRectMake(sW, -34, sW, sH-42+34) style:UITableViewStyleGrouped];
    _tableView2.delegate = self;
    _tableView2.dataSource = self;
    _tableView2.backgroundColor = [UIColor clearColor];
    [_segmentView.mainScrollView addSubview:_tableView2];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView dataSouce delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (tableView == _tableView1) {
        return 5;
    }
    else if (tableView == _tableView2){
        return 12;
    }
    else{
        return 0;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier1 = @"Cell1";
    static NSString *identifier2 = @"Cell2";
    static NSString *identifier3 = @"Cell3";
    
    if (tableView == _tableView1) {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier1];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier1];
        }
        
        cell.textLabel.text = [NSString stringWithFormat:@"11111111%li",(long)indexPath.row];
        
        return cell;

    }
    else if (tableView == _tableView2){
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier2];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier2];
        }
        
        cell.textLabel.text = [NSString stringWithFormat:@"22222222%li",(long)indexPath.row];
        
        return cell;

    }
    else{
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier3 forIndexPath:indexPath];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier3];
        }

        return cell;

    }
}

@end








