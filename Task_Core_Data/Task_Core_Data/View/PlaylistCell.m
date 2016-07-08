//
//  PlaylistCell.m
//  Task_Core_Data
//
//  Created by Semyon Belokovsky on 08/07/16.
//  Copyright © 2016 Semyon Belokovsky. All rights reserved.
//

#import "PlaylistCell.h"
#import "PlaylistModel.h"

@interface PlaylistCell ()

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UIImageView *coverImageView;

@end

@implementation PlaylistCell

- (void)configureWithPlaylist:(PlaylistModel *)playlist {
    self.titleLabel.text = playlist.title;
    self.coverImageView.image = [UIImage imageWithData:playlist.imageData];
}

@end
