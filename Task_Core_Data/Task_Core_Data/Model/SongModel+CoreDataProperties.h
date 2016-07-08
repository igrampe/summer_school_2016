//
//  SongModel+CoreDataProperties.h
//  Task_Core_Data
//
//  Created by Semyon Belokovsky on 08/07/16.
//  Copyright © 2016 Semyon Belokovsky. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "SongModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SongModel (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSString *artistName;
@property (nullable, nonatomic, retain) PlaylistModel *playlist;

@end

NS_ASSUME_NONNULL_END
