//
//  TestDatePickerViewController.h
//  TestPrj
//
//  Created by hjs on 15/12/3.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyDatePickerView.h"

@interface TestDatePickerViewController : UIViewController
- (IBAction)shouDatePicker:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end
