//
//  HomeViewCell.m
//  MansoryForCell
//
//  Created by 余钦 on 16/3/16.
//  Copyright © 2016年 cmbfae Co.,Ltd. All rights reserved.
//

#import "HomeViewCell.h"
#import "HomeStatus.h"
#import <Masonry/Masonry.h>


#define iconH 100
#define iconW 100
#define marginW 10

static NSString *cellID = @"home_cell";

@interface HomeViewCell ()
@property(nonatomic, weak)UIImageView *icon;
@property(nonatomic, weak)UILabel *content;
@property(nonatomic, weak)UIImageView *line;

@property(nonatomic, assign)CGFloat contentH;
@end

@implementation HomeViewCell


+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    HomeViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[HomeViewCell alloc ]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    return cell;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self SetupSubviews];
    }
    return self;
}


- (void)SetupSubviews
{
    //1.添加图片
    UIImageView *icon = [[UIImageView alloc]init];
    icon.contentMode = UIViewContentModeScaleAspectFill;
    icon.clipsToBounds = YES;
    [self.contentView addSubview:icon];
    self.icon = icon;
    //2.添加文本label
    UILabel *content = [[UILabel alloc]init];
    content.numberOfLines = 0;
    content.font = [UIFont systemFontOfSize:16];
    [self.contentView addSubview:content];
    self.content = content;
    
    UIImageView *line = [[UIImageView alloc]init];
    line.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:line];
    self.line = line;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    //设置约束
    __weak __typeof(&*self)weakSelf = self;
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(iconH);
        make.width.mas_equalTo(iconW);
        make.top.equalTo(weakSelf.mas_top).offset(marginW);//设置距离顶部高度
        make.left.equalTo(weakSelf.mas_left).offset(marginW);//设置距离左边的间距
    }];
    
    [self.content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.icon.mas_bottom).offset(marginW);//设置距离图片底部的间隔
        make.left.equalTo(weakSelf.mas_left).offset(marginW);
        make.right.equalTo(weakSelf.mas_right).offset(-marginW);
    }];
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.content.mas_bottom).offset(marginW);
        make.left.equalTo(weakSelf.mas_left).offset(0);
        make.right.equalTo(weakSelf.mas_right).offset(0);
        make.bottom.equalTo(weakSelf.mas_bottom).offset(-0.5);
        make.width.mas_equalTo(weakSelf.mas_width);
        make.height.mas_equalTo(0.5);
    }];
}

- (void)setHomeStatus:(HomeStatus *)homeStatus
{
    _homeStatus = homeStatus;
    self.icon.image = [UIImage imageNamed:homeStatus.icon];
    self.content.text = homeStatus.content;
    
    __weak __typeof(&*self)weakSelf = self;
    //设置标签的高度
    [self.content mas_makeConstraints:^(MASConstraintMaker *make) {
        // weakSelf.contentLabelH  这个会调用下面的懒加载方法
        make.height.mas_equalTo(weakSelf.contentH);
    }];
    
    // 2. 更新约束
    [self layoutIfNeeded];
    
    //3.  视图的最大 Y 值
    CGFloat h= CGRectGetMaxY(self.content.frame);
    
    NSLog(@"-->>>%d,--- %f", __LINE__, CGRectGetMaxY(self.content.frame));
    _homeStatus.cellHeight = h+10; //最大的高度+10

}
- (CGFloat)contentH
{
    if (!_contentH) {
        _contentH = [self.homeStatus.content boundingRectWithSize:CGSizeMake(self.contentView.bounds.size.width-2*marginW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil].size.height;
    }
    return _contentH;
}
@end
