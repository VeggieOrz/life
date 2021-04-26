//
//  LFInfoMacro.h
//  life
//
//  Created by liuweihong on 2021/4/26.
//  Copyright © 2021 veggie. All rights reserved.
//

#ifndef LFInfoMacro_h
#define LFInfoMacro_h

// 获取 APP 名称
#define APP_NAME ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"])

// 获取 APP 版本号
#define APP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

#endif /* LFInfoMacro_h */
