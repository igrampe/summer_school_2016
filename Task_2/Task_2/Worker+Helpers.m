//
//  Worker+Helpers.m
//  Task_2
//
//  Created by Semyon Belokovsky on 06/07/16.
//  Copyright © 2016 Semyon Belokovsky. All rights reserved.
//

#import "Worker+Helpers.h"

@implementation Worker (Helpers)

- (NSString *)fullName {
    NSString *fullName = @"";
    if (self.firstName.length) {
        fullName = self.firstName;
    }
    if (self.lastName.length) {
        // Если полное имя содержит имя, добавим в него пробел, чтобы отделить фамилию от имени
        if (fullName.length) {
            fullName = [NSString stringWithFormat:@"%@ ", fullName];
        }
        // fullName уже содержит необхожимый пробел, либо fullName - пустая строка
        fullName = [NSString stringWithFormat:@"%@%@", fullName, self.lastName];
    }
    return fullName;
}

@end
