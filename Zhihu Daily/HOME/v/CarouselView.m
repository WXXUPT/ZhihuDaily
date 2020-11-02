//
//  CarouselView.m
//  Zhihu Daily
//
//  Created by 王旭 on 2020/10/27.
//

#import "CarouselView.h"
#import "CONTENTViewController.h"
@implementation CarouselView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIScrollView *scrollView = [[UIScrollView alloc] init];
        
        scrollView.delegate = self;
        scrollView.showsVerticalScrollIndicator = NO;
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.pagingEnabled = YES;
        scrollView.bounces = YES;
        
        [self addSubview:scrollView];
        self.scrollView = scrollView;
        
        for (int i = 0; i < 3; i++) {
            UIButton *imageBtn = [[UIButton alloc] init];
            [scrollView addSubview:imageBtn];
        }
        
        UIPageControl *pageControl = [[UIPageControl alloc] init];
        [self addSubview:pageControl];
        self.pageControl = pageControl;
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.scrollView.frame = CGRectMake(0, 50, 414, 360);
    
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    
    if (self.isScrollDorectionPortrait) {
        self.scrollView.contentSize = CGSizeMake(width, height * 3);
    } else {
        self.scrollView.contentSize = CGSizeMake(width * 3, height);
    }
    
    for (int i = 0; i < 3; i++) {
        UIButton *imageBtn = self.scrollView.subviews[i];
        [imageBtn addTarget:self action:@selector(imageBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        if (self.isScrollDorectionPortrait) {
            imageBtn.frame = CGRectMake(0, i * height, width, height);
        } else {
            imageBtn.frame = CGRectMake(i * width, 0, width, height);
        }
    }
    if (self.isScrollDorectionPortrait) {
        self.scrollView.contentOffset = CGPointMake(0, height);
    } else {
        self.scrollView.contentOffset = CGPointMake(width, 0);
    }
    CGFloat pageW = 100;
    CGFloat pageH = 20;
    CGFloat pageX = width - pageW;
    CGFloat pageY = height - pageH;
    self.pageControl.frame = CGRectMake(pageX, pageY, pageW, pageH);
}
- (void)setCurrentPageColor:(UIColor *)currentPageColor {
    _currentPageColor = currentPageColor;
    self.pageControl.currentPageIndicatorTintColor = currentPageColor;
}
- (void)setPageColor:(UIColor *)pageColor {
    _pageColor = pageColor;
    self.pageControl.pageIndicatorTintColor = pageColor;
}
- (void)setImages:(NSArray *)images {
    _images = images;
    self.pageControl.numberOfPages = images.count;
    self.pageControl.currentPage = 0;
    [self setContent];
    [self startTimer];
}
- (void)setContent {
    for (int i = 0; i < self.scrollView.subviews.count; i++) {
        UIButton *imageBtn = self.scrollView.subviews[i];
        NSInteger index = self.pageControl.currentPage;
        if (i == 0) {
            index--;
        } else if (i == 2) {
            index++;
        }
        if (index < 0) {
            index = self.pageControl.numberOfPages - 1;
        } else if (index == self.pageControl.numberOfPages) {
            index = 0;
        }
        imageBtn.tag = index;
        [imageBtn setBackgroundImage:self.images[index] forState:UIControlStateNormal];
        [imageBtn setBackgroundImage:self.images[index] forState:UIControlStateHighlighted];
    }
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSInteger page = 0;
    CGFloat minDistance = MAXFLOAT;
    for (int i = 0; i < self.scrollView.subviews.count; i++) {
        UIButton *imageBtn = self.scrollView.subviews[i];
        CGFloat distance = 0;
        if (self.isScrollDorectionPortrait) {
            distance = ABS(imageBtn.frame.origin.y - scrollView.contentOffset.y);
        } else {
            distance = ABS(imageBtn.frame.origin.x - scrollView.contentOffset.x);
        }
        if (distance < minDistance) {
            minDistance = distance;
            page = imageBtn.tag;
        }
    }
    self.pageControl.currentPage = page;
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.timer invalidate];
    self.timer = nil;
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self startTimer];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    [self setContent];
    if (self.isScrollDorectionPortrait) {
        self.scrollView.contentOffset = CGPointMake(0, height);
    } else {
        self.scrollView.contentOffset = CGPointMake(width, 0);
    }
}
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    [self setContent];
    if (self.isScrollDorectionPortrait) {
        self.scrollView.contentOffset = CGPointMake(0, height);
    } else {
        self.scrollView.contentOffset = CGPointMake(width, 0);
    }
}
- (void)startTimer {
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:4.0 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    self.timer = timer;
}
- (void)nextImage {
    CGFloat height = self.bounds.size.height;
    CGFloat width = self.bounds.size.width;
    if (self.isScrollDorectionPortrait) {
        [self.scrollView setContentOffset:CGPointMake(0, 2 * height) animated:YES];
    } else {
        [self.scrollView setContentOffset:CGPointMake(2 * width, 0) animated:YES];
    }
}
- (void)imageBtnClick:(UIButton *)btn {
    NSLog(@"1");
    [self.CarouselViewDelegate carouselView:self indexOfClickedImageBtn:btn.tag];
}
@end
