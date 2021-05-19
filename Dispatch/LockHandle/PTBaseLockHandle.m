//
//  PTBaseLockHandle.m
//  Dispatch
//
//  Created by benwang on 2021/3/15.
//

#import "PTBaseLockHandle.h"
#import <Foundation/Foundation.h>

@interface PTBaseLockHandle ()
@property (nonatomic, assign) NSInteger money;
@end

@implementation PTBaseLockHandle


// 存钱 取钱
- (void)test {

    self.money = 100;

    dispatch_queue_t global = dispatch_get_global_queue(0, 0);
    dispatch_async(global, ^{
        for (NSInteger i = 0; i < 10; i++) {
            [self _saveMoney];
        }
    });
    dispatch_async(global, ^{
        for (NSInteger i = 0; i < 10; i++) {
            [self _drawMoney];
        }
    });
}


- (void)_saveMoney {
    NSInteger money = self.money;
    sleep(0.2);
    money += 100;
    self.money = money;
    NSLog(@"剩余：%ld %@", self.money, [NSThread currentThread]);
}

- (void)_drawMoney {
    NSInteger money = self.money;
    sleep(0.2);
    money -= 100;
    self.money = money;
    NSLog(@"剩余：%ld %@", self.money, [NSThread currentThread]);
}

@end
