//
//  Person.h
//  AndyStore_Test
//
//  Created by 李扬 on 16/6/23.
//  Copyright © 2016年 andyli. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Dog;

@interface Person : NSObject

@property (nonatomic, assign) int age;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *address;

@property (nonatomic, strong) Dog *dog;

@property (nonatomic, strong) NSArray *toys;

@end
