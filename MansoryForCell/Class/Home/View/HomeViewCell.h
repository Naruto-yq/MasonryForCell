//
//  HomeViewCell.h
//  MansoryForCell
//
//  Created by 余钦 on 16/3/16.
//  Copyright © 2016年 cmbfae Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HomeStatus;

@interface HomeViewCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

-(CGFloat)rowHeightWithCellModel:(HomeStatus *)homeStatus;
@property(nonatomic, strong)HomeStatus *homeStatus;
@end
