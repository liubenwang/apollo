//
//  NSObject+JSON.m
//  runtime-object
//
//  Created by benwang on 2021/4/20.
//

#import "NSObject+JSON.h"
#import <objc/runtime.h>

@implementation NSObject (JSON)

+ (instancetype)pt_objectWithDictionry:(NSDictionary *)dictonry {

    /**
     1. 继承体系
     2. 参数缺省
     3. 参数大小写或驼形转换

     */
    id obj = [[self alloc] init];

    unsigned int count;
    Ivar *ivars = class_copyIvarList([self class], &count);

    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];


        NSMutableString *key = [NSMutableString stringWithUTF8String:ivar_getName(ivar)];
        if ([key hasPrefix:@"_"]) {
            [key deleteCharactersInRange:NSMakeRange(0, 1)];
        }

        if ([dictonry.allKeys containsObject:key]) {
            [obj setValue:dictonry[key] forKey:key];
            NSLog(@"%@=%@", key, dictonry[key]);
        } else {
            NSLog(@"****** 缺省值：%@", key);
        }
    }

    free(ivars);

    return obj;
}


- (void)print {

//        id ivarValue = nil;
//
//        if ([ivarType isEqualToString:@"q"]) {
//            long long v = ((long long (*)(id, Ivar))object_getIvar)(man, ivar);
//        } else {
//            ivarValue = object_getIvar(self, ivar);
//        }

    unsigned int count;
    Ivar *ivars = class_copyIvarList([self class], &count);

    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];

        NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
        NSLog(@"%@ = %@", key, [self valueForKey:key]);
    }

    free(ivars);
}


@end
