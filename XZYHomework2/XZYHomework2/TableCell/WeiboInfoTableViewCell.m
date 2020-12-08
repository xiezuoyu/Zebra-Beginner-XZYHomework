//
//  WeiboInfoTableViewCell.m
//  XZYHomework2
//
//  Created by XieZuoyu on 2020/12/6.
//

#import "WeiboInfoTableViewCell.h"
#import "Masonry.h"
#import "SDWebImage.h"
#import "WeiboInfo.h"

@interface WeiboInfoTableViewCell ()

@property (nonatomic,strong) UIView *infoContainer;
@property (nonatomic,strong) UIImageView *profileImage;
@property (nonatomic,strong) UILabel *userName;
@property (nonatomic,strong) UILabel *createdAt;
@property (nonatomic,strong) UILabel *weiboText;

@end

@implementation WeiboInfoTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUserInterface];
        [self setupInfoContainer];
    }
    return self;
}

#pragma mark - Setup Methods

- (void)setupUserInterface {
    [self.contentView addSubview:self.infoContainer];
    [self.infoContainer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(0, 15, 10, 15));
    }];
}

- (void)setupInfoContainer {
    [self.infoContainer addSubview:self.profileImage];
    [self.infoContainer addSubview:self.userName];
    [self.infoContainer addSubview:self.createdAt];
    [self.infoContainer addSubview:self.weiboText];
    
    [self.profileImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.infoContainer).with.offset(5);
        make.left.equalTo(self.infoContainer).with.offset(5);
        make.width.height.equalTo(@50);
    }];
    
    [self.userName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.profileImage);
        make.left.equalTo(self.profileImage.mas_right).with.offset(10);
    }];
    
    [self.createdAt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.userName.mas_left);
        make.top.equalTo(self.userName.mas_bottom).with.offset(10);
        make.bottom.equalTo(self.profileImage.mas_bottom);
    }];
    
    [self.weiboText setContentCompressionResistancePriority:UILayoutPriorityRequired                                                                                forAxis:UILayoutConstraintAxisVertical];
    [self.weiboText setContentHuggingPriority:UILayoutPriorityRequired
                                      forAxis:UILayoutConstraintAxisVertical];
    
    [self.weiboText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.profileImage.mas_bottom).with.offset(10);
        make.left.equalTo(self.profileImage.mas_left);
        make.bottom.equalTo(self.infoContainer.mas_bottom).with.offset(-10);
        make.width.equalTo(self.infoContainer.mas_width);
    }];
}

- (void)bindDataWithViewModel:(WeiboInfo *)viewModel {
    [self.profileImage sd_setImageWithURL:viewModel.profileImageUrl];
    self.userName.text = viewModel.userName;
    self.createdAt.text = viewModel.createdTime;
    self.weiboText.text = viewModel.weiboText;
    self.weiboText.numberOfLines = 0;
}

#pragma mark - Properties

- (UIView *)infoContainer {
    if (!_infoContainer) {
        _infoContainer = [[UIView alloc] init];
    }
    return _infoContainer;
}

- (UIImageView *)profileImage {
    if (!_profileImage) {
        _profileImage = [[UIImageView alloc] init];
    }
    return _profileImage;
}

- (UILabel *)userName {
    if (!_userName) {
        _userName = [[UILabel alloc] init];
    }
    return _userName;
}

- (UILabel *)createdAt {
    if (!_createdAt) {
        _createdAt = [[UILabel alloc] init];
    }
    return _createdAt;
}

- (UILabel *)weiboText {
    if (!_weiboText) {
        _weiboText = [[UILabel alloc] init];
    }
    return _weiboText;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
