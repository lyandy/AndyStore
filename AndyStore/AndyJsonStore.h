//
//  AndyJsonStore.h
//  AndyStore_Test
//
//  Created by 李扬 on 16/6/23.
//  Copyright © 2016年 andyli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AndySingleton.h"

@interface AndyJsonStore : NSObject

SingletonH(JsonStore);

- (BOOL)setOrUpdateValue:(nonnull id)value ForKey:(nonnull NSString *)key;

- (nullable instancetype)getValueForClass:(nullable Class)valueClass ForKey:(nullable NSString *)key DefaultValue:(nullable id)defaultValue ;

- (BOOL)removeValueForKey:(nullable NSString *)key;

- (BOOL)clear;

@end
