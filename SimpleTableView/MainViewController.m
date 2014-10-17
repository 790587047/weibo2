//
//  MainViewController.m
//  SimpleTableView
//
//  Created by Ibokan on 14-9-2.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController
@synthesize list;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray *array = [NSArray arrayWithObjects:@"As long as you love me",@"Nobody but you",@"I want it that way",@"Spanish eyes",@"Everybody",@"Lager than life",@"shape of my heart",@"Back to your heart",@"Show me the meaning of being lonely",@"Get Another boyfriend",@"Shinig Star",@"I promise you",@"The answer to our life",@"everyone",@"More than that",@"Time", nil];
    self.list = array;
    
    UITableView *myTable = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    myTable.delegate = self;
    myTable.dataSource =self;
    [self.view addSubview:myTable];
    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.list.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString*CellIdentifier = @"CellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        static int count =0;
        count++;
        NSLog(@"%d",count);
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    
    cell.textLabel.text = [self.list objectAtIndex:indexPath.row];
    if (indexPath.row %2 ==0) {
        cell.imageView.image = [UIImage imageNamed:@"userinfo_vip_background@2x"];

    }else
        cell.imageView.image = [UIImage imageNamed:@"ICN_info_ON"];
        cell.detailTextLabel.text = @"Backstreet Boys";
    cell.textLabel.font = [UIFont boldSystemFontOfSize:50];//设置字体大小
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 100;
}
//设置cell的行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 70;
}
//header
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
   
         return @"A";
   
   
}
//footer
-(NSString*)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    return @"Never get tired of hearing";
}
#pragma mark -Table view delegate
-(NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [indexPath row];
}
//设置第一行不能被选
-(NSIndexPath*)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        return nil;
    }
    return indexPath;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *string = [self.list objectAtIndex:indexPath.row];
    NSString *msg = [NSString stringWithFormat:@"You selected %@",string];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Row Selected" message:msg delegate:nil cancelButtonTitle:@"yes I did" otherButtonTitles:nil, nil];
    [alert show];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
