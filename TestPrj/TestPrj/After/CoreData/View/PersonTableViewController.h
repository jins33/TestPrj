//
//  PersonTableViewController.h
//  CoreDataTest
//
//  Created by hjs on 16/3/20.
//  Copyright © 2016年 hjs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonTableViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UITextField *nameText;
@property (weak, nonatomic) IBOutlet UITextField *ageText;


- (IBAction)saveData:(id)sender;

@end
