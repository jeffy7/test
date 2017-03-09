//
//  JFArchiveViewController.m
//  test
//
//  Created by je_ffy on 2017/3/9.
//  Copyright © 2017年 je_ffy. All rights reserved.
//

#import "JFArchiveViewController.h"
#import "JFArchiveSon.h"

@interface JFArchiveViewController ()

@end

@implementation JFArchiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    JFArchiveSon *son = [[JFArchiveSon alloc] init];
    son.name = @"jeffy";
    son.age = 18;
    son.playGame = @"coding";
    
    //一个对象archive
    NSData *archiveData = [NSKeyedArchiver archivedDataWithRootObject:son];
    [[NSUserDefaults standardUserDefaults] setObject:archiveData forKey:@"oneSon"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
    NSData *unarchiveData = [[NSUserDefaults standardUserDefaults] valueForKey:@"oneSon"];
    JFArchiveSon *unarchiveSon = [NSKeyedUnarchiver unarchiveObjectWithData:unarchiveData];
    NSLog(@"\n unarchiveSon.name = %@ \n unarchiveSon.age = %ld \n unarchiveSon.playGame = %@\n",
          unarchiveSon.name,unarchiveSon.age,unarchiveSon.playGame);
    
    
    //多个学生archive 并写入文件
    NSString *docPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *multiHomePath = [docPath stringByAppendingPathComponent:@"multi.archiver"];
    NSLog(@"multiHomePath = %@",multiHomePath);
    
    JFArchiveSon *AnotherSon = [[JFArchiveSon alloc] init];
    AnotherSon.name = @"jeffy2";
    AnotherSon.age = 182;
    AnotherSon.playGame = @"coding2";
    NSMutableData *data = [NSMutableData data];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:son forKey:@"son"];
    [archiver encodeObject:AnotherSon forKey:@"anotherSon"];
    [archiver finishEncoding];
    
    [data writeToFile:multiHomePath atomically:YES];
    
    NSMutableData *dataUnarchive = [[NSMutableData alloc] initWithContentsOfFile:multiHomePath];
    NSKeyedUnarchiver *unarchive = [[NSKeyedUnarchiver alloc] initForReadingWithData:dataUnarchive];
    JFArchiveSon *son1 = [unarchive decodeObjectForKey:@"son"];
    JFArchiveSon *son2 = [unarchive decodeObjectForKey:@"anotherSon"];
    [unarchive finishDecoding];
    NSLog(@"\n son1.name = %@ \
          \n son1.age = %ld \
          \n son1.playGame = %@\
          \n son2.name = %@ \
          \n son2.age = %ld \
          \n son2.playGame = %@",
          son1.name,son1.age,son1.playGame,son2.name,son2.age,son2.playGame);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
