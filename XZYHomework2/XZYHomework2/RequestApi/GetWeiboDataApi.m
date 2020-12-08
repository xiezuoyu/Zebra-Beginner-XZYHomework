//
//  GetWeiboDataApi.m
//  XZYHomework2
//
//  Created by XieZuoyu on 2020/12/4.
//

#import "GetWeiboDataApi.h"

@implementation GetWeiboDataApi {
    NSString *_accessToken;
    NSString *_count;
    NSString *_page;
}

- (id)initWithRequestArgs:(NSString *)accessToken count:(NSString *)count page:(NSString *)page {
    self = [self init];
    if (self) {
        _accessToken = accessToken;
        _count = count;
        _page = page;
    }
    return self;
}
- (BOOL)useCDN {
    return NO;
}
- (NSString *)baseUrl {
    return @"https://api.weibo.com";
}

- (NSString *)requestUrl {
    return @"/2/statuses/home_timeline.json";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodGET;
}

- (id)requestArgument {
    return @{
        @"access_token": _accessToken,
        @"count": _count,
        @"page": _page
    };
}
@end
