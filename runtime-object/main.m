//
//  main.m
//  runtime-object
//
//  Created by benwang on 2021/4/13.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>


void test_array() {

    NSMutableArray *a1 = [NSMutableArray alloc];
    NSMutableArray *a2 = [NSMutableArray alloc];

    NSArray *b1 = [NSArray alloc];
    NSArray *b2 = [NSArray alloc];

    NSLog(@"a：%p %p", a1, a2);
    NSLog(@"a：%@ %@", [a1 class], [a2 class]);

    NSLog(@"b：%p %p", b1, b2);
    NSLog(@"b：%@ %@", [b1 class], [b2 class]);


    id a11 = [a1 init];
    id a22 = [a2 init];

    id b11 = [b1 init];
    id b22 = [b2 init];


    NSLog(@"a1：%p %p", a11, a22);
    NSLog(@"a1：%@ %@", [a11 class], [a22 class]);

    NSLog(@"b1：%p %p", b11, b22);
    NSLog(@"b1：%@ %@", [b11 class], [b22 class]);
}

void test_object() {

    NSObject *cls = [NSObject alloc];

    NSLog(@"cls: %@", cls);

    NSObject *a1 = [cls init];
    NSObject *a2 = [cls init];

    NSLog(@"a1: %@", a1);
    NSLog(@"a2: %@", a2);
}

int pow_1(int a, int b) {

    int sum = 1;
    for (NSInteger i = 0; i < b; i++) {
        sum *= a;
        NSLog(@"第%ld次", i);
    }
    return sum;
}

int pow_2(int a, int n) {
    int rs = 1;

    int count = 0;
    while (n) {
        if (n & 1) {
            rs *= a;
        }
        n >>= 1;
        a *= a;

        NSLog(@"第%ld次", count);
        count ++;
    }
    return rs;
}

#import "PTChild.h"
#import "NSObject+JSON.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

//        test_object();

//        Class benco = object_getClass([NSObject class]);
//
//        NSLog(@"%d", [NSObject isKindOfClass:[NSObject class]]); // 1
//        NSLog(@"%d", [NSObject isMemberOfClass:[NSObject class]]); // 0
//
//        NSObject *object = [[NSObject alloc] init];
//
//        NSLog(@"%d", [object isKindOfClass:[NSObject class]]); // 1
//        NSLog(@"%d", [object isMemberOfClass:[NSObject class]]); // 1
//
//        PTChild *man = [[PTChild alloc] init];
////        [man hello];
//
//        NSLog(@"%d", [PTChild isKindOfClass:[PTChild class]]); // 0
//        NSLog(@"%d", [PTChild isMemberOfClass:[PTChild class]]); // 0
//
//        NSLog(@"%d", [man isKindOfClass:[PTChild class]]); // 1
//        NSLog(@"%d", [man isMemberOfClass:[PTChild class]]); // 1
//        NSLog(@"%d", [man isMemberOfClass:[NSObject class]]); // 0
//
//        NSLog(@"%d", [PTChild isKindOfClass:[NSObject class]]); // 1
//        NSLog(@"%d", [PTChild isMemberOfClass:[NSObject class]]); // 0
//
//        Ivar ivar = class_getInstanceVariable([PTChild class], "_age");
//
//        object_setIvar(man, ivar, (__bridge id)(void *)10);
//
//        NSLog(@"%d", man.age);
//
//        unsigned int count;
//        Ivar *ls = class_copyIvarList([PTChild class], &count);
//
//        for (int i = 0; i < count; i++) {
//            Ivar iv = ls[i];
//
//            NSLog(@"%s %s", ivar_getName(iv), ivar_getTypeEncoding(iv));
//        }
//
//        free(ls);



//        NSDictionary *json = @{
//            @"age": @10,
//            @"name": @"benwang",
//            @"count": @110
//        };
//
//
//        void (^block)(void) = ^{
//            NSLog(@"打印了哈哈哈哈");
//        };
//
//
//        class_replaceMethod([PTChild class], @selector(print), imp_implementationWithBlock(block), "v@:");
//
//        PTChild *child = [PTChild pt_objectWithDictionry:json];
//
//        NSLog(@"************遍历************");
//
//        [child print];

//        Method nd = method





        // 利用关联对象给分类添加属性
        // 遍历类的所有成员变量： 修改占位文字颜色，归档解档，字典转模型
        // 交换方法实现：



        int sum = pow_2(3, 10);
        NSLog(@"%d", sum);


    }
    return 0;
}





