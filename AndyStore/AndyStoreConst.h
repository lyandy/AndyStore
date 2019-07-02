//
//  AndyStoreConst.h
//  AndyStore_Test
//
//  Created by 李扬 on 2017/2/23.
//  Copyright © 2017年 andyli. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ANDYSTORE_EXTERN UIKIT_EXTERN

#define AndyStoreAssert(condition, desc, ...)  NSAssert(condition, desc, ##__VA_ARGS__)

#define AndyStoreDeprecated(instead) NS_DEPRECATED(2_0, 2_0, 2_0, 2_0, instead)

#define AndySemaphoreBegin \
static dispatch_semaphore_t semaphore; \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
semaphore = dispatch_semaphore_create(1); \
}); \
dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);

#define AndySemaphoreEnd \
dispatch_semaphore_signal(semaphore);
