//
//  HomeStatus.h
//  MansoryForCell
//
//  Created by 余钦 on 16/3/17.
//  Copyright © 2016年 cmbfae Co.,Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

static NSString *cellID = @"home_cell";

@interface HomeStatus : NSObject
@property (nonatomic,copy) NSString *icon; //图片
@property (nonatomic,copy) NSString *content; //内容的label
//单元格的高度
@property (nonatomic, assign)CGFloat cellHeight;
@end
