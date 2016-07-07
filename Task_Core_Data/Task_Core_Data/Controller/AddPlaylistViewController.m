//
//  AddPlaylistViewController.m
//  Task_Core_Data
//
//  Created by Semyon Belokovsky on 08/07/16.
//  Copyright © 2016 Semyon Belokovsky. All rights reserved.
//

#import "AddPlaylistViewController.h"
#import "CoverPickerViewController.h"

@interface AddPlaylistViewController ()

@property (strong, nonatomic) IBOutlet UIBarButtonItem *saveButtonItem;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *cancelButtonItem;

@property (strong, nonatomic) IBOutlet UITextField *titleField;
@property (strong, nonatomic) IBOutlet UIImageView *coverImageView;

@end

@implementation AddPlaylistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if (sender == self.cancelButtonItem) {
        return;
    }
    [self save];
}

- (IBAction)unwind:(UIStoryboardSegue *)sender {
    if ([sender.sourceViewController isKindOfClass:[CoverPickerViewController class]]) {
        CoverPickerViewController *coverPicker = (CoverPickerViewController *)sender.sourceViewController;
        self.coverImageView.image = coverPicker.selectedImage;
    }
}

#pragma mark - Logic

- (void)save {
    
}

@end
