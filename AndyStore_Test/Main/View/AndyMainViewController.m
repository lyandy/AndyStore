//
//  AndyMainViewController.m
//  AndyStore_Test
//
//  Created by 李扬 on 16/6/23.
//  Copyright © 2016年 andyli. All rights reserved.
//

#import "AndyMainViewController.h"
#import "Person.h"
#import "Dog.h"
#import "Toy.h"
#import "AndyStore.h"

@interface AndyMainViewController ()

@property (weak, nonatomic) IBOutlet UIButton *jsonWriteBtn;
@property (weak, nonatomic) IBOutlet UIButton *jsonReadBtn;
@property (weak, nonatomic) IBOutlet UIButton *jsonDeleteBtn;
@property (weak, nonatomic) IBOutlet UIButton *jsonClearBtn;

@property (weak, nonatomic) IBOutlet UIButton *userDefaultsWriteBtn;
@property (weak, nonatomic) IBOutlet UIButton *userDefaultReadBtn;
@property (weak, nonatomic) IBOutlet UIButton *userDefaultsDeleteBtn;
@property (weak, nonatomic) IBOutlet UIButton *userDefaultsClearBtn;

@property (weak, nonatomic) IBOutlet UIButton *dictWriteBtn;
@property (weak, nonatomic) IBOutlet UIButton *dictReadBtn;
@property (weak, nonatomic) IBOutlet UIButton *dictDeleteBtn;
@property (weak, nonatomic) IBOutlet UIButton *dictClearBtn;

@property (nonatomic, strong) Person *person;

@end

@implementation AndyMainViewController

static NSString *key = @"test";

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupInitData];
    
    [self setupAutoLayout];
}

- (void)setupInitData
{
    Person *p = [[Person alloc] init];
    p.age = 5;
    p.name = @"莉莉";
    p.address = @"北京";
    
    Dog *dog = [[Dog alloc] init];
    dog.name = @"泰迪";
    
    p.dog = dog;
    
    Toy *t1 = [[Toy alloc] init];
    t1.price = 34.4;
    t1.name = @"变形金刚1";
    
    Toy *t2 = [[Toy alloc] init];
    t2.price = 44.4;
    t2.name = @"变形金刚2";
    
    Toy *t3 = [[Toy alloc] init];
    t3.price = 54.4;
    t3.name = @"变形金刚3";
    
    p.toys = [NSArray arrayWithObjects:t1, t2, t3, nil];
    
    self.person = p;

}

- (void)setupAutoLayout
{
    CGFloat commonVeticalMargin = 50;
    CGFloat commonHorizontalMargin = 10;
    
    [self.jsonWriteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.left).offset(commonHorizontalMargin);
        make.top.equalTo(self.view.top).offset(commonVeticalMargin);
    }];
    
    [self.jsonReadBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.jsonWriteBtn.left);
        make.top.equalTo(self.jsonWriteBtn.bottom).offset(commonVeticalMargin);
    }];
    
    [self.jsonDeleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.jsonWriteBtn.left);
        make.top.equalTo(self.jsonReadBtn.bottom).offset(commonVeticalMargin);
    }];
    
    [self.jsonClearBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.jsonWriteBtn.left);
        make.top.equalTo(self.jsonDeleteBtn.bottom).offset(commonVeticalMargin);
    }];
    
    
    [self.userDefaultsWriteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.centerX);
        make.top.equalTo(self.view.top).offset(commonVeticalMargin);
    }];
    
    [self.userDefaultReadBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.userDefaultsWriteBtn.centerX);
        make.top.equalTo(self.userDefaultsWriteBtn.bottom).offset(commonVeticalMargin);
    }];
    
    [self.userDefaultsDeleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.userDefaultsWriteBtn.centerX);
        make.top.equalTo(self.userDefaultReadBtn.bottom).offset(commonVeticalMargin);
    }];
    
    [self.userDefaultsClearBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.userDefaultsWriteBtn.centerX);
        make.top.equalTo(self.jsonDeleteBtn.bottom).offset(commonVeticalMargin);
    }];
    
    [self.dictWriteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.right).offset(-commonHorizontalMargin);
        make.top.equalTo(self.view.top).offset(commonVeticalMargin);
    }];
    
    [self.dictReadBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.dictWriteBtn.right);
        make.top.equalTo(self.dictWriteBtn.bottom).offset(commonVeticalMargin);
    }];
    
    [self.dictDeleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.dictWriteBtn.right);
        make.top.equalTo(self.dictReadBtn.bottom).offset(commonVeticalMargin);
    }];
    
    [self.dictClearBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.dictWriteBtn.right);
        make.top.equalTo(self.dictDeleteBtn.bottom).offset(commonVeticalMargin);
    }];
}

