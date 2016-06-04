//
//  ProgressView.m
//  ProgressTest
//
//  Created by Elty on 10/9/14.
//  Copyright (c) 2014 Elty. All rights reserved.
//

#import "ProgressView.h"

#define kDefaultInterval 0.2

@interface ProgressView()
{
	CGFloat _radius;
	CGPoint _origin;
	NSInteger _nodeNumber;
	
	NSInteger _currentProgress;
	NSTimer *_timer;
	
	CGFloat _solidArc;//实心的弧度
	CGFloat _cellArc;//每个单元的弧度
}
@end

@implementation ProgressView

- (void)dealloc{
//	[super dealloc];
}

- (id)initWithCenter:(CGPoint)center radius:(CGFloat)radius{
	if(self = [super init]){
		[self setBackgroundColor:[UIColor clearColor]];
		_origin = CGPointMake(radius, radius);
		_radius = radius;
		CGRect rect = CGRectMake(center.x - radius, center.y - radius, radius*2, radius*2);
		[self setFrame:rect];
	}
	return self;
}

- (void)setNodeNumber:(NSInteger)nodeNumber spaceNodePersent:(CGFloat)spaceNodePersent{
	_nodeNumber = nodeNumber;
	_cellArc = M_PI*2/nodeNumber;
	_solidArc = (1-spaceNodePersent)*_cellArc;
}

- (void)startAnimating{
	[self setHidden:NO];
	[self startTimer];
	[self setNeedsDisplay];
}

- (void)stopAnimating{
	[self setHidden:YES];
	[self stopTimer];
	_currentProgress = 0;
}

- (void)startTimer{
	if (_timer){
		NSLog(@"前一个动画还没有关闭");
		return;
	}
	_timer = [NSTimer scheduledTimerWithTimeInterval:kDefaultInterval target:self selector:@selector(drawCurrentDegree) userInfo:nil repeats:YES];
}

- (void)stopTimer{
	if (_timer){
		[_timer invalidate];
	}
	_timer = nil;
}

- (void)drawCurrentDegree{
	_currentProgress ++;
	_currentProgress = _currentProgress%_nodeNumber;
	[self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect{
	CGFloat x = _origin.x;
	CGFloat y = _origin.y;
	CGFloat r,g,b,alpha;
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextClearRect(context, rect);
	CGContextSetLineWidth(context, _arcLineWidth);
	CGContextSaveGState(context);
	
	[_onColor getRed:&r green:&g blue:&b alpha:&alpha];
	CGContextSetRGBStrokeColor(context,r,g,b,alpha);
	for (int i = 0; i < _currentProgress; i++){
		CGFloat startAngle = _cellArc*i - M_PI_2;
		CGContextAddArc(context, x, y, _radius - _arcLineWidth, startAngle,startAngle + _solidArc, 0);
		CGContextStrokePath(context);
	}
	CGContextRestoreGState(context);
	[_unOnColor getRed:&r green:&g blue:&b alpha:&alpha];
	CGContextSetRGBStrokeColor(context,r,g,b,alpha);
	for (NSInteger i = _currentProgress; i < _nodeNumber; i++) {
		CGFloat startAngle = _cellArc*i - M_PI_2;
		CGContextAddArc(context, x, y, _radius - _arcLineWidth, startAngle,startAngle + _solidArc, 0);
		CGContextStrokePath(context);
	}
}

@end
