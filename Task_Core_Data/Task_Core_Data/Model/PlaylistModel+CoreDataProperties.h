//
//  PlaylistModel+CoreDataProperties.h
//  Task_Core_Data
//
//  Created by Semyon Belokovsky on 08/07/16.
//  Copyright © 2016 Semyon Belokovsky. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "PlaylistModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PlaylistModel (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSData *imageData;
@property (nullable, nonatomic, retain) NSSet<SongModel *> *songs;

@end

@interface PlaylistModel (CoreDataGeneratedAccessors)

- (void)addSongsObject:(SongModel *)value;
- (void)removeSongsObject:(SongModel *)value;
- (void)addSongs:(NSSet<SongModel *> *)values;
- (void)removeSongs:(NSSet<SongModel *> *)values;

@end

NS_ASSUME_NONNULL_END
