//
//  ProgressView.h
//  ProgressTest
//
//  Created by Elty on 10/9/14.
//  Copyright (c) 2014 Elty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgressView : UIView

@property (nonatomic,retain)UIColor *onColor;
@property (nonatomic,retain)UIColor *unOnColor;
@property (nonatomic,assign)CGFloat arcLineWidth;

- (id)initWithCenter:(CGPoint)center radius:(CGFloat)radius;
- (void)setNodeNumber:(NSInteger)nodeNumber spaceNodePersent:(CGFloat)spaceNodePersent;

- (void)startAnimating;
- (void)stopAnimating;

@end
