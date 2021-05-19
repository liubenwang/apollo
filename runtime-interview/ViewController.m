//
//  ViewController.m
//  runtime-interview
//
//  Created by benwang on 2021/4/19.
//

#import "ViewController.h"
#import "PTMan.h"
#import "PTStudent.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    // 题目二：打印何种内容，为什么？
//
//    // 第一种调用方式：
//    Class cls = [PTMan class];
//
//    void *obj = &cls;
//
//    [(__bridge id)obj greet];
//
//
//    // 第二种调用方式：
//    [self another];


    // 类簇 NSString NSArray NSDictionary


    // 方法交换

    PTStudent *st = [[PTStudent alloc] init];
    [st greet];


    PTMan *man = [[PTMan alloc] init];
    [man greet];


    NSLog(@"开始交换方法实现");


    Method stMethod = class_getInstanceMethod([PTStudent class], @selector(greet));
    Method neMethod = class_getInstanceMethod([self class], @selector(vc_print));

    method_exchangeImplementations(stMethod, neMethod);

    [st greet];

    [man greet];

    self.view.safeAreaInsets;
    self.view.safeAreaLayoutGuide.layoutFrame;
    self.additionalSafeAreaInsets
}

- (void)vc_print {
    NSLog(@"vc: %@", self);
}

- (void)another {

    NSObject *object = [[NSObject alloc] init];

    Class cls = [PTMan class];

    void *obj = &cls;

    [(__bridge id)obj greet];
}


@end
