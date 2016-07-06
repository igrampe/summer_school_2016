//
//  Worker.m
//  Task_2
//
//  Created by Semyon Belokovsky on 06/07/16.
//  Copyright © 2016 Semyon Belokovsky. All rights reserved.
//

#import "Worker.h"

@implementation Worker

@synthesize phone; // Необходимо синтезировать свойство, описанное в протоколе Caller

- (void)call:(id<Caller>)otherCaller {
    NSLog(@"Worker with phone %@ calls to phone: %@", self.phone, otherCaller.phone);
}

@end
