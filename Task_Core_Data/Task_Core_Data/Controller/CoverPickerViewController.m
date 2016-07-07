//
//  CoverPickerViewController.m
//  Task_Core_Data
//
//  Created by Semyon Belokovsky on 08/07/16.
//  Copyright © 2016 Semyon Belokovsky. All rights reserved.
//

#import "CoverPickerViewController.h"
#import "CoverCell.h"

@interface CoverPickerViewController ()

@property (nonatomic, strong) NSArray *covers;

@end

@implementation CoverPickerViewController

static NSString * const reuseIdentifier = @"CoverCell";

- (void)awakeFromNib {
    [super awakeFromNib];
    NSMutableArray *imagesArray = [NSMutableArray new];
    for (NSInteger i = 0; i < 50; i++) {
        NSString *imageName = [NSString stringWithFormat:@"cover_%02ld.jpg", (long)i];
        UIImage *image = [UIImage imageNamed:imageName];
        if (image) {
            [imagesArray addObject:image];
        }
    }
    self.covers = [NSArray arrayWithArray:imagesArray];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.covers.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CoverCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.coverImageView.image = self.covers[indexPath.row];
    
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedImage = self.covers[indexPath.row];
    [self performSegueWithIdentifier:@"Unwind" sender:self];
}

@end
