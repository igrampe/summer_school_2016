//
//  NSArray+Sum.m
//  Task_2
//
//  Created by Semyon Belokovsky on 06/07/16.
//  Copyright © 2016 Semyon Belokovsky. All rights reserved.
//

#import "NSArray+Sum.h"

@implementation NSArray (Sum)

- (NSNumber *)sum {
    // Считаем, что все эелементы массива - экземпляры класса NSNumber,
    // которые хранят целочиселенные значения
    
    NSNumber *result = [NSNumber numberWithInteger:0];
    for (int i = 0; i < self.count; i++) {
        NSNumber *element = self[i];
        result = @(result.integerValue + element.integerValue);
    }
    return result;
}

@end
