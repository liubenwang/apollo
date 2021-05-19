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

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.money = 100;
    }
    return self;
}

// 存钱 取钱
- (void)saveMoney {
    dispatch_queue_t global = dispatch_queue_create("save", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(global, ^{
        for (NSInteger i = 0; i < 10; i++) {
            [self _saveMoney];
        }
    });
}

- (void)drawMoney {
    dispatch_queue_t global = dispatch_queue_create("draw", DISPATCH_QUEUE_CONCURRENT);
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
