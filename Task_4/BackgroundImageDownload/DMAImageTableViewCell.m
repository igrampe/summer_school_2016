//
//  DMAImageTableViewCell.m
//  BackgroundImageDownload
//
//  Created by Demid Merzlyakov on 07.07.16.
//  Copyright © 2016 DMA. All rights reserved.
//

#import "DMAImageTableViewCell.h"
#import "DMAImageProvider.h"

@interface DMAImageTableViewCell()

+ (NSOperationQueue *)imageDownloadQueue;

@end

@implementation DMAImageTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+(NSOperationQueue *)imageDownloadQueue {
    static NSOperationQueue *queue = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        queue = [[NSOperationQueue alloc] init];
    });
    
    return queue;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setCustomImage {
    // На самом деле, в реальной практике логика загрузки изображения была бы в том же DMAImageProvider. Уж точно не в ячейке.
    // Так что это просто для примера.
    
    NSOperationQueue *queue = [self.class imageDownloadQueue];
    
    [queue addOperationWithBlock:^{
        UIImage *image = [[DMAImageProvider sharedInstance] getImage];
        
        //Просто для разнообразия используем тут GCD:
        dispatch_async(dispatch_get_main_queue(), ^{
            self.customImageView.image = image;
        });
    }];
}

-(void)prepareForReuse {
    self.customImageView.image = nil;
}

@end
