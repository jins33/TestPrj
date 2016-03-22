//
//  TTTAttributedLabelViewController.h
//  TestPrj
//
//  Created by F－03 on 16/3/10.
//  Copyright © 2016年 hjs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTTAttributedLabel.h"

@interface TTTAttributedLabelViewController : UIViewController<TTTAttributedLabelDelegate>

@property (nonatomic, strong) TTTAttributedLabel *summaryLabel;

@end
