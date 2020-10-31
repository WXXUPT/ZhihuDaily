//
//  MAINView.m
//  Zhihu Daily
//
//  Created by 王旭 on 2020/10/23.
//

#import "MAINView.h"
#import "CONTENTTableViewCell.h"
@implementation MAINView
- (void)setUI {
    self.backgroundColor = [UIColor whiteColor];
    self.mainScrollView = [[CarouselView alloc] initWithFrame:CGRectMake(0, 100, 414, 400)];
    _mainScrollView.delegate = self;
    _mainScrollView.currentPageColor = [UIColor orangeColor];
    _mainScrollView.pageColor = [UIColor grayColor];
    
    self.mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 414, 840) style:UITableViewStyleGrouped];
    [self.mainTableView registerClass:[CONTENTTableViewCell class] forCellReuseIdentifier:@"cell1"];
    self.mainTableView.backgroundColor = [UIColor whiteColor];
//    self.mainTableView.tableHeaderView = _mainScrollView;
    self.mainTableView.bounces = YES;
    [self addSubview:_mainTableView];
    [self addSubview:_mainScrollView];
    
    self.activityIndcator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.activityIndcator.frame = CGRectMake(165, 750, 60, 60);
    self.activityIndcator.color = [UIColor blackColor];
    self.activityIndcator.backgroundColor = [UIColor clearColor];
    self.activityIndcator.hidesWhenStopped = YES;
//    [self.activityIndcator startAnimating];
//    [self addSubview:_activityIndcator];
}
- (void)carouselView:(CarouselView *)carouselView indexOfClickedImageBtn:(NSUInteger)index {
    [self.delegate pass:index];
}
@end
