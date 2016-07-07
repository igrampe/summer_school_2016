//
//  AddSongViewController.m
//  Task_Core_Data
//
//  Created by Semyon Belokovsky on 08/07/16.
//  Copyright © 2016 Semyon Belokovsky. All rights reserved.
//

#import "AddSongViewController.h"

@interface AddSongViewController ()

@property (strong, nonatomic) IBOutlet UIBarButtonItem *saveButtonItem;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *cancelButtonItem;

@property (strong, nonatomic) IBOutlet UITextField *titleField;
@property (strong, nonatomic) IBOutlet UITextField *artistNameField;

@end

@implementation AddSongViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if (sender == self.cancelButtonItem) {
        return;
    }
    [self save];
}

#pragma mark - Logic

- (void)save {
    
}

@end
