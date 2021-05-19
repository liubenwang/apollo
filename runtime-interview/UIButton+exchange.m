//
//  UIButton+exchange.m
//  runtime-interview
//
//  Created by benwang on 2021/4/20.
//

#import "UIButton+exchange.h"
#import <objc/runtime.h>

@implementation UIButton (exchange)


+(void)load {
    // method_t ： SEL name; const char *types; IMP imp;
    Method method1 = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method method2 = class_getInstanceMethod(self, @selector(pt_sendAction:to:forEvent:));

    method_exchangeImplementations(method1, method2);
}

- (void)pt_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    [self pt_sendAction:action to:target forEvent:event];


}


@end
