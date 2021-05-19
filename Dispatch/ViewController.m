//
//  ViewController.m
//  Dispatch
//
//  Created by benwang on 2021/3/13.
//

#import "ViewController.h"
#import "PTBaseLockHandle.h"
#import "PTSpinLockHandle.h"
#import "PTUnfairLockHandle.h"
#import "PTMutextLockHandle.h"
#import "PTNSLockHandle.h"
#import "PTNSConditionHandle.h"
#import "PTNSConditionLockHandle.h"
#import "PTSerialQueueHandle.h"
#import "PTSemaphoreHandle.h"
#import "PTSynchronizeHandle.h"
#import "PTMan.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


//    [NSRunLoop currentRunLoop].getCFRunLoop;
//    [NSRunLoop mainRunLoop];
//
//    CFRunLoopGetMain();
//    CFRunLoopGetCurrent();
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

//    id handle = [[PTSynchronizeHandle alloc] init];
//    [handle test];

    dispatch_queue_t global = dispatch_queue_create("global", DISPATCH_QUEUE_CONCURRENT);

    PTMan *man = [[PTMan alloc] init];

//    dispatch_async(global, ^{
//        for (NSInteger i = 0; i< 10; i++) {
//            man.age = i;
//            NSLog(@"%ld %@", man.age, [NSThread currentThread]);
//            sleep(1);
//        }
//    });
//
//    dispatch_async(global, ^{
//        for (NSInteger i = 11; i< 20; i++) {
//            man.age = i;
//            NSLog(@"%ld %@", man.age, [NSThread currentThread]);
//            sleep(1.1);
//        }
//    });

    man.age = 100;

    NSString *str = @"dneisnei";
    NSLog(@"0str: %@ %p %p", str, str, &str);

    [self change:man str:str];
    // 00 -> 00

    NSLog(@"3str: %@ %p", str, str);
    NSLog(@"2men: %ld %p %p", (long)man.age, man, &man);
}

- (void)change:(PTMan *)men str:(NSString *)str {

    NSLog(@"1men: %ld %p %p", (long)men.age, men, &men);
    NSLog(@"1str: %@ %p %p", str, str, &str);
    men.age = 80;
    str = @"str";
    NSLog(@"2str: %@ %p %p", str, str, &str);

    // 对象都是指针，通过传递指针来引用对象，对象实际存储在堆上，当没有引用时销毁
    // 当引用对象时，会复制指针的，指针依然指向同一个堆上的对象
    // 当对对象赋值时，会修改指针的指向，指针指向一块新的堆内存
}


@end
