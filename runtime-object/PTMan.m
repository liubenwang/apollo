//
//  PTMan.m
//  runtime-object
//
//  Created by benwang on 2021/4/15.
//

#import "PTMan.h"
#import <objc/runtime.h>

@implementation PTMan

- (void)greet:(NSString *)name age:(int)age {
    NSLog(@"greet: %@ %d", name, age);
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {

    if (sel == @selector(hello)) {
        Method method = class_getInstanceMethod(self, @selector(greet:age:));
        const char *types = method_getTypeEncoding(method);
        IMP imp = method_getImplementation(method);

        NSLog(@"%s %p %p", types, imp, self);

        class_addMethod(self, sel, imp, types);

        return YES;
    }

    return [super resolveInstanceMethod:sel];
}

@end
