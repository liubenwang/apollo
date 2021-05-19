//
//  PTNSConditionHandle.h
//  Dispatch
//
//  Created by benwang on 2021/3/16.
//

#import "PTBaseLockHandle.h"

NS_ASSUME_NONNULL_BEGIN

@interface PTNSConditionHandle : PTBaseLockHandle

- (void)testCondition;

@end

NS_ASSUME_NONNULL_END
