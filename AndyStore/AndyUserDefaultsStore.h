//
//  AndyUserDefaultsStore.h
//  AndyStore_Test
//
//  Created by 李扬 on 16/6/23.
//  Copyright © 2016年 andyli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AndySingleton.h"

@interface AndyUserDefaultsStore : NSObject

SingletonH(UserDefaultsStore);

- (BOOL)setOrUpdateValue:(nonnull id)value ForKey:(nonnull NSString *)key;

- (nullable instancetype)getValueForKey:(nullable NSString *)key DefaultValue:(nullable id)defaultValue ;

- (BOOL)removeValueForKey:(nullable NSString *)key;

- (BOOL)clear;

@end
