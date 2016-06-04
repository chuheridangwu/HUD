//
//  WXWaitingHud.h
//  ProgressTest
//
//  Created by Elty on 10/10/14.
//  Copyright (c) 2014 Elty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WXWaitingHud : UIView

- (void)setText:(NSString*)text;
- (id)initWithParentView:(UIView*)parentView;

- (void)startAnimate;
- (void)stopAniamte;

@end
