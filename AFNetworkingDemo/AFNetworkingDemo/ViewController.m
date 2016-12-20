//
//  ViewController.m
//  AFNetworkingDemo
//
//  Created by 周鹏钜 on 16/12/15.
//  Copyright © 2016年 周鹏钜. All rights reserved.
//

#import "ViewController.h"
#import "HTRequestHelper.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDictionary *dict = @{@"username" : @"23716997892", @"password" : @"123123", @"type" : @"1"};
    [HTRequestHelper LoginDataParams:dict success:^(id responseObj) {
        
        NSLog(@"%@", responseObj);
    } failure:^(NSError *error) {
        
        
    }];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    
    [self.view addSubview:btn];
    
    btn.backgroundColor = [UIColor redColor];
    
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
}
    
- (void)btnClick {

    [HTRequestHelper uploadSingleFileSuccess:^(id responseObj) {
        
        NSLog(@"%@", responseObj);
    }];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    [HTRequestHelper downloadVWithFilePath:^(NSString *filePath) {
        
        PJLog(@"%@", filePath);
    }];
}

@end
