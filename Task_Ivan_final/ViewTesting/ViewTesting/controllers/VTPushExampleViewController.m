//
//  VTPushExampleViewController.m
//  ViewTesting
//
//  Created by Ivan Gorbulin on 12/07/16.
//  Copyright © 2016 MSL. All rights reserved.
//

#import "VTPushExampleViewController.h"

@interface VTPushExampleViewController ()

@end

@implementation VTPushExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)performSegue:(id)sender {
    [self performSegueWithIdentifier: @"showHallo" sender: nil];
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
