//
//  DMAImageProvider.m
//  BackgroundImageDownload
//
//  Created by Demid Merzlyakov on 07.07.16.
//  Copyright © 2016 DMA. All rights reserved.
//

#import "DMAImageProvider.h"

@implementation DMAImageProvider

+ (instancetype)sharedInstance {
    static DMAImageProvider *instance = nil;

    //Стандартный способ создания singleton-а:
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [DMAImageProvider new];
    });
    
    
    //Другой вариант реализации синглтона:
    @synchronized (self) { //Это статический метод (метод класса), так что self здесь – сам класс DMAImageProvider.
        if (!instance) {
            instance = [DMAImageProvider new];
        }
        //Проблема: в качестве объекта синзронизации мы используем [DMAImageProvider class], который доступен вовне.
        //Если кто-то в стороннем коде попробует сделать то же самое по неизвестной причие (например, голоса в голове сказали),
        //могут возникнуть проблемы.
    }

    
    //НЕПРАВИЛЬНЫЙ вариант реализации синглтона:
//    if (instance == nil) {
//        instance = [DMAImageProvider new];
//    }

    
    
    //Пример организации критической секции (участок кода, который может выполняться только одним потоком одновременно):
//    static NSObject *locker = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        locker = [NSObject new];
//    });
//    
//    @synchronized (locker) {
//        //Критическая секция
//    }
    
    
    return instance;
}

-(UIImage *)getImage {
//    Пример загрузки по сети:
    
//    NSURL *imageUrl = [NSURL URLWithString:@"https://dl.dropboxusercontent.com/u/27054216/%D0%9F%D1%80%D0%B8%D0%BA%D0%BE%D0%BB%D1%8B%29/%D0%A1%D0%B5%D0%B9%D1%87%D0%B0%D1%81%20%D0%BC%D0%BE%D0%B4%D0%BD%D0%BE%20%D0%B2%D1%8B%D0%B3%D0%BB%D1%8F%D0%B4%D0%B5%D1%82%D1%8C%20%D0%BA%D0%B0%D0%BA%20%D0%B4%D1%80%D0%BE%D0%B2%D0%BE%D1%81%D0%B5%D0%BA%2C%20%D0%BA%D0%BE%D1%82%D0%BE%D1%80%D1%8B%D0%B9%20%D0%BD%D0%B5%20%D1%80%D1%83%D0%B1%D0%B8%D1%82%20%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D1%8C%D1%8F%2C%20%D0%B0%20%D1%86%D0%B5%D0%BB%D1%8B%D0%B9%20%D0%B4%D0%B5%D0%BD%D1%8C%20%D1%83%D1%85%D0%B0%D0%B6%D0%B8%D0%B2%D0%B0%D0%B5%D1%82%20%D0%B7%D0%B0%20%D1%81%D0%BE%D0%B1%D0%BE%D0%B9%2C%20%D1%87%D1%82%D0%BE%D0%B1%D1%8B%20%D0%BF%D0%BE%D0%BD%D1%80%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%D1%81%D1%8F%20%D0%B4%D1%80%D1%83%D0%B3%D0%B8%D0%BC%20%D0%B4%D1%80%D0%BE%D0%B2%D0%BE%D1%81%D0%B5%D0%BA%D0%B0%D0%BC.jpg"];
//    NSData *data = [NSData dataWithContentsOfURL:imageUrl];
//    UIImage *image = [[UIImage alloc] initWithData:data];
    
    NSLog(@"Request image");
    UIImage *image = [UIImage imageNamed:@"image"];
    [NSThread sleepForTimeInterval:5];
    NSLog(@"Got image");
    return image;
}

@end
