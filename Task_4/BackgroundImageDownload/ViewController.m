//
//  ViewController.m
//  BackgroundImageDownload
//
//  Created by Demid Merzlyakov on 07.07.16.
//  Copyright © 2016 DMA. All rights reserved.
//

#import "ViewController.h"
#import "DMAImageTableViewCell.h"
#import "DMAImageProvider.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation ViewController

const int numberOfCells = 30;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView methods

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return numberOfCells;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 168;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DMAImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ImageCell"];
    
    [cell setCustomImage];
    
    return cell;
}

@end
