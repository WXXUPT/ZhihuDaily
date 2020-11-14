//
//  COMMENTSView.m
//  Zhihu Daily
//
//  Created by 王旭 on 2020/11/5.
//

#import "COMMENTSView.h"
#import "CommentsTableViewCell.h"
#import "UIImageView+WebCache.h"
@implementation COMMENTSView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height*0.9)];
        self.tableView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_tableView];
        self.footView = [[COMMENTSfootView alloc] initWithFrame:CGRectMake(0, self.frame.size.height*0.9, self.frame.size.width, self.frame.size.height*0.1)];
        [self addSubview:_footView];
        self.didChange = NO;
        self.didSecondChange = NO;
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedRowHeight = 300;
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.tag = 111;
    }
    return self;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.NumberOfComments > 20) {
        return 20 + self.NumberOfComments;
    }
    return self.NumberOfComments;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIndentifier = [NSString stringWithFormat:@"cell%ld%ld",indexPath.section,indexPath.row];
    CommentsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (!cell) {
        cell = [[CommentsTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIndentifier];
        cell.foldButton.hidden = YES;
        cell.longFoldButton.hidden = YES;
        [cell.foldButton addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
        [cell.longFoldButton addTarget:self action:@selector(pressLongButton:) forControlEvents:UIControlEventTouchUpInside];
    } else if (indexPath.row < self.NumberOfLongComments){
        cell.longCommentLabel.text = self.longComment[indexPath.row];
        [cell.longCommentImageView sd_setImageWithURL:[NSURL URLWithString:[self.longCommentImages objectAtIndex:indexPath.row]]];
        cell.longCommentAuthorLabel.text = self.longCommentAuthor[indexPath.row];
        cell.longCommentTime.text = self.longCommentTime[indexPath.row];
        cell.longCommentTime.textColor = [UIColor grayColor];
        if ([self.longCommentAuthorReply[indexPath.row] isEqual:@"a"]) {
            cell.longCommentReplyLabel.text = @"a";
        } else {
            NSString *str = [NSString stringWithFormat:@"//%@：%@", _longCommentAuthorReply[indexPath.row],_longCommentReply[indexPath.row]];
            NSMutableAttributedString *noteStr = [[NSMutableAttributedString alloc] initWithString:str];
            NSRange range1 = NSMakeRange(0, [str length]);
            [noteStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:0.53f green:0.53f blue:0.53f alpha:1.00f] range:range1];
            [cell.longCommentReplyLabel setAttributedText:noteStr];
        }
        NSInteger count = [self textHeightFromTextString:cell.longCommentLabel.text width:388 fontSize:15].height / cell.longCommentLabel.font.lineHeight;
        if (count <= 2) {
            cell.longFoldButton.hidden = YES;
        } else {
            cell.longFoldButton.hidden = NO;
        }
    } else if (indexPath.row >= self.NumberOfLongComments) {
        cell.shortCommentLabel.text = _shortComment[indexPath.row - _NumberOfLongComments];
        [cell.shortCommentImageView sd_setImageWithURL:[NSURL URLWithString:[_shortCommentImages objectAtIndex:indexPath.row - _NumberOfLongComments]]];
        cell.shortCommentAuthorLabel.text = _shortCommentAuthor[indexPath.row - _NumberOfLongComments];
        cell.shortCommentTime.text = _shortCommentTime[indexPath.row - _NumberOfLongComments];
        cell.shortCommentTime.textColor = [UIColor grayColor];
        if ([_shortCommentAuthorReply[indexPath.row - _NumberOfLongComments] isEqual:@"a"]) {
            cell.shortCommentReplyLabel.text = @"";
        } else {
            NSString *str = [NSString stringWithFormat:@"//%@：%@", _shortCommentAuthorReply[indexPath.row - _NumberOfLongComments],_shortCommentReply[indexPath.row - _NumberOfLongComments]];
            NSMutableAttributedString *noteStr = [[NSMutableAttributedString alloc] initWithString:str];
            NSRange range1 = NSMakeRange(0, [str length]);
            [noteStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:0.53f green:0.53f blue:0.53f alpha:1.00f] range:range1];
            [cell.shortCommentReplyLabel setAttributedText:noteStr];
            NSInteger count = [self textHeightFromTextString:str width:388 fontSize:15].height / cell.shortCommentReplyLabel.font.lineHeight;
            if (count <= 2) {
                    cell.foldButton.hidden = YES;
            } else {
                    cell.foldButton.hidden = NO;
            }
        }

    }
    return cell;
}
-(CGSize)textHeightFromTextString:(NSString *)text width:(CGFloat)textWidth fontSize:(CGFloat)size {
    //计算 label需要的宽度和高度
    NSDictionary *dict = @{NSFontAttributeName:[UIFont systemFontOfSize:size]};
    CGRect rect = [text boundingRectWithSize:CGSizeMake(textWidth, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    
    CGSize size1 = [text sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:size]}];
    return CGSizeMake(size1.width, rect.size.height);
    
}
- (void)pressButton:(UIButton *)button {
    CommentsTableViewCell *cell = [(CommentsTableViewCell *)[button superview] superview];
    if (cell.shortCommentReplyLabel.numberOfLines == 2) {
        cell.longCommentReplyLabel.numberOfLines = 0;
    } else {
        cell.shortCommentReplyLabel.numberOfLines = 2;
    }
    if (self.didChange) {
        [button setTitle:@"展开更多" forState:UIControlStateNormal];
    } else {
        [button setTitle:@"收起" forState:UIControlStateNormal];
    }
    self.didChange = !_didChange;
    [self.tableView reloadData];
}
- (void)pressLongButton:(UIButton *)button {
    CommentsTableViewCell *cell = [(CommentsTableViewCell *)[button superview] superview];
    //button加到tableView上 要获取此时的cell 那么button.superView 就是contentView 再superView 就是cell
    if (cell.longCommentLabel.numberOfLines == 2) {
        cell.longCommentLabel.numberOfLines = 0;
    } else {
        cell.longCommentLabel.numberOfLines = 2;
    }
    if (self.didSecondChange) {
        [button setTitle:@"展示更多" forState:UIControlStateNormal];
    } else {
        [button setTitle:@"收起" forState:UIControlStateNormal];
    }
    self.didSecondChange = !_didSecondChange;
    [self.tableView reloadData];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}
@end
