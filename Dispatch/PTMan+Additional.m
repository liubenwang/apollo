//
//  PTMan+Additional.m
//  Dispatch
//
//  Created by benwang on 2021/4/8.
//

#import "PTMan+Additional.h"
#import <objc/runtime.h>

@implementation PTMan (Additional)

- (NSString *)name {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setName:(NSString *)name {
    objc_setAssociatedObject(self, @selector(name), name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
