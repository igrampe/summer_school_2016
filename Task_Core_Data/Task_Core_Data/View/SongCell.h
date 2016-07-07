//
//  SongCell.h
//  Task_Core_Data
//
//  Created by Semyon Belokovsky on 08/07/16.
//  Copyright © 2016 Semyon Belokovsky. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SongModel;

@interface SongCell : UITableViewCell

- (void)configureWithSong:(SongModel *)song;

@end
