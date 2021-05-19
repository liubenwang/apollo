//
//  PTMan.h
//  runtime-interview
//
//  Created by benwang on 2021/4/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PTMan : NSObject
@property (nonatomic, strong) NSString *name;
- (void)greet;
@end

NS_ASSUME_NONNULL_END
