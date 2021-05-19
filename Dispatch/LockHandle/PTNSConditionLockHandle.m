//
//  PTNSConditionLockHandle.m
//  Dispatch
//
//  Created by benwang on 2021/3/16.
//

#import "PTNSConditionLockHandle.h"

@implementation PTNSConditionLockHandle {
    NSConditionLock *_lock;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _lock = [[NSConditionLock alloc] initWithCondition:1];
    }
    return self;
}

- (void)test {
    [[[NSThread alloc] initWithTarget:self selector:@selector(one) object:nil] start];
    [[[NSThread alloc] initWithTarget:self selector:@selector(two) object:nil] start];
    [[[NSThread alloc] initWithTarget:self selector:@selector(three) object:nil] start];

//    dispatch_queue_t global = dispatch_get_global_queue(0, 0);
//    for (id i in @[@1,@2,@3,@4,@5]) {
//        dispatch_async(global, ^{
//            [self lockni];
//        });
//    }
}

- (void)lockni {
    NSLog(@"加锁");
    [_lock lockWhenCondition:1];
    sleep(1);
    NSLog(@"处理");
    [_lock unlockWithCondition:2];
    NSLog(@"解锁");

    NSLog(@"加锁 3");
    [_lock lockWhenCondition:3];
    sleep(1);
    NSLog(@"处理 3");
    [_lock unlock];
    NSLog(@"解锁 3");

}

- (void)one {

    [_lock lock];
    NSLog(@"%s", __func__);
    sleep(1);
    [_lock unlockWithCondition:2];
}

- (void)two {
    [_lock lockWhenCondition:2];
    NSLog(@"%s", __func__);
    sleep(1);
    [_lock unlockWithCondition:3];
}

- (void)three {
    [_lock lockWhenCondition:3];
    NSLog(@"%s", __func__);
    sleep(1);
    [_lock unlock];
}

@end


