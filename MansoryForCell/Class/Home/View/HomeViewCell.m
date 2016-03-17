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
    
    //设置约束
    __weak __typeof(&*self)weakSelf = self;
    //1.设置图片的大小
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(iconH);  //头像的高度
        make.width.mas_equalTo(iconW); //头像的宽度
        make.top.equalTo(weakSelf.mas_top).offset(marginW) ; //距离顶部10的距离
        make.left.equalTo(weakSelf.mas_left).offset(marginW);
        
    }];
    //2.设置contentLabel
    [self.content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.icon.mas_bottom).offset(marginW); //文本距离头像底部10个间距
        make.left.equalTo(weakSelf.mas_left).offset(marginW);  //文本距离左边的距离
        make.right.equalTo(weakSelf.mas_right).offset(-marginW);  //文本距离右边的距离
        
        //文本高度 我们再得到模型的时候 在传递
    }];
    
    
    //3.设置下划线的大小
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(0.5);
        make.left.equalTo(weakSelf.mas_left).offset(0);
        make.right.equalTo(weakSelf.mas_right).offset(0);
        make.bottom.equalTo(weakSelf.mas_bottom).offset(-marginW); //下划线距离底部10的距离
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
        NSLog(@"--->>line:%d,weakSelf.contentH:%f", __LINE__, weakSelf.contentH);
        make.height.mas_equalTo(weakSelf.contentH);
    }];
    // 2. 更新约束
    [self layoutIfNeeded];
    
    //3.  视图的最大 Y 值
    CGFloat h= CGRectGetMaxY(self.content.frame);
    
    _homeStatus.cellHeight = h+10; //最大的高度+10

}


//在表格cell中 计算出高度
-(CGFloat)rowHeightWithCellModel:(HomeStatus *)homeStatus
{
    _homeStatus = homeStatus;
    __weak __typeof(&*self)weakSelf = self;
    //设置标签的高度
    [self.content mas_makeConstraints:^(MASConstraintMaker *make) {
        // weakSelf.contentLabelH  这个会调用下面的懒加载方法
        NSLog(@"--->>line:%d,weakSelf.contentH:%f", __LINE__, weakSelf.contentH);
        make.height.mas_equalTo(weakSelf.contentH);
    }];
    
    // 2. 更新约束
    [self layoutIfNeeded];
    
    //3.  视图的最大 Y 值
    CGFloat h= CGRectGetMaxY(self.content.frame);
    
    return h+10; //最大的高度+10
}


- (CGFloat)contentH
{
    if (!_contentH) {
        _contentH = [self.homeStatus.content boundingRectWithSize:CGSizeMake(self.contentView.bounds.size.width-2*marginW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil].size.height;
    }
    return _contentH;
}
@end
