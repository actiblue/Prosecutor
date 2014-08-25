//
//  NetWork.h
//  Prosecutor
//
//  Created by joanfen on 14-6-9.
//  Copyright (c) 2014年 joanfen. All rights reserved.
//

#ifndef Prosecutor_NetWork_h
#define Prosecutor_NetWork_h

#define KDefault_IP     @"58.241.101.178"
#define KDefault_port   @":8089"
#define URL(string)     [NSURL URLWithString:string]

#define KGetWeb_STR(type)   [NSString stringWithFormat:@"http://%@%@/zjjj/API_JJ_detailSingle.action?resourcehotel.ctype=%d",KDefault_IP,KDefault_port,type]
#define KGetWeb_URL(type)   URL(KGetWeb_STR(type))

#define KGetData_STR(type)  [NSString stringWithFormat:@"http://%@%@/zjjj/API_JJ_detailSingleData.action?resourcehotel.ctype=%d",KDefault_IP,KDefault_port,type]
#define KGetData_URL(type)      URL(KGetWeb_STR(type))

#define KGetListData_STR(type,page)  [NSString stringWithFormat:@"http://%@%@/zjjj/API_JJGetlistByType.action?resourcehotel.ctype=%d&entityPage.currentPage=%d",KDefault_IP,KDefault_port,type,page]

#define KGetListData_URL(type,page)  URL(KGetListData_STR(type,page))

#define KGetDetail_STR(cid) [NSString stringWithFormat:@"http://%@%@/zjjj/API_JJ_detail_android.action?resourcehotel.cid=%ld",KDefault_IP,KDefault_port,(long)cid]

#define KGetDetail_URL(cid)  URL(KGetDetail_STR(cid))

#define KGetPicList_STR  [NSString stringWithFormat:@"http://%@%@/zjjj/API_JJGetRY.action",KDefault_IP,KDefault_port]

#define KGetPicList_URL  URL(KGetPicList_STR)

#define KGetPic_STR(pic)  [NSString stringWithFormat:@"http://%@%@/zjjj/images/pic/%@",KDefault_IP,KDefault_port,pic]
#define KGetPic_URL(pic)  URL(KGetPic_STR(pic))

#define KSina_STR @"http://weibo.cn/u/3204113874?rand=6421&p=r"
#define KTX_STR @"http://m.3g.qq.com/wbread/copage/singleguest?lp=0,0,5,0,6&id=zjsjcy"
#define KProsecutor_STR @"http://kfqjcy.zjna.gov.cn/"
#define KJSJC @"http://www.js.jcy.gov.cn/"

#endif
