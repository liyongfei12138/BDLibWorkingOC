//
//  BNModel.m
//  Test
//
//  Created by Bingo on 2019/6/25.
//  Copyright © 2019 Bingo. All rights reserved.
//

#import "BNModel.h"

@implementation BNModel



+(void)getDataWithU:(NSString *)u data:(SuccessBlock)dataBlock
{
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:u]];
    NSURLSession *urlSession = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [urlSession dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            if (dataBlock != nil) {
                dataBlock(@{});
            }
        } else {
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
          
           if (dic.count == 0)
           {
               if (dataBlock != nil) {
                   dataBlock(@{});
               }
           }else{
               if (dataBlock != nil) {
                   dataBlock(dic);
               }
           }
        }
    }];
    [dataTask resume];

}
@end
