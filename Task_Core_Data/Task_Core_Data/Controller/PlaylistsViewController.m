//
//  PlaylistsViewController.m
//  Task_Core_Data
//
//  Created by Semyon Belokovsky on 08/07/16.
//  Copyright © 2016 Semyon Belokovsky. All rights reserved.
//

#import "PlaylistsViewController.h"
#import "SongsViewController.h"
#import "AddPlaylistViewController.h"
#import "PlaylistCell.h"
#import "PlaylistModel.h"
#import "SongModel.h"
#import "DataBaseManager.h"

@interface PlaylistsViewController ()

@property (nonatomic, weak) IBOutlet UIBarButtonItem *editButtonItem;

@property (nonatomic, strong) NSArray *playlists;

@end

@implementation PlaylistsViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self reloadData];
    [self.tableView reloadData];
}

- (IBAction)unwind:(UIStoryboardSegue *)sender {
    
}

- (IBAction)changeEditing:(id)sender {
    self.editButtonItem.title = self.tableView.editing ? @"Edit" : @"Done";
    [self.tableView setEditing:!self.tableView.editing];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [self.tableView setEditing:NO];
    self.editButtonItem.title = @"Edit";
    UIViewController *destinationVC = segue.destinationViewController;
    if ([segue.destinationViewController isKindOfClass:[UINavigationController class]]) {
        destinationVC = ((UINavigationController *)segue.destinationViewController).topViewController;
    }
    if ([destinationVC isKindOfClass:[SongsViewController class]]) {
        SongsViewController *songsVC = (SongsViewController *)destinationVC;
        songsVC.dataBaseManager = self.dataBaseManager;
        
        if ([sender isKindOfClass:[UITableViewCell class]]) {
            UITableViewCell *cell = (UITableViewCell *)sender;
            NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
            songsVC.playlist = self.playlists[indexPath.row];
        }
    } else if ([destinationVC isKindOfClass:[AddPlaylistViewController class]]) {
        AddPlaylistViewController *addPlaylistVC = (AddPlaylistViewController *)destinationVC;
        addPlaylistVC.dataBaseManager = self.dataBaseManager;
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.playlists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PlaylistCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PlaylistCell" forIndexPath:indexPath];
    
    [cell configureWithPlaylist:self.playlists[indexPath.row]];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView beginUpdates];
    [self deletePlaylistAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [tableView endUpdates];
}

#pragma mark - Logic

- (void)reloadData {
    self.playlists = [self.dataBaseManager playlists];
}

- (void)deletePlaylistAtIndex:(NSInteger)index {
    PlaylistModel *playlist = self.playlists[index];
    [self.dataBaseManager deletePlaylist:playlist];
    [self reloadData];
}

@end
