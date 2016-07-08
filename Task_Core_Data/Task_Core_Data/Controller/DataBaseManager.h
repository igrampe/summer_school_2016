//
//  DataBaseManager.h
//  Task_Core_Data
//
//  Created by Semyon Belokovsky on 08/07/16.
//  Copyright © 2016 Semyon Belokovsky. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PlaylistModel;
@class SongModel;

@interface DataBaseManager : NSObject

- (NSArray *)playlists;
- (void)addPlaylistWithTitle:(NSString *)title imageData:(NSData *)imageData;
- (void)deletePlaylist:(PlaylistModel *)playlist;

- (void)addSongWithTitle:(NSString *)title artistName:(NSString *)artistName toPlaylist:(PlaylistModel *)playlist;
- (void)deleteSong:(SongModel *)song;

@end
