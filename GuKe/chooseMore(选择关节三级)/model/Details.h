//
//  Details.h
//  ChooseAreas
//
//  Created by 韩新辉 on 2017/12/12.
//  Copyright © 2017年 韩新辉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Details : NSObject
@property (nonatomic, assign) int layer;
@property (nonatomic, strong) NSString * uid;
@property (nonatomic, strong) NSArray *children;
@property (nonatomic, strong) NSString *jointsName;
//临时变量
@property (nonatomic ,assign) BOOL flag;
@end
