//
//  President.m
//  Task_2
//
//  Created by Semyon Belokovsky on 06/07/16.
//  Copyright © 2016 Semyon Belokovsky. All rights reserved.
//

#import "President.h"

@implementation President

// Синтезировать свойство phone не нужно, тк оно синтезировано в родительском классе

- (void)sendFax:(id<Caller>)otherCaller {
    NSLog(@"President with phone %@ sends fax to phone: %@", self.phone, otherCaller.phone);
}

@end
