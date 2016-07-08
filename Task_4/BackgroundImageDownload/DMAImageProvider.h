//
//  DMAImageProvider.h
//  BackgroundImageDownload
//
//  Created by Demid Merzlyakov on 07.07.16.
//  Copyright © 2016 DMA. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  Слой абстракции вокруг загрузки изображений. Просто для того, чтобы сделать вид, что изображения у нас загружаются по сети (добавим задержку)
 */
@interface DMAImageProvider : NSObject

/**
 *  Метод, возвращающий singleton DMAImageProvider-а.
 */
+ (instancetype)sharedInstance;


/**
 *  Метод, "загружающий" изображение. У нас он никаких параметров не принимает, потому что картинка всего одна, но в теории может.
 */
- (UIImage *)getImage;

@end


// P.S. Мы в лекции не рассматривали модификаторы nonull, nullable, null_resettable.
// В реальном коде я бы их использовал, тут они отсутствуют для упрощения.
// Можно и без них, просто с ними удобнее работать с кодом извне. Плюс, облегчается интеграция со Swift.