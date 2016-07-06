//
//  main.m
//  Task_2
//
//  Created by Semyon Belokovsky on 06/07/16.
//  Copyright © 2016 Semyon Belokovsky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSArray+Sum.h"
#import "Worker.h"
#import "Worker+Helpers.h"
#import "Boss.h"
#import "President.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Worker *worker1 = [Worker new];
        worker1.firstName = @"Василий";
        worker1.lastName = @"Петров";
        worker1.phone = @"111";
        
        Boss *boss1 = [Boss new];
        boss1.phone = @"222";
        
        President *president = [President new];
        president.phone = @"333";
        
        // Boss может позвонить Worker, тк worker реализует протокол Caller
        [boss1 call:worker1];
        
        // President может отправить факс
        [president sendFax:boss1];
        
        // Проверяем, может ли объект boss1 выполнить метод sendFax:
        if ([boss1 respondsToSelector:@selector(sendFax:)]) {
            [boss1 sendFax:president];
        } else {
            NSLog(@"no fax");
        }        
        
    }
    return 0;
}
