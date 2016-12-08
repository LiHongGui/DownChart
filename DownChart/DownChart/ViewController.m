//
//  ViewController.m
//  DownChart
//
//  Created by lihonggui on 2016/12/7.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import "ViewController.h"
#import "DownChart.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet DownChart *downChart;
@property (weak, nonatomic) IBOutlet UISlider *slider;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)slider:(UISlider *)sender {
    //接受值
    self.downChart.nbr = self.slider.value;
//    self.downChart.label.text = [NSString stringWithFormat:@"%.02lf%%",sender.value];
    NSLog(@"%.2f",self.slider.value);
}
@end
