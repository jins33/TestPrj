//
//  TTTAttributedLabelViewController.m
//  TestPrj
//
//  Created by F－03 on 16/3/10.
//  Copyright © 2016年 hjs. All rights reserved.
//

#import "TTTAttributedLabelViewController.h"

@interface TTTAttributedLabelViewController ()

@end

@implementation TTTAttributedLabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.layer.shouldRasterize = YES;
    self.view.layer.rasterizationScale = [[UIScreen mainScreen] scale];
    
    self.summaryLabel = [[TTTAttributedLabel alloc] initWithFrame:CGRectMake(0, 40, 320, 40)];
    self.summaryLabel.font = [UIFont systemFontOfSize:15];
    self.summaryLabel.lineBreakMode = NSLineBreakByCharWrapping;
    self.summaryLabel.numberOfLines = 0;
//    self.summaryLabel.textColor = [UIColor redColor];

    self.summaryLabel.linkAttributes = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:NO] forKey:(__bridge NSString *)kCTUnderlineStyleAttributeName];

    self.summaryLabel.activeLinkAttributes = @{};
    self.summaryLabel.textColor = [UIColor blueColor];

    self.summaryLabel.text = @"hhhhahahahhhhhhhhhhhh";

    [self.summaryLabel addLinkToPhoneNumber:@"1111111" withRange:NSMakeRange(0, 10)];

    self.summaryLabel.delegate = self;
    
    [self.view addSubview:self.summaryLabel];
    
//    [self.summaryLabel setText:self.summaryText afterInheritingLabelAttributesAndConfiguringWithBlock:^NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
//    }

}

- (void)attributedLabel:(TTTAttributedLabel *)label didSelectLinkWithPhoneNumber:(NSString *)phoneNumber{
    NSLog(@"label %@, no %@", label.text, phoneNumber);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
