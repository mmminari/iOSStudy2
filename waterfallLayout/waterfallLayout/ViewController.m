//
//  ViewController.m
//  waterfallLayout
//
//  Created by 김민아 on 2016. 10. 26..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "ViewController.h"
#import "WaterfallLayoutViewController.h"

@interface ViewController () < UITableViewDataSource, UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - Table View Datasource
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"listCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    cell.textLabel.text = @"waterfallLayout";
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

#pragma mark - Table View Delegate

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WaterfallLayoutViewController *waterfallVC = [[WaterfallLayoutViewController alloc]initWithNibName:@"WaterfallLayoutViewController" bundle:nil];
    [self.navigationController pushViewController:waterfallVC animated:YES];
}

@end
