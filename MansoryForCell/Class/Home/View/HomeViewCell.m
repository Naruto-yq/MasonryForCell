//
//  HomeViewCell.m
//  MansoryForCell
//
//  Created by 余钦 on 16/3/16.
//  Copyright © 2016年 cmbfae Co.,Ltd. All rights reserved.
//

#import "HomeViewCell.h"
static NSString *cellID = @"home_cell";

@implementation HomeViewCell


+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    HomeViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[HomeViewCell alloc ]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    cell.textLabel.text = @"嘻嘻哈哈";
    return cell;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

@end
