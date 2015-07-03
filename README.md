# LineDashPhaseDemo
Line、Dash、Phase、LineDashPhase、滚动虚线、虚线动画
虚线方法参考 http://www.cocoachina.com/ios/20150417/11610.html

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
    
    虚线滚动方法实现原理：参考安卓实现方法，通过设置setLineDashPhase参数的变化来实现
    [m_shapeLayer setLineDashPhase:1];
    [[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(movePhase) userInfo:nil repeats:YES] fire];
-(void)movePhase
{ 
  //自加 、自减控制方向
    m_shapeLayer.lineDashPhase--;
}
