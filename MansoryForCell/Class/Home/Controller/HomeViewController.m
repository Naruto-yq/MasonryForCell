//
//  HomeViewController.m
//  MansoryForCell
//
//  Created by 余钦 on 16/3/16.
//  Copyright © 2016年 cmbfae Co.,Ltd. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeViewCell.h"
#import "HomeStatus.h"

@interface HomeViewController ()
@property (nonatomic,strong) NSMutableArray *arr; //存放的我们自定义的数据
@property (nonatomic,strong) NSMutableArray *arrModel; //存放的数据模型
@end

@implementation HomeViewController
-(NSMutableArray *)arr
{
    if(_arr==nil){
        _arr=[NSMutableArray array];
        [_arr addObject:@"高通与小米达成专利授权协议的主要影响在于小米的海外市场，因为在国内小米并不会遇到专利问题。然而，分析小米在海外遇到的问题会发现，这远不是签订一个专利协议能解决"];
        [_arr addObject:@"当年科比和乔丹的对决，那时的科比几乎无所不能，谁又会想到他会退役，说不定再过10年，我也就退役了。"];
        [_arr addObject:@"高通与小米达成专利授权协议的主要影响在于小米的海外市场，因为在国内小米并不会遇到专利问题。然而，分析小米在海外遇到的问题会发现，这远不是签订一个专利协议能解决"];
        [_arr addObject:@"hello 这是我的iOS学习群 519797474，欢迎加入"];
        [_arr addObject:@"佛堂中，大师正在对弟子讲话：“为师为你们所起之名并非随随便便，而是为师对你们的期望，你们懂了吗？”众弟子都回答懂了。只有一名弟子默然不语。大师见状，问那名弟子道：“圆寂，你为什么不说话?"];
        [_arr addObject:@"最后这个例子是老例子了最后这个例子是老例子了，我想给大家看看其实Masonry做动画也和其他的Autolayout方法一样，但是添加约束的代码却非常的少最后这个例子是老例子了，我想给大家看看其实Masonry做动画也和其他的Autolayout方法一样，但是添加约束的代码却非常的少最后这个例子是老例子了，我想给大家看看其实Masonry做动画也和其他的Autolayout方法一样，但是添加约束的代码却非常的少最后这个例子是老例子了，我想给大家看看其实Masonry做动画也和其他的Autolayout方法一样，但是添加约束的代码却非常的少最后这个例子是老例子了，我想给大家看看其实Masonry做动画也和其他的Autolayout方法一样，但是添加约束的代码却非常的少最后这个例子是老例子了，我想给大家看看其实Masonry做动画也和其他的Autolayout方法一样，但是添加约束的代码却非常的少"];
        [_arr addObject:@"今天和老婆吵架,吵到激烈的时候,我突然觉得我一个大男人为什么要和一个女人一般见识呢?何况还是自己的老婆!当时我就跟老婆道了歉,老婆挺高兴的.道完歉,她哥哥把菜刀放下了,她弟弟把铁锹也放下了,她妹妹拽着我头发的手也松开了,妹夫手里的擀面杖也扔地下了,老丈人也把砖头丢开了;"];
        [_arr addObject:@"昨天去一家工厂面试监工，给出的工资太低，简直不能忍。最后跟主管去车间看了看，我觉得工资只是数字而已，关键是学习的机会，所以留下来了。"];
        [_arr addObject:@"大家好，我是他主治医生。请原谅他，他因为神经病引起的并发症迷恋上了装逼，去年高考 ，他差一点就上清华了，现在想来依然倍感惋惜，清华分数695，他考了69.5，就差那么一点。巨大的打击彻底粉碎了他对未来的憧憬，整日在家自暴自弃专研怎么装逼，终成为新一代装逼大师，将装逼 方法研究的出神入化，各种装逼方法，无死角装逼，终于横空出世…。你看，他又在装逼......."];
        [_arr addObject:@"高通与小米达成专利授权协议的主要影响在于小米的海外市场，因为在国内小米并不会遇到专利问题。然而，分析小米在海外遇到的问题会发现，这远不是签订一个专利协议能解决，周鸿祎的当别人都这么做的时候，我们换一种方式去做；和雷军的打败一种东西的一定是更新的东西而不是简单的复制。越想越觉得他们的理念异曲同工周鸿祎的当别人都这么做的时候，我们换一种方式去做；和雷军的打败一种东西的一定是更新的东西而不是简单的复制。越想越觉得他们的理念异曲同工周鸿祎的当别人都这么做的时候，我们换一种方式去做；和雷军的打败一种东西的一定是更新的东西而不是简单的复制。越想越觉得他们的理念异曲同工周鸿祎的当别人都这么做的时候，我们换一种方式去做；和雷军的打败一种东西的一定是更新的东西而不是简单的复制。越想越觉得他们的理念异曲同工周鸿祎的当别人都这么做的时候，我们换一种方式去做；和雷军的打败一种东西的一定是更新的东西而不是简单的复制。越想越觉得他们的理念异曲同工周鸿祎的当别人都这么做的时候，我们换一种方式去做；和雷军的打败一种东西的一定是更新的东西而不是简单的复制。越想越觉得他们的理念异曲同工周鸿祎的当别人都这么做的时候，我们换一种方式去做；和雷军的打败一种东西的一定是更新的东西而不是简单的复制。越想越觉得他们的理念异曲同工周鸿祎的当别人都这么做的时候，我们换一种方式去做；和雷军的打败一种东西的一定是更新的东西而不是简单的复制。越想越觉得他们的理念异曲同工周鸿祎的当别人都这么做的时候，我们换一种方式去做；和雷军的打败一种东西的一定是更新的东西而不是简单的复制。越想越觉得他们的理念异曲同工周鸿祎的当别人都这么做的时候，我们换一种方式去做；和雷军的打败一种东西的一定是更新的东西而不是简单的复制。越想越觉得他们的理念异曲同工"];
        [_arr addObject:@"很多时候我们过高估计了机遇的力量，低估了规划的重要性，不明确的乐观主义者只知道未来越来越好，却不知道究竟多好，因此不去制定具体计划。他想在未来获利，但是却认为没有必要制定具体规划。"];
        [_arr addObject:@"hello 这是我的iOS学习群 519797474，欢迎加入"];
        for(int i=0;i<_arr.count;i++){
            HomeStatus *m=[[HomeStatus alloc]init];
            m.icon=[NSString stringWithFormat:@"%i",i];
            m.content=_arr[i];
            //把模型那存到模型数组中
            [self.arrModel addObject:m];
            
        }
        
    }
    return _arr;
}


-(NSMutableArray *)arrModel
{
    if(_arrModel==nil){
        _arrModel=[NSMutableArray array];
    }
    return _arrModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //注册表格单元
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;//去掉默认下划线
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.arr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeViewCell *cell = [HomeViewCell cellWithTableView:tableView];
    //HomeViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.homeStatus = self.arrModel[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeStatus *status = self.arrModel[indexPath.row];
    return status.cellHeight;
}

@end
