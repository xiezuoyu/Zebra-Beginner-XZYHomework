//
//  GetWeiboDataApi.h
//  XZYHomework2
//
//  Created by XieZuoyu on 2020/12/4.
//

#import "YTKRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface GetWeiboDataApi : YTKRequest

- (id)initWithRequestArgs:(NSString *)accessToken count:(NSString *)count page:(NSString *)page;

@end

NS_ASSUME_NONNULL_END
