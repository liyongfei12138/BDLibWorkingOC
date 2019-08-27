#import "BNMyViewController.h"
#import "BNProgressView.h"
#import "UIImage+BNImage.h"



@interface BNMyViewController ()<UIScrollViewDelegate,UIGestureRecognizerDelegate,UIWebViewDelegate>
@property (nonatomic,strong) NSString *titleName;
@property (nonatomic,assign) CGRect webViewFrame;
@property (nonatomic,strong) NSString* webUrl;
@property (nonatomic,strong) UIWebView *webView;
@property (nonatomic, strong) BNProgressView *progressView;

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
    
#define kDeviceStatusHeight  [UIApplication sharedApplication].statusBarFrame.size.height
#define kDeviceWidth  [UIScreen mainScreen].bounds.size.width
#define kDeviceHeight [UIScreen mainScreen].bounds.size.height
    
    
- (void)configWebView
{
    self.webView = [[UIWebView alloc] init];;
    self.webView.frame = self.webViewFrame;
    self.webView .scrollView.delegate = self;
    self.webView.delegate = self;
    NSURL *url = [NSURL URLWithString:self.webUrl];
    self.webView.backgroundColor = [UIColor whiteColor];
    [self.webView setOpaque:NO];
    
    
    NSURLRequest * urlReuqest = [[NSURLRequest alloc]initWithURL:url cachePolicy:1 timeoutInterval:30.0f];
    [self.webView loadRequest:urlReuqest];
    
    [self.view addSubview:self.webView];
    
    self.progressView = [[BNProgressView alloc] initWithFrame:CGRectMake(0,kDeviceStatusHeight , kDeviceWidth, 4)];
    [self.view addSubview:self.progressView];
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    [self.progressView beginLoadView];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    
    [self.progressView finishLoadView];
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [self.progressView hidView];
    
}
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    [self.progressView hidView];
    return YES;
}


@end

