//
//  PTMutextLockHandle.h
//  Dispatch
//
//  Created by benwang on 2021/3/16.
//

#import "PTBaseLockHandle.h"

NS_ASSUME_NONNULL_BEGIN

@interface PTMutextLockHandle : PTBaseLockHandle

- (void)testRecusive;

- (void)testCondition;

@end

NS_ASSUME_NONNULL_END
