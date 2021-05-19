//
//  PTSpinLockHandle.m
//  Dispatch
//
//  Created by benwang on 2021/3/15.
//

#import "PTSpinLockHandle.h"
#import <Foundation/Foundation.h>
#import <libkern/OSAtomic.h>

@implementation PTSpinLockHandle {
    OSSpinLock lock;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        lock = OS_SPINLOCK_INIT;
    }
    return self;
}

- (void)_saveMoney {
    OSSpinLockLock(&lock);
    [super _saveMoney];
    OSSpinLockUnlock(&lock);
}

- (void)_drawMoney {
    OSSpinLockLock(&lock);
    [super _drawMoney];
    OSSpinLockUnlock(&lock);
}

@end
