//
//  NSObject+JSON.h
//  runtime-object
//
//  Created by benwang on 2021/4/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (JSON)

+ (instancetype)pt_objectWithDictionry:(NSDictionary *)dictonry;


- (void)print;

@end

NS_ASSUME_NONNULL_END
