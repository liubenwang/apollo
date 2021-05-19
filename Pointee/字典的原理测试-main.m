//
//  main.m
//  Pointee
//
//  Created by benwang on 2021/3/12.
//

#import <Foundation/Foundation.h>

@interface KeyType : NSObject <NSCopying>
@property (nonatomic, strong) NSString *name;
@end

@implementation KeyType

- (instancetype)initWithName:(NSString *)name
{
    self = [super init];
    if (self) {
        self.name = name;
    }
    return self;
}

- (NSUInteger)hash {
    NSUInteger has = [super hash];
    NSLog(@"get hash: %lx", has);
    return has;
}

- (BOOL)isEqual:(id)object {
    BOOL ret =  [super isEqual: object];
    NSLog(@"is Equal: %p %p hash: %lx", self, object, [object hash]);
    return ret;
}

- (id)copyWithZone:(NSZone *)zone {
    NSLog(@"copyWithZone");
    KeyType *key = [[KeyType alloc] initWithName:self.name];
    NSLog(@"copyWithZone: %p %p hash: %lx", self, key, key.hash);
    return key;
}
@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {

//        NSMutableDictionary *map = [NSMutableDictionary dictionary];
//
//        KeyType *key1 = [[KeyType alloc] initWithName:@"keyType1"];
//        KeyType *key2 = [key1 copyWithZone:nil];
//
//        NSLog(@"%p %p", key1, key2);
//
//        NSLog(@"------------------");
//
//
//        [map setObject:@"benco" forKey:key2];
//        NSLog(@"retain count: %@", [key2 valueForKey:@"retainCount"]);
//
//
//
//        NSLog(@"------------------");
//        NSLog(@"key: %@", map[key2]);

        NSMutableDictionary *map = [NSMutableDictionary dictionary];

        KeyType *key = [[KeyType alloc] initWithName:@"keyType"];


        NSLog(@"retain count: %@", [key valueForKey:@"retainCount"]);
        [map setObject:key forKey:@"key"];
        NSLog(@"retain count: %@", [key valueForKey:@"retainCount"]);
        // 将对象作为value存入字典中，引用计数会 + 1


        [map setObject:@"benco" forKey:key];
        NSLog(@"retain count: %@", [key valueForKey:@"retainCount"]);

        // 将对象作为key存入字典时，会调用对象的hash方法，
        // 然后调用copyWithZone方法将对象复制一份，和value一起存入字典中，引用计数不会增加


        NSLog(@"key: %@", map[key]);
        // 使用对象作为key，读取value时，会调用对象的hash方法，然后调用isEqual方法获取key
        // 如上，为什么获取到value=nil呢？
        // 由于将对象作为Key与value一起存入字典时，复制了一份key，
        // 而用key读取value时，会通过isEqual判断内存地址是否相同，因为复制了一份，
        // 所以内存地址不同，读取不到value

        // NSString，
        // NSObject是将对象的地址作为hash值返回的

        NSLog(@"%p", key);
        NSLog(@"%lx", (unsigned long)key.hash);

    }
    return 0;
}

void test() {

    NSMutableDictionary *map = [NSMutableDictionary dictionary];

    KeyType *key = [[KeyType alloc] initWithName:@"keyType"];


    NSLog(@"retain count: %@", [key valueForKey:@"retainCount"]);
    [map setObject:key forKey:@"key"];
    NSLog(@"retain count: %@", [key valueForKey:@"retainCount"]);
    // 将对象作为value存入字典中，引用计数会 + 1


    NSLog(@"------------------");


    [map setObject:@"benco" forKey:key];
    NSLog(@"retain count: %@", [key valueForKey:@"retainCount"]);

    // 将对象作为key存入字典时，会调用对象的hash方法，
    // 然后调用copyWithZone方法将对象复制一份，和value一起存入字典中，引用计数不会增加

    NSLog(@"------------------");

    NSLog(@"key: %@", map[key]);
    // 使用对象作为key，读取value时，会调用对象的hash方法，然后调用isEqual方法获取key
    // 如上，为什么获取到value=nil呢？
    // 由于将对象作为Key与value一起存入字典时，复制了一份key，
    // 而用key读取value时，会通过isEqual判断内存地址是否相同，因为复制了一份，
    // 所以内存地址不同，读取不到value

    // NSString，
    // NSObject是将对象的地址作为hash值返回的
    NSLog(@"%p", key);
    NSLog(@"%lx", (unsigned long)key.hash);

}


void test1() {


}
