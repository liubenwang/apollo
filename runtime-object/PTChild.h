//
//  PTChild.h
//  runtime-object
//
//  Created by benwang on 2021/4/15.
//

#import "PTMan.h"

NS_ASSUME_NONNULL_BEGIN

@interface PTChild : PTMan
@property (nonatomic, assign) int age;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) int count;
@property (nonatomic, strong) NSString *order;
@end

NS_ASSUME_NONNULL_END
