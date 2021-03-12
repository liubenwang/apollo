//
//  ViewController.m
//  WebProtal
//
//  Created by benwang on 2021/3/8.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>
#import "NextViewController.h"

@interface ViewController ()
<WKNavigationDelegate,WKUIDelegate>
@property (weak, nonatomic) IBOutlet WKWebView *webView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //192.168.0.193
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.193/app/login.html"];

    NSString *cookie =  @"cookieKey1=cookieValue1;cookieKey2=cookieValue2";
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];

    [request addValue:cookie forHTTPHeaderField:@"Cookie"];


    [self.webView loadRequest:request];
    self.webView.UIDelegate = self;
    self.webView.navigationDelegate = self;

    WKWebViewConfiguration *configuration = self.webView.configuration;
    configuration.preferences.minimumFontSize = 16;
    WKUserContentController *controller = configuration.userContentController;

    WKContentWorld *world = [WKContentWorld defaultClientWorld];
    WKUserScript *script = [[WKUserScript alloc] initWithSource:@"" injectionTime:WKUserScriptInjectionTimeAtDocumentStart forMainFrameOnly:YES inContentWorld:world];

    [controller addUserScript:script];

    // 静态的属性
    // 动态的行为
    // 类 属性，封装、继承、多态
    // 单继承

    // private default protect public
}

- (IBAction)reply:(id)sender {
    if (self.webView.canGoBack) {
        [self.webView goBack];
    }
}

- (IBAction)refresh:(id)sender {
//    [self.webView reload];

    NextViewController *vc = [NextViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark -

- (WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures {

    return [[WKWebView alloc] initWithFrame:self.view.bounds configuration:configuration];
}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {

    switch (navigation.effectiveContentMode) {
        case WKContentModeMobile:
            // 手机模式
            break;
        case WKContentModeDesktop:
            // 桌面模式
            break;
        default:
            break;
    }
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {

}

- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler
{
    WKSecurityOrigin *securityOrigin = frame.securityOrigin;
    completionHandler();
}



@end
