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
    
    
    
    NSString *urlString = @"https://app.shangpin.com/apiv2/firstIndexV3";
    NSString *cerPath = [[NSBundle mainBundle] pathForResource:@"server" ofType:@"cer"];
    NSData * certData =[NSData dataWithContentsOfFile:cerPath];
    NSSet * certSet = [[NSSet alloc] initWithObjects:certData, nil];
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    // 是否允许,NO-- 不允许无效的证书
    [securityPolicy setAllowInvalidCertificates:YES];
    // 设置证书
    [securityPolicy setPinnedCertificates:certSet];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.securityPolicy = securityPolicy;
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager.requestSerializer setValue:@"0c9e47fb92e2bd7ede3e6eadc6310477" forHTTPHeaderField:@"imei"];
    [manager.requestSerializer setValue:@"Ti+5OcIow2JOEPk2Llp+0A==" forHTTPHeaderField:@"token"];
    [manager.requestSerializer setValue:@"ios" forHTTPHeaderField:@"os"];
    [manager.requestSerializer setValue:@"A01" forHTTPHeaderField:@"baseType"];
    [manager.requestSerializer setValue:@"3.0.8" forHTTPHeaderField:@"ver"];
    [manager.requestSerializer setValue:@"2" forHTTPHeaderField:@"p"];

    // request
    [manager GET:urlString parameters:nil progress:^(NSProgress * progress){
        
    } success:^(NSURLSessionDataTask *task, id responseObject) {
        NSArray * array = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        NSLog(@"OK === %@",array);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"error ==%@",error.description);
    }];

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
