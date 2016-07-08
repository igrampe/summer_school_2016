//
//  DataBaseManager.m
//  Task_Core_Data
//
//  Created by Semyon Belokovsky on 08/07/16.
//  Copyright © 2016 Semyon Belokovsky. All rights reserved.
//

#import "DataBaseManager.h"
#import <CoreData/CoreData.h>

#import "PlaylistModel.h"
#import "SongModel.h"

@interface DataBaseManager ()

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@end

@implementation DataBaseManager

- (NSArray *)playlists {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"PlaylistModel" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];

    NSError *error = nil;
    NSArray *results = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    return results;
}

- (void)addPlaylistWithTitle:(NSString *)title imageData:(NSData *)imageData {
    PlaylistModel *playlist = (PlaylistModel *)[NSEntityDescription insertNewObjectForEntityForName:@"PlaylistModel"
                                                                             inManagedObjectContext:self.managedObjectContext];
    playlist.title = title;
    playlist.imageData = imageData;
    [self saveContext];
}

- (void)deletePlaylist:(PlaylistModel *)playlist {
    [self.managedObjectContext deleteObject:playlist];
    [self saveContext];
}

- (void)addSongWithTitle:(NSString *)title artistName:(NSString *)artistName toPlaylist:(PlaylistModel *)playlist {
    SongModel *song = (SongModel *)[NSEntityDescription insertNewObjectForEntityForName:@"SongModel"
                                                                 inManagedObjectContext:self.managedObjectContext];
    song.title = title;
    song.artistName = artistName;
    [playlist addSongsObject:song];
    [self saveContext];
}

- (void)deleteSong:(SongModel *)song {
    [song.playlist removeSongsObject:song];
    [self.managedObjectContext deleteObject:song];
    [self saveContext];
}

#pragma mark - CoreData Stack

- (NSURL *)applicationDocumentsDirectory {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Task_Core_Data" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Task_Core_Data.sqlite"];
    NSError *error = nil;
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                   configuration:nil
                                                             URL:storeURL
                                                         options:nil
                                                           error:&error]) {
        NSLog(@"%@", error.localizedDescription);
        abort();
    }
    
    return _persistentStoreCoordinator;
}

- (NSManagedObjectContext *)managedObjectContext {
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = self.persistentStoreCoordinator;
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            NSLog(@"%@", error.localizedDescription);
            abort();
        }
    }
}

@end
