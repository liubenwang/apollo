//
//  PTNSLockHandle.m
//  Dispatch
//
//  Created by benwang on 2021/3/16.
//

#import "PTNSLockHandle.h"


@implementation PTNSLockHandle {
    NSLock *_lock;
    NSRecursiveLock *_rsLock;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _lock = [[NSLock alloc] init];
        _rsLock = [[NSRecursiveLock alloc] init];
    }
    return self;
}

- (void)_saveMoney {
    [_lock lock];
    [super _saveMoney];
    [_lock unlock];
}

- (void)_drawMoney {
    [_lock lock];
    [super _drawMoney];
    [_lock unlock];
}

#pragma mark -

- (void)testRecusive {
    static int a = 0;
    // 递归锁 在同一线程

    if (a > 10) {
        return;
    }
    dispatch_queue_t global = dispatch_get_global_queue(0, 0);
    dispatch_async(global, ^{
        [self->_rsLock lock];
        a++;
        NSLog(@"递：%d %@", a, [NSThread currentThread]);
        [self testRecusive];
        NSLog(@"归：%d %@", a, [NSThread currentThread]);
        [self->_rsLock unlock];
    });
}

@end
