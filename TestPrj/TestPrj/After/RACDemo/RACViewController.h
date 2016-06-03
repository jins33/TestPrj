//
//  RACViewController.h
//  TestPrj
//
//  Created by F－03 on 16/5/6.
//  Copyright © 2016年 hjs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ReactiveCocoa.h>

@interface RACViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *myTextField;
@property (weak, nonatomic) IBOutlet UIButton *textChangeBtn;
@property (nonatomic, strong) NSString *textStr;


@end
