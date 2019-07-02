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

SingletonM(DictStore)

static NSMutableDictionary *dictM;

- (BOOL)setOrUpdateValue:(id)value ForKey:(NSString *)key
{
    AndyStoreAssert(value != nil && key != nil, @"AndyDictStore setOrUpdateValue:ForKey: value or key can not be nil");
    
    if (value != nil && key != nil)
    {
        @try {
            
            AndySemaphoreBegin
            
            if (dictM == nil)
            {
                dictM = [NSMutableDictionary dictionary];
            }
            
            if ([dictM objectForKey:key] != nil)
            {
                dictM[key] = value;
            }
            else
            {
                [dictM setObject:value forKey:key];
            }
            
            AndySemaphoreEnd
            
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
    AndySemaphoreBegin
    
    id value = [dictM objectForKey:key];
    
    AndySemaphoreEnd
    
    if (value != nil)
    {
        return value;
    }
    else
    {
        return defaultValue;
    }
}

- (BOOL)removeValueForKey:(NSString *)key
{
    AndySemaphoreBegin
    
    [dictM removeObjectForKey:key];
    
    AndySemaphoreEnd
    
    return YES;
}

- (BOOL)clear
{
    AndySemaphoreBegin
    
    [dictM removeAllObjects];
    
    AndySemaphoreEnd
    
    return YES;
}


@end
