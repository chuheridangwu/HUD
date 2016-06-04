//
//  WXWaitingHud.m
//  ProgressTest
//
//  Created by Elty on 10/10/14.
//  Copyright (c) 2014 Elty. All rights reserved.
//

#import "WXWaitingHud.h"
#import "ProgressView.h"
#import "LoadLabel.h"
#import "UIColor+WX.h"

#define kTipFontSize (10.0)
@interface WXWaitingHud()
{
	ProgressView *_progressView;
	LoadLabel *_tipLabel;
	UIView *_shell;
}
@end

@implementation WXWaitingHud

- (void)dealloc{
	[_tipLabel stopAnimate];
//	[super dealloc];
}

- (id)initWithParentView:(UIView*)parentView{
	if(self = [super init]){
		CGSize size = parentView.bounds.size;
		[self setFrame:parentView.bounds];
		
		CGFloat progressViewRadius = 60.0;
		CGFloat length = progressViewRadius;
		CGFloat tipHeight = 15.0;
		CGSize shellSize = CGSizeMake(length,length);
		CGRect shellRect = CGRectMake((size.width - length)*0.5, (size.height - shellSize.height)*0.5-80, shellSize.width, shellSize.height);
		_shell = [[UIView alloc] initWithFrame:shellRect];
		[_shell setBackgroundColor:[UIColor clearColor]];
		[self addSubview:_shell];
		
		CGPoint center = CGPointMake(progressViewRadius/2.0 + (length-progressViewRadius)*0.5, progressViewRadius/2.0);
		_progressView = [[ProgressView alloc] initWithCenter:center radius:progressViewRadius*0.5];
		[_progressView setArcLineWidth:5.0];
        [_progressView setOnColor:WXColorWithInteger(0xdd2726)];
		[_progressView setUnOnColor:WXColorWithInteger(0xd1c7be)];
		[_progressView setNodeNumber:20 spaceNodePersent:0.2];
		[_progressView setAlpha:0.6];
		[_shell addSubview:_progressView];
		
		UIImage *wxIcon = [UIImage imageNamed:@"woxinHidIcon.png"];
		CGSize wxIconSize = wxIcon.size;
		UIImageView *wxImgView = [[UIImageView alloc] initWithImage:wxIcon];
		[wxImgView setFrame:CGRectMake((progressViewRadius-wxIconSize.width)*0.5, (progressViewRadius-wxIconSize.height)*0.5, wxIconSize.width, wxIconSize.height)];
		[_progressView addSubview:wxImgView];
		
		
        CGFloat tipLabelWidth = 150;
		_tipLabel = [[LoadLabel alloc] initWithFrame:CGRectMake((size.width-tipLabelWidth)/2, shellRect.origin.y + shellRect.size.height + 2, tipLabelWidth, tipHeight)];
        [_tipLabel setTextAlignment:NSTextAlignmentCenter];
		[_tipLabel setFont:[UIFont systemFontOfSize:kTipFontSize]];
		[_tipLabel setDotCount:4];
		[self addSubview:_tipLabel];
	}
	return self;
}

- (void)setText:(NSString*)text{
	if (!text){
		text = @"努力加载中";
	}
	[_tipLabel setLoadText:text];
	UIFont *font = [UIFont systemFontOfSize:kTipFontSize];
	CGSize size = [self sizeWithStr:text anFont:font];
	CGFloat xOffset = (self.bounds.size.width - size.width)*0.5-5;
	CGRect rect = _tipLabel.frame;
	rect.origin.x = xOffset;
	CGFloat dotWidth = 15.0;
	rect.size.width = size.width + dotWidth;
	[_tipLabel setFrame:rect];
}

- (void)startAnimate{
	[_progressView startAnimating];
	[_tipLabel startAnimate];
}

- (void)stopAniamte{
	[_progressView stopAnimating];
	[_tipLabel stopAnimate];
}

- (CGSize)sizeWithStr:(NSString*)str anFont:(UIFont*)fount{
    NSMutableDictionary *dic =[NSMutableDictionary dictionary];
    dic[NSFontAttributeName] = fount;
    CGSize size = CGSizeMake([UIScreen mainScreen].bounds.size.width, MAXFLOAT);
    return [str boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size ;
}



@end
