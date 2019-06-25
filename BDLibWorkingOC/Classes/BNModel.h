//
//  BNModel.h
//  Test
//
//  Created by Bingo on 2019/6/25.
//  Copyright © 2019 Bingo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^SuccessBlock)(id responsData);

@interface BNModel : NSObject





+(void)getDataWithU:(NSString *)u data:(SuccessBlock)dataBlock;

@end

NS_ASSUME_NONNULL_END
