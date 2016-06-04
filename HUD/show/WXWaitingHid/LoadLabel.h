//
//  LoadLabel.h
//  ProgressTest
//
//  Created by Elty on 10/10/14.
//  Copyright (c) 2014 Elty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadLabel : UILabel
@property (nonatomic,assign)NSInteger dotCount;

- (void)setLoadText:(NSString*)loadText;

- (void)startAnimate;
- (void)stopAnimate;
@end
