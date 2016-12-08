//
//  DownChart.m
//  DownChart
//
//  Created by lihonggui on 2016/12/7.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import "DownChart.h"

@implementation DownChart

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, width, height) cornerRadius:width/2];
    CGPoint center = CGPointMake(rect.size.width/2, rect.size.height/2);
    CGFloat radius = rect.size.width/2;
    CGFloat start = -M_PI_2;
    CGFloat end = (float)self.nbr/100 *2*M_PI +start;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:start endAngle:end clockwise:YES];
    [path addLineToPoint:center];
    [path closePath];
//    [[self color]setFill];
    [[UIColor grayColor]setFill];
    [path fill];
}

#pragma mark
#pragma mark -  懒加载

-(UILabel *)label
{
    #warning 开始运行时:是不显示的(没有下载数据)
    if (_label ==nil) {
        
        _label = [[UILabel alloc]init];
        
        _label.textAlignment = NSTextAlignmentCenter;
        _label.font = [UIFont systemFontOfSize:20];
        [self addSubview:_label];
    }
    return _label;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    _label.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
}
#warning 重写
-(void)setNbr:(CGFloat)nbr
{
    _nbr = nbr;
    [self setNeedsDisplay];
    self.label.text = [NSString stringWithFormat:@"%.2lf%%",self.nbr];
    NSLog(@"label%lf",self.nbr);
}

-(UIColor *)color
{
    CGFloat red = arc4random_uniform(256)/255.0;
    CGFloat green = arc4random_uniform(256)/255.0;
    CGFloat blue = arc4random_uniform(256)/255.0;
    UIColor *randomColor = [UIColor colorWithRed:red green:green blue:blue alpha:1];
    return randomColor;
}
#pragma mark
#pragma mark -  点击屏幕,随机变换颜色
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //重新画图
    [self setNeedsDisplay];
}
@end
