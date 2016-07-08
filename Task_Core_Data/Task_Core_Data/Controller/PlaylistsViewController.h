//
//  PlaylistsViewController.h
//  Task_Core_Data
//
//  Created by Semyon Belokovsky on 08/07/16.
//  Copyright © 2016 Semyon Belokovsky. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DataBaseManager;

@interface PlaylistsViewController : UITableViewController

@property (nonatomic, strong) IBOutlet DataBaseManager *dataBaseManager;

@end
