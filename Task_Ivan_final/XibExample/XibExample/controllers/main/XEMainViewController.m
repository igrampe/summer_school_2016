//
//  XEMainViewController.m
//  XibExample
//
//  Created by Ivan Gorbulin on 12/07/16.
//  Copyright © 2016 MSL. All rights reserved.
//

#import "XEMainViewController.h"
#import "XESecondViewController.h"

@interface XEMainViewController ()

@end

@implementation XEMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnPushPressed:(id)sender {
    XESecondViewController *sc = [[XESecondViewController alloc] initWithNibName: @"XESecondViewController" bundle: nil];
    [self.navigationController pushViewController: sc animated: YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
