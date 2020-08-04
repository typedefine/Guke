//
//  PatientRecordInfoManageModel.h
//  GuKe
//
//  Created by 莹宝 on 2020/8/2.
//  Copyright © 2020 shangyukeji. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PatientRecordBookCellModel.h"
#import "PatientRecordInfoManageCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PatientRecordInfoSectionModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) NSInteger rowCount;

@end


@interface PatienRecordFitMentionSectionModel : PatientRecordInfoSectionModel

@property (nonatomic, copy) NSString *content;

@end

@interface PatientRecordInfoManageSectionModel : PatientRecordInfoSectionModel

//@property (nonatomic, assign) BOOL showRecord;
//@property (nonatomic, assign) BOOL showSurgery;
//@property (nonatomic, assign) BOOL showFollwUp;

@property (nonatomic, readonly) NSArray<PatientRecordInfoManageCellModel *> *cellModelList;

@end


@interface PatientRecordBookSectionModel : PatientRecordInfoSectionModel

@property (nonatomic, readonly) NSArray<PatientRecordBookCellModel *> *cellModelList;

@end

@interface PatientRecordInfoManageModel : NSObject

@property (nonatomic, assign) NSInteger numberOfSection;
@property (nonatomic, readonly) NSArray<PatientRecordInfoSectionModel *> *sectionModelList;

- (void)configureWithData:(id)data;

- (NSString *)titleForSection:(NSInteger)section;
- (NSInteger)numberOfRowAtSection:(NSInteger)section;
- (PatientRecordInfoSectionModel *)sectionModel:(NSInteger)section;
- (CGSize)sizeForItemAtSection:(NSInteger)section;

@end

NS_ASSUME_NONNULL_END
