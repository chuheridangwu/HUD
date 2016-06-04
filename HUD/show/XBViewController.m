//
//  XBViewController.m
//  show
//
//  Created by app on 16/5/19.
//  Copyright (c) 2016年 roderick. All rights reserved.
//

#import "XBViewController.h"
#import "TwoViewController.h"

@interface XBViewController ()

@end

@implementation XBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //  注意： E_WaiteView_Mode_FullScreenBlock  如果是当前view，拿不到window
    
//    self.view.backgroundColor = [UIColor redColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 100);
    [btn setTitle:@"替换" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:btn];
}

- (void)clickBtn {
    TwoViewController *t = [[TwoViewController alloc]init];
    [self.navigationController pushViewController:t animated:YES];
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
