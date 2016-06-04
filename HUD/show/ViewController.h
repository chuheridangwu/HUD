//
//  ViewController.h
//  show
//
//  Created by app on 16/5/19.
//  Copyright (c) 2016年 roderick. All rights reserved.
//

typedef enum {
    //不阻塞界面
    E_WaiteView_Mode_Unblock,
    //阻塞baseView
    E_WaiteView_Mode_BaseViewBlock,
    //阻塞全频
    E_WaiteView_Mode_FullScreenBlock,
}E_WaiteView_Mode;

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

//title在block的模式下有用
- (void)showWaitViewMode:(E_WaiteView_Mode)mode tip:(NSString*)tip;
- (void)showWaitViewMode:(E_WaiteView_Mode)mode title:(NSString*)title;
- (void)unShowWaitView;

@end

