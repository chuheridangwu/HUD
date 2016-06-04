//
//  LoadLabel.m
//  ProgressTest
//
//  Created by Elty on 10/10/14.
//  Copyright (c) 2014 Elty. All rights reserved.
//

#import "LoadLabel.h"

#define kAnimateDur (0.5)
#define kDefaultDotCount (3)
@interface LoadLabel(){
	NSTimer *_animateTimer;
	NSInteger _currentDotCount;
}
@property (nonatomic,retain)NSString *loadingText;
@end

@implementation LoadLabel

- (void)dealloc{
//	[super dealloc];
}

- (id)initWithFrame:(CGRect)frame{
	if (self = [super initWithFrame:frame]){
		[self setTextAlignment:NSTextAlignmentLeft];
        self.loadingText = @"努力加载中";
	}
	return self;
}

- (void)setLoadText:(NSString*)loadText{
	[self setLoadingText:loadText];
	[self setText:loadText];
	
}

- (NSInteger)dotCount{
	if (_dotCount < kDefaultDotCount){
		_dotCount = kDefaultDotCount;
	}
	return _dotCount;
}

- (void)startAnimate{
	if (_animateTimer){
		NSLog(@"前一个动画还没有关闭");
		return;
	}
	_animateTimer = [NSTimer scheduledTimerWithTimeInterval:kAnimateDur target:self selector:@selector(loading) userInfo:nil repeats:YES];
}

- (void)stopAnimate{
	if (_animateTimer){
		[_animateTimer invalidate];
		_animateTimer = nil;
		_currentDotCount = 0;
		[self setText:_loadingText];
	}
}

- (void)loading{
	_currentDotCount ++;
	if (_currentDotCount > self.dotCount){
		_currentDotCount = 0;
	}
	NSString *text = [NSString stringWithString:_loadingText];
	for (NSInteger i = 0; i < _currentDotCount; i++){
		text = [text stringByAppendingString:@"."];
	}
	[self setText:text];
}

@end
