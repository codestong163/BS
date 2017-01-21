//
//  RecomViewController.m
//  BSBDJ
//
//  Created by Hongjian.Lan on 2016/12/22.
//  Copyright © 2016年 Hongjian.Lan. All rights reserved.
//

#import "RecomViewController.h"
#import "AFNetworking.h"
#import "MBProgressHUD.h"
#import "MJExtension.h"
#import "RecomModel.h"
#import "RecomCell.h"


@interface RecomViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableview; //表示图
    MBProgressHUD *_hud;//加载菊花
    NSMutableArray *_datamodel;//数据
    


}

@end
static NSString *Iddentstr = @"cell";//注册的字符串
@implementation RecomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = QJRGBBGCL;
    // 创建表示图
    [self _addtableview];
    //网络请求
    [self _createAfnetworking];
 
    

}
- (void)_createAfnetworking {
    _datamodel = [NSMutableArray array];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"category";
    parameters[@"c"] = @"subscribe";
    //加载菊花
    _hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    _hud.label.text = @"加载中...";
    
        
   //网络请求
    [[AFHTTPSessionManager manager]GET:@"https://api.budejie.com/api/api_open.php" parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        
         [MBProgressHUD hideHUDForView:self.view animated:YES];
    
        //数据添加到数组
        _datamodel = [RecomModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        

        //刷新
        [_tableview reloadData];

        //默认选择第一行
        [_tableview selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionNone];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
          NSLog(@"关注左边数据请求失败");
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }
     ];
    

}
- (void)_addtableview {
    _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Kwidth/4, Kheight-120) style:UITableViewStylePlain];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    //隐藏分割线
    _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableview.backgroundColor = QJRGBBGCL;
    [self.view addSubview:_tableview];
    UINib *nib = [UINib nibWithNibName:@"RecomCell" bundle:nil];
    [_tableview registerNib:nib forCellReuseIdentifier:Iddentstr];
//    self.automaticallyAdjustsScrollViewInsets = NO;
//    _tableview.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    //隐藏滚动条
    _tableview.showsVerticalScrollIndicator = NO;


}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _datamodel.count;
    
    

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RecomCell *cell = [tableView dequeueReusableCellWithIdentifier:Iddentstr forIndexPath:indexPath];
    cell.model = _datamodel[indexPath.row];
    return cell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    
    return (_tableview.bounds.size.height-64)/_datamodel.count;
 
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
