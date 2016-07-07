//
//  PlaylistModel.h
//  Task_Core_Data
//
//  Created by Semyon Belokovsky on 08/07/16.
//  Copyright © 2016 Semyon Belokovsky. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SongModel;

@interface PlaylistModel : NSObject

@property NSData *imageData;
@property NSString *title;
@property NSSet<SongModel *> *songs;

@end
