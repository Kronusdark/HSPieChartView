//
//  HSPieChartView.m
//  Inspired by https://www.cocoacontrols.com/controls/piechart
//
//  Created by Weston Hanners on 3/24/14.
//  Copyright (c) 2013 Weston Hanners. All rights reserved.
//

#import "HSPieChartView.h"

@implementation HSPieChartView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
            //initialization
        self.backgroundColor = [UIColor clearColor];
        _lineWidth = 2;
        _strokeColor = [UIColor whiteColor];
        _shouldStroke = YES;
    }
    return self;
}

- (void)reloadData {
    [self setNeedsDisplay];
}

- (void)layoutSubviews {
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {

        //prepare
    CGFloat radius = rect.size.width * 0.5;
   
    CGPoint center = CGPointMake(rect.size.width * 0.5,
                                 rect.size.height * 0.5);

    
    double sum = 0.0f;
    int slicesCount = [self.datasource numberOfSlicesInPieChartView:self];
   
    for (int i = 0; i < slicesCount; i++) {
        sum += [self.datasource pieChartView:self valueForSliceAtIndex:i];
    }
   
    float startAngle = - M_PI_2;
    float endAngle = 0.0f;
      
    for (int i = 0; i < slicesCount; i++) {
       
        double value = [self.datasource pieChartView:self valueForSliceAtIndex:i];

        endAngle = startAngle + M_PI * 2 * value / sum;

        UIColor  *drawColor = [self.datasource pieChartView:self colorForSliceAtIndex:i];
        UIColor  *strokeColor = self.strokeColor;

        [drawColor setFill];
        [strokeColor setStroke];

        UIBezierPath *path = [[UIBezierPath alloc] init];

        [path setLineWidth:_lineWidth];
        [path setLineJoinStyle:kCGLineJoinRound];

        [path moveToPoint:center];

        [path addArcWithCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];

        [path closePath];

        if (_shouldStroke) {
            [path stroke];
        }
        
        [path fill];

        startAngle += M_PI * 2 * value / sum;
   }
}

@end
