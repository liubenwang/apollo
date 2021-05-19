//
//  PTBaseLockHandle.h
//  Dispatch
//
//  Created by benwang on 2021/3/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PTBaseLockHandle : NSObject


- (void)saveMoney;

- (void)drawMoney;

- (void)_saveMoney;

- (void)_drawMoney;

@end

NS_ASSUME_NONNULL_END
