//
//  ViewController.m
//  show
//
//  Created by app on 16/5/19.
//  Copyright (c) 2016年 roderick. All rights reserved.
//

#import "ViewController.h"
#import "WXWaitingHud.h"

#define Size self.view.frame.size
#define kTopLayerZPosition 10000.0

@interface ViewController ()
{
     //导航栏还可以点击
    WXWaitingHud *_hud;
     //纯粹提示
    UIActivityIndicatorView *_waitingView;
    //全频阻塞
    WXWaitingHud *_fullScreenHud;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _hud = [[WXWaitingHud alloc] initWithParentView:self.view];
    _hud.frame = CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64);
    [_hud setHidden:YES];
    [self.view addSubview:_hud];
    
    _waitingView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    _waitingView.color = [UIColor redColor];
    [_waitingView setCenter:CGPointMake(Size.width*0.5, Size.height*0.5)];
    [_waitingView.layer setZPosition:kTopLayerZPosition];
    [self.view  addSubview:_waitingView];
}

- (void)showWaitViewMode:(E_WaiteView_Mode)mode tip:(NSString*)tip{
    switch (mode) {
        case E_WaiteView_Mode_Unblock:
            [_waitingView startAnimating];
            [_waitingView setHidden:NO];
            break;
        case E_WaiteView_Mode_BaseViewBlock:
            [_hud setHidden:NO];
            [_hud setText:tip];
            [_hud startAnimate];
            break;
        case E_WaiteView_Mode_FullScreenBlock:
            [self showFullScreenHud:YES withTip:tip];
            break;
        default:
            break;
    }
}
- (void)showWaitViewMode:(E_WaiteView_Mode)mode title:(NSString*)title{
    switch (mode) {
        case E_WaiteView_Mode_Unblock:
            [_waitingView startAnimating];
            [_waitingView setHidden:NO];
            break;
        case E_WaiteView_Mode_BaseViewBlock:
            [_hud setHidden:NO];
            [_hud setText:nil];
            [_hud startAnimate];
            break;
        case E_WaiteView_Mode_FullScreenBlock:
            [self showFullScreenHud:YES withTip:nil];
            break;
        default:
            break;
    }
}
- (void)unShowWaitView{
    [_waitingView stopAnimating];
    [_waitingView setHidden:YES];
    [_hud stopAniamte];
    [_hud setHidden:YES];
    [self showFullScreenHud:NO withTip:nil];
}

- (void)showFullScreenHud:(BOOL)show withTip:(NSString*)tip{
    if(show){
        UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
        _fullScreenHud = [[WXWaitingHud alloc] initWithParentView:keyWindow];
        [_fullScreenHud setText:tip];
        [keyWindow.rootViewController.view addSubview:_fullScreenHud];
        [_fullScreenHud startAnimate];
    }else{
        if(_fullScreenHud){
            [_fullScreenHud stopAniamte];
            [_fullScreenHud setHidden:YES];
            [_fullScreenHud removeFromSuperview];
        }
    }
}

@end
