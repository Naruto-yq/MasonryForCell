//
//  HomeStatus.m
//  MansoryForCell
//
//  Created by 余钦 on 16/3/17.
//  Copyright © 2016年 cmbfae Co.,Ltd. All rights reserved.
//

#import "HomeStatus.h"
#import "HomeViewCell.h"

@implementation HomeStatus

//惰性初始化是这样写的
//-(CGFloat)cellHeight
//{
//    //只在初始化的时候调用一次就Ok
//    if(!_cellHeight){
//        HomeViewCell *cell=[[HomeViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
//        NSLog(@"我要计算高度");
//        // 调用cell的方法计算出高度
//        _cellHeight=[cell rowHeightWithCellModel:self];
//        
//    }
//    
//    
//    return _cellHeight;
//}

@end
