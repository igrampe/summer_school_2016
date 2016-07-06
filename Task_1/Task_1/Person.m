//
//  Person.m
//  Task_1_1
//
//  Created by Semyon Belokovsky on 05/07/16.
//  Copyright © 2016 Semyon Belokovsky. All rights reserved.
//

#import "Person.h"

@implementation Person

// Перегружаем стандартный инициализатор
- (instancetype)init {
    self = [super init]; // Вызываем инициализатор базового класса
    if (self) {
        self.dogs = [[NSMutableArray alloc] init];
    }
    return self;
}

- (Dog *)mainDog {
    if (self.dogs.count > 5) {
        return self.dogs[5];
    }
    return nil;
}

+ (instancetype)personWithThreeDogs {
    Person *person = [Person new];
    for (int i = 0; i < 3; i++) {
        Dog *dog = [Dog new];
        dog.ownerName = [NSString stringWithFormat:@"owner %d", i];
        [person.dogs addObject:dog];
    }
    return person;
}

@end
