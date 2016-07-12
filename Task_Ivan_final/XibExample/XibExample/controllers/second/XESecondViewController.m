//
//  XESecondViewController.m
//  XibExample
//
//  Created by Ivan Gorbulin on 12/07/16.
//  Copyright © 2016 MSL. All rights reserved.
//

#import "XESecondViewController.h"

@interface XESecondViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblHallo;
@property (weak, nonatomic) IBOutlet UIButton *btnAnimate;

@end

@implementation XESecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.btnAnimate.backgroundColor    = [UIColor redColor];
    self.btnAnimate.layer.cornerRadius = 22;
    self.btnAnimate.layer.borderColor  = [UIColor blackColor].CGColor;
    self.btnAnimate.layer.borderWidth  = 2;
    self.btnAnimate.clipsToBounds      = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnAnimatePressed:(id)sender {
    
    CGRect frame = self.lblHallo.frame;
    frame.origin.x += 50;
    
    
//    [UIView animateWithDuration: 5.5 animations:^{
//        self.lblHallo.frame = frame;
//    }];
    
    [UIView animateWithDuration: 0.5
                          delay: 0
                        options: UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse
                     animations:^{
                         self.lblHallo.frame = frame;
                         self.lblHallo.transform = CGAffineTransformScale(self.lblHallo.transform, 2, 2);
                     }
                     completion: nil];
    
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
