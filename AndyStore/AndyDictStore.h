//
//  AndyDictStore.h
//  AndyStore_Test
//
//  Created by 李扬 on 16/6/23.
//  Copyright © 2016年 andyli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AndyDictStore.h"
#import "AndySingleton.h"

@interface AndyDictStore : NSObject

SingletonH(DictStore);

- (BOOL)setOrUpdateValue:(nonnull id)value ForKey:(nonnull NSString *)key;

- (nullable instancetype)getValueForKey:(nullable NSString *)key DefaultValue:(nullable id)defaultValue ;

- (void)removeValueForKey:(nullable NSString *)key;

- (void)clear;

@end
