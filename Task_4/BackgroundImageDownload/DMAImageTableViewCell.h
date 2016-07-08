//
//  DMAImageTableViewCell.h
//  BackgroundImageDownload
//
//  Created by Demid Merzlyakov on 07.07.16.
//  Copyright © 2016 DMA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DMAImageTableViewCell : UITableViewCell


/**
 *  Note: Изначально мы добавили тут (в интерфейсе) customImageView, но позднее перешли на установку image через setCustomImage.
 *  Так что, по идее, customImageView можно перенести в class extension (внутри .m файла), чтобы не давать пользователям возможности
 *  работать с customImageView напрямую.
 *
 */
@property (weak, nonatomic) IBOutlet UIImageView *customImageView;

-(void)setCustomImage;

@end
