//
//  MainViewController.h
//  SimpleTableView
//
//  Created by Ibokan on 14-9-2.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property(retain,nonatomic)NSArray *list;

@property(retain,nonatomic)NSArray *list1;
@property(retain,nonatomic)NSArray *list2;
@property(retain,nonatomic)NSArray *list3;
@end
