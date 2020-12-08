//
//  WeiboInfo.m
//  XZYHomework2
//
//  Created by XieZuoyu on 2020/12/5.
//

#import "WeiboInfo.h"

@interface WeiboInfo()
@property (nonatomic) NSDate *createdAt;
@end

@implementation WeiboInfo

//return formatted time string,such as "2020-10-10"
- (NSString *)getCreatedTime {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    _createdTime = [formatter stringFromDate:self.createdAt];
    return _createdTime;
}

//init an instance from a dictionary
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
        @"profileImageUrl": @"user.profile_image_url",
        @"userName": @"user.name",
        @"createdAt": @"created_at",
        @"weiboText": @"text",
    };
}

//convert a time string from the dictionary to a NSDate object
+ (NSValueTransformer *)createdAtJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSString *dateString) {
        return [self.dateFormatter dateFromString:dateString];
    } reverseBlock:^(NSDate *date) {
        return [self.dateFormatter stringFromDate:date];
    }];
}

+ (NSDateFormatter *)dateFormatter {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    [formatter setDateFormat:@"EEE MMM dd HH:mm:ss zzz yyyy"];
    return formatter;
}

//convert a url string from the dictionary to a NSURL object
+ (NSValueTransformer *)profileImageUrlURLJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}
@end
