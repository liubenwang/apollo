//
//  PTMan.m
//  runtime-interview
//
//  Created by benwang on 2021/4/19.
//

#import "PTMan.h"

@implementation PTMan

- (void)greet {
    NSLog(@"PTMan: %@ %@", self, self->_name);
}

@end
