//
//  Person.m
//  AndyStore_Test
//
//  Created by 李扬 on 16/6/23.
//  Copyright © 2016年 andyli. All rights reserved.
//

#import "Person.h"
#import "AndyExtension.h"
#import "Toy.h"

@implementation Person

+ (NSDictionary *)andy_objectClassInArray
{
    return @{@"toys" : [Toy class]};
}

@end
