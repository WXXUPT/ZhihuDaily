//
//  CarouselView.h
//  Zhihu Daily
//
//  Created by 王旭 on 2020/10/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class CarouselView;
@protocol CarouselViewDelegate <NSObject>
@optional
- (void)carouselView:(CarouselView *)carouselView indexOfClickedImageBtn:(NSUInteger)index;
@end

@interface CarouselView : UIView<UIScrollViewDelegate>
@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, weak) UIPageControl *pageControl;
@property (nonatomic, weak) NSTimer *timer;
@property (nonatomic, copy) NSArray *images;
@property (nonatomic, strong) UIColor *currentPageColor;
@property (nonatomic, strong) UIColor *pageColor;
@property (nonatomic, assign, getter=isScrollDorectionPortrait) BOOL scrollDorectionPortrait;
@property (weak, nonatomic) id<CarouselViewDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
