//
//  PTSerialQueueHandle.m
//  Dispatch
//
//  Created by benwang on 2021/3/16.
//

#import "PTSerialQueueHandle.h"

@implementation PTSerialQueueHandle {
    dispatch_queue_t _serial;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _serial = dispatch_queue_create("serail", DISPATCH_QUEUE_SERIAL);
    }
    return self;
}

- (void)_saveMoney {
    dispatch_sync(_serial, ^{
        [super _saveMoney];
    });
}

- (void)_drawMoney {
    dispatch_sync(_serial, ^{
        [super _drawMoney];
    });
}
@end
