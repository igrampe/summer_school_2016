//
//  Person.h
//  Task_1_1
//
//  Created by Semyon Belokovsky on 05/07/16.
//  Copyright © 2016 Semyon Belokovsky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"

@interface Person : NSObject

@property NSMutableArray *dogs;

- (Dog *)mainDog;

// Метод класса (статический метод)
+ (instancetype)personWithThreeDogs;

@end