#pragma mark - AndyJsonStore方法 持久化存储，任何类型，基于AndyExtension实现

#pragma mark 存储
- (IBAction)btnJsonWrite:(UIButton *)sender
{
    [[AndyJsonStore sharedJsonStore] setOrUpdateValue:self.person ForKey:key];
    
//    //单例测试
//    AndyJsonStore *j1 = [AndyJsonStore sharedJsonStore];
//    AndyJsonStore *j2 = [AndyJsonStore sharedJsonStore];
//    AndyJsonStore *j3 = [AndyJsonStore sharedJsonStore];
//    AndyJsonStore *j4 = [AndyJsonStore sharedJsonStore];
//    
//    AndyLog(@"%p, %p, %p, %p", j1, j2, j3, j4);
//    AndyLog(@"%@, %@, %@, %@", j1, j2, j3, j4);
}

#pragma mark 读取
- (IBAction)btnJsonRead:(UIButton *)sender
{
    id value = [[AndyJsonStore sharedJsonStore] getValueForClass:[Person class] ForKey:@"test" DefaultValue:nil];
    
    AndyLog(@"%@", value);
}

#pragma mark 删除
- (IBAction)btnJsonDelete:(UIButton *)sender
{
    [[AndyJsonStore sharedJsonStore] removeValueForKey:key];
}

#pragma mark 清空
- (IBAction)btnJsonClear:(UIButton *)sender
{
    [[AndyJsonStore sharedJsonStore] clear];
}


#pragma mark - AndyUserDefaultsStore方法，持久化存储，基本数据对象类型，基于NSUserDefaults实现

#pragma mark 存储
- (IBAction)btnUserDefaultsWrite:(UIButton *)sender
{
    [[AndyUserDefaultsStore sharedUserDefaultsStore] setOrUpdateValue:@34534534 ForKey:key];
}

#pragma mark 读取
- (IBAction)btnUserDefaultsRead:(UIButton *)sender
{
    id value = [[AndyUserDefaultsStore sharedUserDefaultsStore] getValueForKey:key DefaultValue:nil];
    
    AndyLog(@"%@", value);
}

#pragma mark 删除
- (IBAction)btnUserDefaultsDelete:(UIButton *)sender
{
    [[AndyUserDefaultsStore sharedUserDefaultsStore] removeValueForKey:key];
}

#pragma mark 清除
- (IBAction)btnUserDefaultsClear:(UIButton *)sender
{
    [[AndyUserDefaultsStore sharedUserDefaultsStore] clear];
}


#pragma mark - AndyDictStore方法，临时村粗，任何类型，基于NSMutableDictionary实现

#pragma mark 存储
- (IBAction)btnDictWrite:(UIButton *)sender
{
    //[[AndyDictStore sharedDictStore] setOrUpdateValue:self.person ForKey:key];
    
    [[AndyDictStore sharedDictStore] copy];
}

#pragma mark 读取
- (IBAction)btnDictRead:(UIButton *)sender
{
    id value = [[AndyDictStore sharedDictStore] getValueForKey:key DefaultValue:nil];
    
    AndyLog(@"%@", value);
}

#pragma mark 删除
- (IBAction)btnDictDelete:(UIButton *)sender
{
    [[AndyDictStore sharedDictStore] removeValueForKey:key];
}

#pragma mark 清除
- (IBAction)btnDictClear:(UIButton *)sender
{
    [[AndyDictStore sharedDictStore] clear];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end



































