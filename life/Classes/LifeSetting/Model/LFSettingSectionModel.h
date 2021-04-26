//
//  LFSettingSectionModel.h
//  life
//
//  Created by liuweihong on 2021/4/21.
//  Copyright © 2021 veggie. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LFSettingSectionModel : NSObject

@property (nonatomic, copy)   NSString *sectionHeaderTitle;         //该 section Header 的标题
@property (nonatomic, copy)   NSString *sectionFooterTitle;         //该section Footer 的标题
@property (nonatomic, strong) NSMutableArray *cellViewModelsArray;      //该section的数据源

@property (nonatomic, assign) CGFloat sectionHeaderHeight;         //header的高度
@property (nonatomic, assign) CGFloat sectionFooterHeight;         //footer的高度

@property (nonatomic, copy) NSArray *itemsArray;

- (instancetype)initWithItemsArray:(NSArray *)itemsArray;

@end

NS_ASSUME_NONNULL_END
