//
//  ViewController.m
//  XZYHomework1
//
//  Created by XieZuoyu on 2020/12/3.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()

@property (nonatomic) UIButton *addButton;
@property (nonatomic) UILabel *countLabel;
@property (nonatomic) unsigned int countRecord;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.addButton = [[UIButton alloc] init];
    self.countLabel = [[UILabel alloc] init];
    UIView* boundOfButtonAndLabelView = [[UIView alloc] init];

    
    [self.addButton setBackgroundImage:[UIImage imageNamed:@"addButton.jpg"] forState:UIControlStateNormal];
    [self.addButton setTitle:@"ADD" forState:UIControlStateNormal];
    
    [self.addButton addTarget:self action:@selector(touchAddButton:) forControlEvents:UIControlEventTouchUpInside];

    [self.countLabel setText:[NSString stringWithFormat:@"Count: %u", self.countRecord]];
    [self.countLabel setTextAlignment:NSTextAlignmentCenter];
    
    [boundOfButtonAndLabelView addSubview:self.addButton];
    [boundOfButtonAndLabelView addSubview:self.countLabel];
    
    [self.view addSubview:boundOfButtonAndLabelView];
    
    [self.addButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.countLabel.mas_bottom).offset(20);
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.equalTo(@160);
        make.height.equalTo(@80);
    }];
    
    [[self countLabel] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(boundOfButtonAndLabelView.mas_top);
        make.width.equalTo(self.view.mas_width);
        make.height.equalTo(@60);
    }];
    
    [boundOfButtonAndLabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view.mas_width);
        make.height.equalTo(@160);
        make.center.equalTo(self.view);
    }];
    
}

- (void)setCountRecord:(unsigned int)countRecord {
    _countRecord = countRecord;
    self.countLabel.text = [NSString stringWithFormat:@"Count: %u", self.countRecord];
}

- (void)touchAddButton:(UIButton *)sender {
    self.countRecord++;
}
@end
