//
//  BNProgressView.m
//  BDLibWorkingOC
//
//  Created by Bingo on 2019/7/2.
//

#import "BNProgressView.h"
@interface BNProgressView()
    
@property (nonatomic, strong) UIView*loadView;
@end

@implementation BNProgressView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        [self configUi];
    }
    return self;
}

-(void)configUi
{
    self.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0];
    self.loadView = [[UIView alloc] init];
    self.loadView.backgroundColor = [UIColor colorWithRed:28/255.0 green:167/255.0 blue:252/255.0 alpha:0.5];
    [self addSubview:self.loadView];
}
-(void)beginLoadView{
    self.hidden = NO;
    
    [UIView animateWithDuration:0.6 animations:^{
        self.loadView.frame = CGRectMake(0, 0, self.frame.size.width * 0.3, self.frame.size.height);
    }];
    [UIView animateWithDuration:4 animations:^{
        self.loadView.frame = CGRectMake(0, 0, self.frame.size.width * 0.75, self.frame.size.height);
    }];
    [UIView animateWithDuration:5 animations:^{
        self.loadView.frame = CGRectMake(0, 0, self.frame.size.width * 0.9, self.frame.size.height);
    }];
}
-(void)finishLoadView{
    
    [UIView animateWithDuration:0.3 animations:^{
         self.loadView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    } completion:^(BOOL finished) {
        [self hidView ];
    }];
}
-(void)hidView{
    self.loadView.frame = CGRectMake(0, 0, 0, self.frame.size.height);
    self.hidden = YES;
    
}
@end
