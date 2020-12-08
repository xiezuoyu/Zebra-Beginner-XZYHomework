//
//  ViewController.m
//  XZYHomework2
//
//  Created by XieZuoyu on 2020/12/4.
//

#import "ViewController.h"
#import "GetWeiboDataApi.h"
#import "WeiboInfo.h"
#import "WeiboInfoTableViewCell.h"
#import "SDWebImage.h"
#import "MJRefresh.h"

@interface ViewController ()

@property (nonatomic, strong) UITableView *infoTableView;
@property (nonatomic) NSArray *infoList;
@property (nonatomic) NSMutableArray *tempList;
@property (nonatomic) int page;
@property (nonatomic) bool isNoMoreData;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.infoTableView];
    [self setRefreshFooter];
    // Do any additional setup after loading the view.
    [self requstForWeibo:++self.page];
}
#pragma mark - Request

//send a request for weibo by the page
- (void)requstForWeibo:(int)page {
    // Do any additional setup after loading the view.
    if (page >= 5) {
        self.isNoMoreData = YES;
        return;
    }
    GetWeiboDataApi *getInfoApi = [[GetWeiboDataApi alloc] initWithRequestArgs:@"2.0063g7WGnFT37E77c8596659sXH4AB" count:@"30" page:[NSString stringWithFormat:@"%d", page]];
    [getInfoApi startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        NSLog(@"successed");
        NSDictionary *infoDictionary = request.responseJSONObject;
        NSArray *status = [infoDictionary objectForKey:@"statuses"];
        for (NSDictionary *weibo in status) {
            WeiboInfo *wbInfo = [MTLJSONAdapter modelOfClass:WeiboInfo.class fromJSONDictionary:weibo error:nil];
            [self.tempList addObject: wbInfo];
        }
        self.infoList = [self.tempList copy];
        [self.infoTableView reloadData];
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        NSLog(@"failed");
    }];
}
#pragma mark - SetUp

- (void) setRefreshFooter {
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self requstForWeibo:++self.page];
        if (self.isNoMoreData) {
            [self.infoTableView.mj_footer setState:MJRefreshStateNoMoreData];
        } else {
            [self.infoTableView.mj_footer setState:MJRefreshStateIdle];
        }
        //[self.infoTableView.mj_footer endRefreshing];
    }];
    footer.automaticallyRefresh = NO;
    //set attributes for footer
    [footer setTitle:@"Click or drag up to refresh" forState:MJRefreshStateIdle];
    [footer setTitle:@"Loading more ..." forState:MJRefreshStateRefreshing];
    [footer setTitle:@"No more data" forState:MJRefreshStateNoMoreData];
    
    footer.stateLabel.font = [UIFont systemFontOfSize:17];
    
    //footer.stateLabel.textColor = [UIColor blueColor];
    
    self.infoTableView.mj_footer = footer;
}

#pragma mark - UITableViewDataSource

- (nonnull UITableViewCell *)tableView
:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    WeiboInfo *weiboViewModel = self.infoList[indexPath.row];
    WeiboInfoTableViewCell *weiboViewCell = [self.infoTableView dequeueReusableCellWithIdentifier:NSStringFromClass([WeiboInfoTableViewCell class]) forIndexPath:indexPath];
    [weiboViewCell bindDataWithViewModel: weiboViewModel];
    return weiboViewCell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.infoList count];
}

#pragma mark - Properties

- (UITableView *)infoTableView {
    if (!_infoTableView) {
        _infoTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _infoTableView.delegate = self;
        _infoTableView.dataSource = self;
        _infoTableView.backgroundColor = [UIColor clearColor];
        _infoTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _infoTableView.rowHeight = UITableViewAutomaticDimension;
        _infoTableView.estimatedRowHeight = 200;
        [_infoTableView registerClass:[WeiboInfoTableViewCell class] forCellReuseIdentifier:NSStringFromClass([WeiboInfoTableViewCell class])];
    }
    return _infoTableView;
}

- (NSMutableArray *)tempList {
    if (!_tempList) {
        _tempList = [[NSMutableArray alloc] init];
    }
    return _tempList;
}
@end

