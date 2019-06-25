#import "BNMyViewController.h"

#import "UIImage+BNImage.h"



@interface BNMyViewController ()<UIScrollViewDelegate,UIGestureRecognizerDelegate>
@property (nonatomic,strong) NSString *titleName;
@property (nonatomic,assign) CGRect webViewFrame;
@property (nonatomic,strong) NSString* webUrl;
@property (nonatomic,strong) UIWebView *webView;


@end

#define kSmallGray [UIColor colorWithRed:241.0/255.0 green:242.0/255.0 blue:243.0/255.0 alpha:1.0f]

@implementation BNMyViewController


// 初始化
-(instancetype)initWithUrl:(NSString*)url frame:(CGRect)frame{
    if(self = [super init]){
        self.webUrl = url;
        self.webViewFrame = frame;

    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
   
    // 初始化webview
    [self configWebView];

}
- (void)configWebView
{
    self.webView = [[UIWebView alloc] init];;
    self.webView.frame = self.webViewFrame;
    self.webView .scrollView.delegate = self;
    NSURL *url = [NSURL URLWithString:self.webUrl];
    
    
    
    NSURLRequest * urlReuqest = [[NSURLRequest alloc]initWithURL:url cachePolicy:1 timeoutInterval:30.0f];
    [self.webView loadRequest:urlReuqest];
    
    [self.view addSubview:self.webView];
}





@end

