//
//  AndyDictStore.m
//  AndyStore_Test
//
//  Created by 李扬 on 16/6/23.
//  Copyright © 2016年 andyli. All rights reserved.
//

#import "AndyDictStore.h"
#import "AndyStoreConst.h"

@implementation AndyDictStore
{
    dispatch_queue_t _concurrent_queue;
    NSMutableDictionary *_dictM;
}

static id instance = nil;

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t oneToken;
    
    dispatch_once(&oneToken, ^{
        instance = [super allocWithZone:zone];
    });
    
    return instance;
}

- (id)copyWithZone:(NSZone *)zone
{
    return instance;
}

- (id)mutableCopyWithZone:(NSZone *)zone
{
    return instance;
}

- (instancetype)init
{
    static dispatch_once_t oneToken;
    
    dispatch_once(&oneToken, ^{
        instance = [super init];
        _concurrent_queue = dispatch_queue_create("dictM_read_write_queue", DISPATCH_QUEUE_CONCURRENT);
        _dictM = [NSMutableDictionary dictionary];
    });
    
    return instance;
}

+ (instancetype)sharedDictStore
{
    return [[self alloc] init];
}

- (BOOL)setOrUpdateValue:(id)value ForKey:(NSString *)key
{
    AndyStoreAssert(value != nil && key != nil, @"AndyDictStore setOrUpdateValue:ForKey: value or key can not be nil");
    
    if (value != nil && key != nil)
    {
        @try {
        
            dispatch_barrier_sync(_concurrent_queue, ^{
                if ([_dictM objectForKey:key] != nil)
                {
                    _dictM[key] = value;
                }
                else
                {
                    [_dictM setObject:value forKey:key];
                }
            });
            return YES;
        } @catch (NSException *exception) {
            return NO;
        }
    }
    else
    {
        return NO;
    }
}

- (instancetype)getValueForKey:(NSString *)key DefaultValue:(id)defaultValue
{
    __block id value = nil;
    
    dispatch_sync(_concurrent_queue, ^{
        value = [_dictM objectForKey:key];
    });
    
    if (value != nil)
    {
        return value;
    }
    else
    {
        return defaultValue;
    }
}

- (void)removeValueForKey:(NSString *)key
{
    dispatch_barrier_async(_concurrent_queue, ^{
        [_dictM removeObjectForKey:key];
    });
}

- (void)clear
{
    dispatch_barrier_async(_concurrent_queue, ^{
        [_dictM removeAllObjects];
    });
}


@end
