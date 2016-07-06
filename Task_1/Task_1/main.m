//
//  main.m
//  Task_1
//
//  Created by Semyon Belokovsky on 06/07/16.
//  Copyright © 2016 Semyon Belokovsky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *person1 = [Person new];
        
        for (int i = 0; i < 5; i++) {
            Dog *dog = [Dog new];
            dog.ownerName = [NSString stringWithFormat:@"Vasya %d", i];
            [person1.dogs addObject:dog];
        }
        [person1.dogs[1] sayHello];
        
        [[person1 mainDog] sayHello];
    }
    return 0;
}
