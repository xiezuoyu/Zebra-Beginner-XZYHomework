//
//  WeiboInfo.h
//  XZYHomework2
//
//  Created by XieZuoyu on 2020/12/5.
//

#import "MTLModel.h"
#import "Mantle.h"
NS_ASSUME_NONNULL_BEGIN

@interface WeiboInfo : MTLModel<MTLJSONSerializing>

@property (nonatomic) NSURL *profileImageUrl;
@property (nonatomic) NSString *userName;
@property (nonatomic) NSString *weiboText;
@property (nonatomic) NSString *createdTime;

- (NSString *)getCreatedTime;
@end

NS_ASSUME_NONNULL_END
