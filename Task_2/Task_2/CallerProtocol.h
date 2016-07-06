//
//  CallerProtocol.h
//  Task_2
//
//  Created by Semyon Belokovsky on 06/07/16.
//  Copyright © 2016 Semyon Belokovsky. All rights reserved.
//

#ifndef CallerProtocol_h
#define CallerProtocol_h

@protocol Caller <NSObject>

@property NSString *phone; // Телефон, необходимо синтезировать в имплементации класса, который реализует этот протокол

- (void)call:(id<Caller>)otherCaller;

@optional

- (void)sendFax:(id<Caller>)otherCaller;

@end

#endif /* CallerProtocol_h */
