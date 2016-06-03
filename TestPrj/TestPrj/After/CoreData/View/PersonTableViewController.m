//
//  PersonTableViewController.m
//  CoreDataTest
//
//  Created by hjs on 16/3/20.
//  Copyright © 2016年 hjs. All rights reserved.
//

#import "PersonTableViewController.h"
#import "CoreDataManager.h"
#import "Person.h"
#import "CoreDataCell.h"

#define CELLID @"coreDataCell"
#define NIBNAME @"CoreDataCell"

@interface PersonTableViewController ()

@end

@implementation PersonTableViewController{
    CoreDataManager *manager;
    NSArray *tableArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    manager = [CoreDataManager manager];
    [manager initContext];
    tableArray = [manager queryEntityName:@"Person" withCondition:@""];
    //注册cell
    [self.tableView registerNib:[UINib nibWithNibName:NIBNAME bundle:nil] forCellReuseIdentifier:CELLID];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return tableArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CoreDataCell *cell = [tableView dequeueReusableCellWithIdentifier:CELLID];
    Person *person = tableArray[indexPath.row];
    cell.titleLbl.text = person.name;
    cell.subTitleLbl.text =[NSString stringWithFormat:@"%@", person.age];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 75;
}

- (IBAction)saveData:(id)sender {
    Person *person = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:manager.context];
    person.name = _nameText.text;
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    person.age = [numberFormatter numberFromString:_ageText.text];
    [manager saveContext];
    tableArray = [manager queryEntityName:@"Person" withCondition:@""];
    [self.tableView reloadData];
}
@end
