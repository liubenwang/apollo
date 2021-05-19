//
//  PTNSConditionHandle.m
//  Dispatch
//
//  Created by benwang on 2021/3/16.
//

#import "PTNSConditionHandle.h"

@implementation PTNSConditionHandle {
    NSMutableArray *_marr;
    NSCondition *_cond;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _cond = [[NSCondition alloc] init];
        _marr = [NSMutableArray array];
    }
    return self;
}

- (void)testCondition {
    [[[NSThread alloc] initWithTarget:self selector:@selector(_remove) object: nil] start];
    [[[NSThread alloc] initWithTarget:self selector:@selector(_add) object: nil] start];
}

- (void)_remove {

    [_cond lock];

    NSLog(@"开始删除");

    if (_marr.count == 0) {
        NSLog(@"等待信号");
        [_cond wait];
    }
    NSLog(@"删除元素");
    [_marr removeLastObject];

    sleep(1);

    [_cond unlock];

    sleep(1);

    NSLog(@"删除结束");
}

- (void)_add {

    sleep(1);

    NSLog(@"开始添加");
    [_cond lock];

    sleep(1);

    [_marr addObject:@"aben"];
    NSLog(@"添加元素");

    // 发送通知
    NSLog(@"发送信号");
    [_cond signal];
//    [_cond broadcast];
    sleep(1);
    NSLog(@"信号回归");

    // 线程A，加锁后，进入条件等待时，相当于解锁
    // 线程B，加锁后，发送信号激活，解锁后，再激活线程A条件
    // 线程A的条件等待被激活，相当于再加锁，解锁后再释放资源。

    [_cond unlock];
    sleep(1);
    NSLog(@"添加结束");
}


@end
