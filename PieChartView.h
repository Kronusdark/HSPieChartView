//
//  HSPieChartView.h
//  Inspired by https://www.cocoacontrols.com/controls/piechart
//
//  Created by Weston Hanners on 3/24/14.
//  Copyright (c) 2013 Weston Hanners. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HSPieChartViewDelegate;
@protocol HSPieChartViewDataSource;

@interface HSPieChartView : UIView 

@property (nonatomic, assign) id <HSPieChartViewDataSource> datasource;

@property (nonatomic) CGFloat   lineWidth;
@property (nonatomic) UIColor   *strokeColor;
@property (nonatomic) BOOL      shouldStroke;

-(void)reloadData;

@end

@protocol HSPieChartViewDataSource <NSObject>

@required

- (int)numberOfSlicesInPieChartView:(HSPieChartView *)pieChartView;

- (double)pieChartView:(HSPieChartView *)pieChartView valueForSliceAtIndex:(NSUInteger)index;

- (UIColor *)pieChartView:(HSPieChartView *)pieChartView colorForSliceAtIndex:(NSUInteger)index;

@end
