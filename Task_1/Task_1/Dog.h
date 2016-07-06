//
//  Dog.h
//  Task_1_1
//
//  Created by Semyon Belokovsky on 05/07/16.
//  Copyright © 2016 Semyon Belokovsky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dog : NSObject

@property NSString *ownerName;

- (void)sayHello;
- (void)sayGoodbye:(NSString *)name;

@end
