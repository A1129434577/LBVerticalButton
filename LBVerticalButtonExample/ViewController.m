//
//  ViewController.m
//  LBTextFieldDemo
//
//  Created by 刘彬 on 2019/9/24.
//  Copyright © 2019 刘彬. All rights reserved.
//

#import "ViewController.h"
#import "LBVerticalButton.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"LBVerticalButton";
    LBVerticalButton *verticalButton = [[LBVerticalButton alloc] initWithFrame:CGRectMake((CGRectGetWidth(self.view.frame)-80)/2, 200, 80, 80)];
    verticalButton.backgroundColor = [UIColor lightGrayColor];
    [verticalButton setImage:[UIImage imageNamed:@"img_+"] forState:UIControlStateNormal];
    [verticalButton setTitle:@"垂直" forState:UIControlStateNormal];
    [verticalButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:verticalButton];
    
    [verticalButton.badgeButton setTitle:@"99+" forState:UIControlStateNormal];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [verticalButton.badgeButton setTitle:@"9" forState:UIControlStateNormal];
    });
    
}

@end
