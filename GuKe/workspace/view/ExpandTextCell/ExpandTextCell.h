//
//  WorkSpaceInfoCellTableViewCell.h
//  GuKe
//
//  Created by yb on 2020/11/2.
//  Copyright © 2020 shangyukeji. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class ExpandTextCellModel;

@interface ExpandTextCell : UITableViewCell

- (void)configWithData:(ExpandTextCellModel *)data expand:(void (^ )(BOOL))expand;

@end

NS_ASSUME_NONNULL_END