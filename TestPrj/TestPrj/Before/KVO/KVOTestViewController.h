//
//  KVOTestViewController.h
//  TestPrj
//
//  Created by hjs on 15/11/16.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KVOTest.h"

@interface KVOTestViewController : UIViewController

@property (strong, nonatomic) KVOTest *testBean;
@property (weak, nonatomic) IBOutlet UILabel *testLabel;
- (IBAction)change:(id)sender;

@end
