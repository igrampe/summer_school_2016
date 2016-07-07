//
//  PlaylistCell.m
//  Task_Core_Data
//
//  Created by Semyon Belokovsky on 08/07/16.
//  Copyright © 2016 Semyon Belokovsky. All rights reserved.
//

#import "PlaylistCell.h"

@interface PlaylistCell ()

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UIImageView *coverImageView;

@end

@implementation PlaylistCell

- (void)configureWithPlaylist:(PlaylistModel *)playlist {
    
}

@end
