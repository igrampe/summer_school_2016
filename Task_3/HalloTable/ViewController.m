//
//  ViewController.m
//  HalloTable
//
//  Created by Ivan Gorbulin on 06/07/16.
//  Copyright © 2016 MSL. All rights reserved.
//

#import "ViewController.h"
#import "HTTableCell.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@end

static NSString *kCellID = @"ht_cell";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tvWorkers.dataSource = self;
    self.tvWorkers.delegate   = self;
    
    [self.tvWorkers registerNib: [UINib nibWithNibName: @"HTTableCell" bundle: nil] forCellReuseIdentifier: kCellID];
    
    [self.btnButon addTarget: self action: @selector(btnNewPressed:) forControlEvents: UIControlEventTouchUpInside];
    
}

- (void) btnNewPressed: (UIButton*)sender
{
    NSLog(@"llooog");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView delegate/datasource

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HTTableCell *cell = [tableView dequeueReusableCellWithIdentifier: kCellID forIndexPath: indexPath];
    
    cell.lblName.text = @"Name Name";
    cell.ivPhoto.backgroundColor = [UIColor greenColor];
    
    return cell;
    
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat: @"Section %d", (int)section];
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}


#pragma mark - buttons

- (IBAction)btnPressed:(id)sender {
    
    UIButton *btn = (UIButton *)sender;
    [btn setTitle: @"new title" forState: UIControlStateNormal];
    
}



@end
