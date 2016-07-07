//
//  PlaylistsViewController.m
//  Task_Core_Data
//
//  Created by Semyon Belokovsky on 08/07/16.
//  Copyright © 2016 Semyon Belokovsky. All rights reserved.
//

#import "PlaylistsViewController.h"
#import "SongsViewController.h"
#import "PlaylistCell.h"
#import "PlaylistModel.h"
#import "SongModel.h"

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
    if ([segue.destinationViewController isKindOfClass:[SongsViewController class]]) {
        if ([sender isKindOfClass:[UITableViewCell class]]) {
            UITableViewCell *cell = (UITableViewCell *)sender;
            NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
            SongsViewController *songsVC = (SongsViewController *)segue.destinationViewController;
            songsVC.playlist = self.playlists[indexPath.row];
        }
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
    NSMutableArray *a = [NSMutableArray new];
    for (int i = 0; i < 10; i++) {
        PlaylistModel *pl = [PlaylistModel new];
        pl.title = [NSString stringWithFormat:@"%ld", (long)i];
        NSMutableArray *b = [NSMutableArray new];
        for (int j = 0; j < 10; j++) {
            SongModel *song = [SongModel new];
            song.title = [NSString stringWithFormat:@"%ld", (long)j];
            song.artistName = [NSString stringWithFormat:@"%ld", (long)i];
            [b addObject:song];
        }
        pl.songs = [NSSet setWithArray:b];
        [a addObject:pl];
    }
    self.playlists = a;
}

- (void)deletePlaylistAtIndex:(NSInteger)index {
    NSMutableArray *a = [self.playlists mutableCopy];
    [a removeObjectAtIndex:index];
    self.playlists = [NSArray arrayWithArray:a];
}

@end
