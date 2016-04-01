//
//  KVOTestViewController.m
//  TestPrj
//
//  Created by hjs on 15/11/16.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import "KVOTestViewController.h"

@interface KVOTestViewController ()

@end

@implementation KVOTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _testBean = [KVOTest new];
    [_testBean addObserver:self forKeyPath:@"testVal" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionInitial context:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"testVal"]) {
        NSLog(@"It Works");
        _testLabel.text = [_testBean valueForKey:@"testVal"];
    }
}

- (IBAction)change:(id)sender {
    int a = [self getRandomNumber:0 to:10000];
    [_testBean setValue: [NSString stringWithFormat:@"%d", a] forKey:@"testVal"];
}

-(int)getRandomNumber:(int)from to:(int)to{
    return (int)(from + (arc4random() % (to - from + 1)));
}

@end
