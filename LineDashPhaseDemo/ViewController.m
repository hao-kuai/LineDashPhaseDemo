//
//  ViewController.m
//  LineDashPhaseDemo
//
//  虚线方法参考 http://www.cocoachina.com/ios/20150417/11610.html
//
//

#import "ViewController.h"
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height
#define ScreenWidth  [[UIScreen mainScreen] bounds].size.width
@interface ViewController ()
{
    CAShapeLayer *m_shapeLayer;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    m_shapeLayer = [CAShapeLayer layer];
    [m_shapeLayer setBounds:self.view.bounds];
    [m_shapeLayer setPosition:self.view.center];
    [m_shapeLayer setFillColor:[[UIColor clearColor] CGColor]];
    // 设置虚线颜色为blackColor
    [m_shapeLayer setStrokeColor:[[UIColor redColor] CGColor]];
    // 3.0f设置虚线的宽度
    [m_shapeLayer setLineWidth:5.0f];
    //不太懂
    [m_shapeLayer setLineJoin:kCALineJoinRound];
    
    // 3=线的宽度 1=每条线的间距
    [m_shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:5],[NSNumber numberWithInt:1],nil]];
    // Setup the path
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path,NULL ,0, ScreenHeight);
    CGPathAddLineToPoint(path, NULL, ScreenWidth/2,0);
    CGPathAddLineToPoint(path, NULL, ScreenWidth,ScreenHeight);
    CGPathAddLineToPoint(path, NULL, ScreenWidth,ScreenHeight);
    CGPathAddLineToPoint(path, NULL, 0,ScreenHeight/3);
    CGPathAddLineToPoint(path, NULL, ScreenWidth,ScreenHeight/3);
    CGPathAddLineToPoint(path, NULL, 0,ScreenHeight);
    
    [m_shapeLayer setPath:path];
    CGPathRelease(path);
    [self.view.layer addSublayer:m_shapeLayer];
    
    //实现动画
    [m_shapeLayer setLineDashPhase:1];
    [[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(movePhase) userInfo:nil repeats:YES] fire];
    
}
-(void)movePhase
{
    m_shapeLayer.lineDashPhase--;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
