//
//  LFDiary.h
//  life
//
//  Created by liuweihong on 2021/2/17.
//  Copyright © 2021 veggie. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, LFDiaryWeather) {
    LFDiaryWeatherSunny           = 0,        // 晴天
    LFDiaryWeatherOvercast        = 1,        // 阴天
    LFDiaryWeatherCloudy          = 2,        // 多云
    LFDiaryWeatherLightRain       = 3,        // 小雨
    LFDiaryWeatherHeavyRain       = 4,        // 大雨
    LFDiaryWeatherThunderStorm    = 5,        // 雷雨
    LFDiaryWeatherLightSnow       = 6,        // 小雪
    LFDiaryWeatherHeavySnow       = 7,        // 大雪
    LFDiaryWeatherFoggy           = 8,        // 雾
    LFDiaryWeatherHaze            = 9,        // 霾
    LFDiaryWeatherDust            = 10,       // 扬尘
    LFDiaryWeatherSandStorm       = 11        // 沙尘暴
};

NS_ASSUME_NONNULL_BEGIN

@interface LFDiary : NSObject

@property (nonatomic, copy) NSString *diaryId;
// 日记标题
@property (nonatomic, copy) NSString *diaryTitle;
// 日记内容
@property (nonatomic, copy) NSString *diaryContent;
// 日记日期
@property (nonatomic, strong) NSDate *diaryDate;
// 天气
@property (nonatomic, assign) LFDiaryWeather diaryWeather;

@end

NS_ASSUME_NONNULL_END
