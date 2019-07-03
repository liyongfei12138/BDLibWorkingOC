//
//  BNProgressView.h
//  BDLibWorkingOC
//
//  Created by Bingo on 2019/7/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BNProgressView : UIView

- (void)beginLoadView;
- (void)finishLoadView;
- (void)hidView;
    
@end

NS_ASSUME_NONNULL_END
