//
//  Dog.m
//  Task_1_1
//
//  Created by Semyon Belokovsky on 05/07/16.
//  Copyright © 2016 Semyon Belokovsky. All rights reserved.
//

#import "Dog.h"

@implementation Dog

- (void)sayHello {
    NSLog(@"hello, %@", self.ownerName);
}

- (void)sayGoodbye:(NSString *)name {
    NSLog(@"goodbye %@", name);
}

@end
