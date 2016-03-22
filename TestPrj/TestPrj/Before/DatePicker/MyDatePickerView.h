//
//  MyDatePickerView.h
//  Wujiang
//
//  Created by zhengzeqin on 15/5/27.
//  Copyright (c) 2015年 com.injoinow. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MyDatePickerView;
typedef void (^MyDatePickerViewBlock)(MyDatePickerView *view,UIButton *btn,NSString *dateStr);
@interface MyDatePickerView : UIView

@property (copy, nonatomic)MyDatePickerViewBlock block;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentViewHegithCons;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
- (IBAction)dissmissBtnPress:(UIButton *)sender;
- (IBAction)finishBtnPress:(UIButton *)sender;

- (void)show;
@end