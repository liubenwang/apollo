//
//  PTUnfairLockHandle.m
//  Dispatch
//
//  Created by benwang on 2021/3/15.
//

#import "PTUnfairLockHandle.h"
#import <os/lock.h>

@interface PTUnfairLockHandle ()
@property (nonatomic, assign) os_unfair_lock lock;
@end

@implementation PTUnfairLockHandle

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.lock = OS_UNFAIR_LOCK_INIT;
    }
    return self;
}

- (void)_saveMoney {
    os_unfair_lock_lock(&_lock);
    [super _saveMoney];
    os_unfair_lock_unlock(&_lock);
}

- (void)_drawMoney {
    os_unfair_lock_lock(&_lock);
    [super _drawMoney];
    os_unfair_lock_unlock(&_lock);
}

@end
