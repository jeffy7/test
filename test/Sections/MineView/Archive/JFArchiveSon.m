//
//  JFArchiveSon.m
//  test
//
//  Created by je_ffy on 2017/3/9.
//  Copyright © 2017年 je_ffy. All rights reserved.
//

#import "JFArchiveSon.h"

@interface JFArchiveSon ()

@end

@implementation JFArchiveSon


/**
 old
 
 - (id)initWithCoder:(NSCoder *)aDecoder {
     if (self = [super init]) {
         self.playGame = [aDecoder decodeObjectForKey:@"playGame"];
         self.age = [[aDecoder decodeObjectForKey:@"age"] integerValue];
     }
     
     return self;
 }
 
 - (void)encodeWithCoder:(NSCoder *)aCoder {
 [aCoder encodeObject:_playGame forKey:@"playGame"];
 [aCoder encodeObject:[NSNumber numberWithInteger:_age] forKey:@"age"];
 }
 
 */



/**
 步骤1:
 
 - (id)initWithCoder:(NSCoder *)aDecoder {
     if (self = [super init]) {
         unsigned int iVarCount = 0;
         Ivar *iVarList = class_copyIvarList([self class], &iVarCount);//获取变量列表
         for (NSInteger i = 0; i < iVarCount; i++) {
             Ivar ivar = iVarList[i];//获取每一个成员变量
             const char *varName = ivar_getName(ivar);//取得变量名字，作为key
             NSString *key = [NSString stringWithUTF8String:varName];
             //decode
             id value = [aDecoder decodeObjectForKey:key];//解码
             if (value) {
                 [self setValue:value forKey:key];//kvc 写入对象
             }
         }
     }
     free(iVarList);//记得释放内存
     return self;
 }
 
 - (void)encodeWithCoder:(NSCoder *)aCoder {
     unsigned int iVarCount = 0;
     Ivar *iVarList = class_copyIvarList([self class], &iVarCount);//获取变量列表
     for (NSInteger i = 0; i < iVarCount; i++) {
         Ivar ivar = iVarList[i];//获取每一个成员变量
         const char *varName = ivar_getName(ivar);//取得变量名字，作为key
         NSString *key = [NSString stringWithUTF8String:varName];
         //decode
         id value = [self valueForKey:key];
         if (value) {
             [aCoder encodeObject:value forKey:key];//编码
         }
     }
     free(iVarList);//记得释放内存
 }

 有个缺陷，在获取变量时都是指定当前类，也就是[self class]。当你的Model对象并不是直接继承自NSObject时容易遗漏掉父类的属性
 
 编解码的范围不能仅仅是自身类的变量，还应当把除NSObject类外的所有层级父类的属性变量也进行编解码！
 
 因此在上面代码的基础上我们我们需要注意一下细节，设一个指针，先指向本身类，处理完指向SuperClass，处理完再指向SuperClass的SuperClass...。

 看步骤二
 */


/*
 步骤二， 增加 class_getSuperclass(classInfo) 一直便利父类，有个问题，KVC 无法获取到父类的私有变量（即实例变量），
 因此，在处理到父类时不能简单粗暴地使用class_copyIvarList，而只能取父类的属性变量 class_copyPropertyList 在处理父类时用后者代替前者。
 另外：打印propertyList会发现有 superClass、description、debugDescription、hash等四个属性。对这几个属性进行encode操作会导致crash。因此在encode前需要屏蔽掉这些key。
 
- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        Class clasInfor = [self class];
        while (clasInfor != [NSObject class]) {
            unsigned int iVarCount = 0;
            Ivar *iVarList = class_copyIvarList([self class], &iVarCount);//获取变量列表
            for (NSInteger i = 0; i < iVarCount; i++) {
                Ivar ivar = iVarList[i];//获取每一个成员变量
                const char *varName = ivar_getName(ivar);//取得变量名字，作为key
                NSString *key = [NSString stringWithUTF8String:varName];
                //decode
                id value = [aDecoder decodeObjectForKey:key];//解码
                if (value) {
                    [self setValue:value forKey:key];//kvc 写入对象
                }
            }
            free(iVarList);
            clasInfor = class_getSuperclass(clasInfor);//指针指向当前类的父类
        }
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    Class classInfo = [self class];
    while (classInfo != [NSObject class]) {
        unsigned int iVarCount = 0;
        Ivar *iVarList = class_copyIvarList([classInfo class], &iVarCount);//获取变量列表
        for (NSInteger i = 0; i < iVarCount; i++) {
            Ivar ivar = iVarList[i];//获取每一个成员变量
            const char *varName = ivar_getName(ivar);//取得变量名字，作为key
            NSString *key = [NSString stringWithUTF8String:varName];
            //decode
            id value = [self valueForKey:key];//解码
            if (value) {
                [aCoder encodeObject:value forKey:key];
            }
        }
        free(iVarList);
        classInfo = class_getSuperclass(classInfo); //指针指向当前类的父类
    }
    
}
*/


/**
 最终实现

 @param aDecoder
 @return
 */
- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        Class classInfo = [self class];
        while (classInfo != [NSObject class]) {
            BOOL isSelfClass = (classInfo == [self class]);/*判断是自身类还是父类*/
            
            unsigned int iVarCount = 0;
            unsigned int propVarCount = 0;
            unsigned int sharedVarCount = 0;
            
            Ivar *ivarList = isSelfClass ? class_copyIvarList([classInfo class], &iVarCount) : NULL;/*变量列表，含属性以及私有变量*/
            objc_property_t *propList = isSelfClass ? NULL : class_copyPropertyList(classInfo, &propVarCount);/*属性列表*/
            sharedVarCount = isSelfClass ? iVarCount : propVarCount;
            
            for (NSInteger i = 0; i < sharedVarCount; i++) {
                const char *varName = isSelfClass ? ivar_getName(ivarList[i]) : property_getName(propList[i]);
                //const char *varName = bIsSelfClass ? ivar_getName(*(ivarList + i)) : property_getName(*(propList + i));
                NSString *key = [NSString stringWithUTF8String:varName];
                //decode
                id varValue = [aDecoder decodeObjectForKey:key];//解码
                NSArray *filters = @[@"superclass", @"description", @"debugDescription", @"hash"];

                if (varValue && [filters containsObject:key] == NO) {
                    [self setValue:varValue forKey:key];
                }
            }
            free(ivarList);
            free(propList);
            classInfo = class_getSuperclass(classInfo);//指针指向当前类的父类
        }
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    Class classInfo = [self class];
    while (classInfo != [NSObject class]) {
        BOOL isSelfClass = (classInfo == [self class]);/*判断是自身类还是父类*/

        unsigned int iVarCount = 0;
        unsigned int propVarCount = 0;
        unsigned int sharedVarCount = 0;
        
        Ivar *ivarList = isSelfClass ? class_copyIvarList([classInfo class], &iVarCount) : NULL;/*变量列表，含属性以及私有变量*/
        objc_property_t *propList = isSelfClass ? NULL : class_copyPropertyList(classInfo, &propVarCount);/*属性列表*/
        sharedVarCount = isSelfClass ? iVarCount : propVarCount;

        for (NSInteger i = 0; i < sharedVarCount; i++) {
            const char *varName = isSelfClass ? ivar_getName(ivarList[i]) : property_getName(propList[i]);
            //const char *varName = bIsSelfClass ? ivar_getName(*(ivarList + i)) : property_getName(*(propList + i));
            NSString *key = [NSString stringWithUTF8String:varName];
            //decode
            id varValue = [self valueForKey:key];
            NSArray *filters = @[@"superclass", @"description", @"debugDescription", @"hash"];
            if (varValue && [filters containsObject:key] == NO) {
                [aCoder encodeObject:varValue forKey:key];
            }
        }
        free(ivarList);
        free(propList);
        classInfo = class_getSuperclass(classInfo); //指针指向当前类的父类
    }
    
}

// 最终封装
#define WZLSERIALIZE_CODER_DECODER()     \
\
- (id)initWithCoder:(NSCoder *)coder    \
{   \
NSLog(@"%s",__func__);  \
Class cls = [self class];   \
while (cls != [NSObject class]) {   \
/*判断是自身类还是父类*/    \
BOOL bIsSelfClass = (cls == [self class]);  \
unsigned int iVarCount = 0; \
unsigned int propVarCount = 0;  \
unsigned int sharedVarCount = 0;    \
Ivar *ivarList = bIsSelfClass ? class_copyIvarList([cls class], &iVarCount) : NULL;/*变量列表，含属性以及私有变量*/   \
objc_property_t *propList = bIsSelfClass ? NULL : class_copyPropertyList(cls, &propVarCount);/*属性列表*/   \
sharedVarCount = bIsSelfClass ? iVarCount : propVarCount;   \
\
for (int i = 0; i < sharedVarCount; i++) {  \
const char *varName = bIsSelfClass ? ivar_getName(*(ivarList + i)) : property_getName(*(propList + i)); \
NSString *key = [NSString stringWithUTF8String:varName];   \
id varValue = [coder decodeObjectForKey:key];   \
NSArray *filters = @[@"superclass", @"description", @"debugDescription", @"hash"]; \
if (varValue && [filters containsObject:key] == NO) { \
[self setValue:varValue forKey:key];    \
}   \
}   \
free(ivarList); \
free(propList); \
cls = class_getSuperclass(cls); \
}   \
return self;    \
}   \
\
- (void)encodeWithCoder:(NSCoder *)coder    \
{   \
NSLog(@"%s",__func__);  \
Class cls = [self class];   \
while (cls != [NSObject class]) {   \
/*判断是自身类还是父类*/    \
BOOL bIsSelfClass = (cls == [self class]);  \
unsigned int iVarCount = 0; \
unsigned int propVarCount = 0;  \
unsigned int sharedVarCount = 0;    \
Ivar *ivarList = bIsSelfClass ? class_copyIvarList([cls class], &iVarCount) : NULL;/*变量列表，含属性以及私有变量*/   \
objc_property_t *propList = bIsSelfClass ? NULL : class_copyPropertyList(cls, &propVarCount);/*属性列表*/ \
sharedVarCount = bIsSelfClass ? iVarCount : propVarCount;   \
\
for (int i = 0; i < sharedVarCount; i++) {  \
const char *varName = bIsSelfClass ? ivar_getName(*(ivarList + i)) : property_getName(*(propList + i)); \
NSString *key = [NSString stringWithUTF8String:varName];    \
/*valueForKey只能获取本类所有变量以及所有层级父类的属性，不包含任何父类的私有变量(会崩溃)*/  \
id varValue = [self valueForKey:key];   \
NSArray *filters = @[@"superclass", @"description", @"debugDescription", @"hash"]; \
if (varValue && [filters containsObject:key] == NO) { \
[coder encodeObject:varValue forKey:key];   \
}   \
}   \
free(ivarList); \
free(propList); \
cls = class_getSuperclass(cls); \
}   \
}


//只需要 import "WZLSerializeKit.h" 调用WZLSERIALIZE_CODER_DECODER();即可

@end
