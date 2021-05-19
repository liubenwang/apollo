//
//  PTMutextLockHandle.m
//  Dispatch
//
//  Created by benwang on 2021/3/16.
//

#import "PTMutextLockHandle.h"
#import <pthread.h>

@implementation PTMutextLockHandle {

    pthread_mutex_t _lock;
    pthread_cond_t _cond;
    NSMutableArray *_marr;
}
- (instancetype)init
{
    self = [super init];
    if (self) {

        pthread_mutexattr_t _attr;
        pthread_mutexattr_init(&_attr);
        pthread_mutexattr_settype(&_attr, PTHREAD_MUTEX_RECURSIVE);
//        PTHREAD_MUTEX_RECURSIVE

        pthread_mutex_init(&_lock, &_attr);

        pthread_mutexattr_destroy(&_attr);

        // 初始化条件

        
        _marr = [NSMutableArray array];
    }
    return self;
}

- (void)dealloc {
    pthread_mutex_destroy(&_lock);
    pthread_cond_destroy(&_cond);
    NSLog(@"释放了");
}

- (void)_saveMoney {
    pthread_mutex_lock(&_lock);
    [super _saveMoney];
    pthread_mutex_unlock(&_lock);
}

- (void)_drawMoney {
    pthread_mutex_lock(&_lock);
    [super _drawMoney];
    pthread_mutex_unlock(&_lock);
}


- (void)testRecusive {
    static int a = 0;
    // 递归锁 在同一线程

    if (a > 10) {
        return;
    }
    dispatch_queue_t global = dispatch_get_global_queue(0, 0);
    dispatch_async(global, ^{
        pthread_mutex_lock(&self->_lock);
        a++;
        NSLog(@"递：%d %@", a, [NSThread currentThread]);
        [self testRecusive];
        NSLog(@"归：%d %@", a, [NSThread currentThread]);
        pthread_mutex_unlock(&self->_lock);
    });
}

- (void)testCondition {
    [[[NSThread alloc] initWithTarget:self selector:@selector(_remove) object: nil] start];
    [[[NSThread alloc] initWithTarget:self selector:@selector(_add) object: nil] start];
}

- (void)_remove {

    pthread_mutex_lock(&_lock);

    NSLog(@"开始删除");

    if (_marr.count == 0) {
        NSLog(@"等待信号");
        pthread_cond_wait(&_cond, &_lock);
    }
    NSLog(@"删除元素");
    [_marr removeLastObject];

    sleep(1);

    pthread_mutex_unlock(&_lock);

    sleep(1);

    NSLog(@"删除结束");
}

- (void)_add {

    sleep(1);

    NSLog(@"开始添加");
    pthread_mutex_lock(&_lock);

    sleep(1);

    [_marr addObject:@"aben"];
    NSLog(@"添加元素");

    // 发送通知
    NSLog(@"发送信号");
//    pthread_cond_signal(&_cond);
    pthread_cond_broadcast(&_cond);
    sleep(1);
    NSLog(@"信号回归");

    // 线程A，加锁后，进入条件等待时，相当于解锁
    // 线程B，加锁后，发送信号激活，解锁后，再激活线程A条件
    // 线程A的条件等待被激活，相当于再加锁，解锁后再释放资源。

    pthread_mutex_unlock(&_lock);
    sleep(1);
    NSLog(@"添加结束");
}

@end
