//
//  ViewController.m
//  BlocksSample
//
//  Created by oda yuma on 2014/09/19.
//  Copyright (c) 2014年 yuma oda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, copy) void (^YumaBlcok)(BOOL flag);

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setYumaBlcok:^(BOOL flag) {
        NSString *str = flag ? @"YESだよーーーー！" : @"NOだよーー！";
        NSLog(@"YumaBlock::%@", str);
    }];
    
    [self doSomethingWithSuccessBlock:^(id object) {
        
    } failureBlock:^(NSError *error) {
        
    }];
    
    [self callYumaBlockWithFlag:NO];
    
    [self localBlockMethod];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)doSomethingWithSuccessBlock:(void (^)(id object))successBlock
                      failureBlock:(void (^)(NSError *error))failureBlock
{
    successBlock(@"successだよー！");
}

-(void)callYumaBlockWithFlag:(BOOL)flag
{
    self.YumaBlcok(flag);
}

-(void)localBlockMethod
{
    int (^LocalYumaBlock)(int) = ^int(int x) {
        return x * x;
    };
    
    NSLog(@"LocalBlock::%d", LocalYumaBlock(5));
}

@end
