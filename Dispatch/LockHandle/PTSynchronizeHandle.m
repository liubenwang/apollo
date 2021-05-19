//
//  PTSynchronizeHandle.m
//  Dispatch
//
//  Created by benwang on 2021/3/16.
//

#import "PTSynchronizeHandle.h"

@implementation PTSynchronizeHandle


- (void)_saveMoney {
    // 性能比较差 底层实现是pthread_mutex_t的
    @synchronized (self.class) {
        [super _saveMoney];
    };
}

- (void)_drawMoney {
    @synchronized (self.class) {
        [super _drawMoney];
    };
}


@end
