//
//  JFArchiveViewController.h
//  test
//
//  Created by je_ffy on 2017/3/9.
//  Copyright © 2017年 je_ffy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JFBaseViewController.h"


/**
 在iOS中一个自定义对象是无法直接存入到文件中的，必须先转化成二进制流才行。从对象到二进制数据的过程我们一般称为对象的序列化(Serialization)，也称为归档(Archive)。
 同理，从二进制数据到对象的过程一般称为反序列化或者反归档。
 在序列化实现中不可避免的需要实现NSCoding以及NSCopying(非必须)协议的以下方法：
 - (id)initWithCoder:(NSCoder *)coder;
 - (void)encodeWithCoder:(NSCoder *)coder;
 - (id)copyWithZone:(NSZone *)zone;
 
 假设我们现在需要对直接继承自NSObject的Person类进行序列化，代码一般长这样子：
 //对变量编码
 - (void)encodeWithCoder:(NSCoder *)coder
 {
 [coder encodeObject:self.name forKey:@"name"];
 [coder encodeObject:@(self.age) forKey:@"age"];
 [coder encodeObject:_father forKey:@"_father"];
 //... ... other instance variables
 }
 //对变量解码
 - (id)initWithCoder:(NSCoder *)coder
 {
 self.name = [coder decodeObjectForKey:@"name"];
 self.age = [[coder decodeObjectForKey:@"age"] integerValue];
 _father = [coder decodeObjectForKey:@"_father"];
 //... ... other instance variables
 }
 
 至少到目前为止是这样的。但是请考虑以下问题：
 
 1.若Person是个很大的类，有非常多的变量需要进行encode/decode处理呢？
 2.若你的工程中有很多像Person的自定义类需要做序列化操作呢？
 3.若Person不是直接继承自NSObject而是有多层的父类呢？(请注意，序列化的原则是所有层级的父类的属性变量也要需要序列化)；
 
 如果采用开始的传统的序列化方式进行序列化，在碰到以上问题时容易暴露出以下缺陷(仅仅是缺陷，不能称为问题)：
 
 1.工程代码中冗余代码很多
 2.父类层级复杂容易导致遗漏点一些父类中的属性变量
 那是不是有更优雅的方案来回避以上问题呢？那是必须的。这里我们将共同探讨使用runtime来实现一种接口简洁并且十分通用的iOS序列化与反序列方案。
 
 */


/**
 总体思路
 观察上面的initWithCoder代码我们可以发现，序列化与反序列化中最重要的环节是遍历类的变量，保证不能遗漏。
 
 这里需要特别注意的是:
 编解码的范围不能仅仅是自身类的变量，还应当把除NSObject类外的所有层级父类的属性变量也进行编解码！
 
 由此可见，这几乎是个纯体力活。而runtime在遍历变量这件事情上能为我们提供什么帮助呢？我们可以通过runtime在运行时获取自身类的所有变量进行编解码；然后对父类进行递归，获取除NSObject外每个层级父类的属性(非私有变量)，进行编解码。
 */


/**
 使用runtime获取变量以及属性
 Ivar *class_copyIvarList(Class cls, unsigned int *outCount)
 */
@interface JFArchiveViewController : JFBaseViewController

@end
