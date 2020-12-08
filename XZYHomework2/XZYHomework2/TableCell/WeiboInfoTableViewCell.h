//
//  WeiboInfoTableViewCell.h
//  XZYHomework2
//
//  Created by XieZuoyu on 2020/12/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class WeiboInfo;

@interface WeiboInfoTableViewCell : UITableViewCell

- (void)bindDataWithViewModel:(WeiboInfo *)viewModel;

@end

NS_ASSUME_NONNULL_END
