//
//  PTSemaphoreHandle.m
//  Dispatch
//
//  Created by benwang on 2021/3/16.
//

#import "PTSemaphoreHandle.h"

@implementation PTSemaphoreHandle {
    dispatch_semaphore_t _semaphore;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _semaphore = dispatch_semaphore_create(1);
    }
    return self;
}

- (void)test_semaphore {
    for (NSInteger i = 0; i < 20; i++) {
        [[[NSThread alloc] initWithTarget:self selector:@selector(selector) object:nil] start];
    }
}

- (void)selector {

    // 信号量，控制线程并发访问的最大数量
    dispatch_semaphore_wait(_semaphore, DISPATCH_TIME_FOREVER);

    NSLog(@"%@", [NSThread currentThread]);
    sleep(5);

    dispatch_semaphore_signal(_semaphore);

    // 如果信号量<=0，线程会进入休眠等待状态，直到信号量值大于零
    // 如果信号量>0，信号量的值减一，继续往下执行
}


// 使用信号量控制并发量保证线程同步
- (void)_saveMoney {
    dispatch_semaphore_wait(_semaphore, DISPATCH_TIME_FOREVER);
    [super _saveMoney];
    dispatch_semaphore_signal(_semaphore);
}

- (void)_drawMoney {
    dispatch_semaphore_wait(_semaphore, DISPATCH_TIME_FOREVER);
    [super _drawMoney];
    dispatch_semaphore_signal(_semaphore);
}

@end
