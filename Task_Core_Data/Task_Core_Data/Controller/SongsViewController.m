//
//  SongsViewController.m
//  Task_Core_Data
//
//  Created by Semyon Belokovsky on 08/07/16.
//  Copyright © 2016 Semyon Belokovsky. All rights reserved.
//

#import "SongsViewController.h"
#import "SongCell.h"
#import "PlaylistModel.h"
#import "AddSongViewController.h"
#import "DataBaseManager.h"

@interface SongsViewController ()

@end

@implementation SongsViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (IBAction)unwind:(UIStoryboardSegue *)sender {
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIViewController *destinationVC = segue.destinationViewController;
    if ([segue.destinationViewController isKindOfClass:[UINavigationController class]]) {
        destinationVC = ((UINavigationController *)segue.destinationViewController).topViewController;
    }
    if ([destinationVC isKindOfClass:[AddSongViewController class]]) {
        AddSongViewController *addSongVC = (AddSongViewController *)destinationVC;
        addSongVC.playlist = self.playlist;
        addSongVC.dataBaseManager = self.dataBaseManager;
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.playlist.songs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SongCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SongCell" forIndexPath:indexPath];
    
    [cell configureWithSong:self.playlist.songs.allObjects[indexPath.row]];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIAlertController *actionController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    __weak typeof(self) welf = self;
    UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"Delete"
                                                           style:UIAlertActionStyleDestructive
                                                         handler:
    ^(UIAlertAction * _Nonnull action) {
        [tableView beginUpdates];
        [welf deleteSongAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        [tableView endUpdates];
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel"
                                                           style:UIAlertActionStyleCancel
                                                         handler:nil];
    [actionController addAction:deleteAction];
    [actionController addAction:cancelAction];
    [self presentViewController:actionController animated:YES completion:nil];
}

#pragma mark - Logic

- (void)deleteSongAtIndex:(NSInteger)index {
    [self.dataBaseManager deleteSong:self.playlist.songs.allObjects[index]];
}

@end
