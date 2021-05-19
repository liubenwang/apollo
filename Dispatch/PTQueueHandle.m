//
//  PTQueueHandle.m
//  Dispatch
//
//  Created by benwang on 2021/3/18.
//

#import "PTQueueHandle.h"

@implementation PTQueueHandle

- (void)test2
{
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);

    dispatch_async(queue, ^{
        NSLog(@"1: %@", [NSThread currentThread]);
        // 这句代码的本质是往Runloop中添加定时器
        [self performSelector:@selector(test) withObject:nil afterDelay:.0];
        NSLog(@"3: %@", [NSThread currentThread]);

        //        [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc] init] forMode:NSDefaultRunLoopMode];
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    });
}

- (void)test
{
    NSLog(@"2: %@", [NSThread currentThread]);
}

- (void)beginTest {
    NSThread *thread = [[NSThread alloc] initWithBlock:^{
        NSLog(@"1: %@", [NSThread currentThread]);

        [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc] init] forMode:NSDefaultRunLoopMode];
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    }];
    [thread start];

    [self performSelector:@selector(test) onThread:thread withObject:nil waitUntilDone:YES];

    [self performSelector:@selector(test) withObject:nil];

    // 往runloop添加一个计时器
    dispatch_queue_t global = dispatch_get_global_queue(0, 0);
    dispatch_async(global, ^{

        NSLog(@"1: %@", [NSThread currentThread]);
        // NSTimer定时器，定时器需要加入到Runloop中，子线程默认没有启动runloop
        [self performSelector:@selector(test) withObject:nil afterDelay:.0];
        NSLog(@"3: %@", [NSThread currentThread]);

        [[NSRunLoop currentRunLoop] addPort:[NSPort new] forMode:NSDefaultRunLoopMode];
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    });

    dispatch_group_t group = dispatch_group_create();

    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);

    dispatch_group_async(group, queue, ^{
        for (int i = 0; i < 10; i++) {
            NSLog(@"任务一：%@", [NSThread currentThread]);
        }
    });

    dispatch_group_async(group, queue, ^{
        for (int i = 0; i < 10; i++) {
            NSLog(@"任务二：%@", [NSThread currentThread]);
        }
    });

    dispatch_group_notify(group, queue, ^{
        for (int i = 0; i < 10; i++) {
            NSLog(@"任务三：%@", [NSThread currentThread]);
        }
    });
}

- (void)dispatch {

//    dispatch_queue_t queue1 = dispatch_get_global_queue(0, 0);
//    dispatch_queue_t queue2 = dispatch_get_global_queue(0, 0);
//    dispatch_queue_t queue3 = dispatch_queue_create("queu3", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_queue_t queue4 = dispatch_queue_create("queu4", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_queue_t queue5 = dispatch_queue_create("queu5", DISPATCH_QUEUE_CONCURRENT);
//
//    NSLog(@"%p %p %p %p %p", queue1, queue2, queue3, queue4, queue5);
//
//    {
//        dispatch_queue_t main = dispatch_get_main_queue();
//        dispatch_async(main, ^{ // block0
//            NSLog(@"1: %@", [NSThread currentThread]);
//            dispatch_sync(main, ^{ // block1
//                NSLog(@"2: %@", [NSThread currentThread]);
//            });
//            NSLog(@"3: %@", [NSThread currentThread]);
//        });
//    }
//
//    {
//        dispatch_queue_t main = dispatch_get_main_queue();
//        dispatch_async(main, ^{ // block0
//            NSLog(@"1: %@", [NSThread currentThread]);
//            dispatch_async(main, ^{ // block1
//                NSLog(@"2: %@", [NSThread currentThread]);
//            });
//            NSLog(@"3: %@", [NSThread currentThread]);
//        });
//    }
//
//    {
//        dispatch_queue_t serial = dispatch_queue_create("serial", DISPATCH_QUEUE_SERIAL);
//        dispatch_async(serial, ^{
//            NSLog(@"1: %@", [NSThread currentThread]);
//            dispatch_sync(serial, ^{
//                NSLog(@"2: %@", [NSThread currentThread]);
//            });
//            NSLog(@"3: %@", [NSThread currentThread]);
//        });
//    }
//
//    {
//        dispatch_queue_t serial = dispatch_queue_create("serial", DISPATCH_QUEUE_SERIAL);
//        dispatch_async(serial, ^{
//            NSLog(@"1: %@", [NSThread currentThread]);
//            dispatch_async(serial, ^{
//                NSLog(@"2: %@", [NSThread currentThread]);
//            });
//            NSLog(@"3: %@", [NSThread currentThread]);
//        });
//    }
//
//
//    {
//        dispatch_queue_t global = dispatch_queue_create("concurrent", DISPATCH_QUEUE_CONCURRENT);
//        dispatch_async(global, ^{
//            NSLog(@"1: %@", [NSThread currentThread]);
//            dispatch_sync(global, ^{
//                NSLog(@"2: %@", [NSThread currentThread]);
//            });
//            NSLog(@"3: %@", [NSThread currentThread]);
//        });
//    } // 1 2 3
//
//    {
//        dispatch_queue_t global = dispatch_queue_create("concurrent", DISPATCH_QUEUE_CONCURRENT);
//        dispatch_async(global, ^{
//            NSLog(@"1: %@", [NSThread currentThread]);
//            dispatch_async(global, ^{
//                NSLog(@"2: %@", [NSThread currentThread]);
//            });
//            NSLog(@"3: %@", [NSThread currentThread]);
//        });
//    } // 1 3 2
//
//    {
//        dispatch_queue_t queue = dispatch_queue_create("myqueu", DISPATCH_QUEUE_SERIAL);
//        dispatch_queue_t queue2 = dispatch_queue_create("myqueu2", DISPATCH_QUEUE_CONCURRENT);
//        //    dispatch_queue_t queue2 = dispatch_queue_create("myqueu2", DISPATCH_QUEUE_SERIAL);
//
//        NSLog(@"1: %@", [NSThread currentThread]);
//        dispatch_async(queue, ^{ // 0
//            NSLog(@"2: %@", [NSThread currentThread]);
//
//            dispatch_sync(queue2, ^{ // 1
//                NSLog(@"3: %@", [NSThread currentThread]);
//            });
//
//            NSLog(@"4: %@", [NSThread currentThread]);
//        });
//        NSLog(@"5: %@", [NSThread currentThread]);
//
//    }
//
//    {
//
//        NSLog(@"执行任务1");
//
//        dispatch_queue_t queue = dispatch_queue_create("myqueu", DISPATCH_QUEUE_CONCURRENT);
//
//        dispatch_async(queue, ^{ // 0
//            NSLog(@"执行任务2");
//
//            dispatch_sync(queue, ^{ // 1
//                NSLog(@"执行任务3");
//            });
//
//            NSLog(@"执行任务4");
//        });
//
//        NSLog(@"执行任务5");
//    }
}


@end
