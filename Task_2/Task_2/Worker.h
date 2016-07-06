//
//  Worker.h
//  Task_2
//
//  Created by Semyon Belokovsky on 06/07/16.
//  Copyright © 2016 Semyon Belokovsky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CallerProtocol.h"

@interface Worker : NSObject <Caller>

@property NSString *firstName;
@property NSString *lastName;

@end
