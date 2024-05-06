class UrlConst {

  ///app当前配置信息
  static const String APP_CONFIG_LIST = "app/sys/config/get";

  /// 发卡业务介绍
  static const String CARD_RECOMMEND = "active/v1/destination?activityType=open_card";

  /// fansUp
  static const String VIEW_FANS_UP = "app/viewFansUp.html";
  static const String SYSTOM_CONFIG_LIST = "app/sys/config/list.html";
  static const String API_TEST = "/api/test";

  /// ------------------- common start ----------------------
  /// 分享连接
  static const String API_SHARE_INFO = "app/sharePic.html";

  static const String API_WEB_ACTIVITY = "active/v1/destination";

  /**
      获取用户分享图片和分享权限
      GET
      position：位置   0红包 ，1币赢严选，2币赢学院，3交易打卡，4常规邀请，5下载分享，6K线分享，
      7社区动态，8直播分享，9OTC广告口令，10合约当前仓位，11合约历史仓位，12盲盒，13交易员排行榜，14交易员主页分享,15 coinw card
      client：客户端  0代表WEB, 1代表APP，2代表H5
   */
  static const String API_USER_SHARE_INFO = "active/v1/platForm/share/pictureList";

  /// ------------------- common end ----------------------

  /// ------------------- ieo start ----------------------
  /// ieo列表
  static const String API_IEO_PROJECT_LIST = "financial/v1/ieo/projectInfo/list";
  /// ieo详情
  static const String API_IEO_PROJECT_DETAIL = "financial/v1/ieo/projectInfo/get";
  /// ieo购买协议
  static const String API_IEO_AGREEMENT = "financial/v1/ieo/projectInfo/agreement";
  /// ieo 同意协议
  static const String API_IEO_AGREEMENT_CONFIRM = "financial/v1/ieo/projectInfo/agreement/confirm";
  /// ieo 购买
  static const String API_IEO_BUY = "financial/v1/ieo/projectInfo/purchase";
  /// ieo 购买记录
  static const String API_IEO_RECORD = "financial/v1/ieo/projectInfo/subscription/detail";

  /// ------------------- ieo end ----------------------

  /// ------------------- 理财相关 start ----------------------
  static const String API_FINANCIAL_INCOME_LIST = "financial/v1/invest/getFinancialIncomeList";

  static const String API_FINANCIAL_REDEMPTION = "financial/v1/redemption";
  static const String API_FINANCIAL_AUTO = "financial/v1/invest/applyFinancialAuto";
  /// ------------------- 理财相关 start ----------------------

  /// ------------------- otc start ----------------------
  /// 获取用户对应法币 和跳转到快捷还是普通
  static const String API_OTC_CURRENCY_DEFAULT = "v2/otc/mercuryo/findCurrenciesByIp";

  /// 广告单列表
  static const String API_OTC_ADVERTISEMENT_LIST = "v2/otc/open/data/advertisement/page";

  /// 广告单列表-visa
  static const String API_OTC_ADVERTISEMENT_VISA_LIST = "v2/otc/mercuryo/facade";

  /// otc可交易的币种信息
  static const String API_OTC_COIN_INFO = "v2/otc/open/data/coin-type/list/open";

  /// otc第三方支持的虚拟币 信用卡交易
  static const String API_OTC_COIN_CREDIT_CARD = "v2/otc/data/order/thirdPartyCoin";

  /// otc信用卡第三方列表
  static const String API_OTC_SYMBOL_PRICE_THIRD_PARTY = "v2/otc/data/order/symbolPriceThirdParty";

  /// 法币 快捷交易支持的法币
  static const String API_OTC_CURRENCY_AND_TYPE = "v2/otc/mercuryo/findCurrenciesAndType";
  static const String API_OTC_CURRENCY_AND_TYPE_V2 = "v2/otc/mercuryo/findCurrenciesAndTypeV2";

  /// 法币 自选交易支持的法币
  static const String API_OTC_OPTIONAL_CURRENCY = "v2/otc/mercuryo/findCurrenciesOrdinary";
  static const String API_OTC_OPTIONAL_CURRENCY_V2 = "v2/otc/mercuryo/findCurrenciesOrdinaryV2";
  /// ------------------- otc 支付 end ----------------------
  //分页查询支付账号
  static const String API_OTC_PAY_LIST = "v2/otc/data/pay-account/page";
  //otc 设置昵称
  static const String API_OTC_SET_NICKNAME = "v2/otc/data/user-info/update";
  //otc银行卡列表
  static const String API_OTC_BANK_LIST = "v2/otc/set/receivable";
  //印尼银行卡列表
  static const String API_OTC_NGN_BANK_LIST = "v2/otc/set/NgnReceivable";
  //俄罗斯行卡列表
  static const String API_OTC_RU_BANK_LIST = "v2/otc/set/RubReceivable";
  //其他银行卡列表
  static const String API_OTC_OTHER_BANK_LIST = "v2/otc/set/findReceivable";
  //otc修改支付
  static const String API_OTC_CURRENCY_PAYS_WAY = "v2/otc/mercuryo/findCurrenciesToPay";
  static const String API_OTC_CURRENCY_PAYS_WAYV2 = "v2/otc/mercuryo/findCurrenciesToPayV2";
  //otc添加支付
  static const String API_OTC_ADD_BANK = "v2/otc/data/pay-account/add";
  //otc修改支付
  static const String API_OTC_UPDATE_BANK = "v2/otc/data/pay-account/update";
  //otc fiatpay添加支付
  static const String API_OTC_FIATPAY_ADD_BANK = "v2/otc/fiatpay/savePayAccount";
  //otc fiatpay删除支付
  static const String API_OTC_FIATPAY_DELETE_BANK = "v2/otc/fiatpay/delPayAccount";
  //otc fiatpay列表
  static const String API_OTC_FIATPAY_PAY_LIST = "v2/otc/fiatpay/findUserPayAccount";
  //商家支付方式详情
  static const String API_OTC_FIATPAY_BUSINESS_DETAIL = "v2/otc/fiatpay/findPayAccount";
  //Fiatpay 下单后支付成功
  static const String API_OTC_FIATPAY_PAY = "v2/otc/fiatpay/oneKey/pay";
  //otc 支付更改状态 开关 和删除
  static const String API_OTC_STATUE_BANK = "v2/otc/data/pay-account/changeStatus";
  //上传图片
  static const String API_OTC_UPLOAD_IMAGE = "app/otc/user/upload.html";
  //otc订单
  static const String API_OTC_ORDER_LIST = "v2/otc/data/order/page";
  //otc订单列表
  static const String API_OTC_ORDER_LIST_ALL = "v2/otc/data/order/orderList";
  //otc   取消申诉
  static const String API_OTC_CANCEL_APPEAL = "v2/otc/data/order/user/cancelAppeal";
  //otc   区块交易id上传
  static const String API_OTC_ORDER_CHAIN_HASH = "v2/otc/openc/order/paid";

  //otc商户信息
  static const String API_OTC_BUSINESS_INFO = "v2/otc/open/org/merchant";
  //otc商户广告单
  static const String API_OTC_BUSINESS_AD_LIST = "v2/otc/data/advertisement/page";
  //otc商家订单下架
  static const String API_OTC_BUSINESS_ORDER_OFF = "v2/otc/data/advertisement/user-cancel";
  //otc商家订单上架
  static const String API_OTC_BUSINESS_ORDER_ON = "v2/otc/data/advertisement/user-putaway";
  //otc商家订单删除
  static const String API_OTC_BUSINESS_ORDER_DELET = "v2/otc/data/advertisement/user-del";
  //otc商家订单编辑前验证
  static const String API_OTC_BUSINESS_ORDER_EDIT_VALIDATE = "v2/otc/data/advertisement/update/validate";
  /// ------------------- otc edn ----------------------

  /// otc用户信息
  static const String API_OTC_USER_INFO = "v2/otc/data/user-info/get-base-userinfo";

  /// 广告单下单前验证
  static const String API_OTC_ORDER_VALIDATE = "v2/otc/data/advertisement/validate";

  /// 广告单新增订单
  static const String API_OTC_ADD_ORDER = "v2/otc/data/order/add";

  /// 广告单新增订单-visa
  static const String API_OTC_MERCURYO_ADD_ORDER = "v2/otc/mercuryo/add";

  /// visa 下单最大最小限额
  static const String API_OTC_MERCURYO_LIMIT = "v2/otc/mercuryo/limit";

  /// 订单详情信息
  static const String API_OTC_ORDER_DETAIL = "v2/otc/data/order/pay";

  /// 取消订单
  static const String API_OTC_ORDER_CANCEL = "v2/otc/data/order/user/cancel/%s";

  /// 买币 确认支付
  static const String API_OTC_PAY_CONFIRM = "v2/otc/data/order/user/payed/%s";

  /// 卖币 确认收款 放币
  static const String API_OTC_SELL_RELEASE = "v2/otc/data/order/user/release/%s";

  /// otc用户卖出,更新订单支付方式
  static const String API_OTC_SELL_PAY_SELECT = "v2/otc/data/order/otcUserSell";

  /// 申述 检查
  static const String API_OTC_COMPLAINT_CHECK = "v2/otc/data/complaint/check";

  /// 申述
  static const String API_OTC_COMPLAINT_ADD = "v2/otc/data/complaint/add";

  /// 快捷交易 查询广告平均价
  static const String API_OTC_AVG_PRICE = "v2/otc/data/order/symbolPriceBiAn";

  /// 快捷交易 快捷交易配置
  static const String API_OTC_FAST_CONFIG = "v2/otc/one-key-matching/config";

  /// 查询撮合广告 升级版 返回所有支付方式
  static const String API_OTC_FAST_MATCHING = "v2/otc/one-key-matching/advertisementV2";

  /// 快捷交易 三方平台比价接口
  static const String API_OTC_FAST_MERCURYO_COMPARE_PRICE =
      "v2/otc/mercuryo/comparePrice";

  /// 快捷交易 一键下单
  static const String API_OTC_FAST_ADD = "v2/otc/one-key-matching/add";

  /// 快捷交易 openC url
  static const String API_OTC_FAST_OPENC_URL = "v2/otc/openc/oneKey/add";

  /// 快捷交易 mercuryo 下单
  static const String API_OTC_FAST_MERCURYO_URL = "v2/otc/mercuryo/oneKey/add";

  /// 快捷交易 advcash 下单
  static const String API_OTC_FAST_ADVCASH_URL = "v2/otc/advcash/oneKey/add";

  /// 快捷交易 itez 下单
  static const String API_OTC_FAST_ITEZ_URL = "v2/otc/itez/oneKey/add";

  /// 快捷交易 ACH 下单
  static const String API_OTC_FAST_ACH_URL = "v2/otc/ach/oneKey/add";

  /// 快捷交易 Fiatpay 下单
  static const String API_OTC_FAST_FIATPAY_URL = "v2/otc/fiatpay/oneKey/add";

  /// 快捷交易 legend trading 获取安全参数
  static const String API_OTC_FAST_FIND_SAFE = "v2/otc/lt/findSafe";

  /// 快捷交易 legend trading 跳转之前需要做kyc
  static const String API_OTC_FAST_LEGEND_KYC = "v2/otc/lt/legendTradingKyc";

  /// 获取ACH 的支付方式
  static const String API_OTC_FAST_ACH_PAY_METHOD = "v2/otc/ach/findCurrencyPayCode";

  /// ACH到账金额查询
  static const String API_OTC_FAST_ACH_AMOUNT_RECEIVED = "v2/otc/ach/getSymbolPriceByAch";

  /// 开启的支付账号
  static const String API_OTC_PAY_OPEN_LIST = "v2/otc/data/pay-account/openList";

  /// 查询UID是黑名单
  static const String API_OTC_UID_IS_BLACK = "v2/otc/data/faceId/isBlack";

  /// otc首页订单提醒
  static const String API_OTC_ORDER_TIP = "v2/otc/data/order/tip";

  /// otc首页为完成订单提醒
  static const String API_OTC_ACTIVITY_ORDER = "v2/otc/data/order/activityOrder";

  /// otc POST添加黑名单、GET获取黑名单列、DELETE移除黑名单
  static const String API_OTC_BLAC_KLIST = "v2/otc/blacklist";
  /// otc 是否在黑名单
  static const String API_OTC_IS_BLACK = "v2/otc/blacklist/is-black";
  /// 卡片大厅
  static const String API_ISSUE_CARD_HOME = "v2/otc/hyper-pay/card/home";
  /// 推荐列表
  static const String API_ISSUE_CARD_RECOMMEND = "v2/otc/hyper-pay/card/recommend";
  /// 卡片详情
  static const String API_ISSUE_CARD_DETAIL = "v2/otc/hyper-pay/card/card-detail";
  /// 发送手机验证码
  static const String API_ISSUE_CARD_SEND_PHONE_CODE = "v2/otc/hyper-pay/card/send-phone-code";
  /// 发送邮件验证码
  static const String API_ISSUE_CARD_SEND_MAIL_CODE = "v2/otc/hyper-pay/card/send-mail-code";
  /// 卡片申请
  static const String API_ISSUE_CARD_APPLY = "v2/otc/hyper-pay/card/apply";
  /// 支付开卡费
  static const String API_ISSUE_CARD_PAYMENT_APPLY = "v2/otc/hyper-pay/card/payment-apply";
  /// 我的卡片列表
  static const String API_ISSUE_CARD_MY_CARD = "v2/otc/hyper-pay/card/my-card";
  /// 充值预估
  static const String API_ISSUE_CARD_ESTIMATION = "v2/otc/hyper-pay/card/estimation";
  /// 充值
  static const String API_ISSUE_CARD_RECHARGE = "v2/otc/hyper-pay/card/recharge";
  /// 申请记录
  static const String API_ISSUE_CARD_APPLY_RECORD = "v2/otc/hyper-pay/card/apply-record";
  /// 消费记录
  static const String API_ISSUE_CARD_TRADE_RECORD = "v2/otc/hyper-pay/card/trade-record";
  /// 常见问题列表
  static const String API_ISSUE_CARD_QUESTIONS = "v2/otc/hyper-pay/card/questions";
  /// 判断用户是否可以申请卡片/已申请判断是否可以充值
  static const String API_ISSUE_CARD_IS_APPLY = "v2/otc/hyper-pay/card/checkUserExtend";
  /// banner列表
  static const String API_ISSUE_CARD_BANNER = "v2/otc/hyper-pay/card/banner";
  /// 选择国籍
  static const String API_OPEN_COMMON_COUNTRY = "open/coinw/common/country";
  /// 根据ip获取当前区号
  static const String API_OPEN_FIND_IP_CODE = "v2/users/open/findIpCode";

  /// 获取修改账单地址的国家省份
  static const String API_ISSUE_BILL_COUNTRY_LIST = "v2/otc/hyper-pay/card/address-change-country";
  /// 获取账单地址
  static const String API_ISSUE_CARD_ADDRESS = "v2/otc/hyper-pay/card/address-query";
  /// 修改账单地址
  static const String API_ISSUE_CARD_ADDRESS_EDIT = "v2/otc/hyper-pay/card/address-change";


  /// ------------------- otc end ----------------------

  /// ------------------- assets start ----------------------
  /// 资产列表
  static const String API_ASSET_WALLET_ACCOUNT = "asset/v1/api/wallet/account";
  ///赠金列表v2接口
  static const String API_ASSET_WALLET_BOUNS = "asset/v1/api/wallet/bonus";
  ///流水列表-充值&提现
  static const String API_ASSET_WALLET_FLOW_LIST = "asset/v1/api/wallet/flow/list";
  /// 币种下拉框
  static const String API_ASSET_COIN_OPTION = "asset/v1/api/coin/option";
  /// 取消提现
  static const String API_ASSET_CANCEL_WITHDRAW = "asset/v1/api/wallet/withdraw/cancel";
  /// 选择地址后检测地址风险
  static const String API_ASSET_ADDRESS_RISK= "asset/v1/api/wallet/withdraw/addressRiskControl";
  /// 添加或更新地址前检测地址风险
  static const String API_ASSET_FRONT_ADDRESS_RISK= "asset/v1/api/withdraw/address/riskControlAndAdd";
  /// 充值币种列表
  static const String API_ASSET_OPTION_WITHDRAWSOURCE = "asset/v1/api/option/withdrawAddressSource";
  /// 热门币种
  static const String API_ASSET_COIN_HOT = "asset/v1/api/coin/hotCoinOption";
  /// 单币种详情
  static const String API_ASSET_WALLET_COIN_DETAIL = "asset/v1/api/wallet/coin";
  static const String API_ASSET_USER_WALLET = 'app/getUserWallet/v1';
  static const String API_ASSET_USER_WITHDRAWADDRESS = 'asset/v1/api/withdraw/address/list';
  ///提现
  static const String API_ASSET_USER_WITHDRAWSUBMIT = 'asset/v1/api/wallet/withdraw';
  /// 发送短信验证码
  static const String API_ASSET_USER_SENDMSGCODE = "app/sendMessageCode.html";
  static const String API_ASSET_USER_SENDMSGCODE_NEW = "v2/users/security/send-user-msg";
  /// 全场景验证码发送（短信/邮件）需要登陆
  static const String API_ALL_SENDMSGCODE_NEW = "v2/users/security/send-verify-code";

  /// 发送手机验证码-未登录
  static const String API_USER_NEW_PHONE = "v2/users/security/send-phone-msg";

  /// 发送新邮箱验证码 修改邮箱时使用
  static const String API_USER_NEW_EMAIL_BY_MODIFY = "v2/users/security/send-email-update-code";
  /// 发送新邮箱验证码 绑定邮箱时使用
  static const String API_USER_NEW_EMAIL_BY_BIND = "v2/users/security/send-mail-msg";


  /// 用户中心-绑定修改手机号
  static const String API_USER_BIND_MODIFY_PHONE = "v2/users/membership/update-phone";

  /// 用户中心-修改邮箱
  static const String API_USER_MODIFY_EMAIL = "v2/users/membership/update-email";

  /// 用户中心-绑定邮箱
  static const String API_USER_BIND_EMAIL = "v2/users/membership/bind-email-v2";

  /// 用户安全中心用户信息
  static const String API_ASSET_USER_SECURITY_CONFIG = "v2/users/security/config";
  /// 用户中心-解绑Google验证器
  static const String API_ASSET_USER_UNBIND_GOOGLE = "v2/users/membership/unbind-google";
  /// 用户中心-绑定谷歌生成绑定信息
  static const String apiUserCenterGenerateGoogle = "v2/users/membership/generate-google";
  /// 用户中心-绑定谷歌验证
  static const String apiUserCenterBindGoogle = "v2/users/membership/bind-google";
  /// 用户中心-发送验证码
  static const String apiUserCenterSendUserMsg = "v2/users/security/send-user-msg";
  /// 用户中心-删除账户检查
  static const String apiUserCenterDeleteCheckUser = "open/logout/account/check";
  /// 用户中心-删除账户验证
  static const String apiUserCenterDeleteValidate = "v2/users/security/validate-code/allScenes";
  /// 用户中心-删除账户撤销
  static const String apiUserCenterDeleteCallback = "open/logout/callback";
  /// 用户中心-删除账户提交
  static const String apiUserCenterDeleteSubmit = "open/logout/submit";

  /// 用户中心-官方渠道验证
  static const String apiUserCenterOfficialValidate = "open/official/validate";


  ///用户提币额度
  static const String API_ASSET_USER_WITHDRAWQUOTA = 'user/withdraw/quotas';
  ///获取充提地址
  static const String API_ASSET_USER_DEPOSITADDRESS = 'asset/v1/api/address/list';
  /// 合约开通状态查询
  static const String API_ASSET_CONTRACT_STATUS = "app/contract/user";
  ///查询划转所需数据的接口
  static const String API_ASSET_TRANSFER_DATA = "app/account/transfer/data";
  ///提交划转接口
  static const String API_ASSET_TRANSFER = "app/account/transfer";
  ///用户划转可用资产历史记录
  static const String API_ASSET_TRANSFER_RECORE = "app/account/transfer/record";
  ///添加提现地址
  static const String API_ASSET_ADDRESS_ADD = "asset/v1/api/withdraw/address/add";
  ///新增内部转账地址簿
  static const String API_ASSET_INNER_ADDRESS_ADD = "asset/v1/api/wallet/internal-transfer/book";
  ///查询内部转账地址簿
  static const String API_ASSET_INNER_ADDRESS_LIST = 'asset/v1/api/wallet/internal-transfer/book/list';
  ///更新提现地址
  static const String API_ASSET_ADDRESS_UPDATE = "asset/v1/api/withdraw/address/update";

  ///删除提现地址
  static const String API_ASSET_ADDRESS_DELETE = "asset/v1/api/withdraw/address/delete";

  ///删除提现地址
  static const String API_ASSET_ADDRESS_MANAGER = "asset/v1/api/withdraw/address/count";

  static const String API_ASSET_TRANSFER_LIST = "asset/v1/api/wallet/transfer/list";

  ///使用赠金
  static const String API_ASSET_USE_BONUS = "asset/v1/api/wallet/useBonusCoin";

  ///hyperPay 充提记录
  static const String API_ASSET_HYPER_PAY_RECORD = "v2/users/hyperpay/transfer-record";

  /// hyperPay 绑定状态
  static const String API_HYPER_PAY_BIND_STATUS = "v2/users/hyperpay/bind";
  ///提现时候OTC T+n
  static const String API_ASSET_WITHDRAW_OTC_DAYS = "asset/v1/api/public/days";

  /// hyperPay 解绑
  static const String API_HYPER_PAY_UNBIND = "v2/users/hyperpay/unbind";

  /// ------------------- assets end ----------------------

  /// ------------------- bbs start ----------------------

  /// 社区-通知-列表
  static const String API_BBS_USERLETTER_QUERY = "userLetter/query";

  /// 社区-通知-全部已读
  static const String API_BBS_USERLETTER_READE_ALL = "userLetter/toHaveReadALL";

  /// 社区-通知-未读消息数
  static const String API_BBS_USERLETTER_UNREADE = "userLetter/getUnReadCount";

  /// 社区-通知-详情
  static const String API_BBS_USERLETTER_INFO = "userLetter/info";

  /// 社区-动态列表 精选、最新
  static const String API_BBS_DYNAMIC = "active/v1/community/dynamic";

  /// 社区-banner列表
  static const String API_BBS_BANNER = "active/v1/community/banner";

  /// 社区-用户详情
  static const String API_BBS_USER_DETAIL = "active/v1/community/user-detail";

  /// 社区-增加分享次数
  static const String API_BBS_ADD_SHARE_COUNT = "active/v1/community/add-share-count";

  /// 社区-我的动态
  static const String API_BBS_USER_DYNAMIC = "active/v1/community/user-dynamic";

  /// 社区-添加关注
  static const String API_BBS_ADD_FOLLOW = "active/v1/community/add-follow";

  /// 社区-取消关注
  static const String API_BBS_REMOVE_FOLLOW = "active/v1/community/remove-follow";

  /// 社区-我的关注
  static const String API_BBS_MY_FOLLOW = "active/v1/community/my-follow";

  /// 社区-推荐关注
  static const String API_BBS_RECOMMEND_FOLLOW = "active/v1/community/recommend-follow";

  /// 社区-我的粉丝
  static const String API_BBS_MY_FANS = "active/v1/community/my-fans";

  /// 社区-评论@我未读数
  static const String API_BBS_UNREAD_COUNT = "active/v1/community/unread-count";

  /// 社区-消息评论列表
  static const String API_BBS_MSG_COMMENT = "active/v1/community/msg-comment";

  /// 社区-消息@我列表
  static const String API_BBS_MSG_AT_ME = "active/v1/community/msg-at-me";

  /// 社区-是否可以发布评论|动态 （是否封禁）
  static const String API_BBS_USER_BAN = "active/v1/community/user-ban";

  /// 社区-发布评论
  static const String API_BBS_SEND_COMMENT = "active/v1/community/send-comment";

  /// 社区-发布动态
  static const String API_BBS_SEND_DYNAMIC = "active/v1/community/send-dynamic";

  /// 社区-搜索@联系人
  static const String API_BBS_SEARCH_AT_USER = "active/v1/community/search-at-user";

  /// 社区-点赞
  static const String API_BBS_ADD_LIKE = "active/v1/community/add-like";

  /// 社区-取消点赞
  static const String API_BBS_REMOVE_LIKE = "active/v1/community/remove-like";

  /// 社区-动态详情
  static const String API_BBS_DYNAMIC_DETAIL = "active/v1/community/dynamic-detail";

  /// 社区-全部已读（@我的、评论）
  static const String API_BBS_READ_ALL = "active/v1/community/read-all";

  /// 社区-联系人动态
  static const String API_BBS_CONTACTS_DYNAMIC = "active/v1/community/contacts-dynamic";

  /// 社区-用户设置验证
  static const String API_BBS_USER_SET_VERIFY = "active/v1/user-set/verify";

  /// 社区-删除评论
  static const String API_BBS_COMMENT_DELETE = "active/v1/community/del-comment";

  /// 社区-删除动态
  static const String API_BBS_DYNAMIC_DELETE = "active/v1/community/del-dynamic";

  /// ------------------- user start ----------------------

  /// 社区-上传附件
  static const String API_USER_SET_UPLOAD = "active/v1/user-set/upload";

  /// 社区-用户设置
  static const String API_USER_SET = "active/v1/user-set";

  /// 任务中心-获取任务列表
  static const String API_TASK_CENTER_LIST = "active/v1/task/list";

  /// 任务中心-用户领取任务
  static const String API_TASK_CENTER_CLAIM = "active/v1/task/claim";

  /// 任务中心-任务中心首页展示剩余赠金和coins资产
  static const String API_TASK_PRIZE_SUMMARY = "active/v1/task/prize/summary";

  /// 任务中心-我的任务
  static const String API_TASK_CENTER_PERSONAL = "active/v1/task/personal";

  /// kyc-国家列表
  static const String apiKycCountries = "v2/users/countries";

  /// kyc-证件列表
  static const String apiKycDocumentTypes = "v2/users/kyc/document-types/";

  /// kyc-提交基础信息
  static const String apiKycBaseKycSubmit = "v2/users/membership/base-kyc/submit";

  /// kyc-基础认证信息
  static const String apiKycBaseKycInfo = "v2/users/membership/base-kyc/info";

  /// kyc-上传身份证照片
  static const String apiKycUploadImage = "app/validateIdentityUpload.html";

  /// kyc-前置限制
  static const String apiKycLimit = "open/kyc/limit";

  /// kyc-初级认证状态查询
  static const String apiKycStatus = "v2/users/kyc/status";

  /// kyc-C2拒绝原因确认
  static const String apiKycReasonRead = "v2/users/kyc/%s/reason-read";

  /// kyc-第三方SDK KYC accessToken 获取
  static const String apiKycToken = "v2/users/kyc/token";

  /// ------------------- user end ----------------------

  /// ------------------- bbs end ----------------------


  ///  ------------------- 现货跟单相关接口 start ----------------------
  /// -------------------spot follow start ----------------------

  /// 现货跟单用户信息
  static const String API_SPOT_FOLLOW_USER_INFO = "spot-follow/users/info";

  /// 现货跟单获取交易员信息
  static const String API_SPOT_FOLLOW_TRADER_INFO = "spot-follow/trader/traderInfo";

  /// 现货跟单查询跟单资产
  static const String API_SPOT_FOLLOW_ASSET_INFO = "spot-follow/copiers/getFollowAsset";

  /// 现货跟单查询交易员带单设置
  static const String API_SPOT_FOLLOW_TRADER_SETTING = "spot-follow/trader/getTraderSetting";

  /// 现货交易员按月/年 统计收益额
  static const String API_SPOT_FOLLOW_LEADER_MONTH_STATISTIC   =  "spot-follow/trader/leaderMonthStatistic";

  /// 现货交易员概述下数据表现统计栏 总收益率/总收益/胜率/跟单规模
  static const String API_SPOT_FOLLOW_LEADER_MONTH_STATISTIC_TOTAL   =  "spot-follow/trader/leaderMonthStatisticBar";

  /// 现货交易员概述下的Ta的偏好
  static const String API_SPOT_FOLLOW_TRADER_HE_PREFERENCE  =  "spot-follow/trader/traderPerference";

  /// 现货交易员关注者
  static const String API_SPOT_FOLLOW_LEADER_FOCUS  =  "spot-follow/traderOrder/getFocusList";

  /// 现货交易员跟随者
  static const String API_SPOT_FOLLOW_MYSELF_FOLLOW_LIST  =  "spot-follow/traderOrder/getCopiersInfo";

  /// 现货交易员带单历史订单
  static const String API_SPOT_FOLLOW_HISTORY_ORDER  =  "spot-follow/traderOrder/getHistoryOrderList";

  /// 现货交易员带单当前订单
  static const String API_SPOT_FOLLOW_CURRENT_ORDER  =  "spot-follow/traderOrder/getTraderOrderList";

  /// 现货交易员统计数据 收益率/累计盈亏/资产账户/跟单人数/跟单价值
  static const String API_SPOT_FOLLOW_LEADER_TRADER_STATISTIC   =  "spot-follow/trader/getStatisticInfo";

  ///现货交易员偏好币种列表数据统计
  static const String API_SPOT_FOLLOW_LEADER_CURRENCY_STATISTIC =  "spot-follow/trader/getTradePreference";

  ///现货交易员统计数据下的其他数据
  static const String API_SPOT_FOLLOW_ELSE_DATA_STATISTIC =  "spot-follow/trader/getElseData";

  /// 现货跟单评价交易员 点赞或踩
  static const String API_SPOT_FOLLOW_COMMENT_TRADER   =  "spot-follow/copiers/good";

  ///  现货跟单关注取消交易员
  static const String API_SPOT_FOLLOW_FOCUS_TRADER   =   "spot-follow/copiers/focus";

  /// 现货交易员带单设置
  static const String API_SPOT_FOLLOW_TRADER_CONFIG   =  "spot-follow/trader/getTraderSetting";

  /// 现货跟单修改带单设置
  static const String API_SPOT_FOLLOW_SET_TRADER_CONFIG   =   "spot-follow/trader/setTraderSetting";

  /// 现货跟单带单币种列表
  static const String API_SPOT_FOLLOW_FOLLOW_CURRENCY_LIST   =   "spot-follow/pairs";

  /// 现货跟单获取今日分润
  static const String API_SPOT_FOLLOW_TODAY_PROFIT = "spot-follow/trader/getTodayProfit";

  /// 现货跟单获取累计分润
  static const String API_SPOT_FOLLOW_TOTAL_SHARE_PROFIT = "spot-follow/trader/getTotalShareProfit";

  /// 现货跟单划转接口
  static const String API_SPOT_FOLLOW_COPIERS_FOLLOW_TRANSFER = "spot-follow/copiers/followTransfer";

  /// 现货跟单获取交易员带单状态及是否清仓
  static const String API_SPOT_FOLLOW_CANCEL_TRADER_CONDITION = "spot-follow/trader/getCancleTraderCondition";

  /// 现货跟单取消交易员
  static const String API_SPOT_FOLLOW_CANCEL_TRADER = "spot-follow/trader/cancleTrader";

  /// 现货跟单取消交易员发送短信信息
  static const String API_SPOT_FOLLOW_CANCEL_TRADER_MSG = "spot-follow/trader/cancleTraderSendMsg";

  /// 现货跟单修改昵称、简介、头像
  static const String API_SPOT_FOLLOW_SAVE_HEAD_NICK_NAME = "active/v1/user-set/spotFollowUserSet";

  /// -------------------spot follow end ----------------------

  ///  ------------------- 合约相关接口 start ----------------------
  /// ------------------- follow start ----------------------

  /// 跟单-交易员详情-订单-当前带单
  static const String API_FOLLOW_LEADER_CURRENT_LIST = "follow/v1/leader/leaderCurrentFollowList";

  /// 跟单-交易员详情-交易数据
  static const String API_FOLLOW_LEADER_TRANS_DATA = "follow/v1/leader/leaderTransactionData";

  /// 跟单-根据uid获取带单老师
  static const String API_FOLLOW_MY_DOCUMENTARY = "follow/v1/myDocumentary/leader";

  /// 跟单-主辅账户相互划转
  static const String API_FOLLOW_APPLY_TRANSFER = "follow/v1/thirdClient/apply/transfer";

  /// 跟单-查询主子账号可用划转余额
  static const String API_FOLLOW_GET_BALANCE_LIST = "follow/v1/thirdClient/getBalanceList";

  /// 跟单-设置用户信息（昵称 简介 头像）
  static const String API_FOLLOW_SET_USER_INFO = "follow/v1/thirdClient/leader/setUserInfo";

  static const String API_FOLLOW_GET_USER_INFO = "follow/v1/thirdClient/leader/getUserInfo";
  ///交易员筛选列表
  static const String API_FOLLOW_LEADER_LIST   = "follow/v1/leader/newLeaderList";
  ///交易员详情
  static const String API_FOLLOW_LEADER_DETAIL   = "follow/v2/leader/leaderDetail";
  ///主页跟随者
  static const String API_FOLLOW_LEADER_FOLLOW_LIST   = "follow/v1/leader/leaderFollow";
  ///主页带单员关注者
  static const String API_FOLLOW_LEADER_FOCUS   = "follow/v2/leader/leaderFocus";
  /// 交易员主页 历史带单
  static const String API_FOLLOW_LEADER_HISTORY_POSITION   = "follow/v1/leader/leaderHistoryFollowList";
  /// 交易员主页 当前带单
  static const String API_FOLLOW_LEADER_CURRENT_POSITION = "follow/v1/leader/leaderCurrentFollowList";
  /// 交易员查看自己历史带单
  static const String API_FOLLOW_LEADER_MY_SELF_HISTORY_POSITION = "follow/v1/thirdClient/leader/getHistoryPositionList";
  /// 交易员查看自己历史带单
  static const String API_FOLLOW_LEADER_MY_SELF_CURRENT_POSITION = "follow/v1/thirdClient/leader/getCurrentPositionList";
  /// 当前跟单
  static const String API_FOLLOW_FOLLOWER_CURRENT_POSITION = "follow/v1/myDocumentary/currentFollowList";
  /// 历史跟单
  static const String API_FOLLOW_FOLLOWER_HISTORY_POSITION = "follow/v1/myDocumentary/historyFollowList";
  /// 我跟随的交易员列表
  static const String API_FOLLOW_FOLLOWER_TRADER_LIST = "follow/v1/contract/getCurrentUserLeader";

  /// 跟随订单详情页汇总信息
  static const String API_FOLLOW_ORDER_DETAIL_SUMMARY = "follow/v1/thirdClient/leader/getFollowStatistics";

  /// 跟随订单详情
  static const String API_FOLLOW_ORDER_DETAIL = "follow/v1/thirdClient/leader/getFollowOrderDetail";

  ///翻译接口
  static const String API_FOLLOW_TRANSLATE   = "follow/v2/leader/getTranslate";
  ///当前自己跟随者
  static const String API_FOLLOW_MYSELFT_FOLLOW_LIST   = "follow/v1/thirdClient/leader/getFollowList";
  ///取消用户跟随
  static const String API_FOLLOW_LEADER_STOP           = "follow/v1/thirdClient/leader/stopFollow";
  ///今日收益+累计收益
  static const String API_FOLLOW_MY_FOLLOW_PROFIY       = "follow/v1/myDocumentary/followProfit";
  ///交易员分成
  static const String API_FOLLOW_MY_LEADER_SHARE        = "follow/v1/myDocumentary/leaderShare";
  ///我的交易员
  static const String API_FOLLOW_MY_LEADER_LIST         = "follow/v1/myDocumentary/myLeaderList";
  ///我的关注列表
  static const String API_FOLLOW_MY_FOCUS_LEADER_LIST   = "follow/v1/myDocumentary/myFocusList";
  ///关注交易员和取消
  static const String API_FOLLOW_LEADER_FOCUS_MANAGER    = "follow/v1/setting/focus";
  ///用户取消交易员身份邮件短信验证
  static const String API_FOLLOW_LEADER_CANCEL           = "follow/v1/thirdClient/leader/validateLeaderCancel";
  ///获取带单设置
  static const String API_FOLLOW_LEADER_CONFIG           = "follow/v1/thirdClient/leader/getLeaderConfig";
  ///用户取消交易员身份
  static const String API_FOLLOW_CANCEL_LEADER_IDENTITY  = "follow/v1/thirdClient/leader/cancelLeaderIdentity";
  ///获取用户收益
  static const String API_FOLLOW_LEADER_PROFIT           =  "follow/v1/thirdClient/leader/getUserProfit";
  ///交易员偏好币种列表数据统计
  static const String API_FOLLOW_LEADER_CURRENCY_STATISTIC =  "follow/v2/leader/leaderCurrencyStatistic";
  ///交易员按月/年 统计收益额
  static const String API_FOLLOW_LEADER_MONTH_STATISTIC   =  "follow/v2/leader/leaderMonthStatistic";
  ///交易员近期统计数据
  static const String API_FOLLOW_LEADER_TRADER_STATISTIC   =  "follow/v2/leader/leaderTradeStatistic";
  /// 评价交易员 点赞或踩
  static const String API_FOLLOW_COMMENT_TRADER   =  "follow/v1/setting/comment";
  /// 关注交易员
  static const String API_FOLLOW_FOCUS_TRADER   =  "follow/v1/setting/focus";
  /// 交易员带单设置
  static const String API_FOLLOW_TRADER_CONFIG   =  "follow/v1/thirdClient/leader/getLeaderConfig";
  /// 修改带单设置
  static const String API_FOLLOW_SET_TRADER_CONFIG   =  "follow/v1/thirdClient/leader/leaderConfig";
  /// 修改带单状态
  static const String API_FOLLOW_SET_TRADER_STATUS   =  "follow/v1/thirdClient/leader/setStatus";
  /// 带单币种列表
  static const String API_FOLLOW_FOLLOW_CURRENCY_LIST   =  "follow/v1/thirdClient/leader/instruments";
  ///跟单修改-回显
  static const String API_FOLLOW_SETTING_ECHO          = "follow/v1/setting/followSettingEcho";

  ///跟单老师详情
  static const String API_FOLLOW_SETTING_LEADER_DETAIL = "follow/v1/setting/leaderDetail";

  ///跟单账户详情
  static const String API_FOLLOW_CONTRACT_ACCOUNT = "follow/v1/contract/accountDetail";

  ///跟单设置
  static const String API_FOLLOW_SETTING = "follow/v1/setting";

  ///取消跟随
  static const String API_FOLLOW_CANCEL = "follow/v1/setting/cancelFollow";

  static const String API_FOLLOW_BBS_LEADER_CURRENT_POSITION = "follow/v1/thirdClient/leader/leaderCurrentPosition";

  /// 搜索交易員
  static const String API_FOLLOW_SEARCH_TRADER = "follow/v2/leader/queryLeaders";

  /// 申请交易员banner
  static const String API_FOLLOW_BECOME_TRADER_BANNER = "follow/v1/leader/background";

  /// 申请成为交易员提交
  static const String API_FOLLOW_BECOME_TRADER_COMMIT = "follow/v1/thirdClient/leader/applyLeader";

  /// 筛选交易员
  static const String API_FOLLOW_TRADER_FILTER = "follow/v1/leader/newLeaderList";

  /// 跟单国家列表
  static const String API_FOLLOW_COUNTRY_LIST = "follow/v2/leader/getCountryPhoneCodeList";

  /// 交易员今日预估分润
  static const String API_FOLLOW_TRADER_TODAY_PROFIT =  "follow/v1/thirdClient/leader/todayProfitList";
  /// 交易员今日累计分润
  static const String API_FOLLOW_TRADER_TOTAL_PROFIT =  "follow/v1/thirdClient/leader/accumulatedProfitList";


  /// 现货跟单-搜索交易页
  static const String API_SPOT_FOLLOW_SEARCH = "spot-follow/trader/queryLeaders";

  /// 现货跟单-筛选交易页
  static const String API_SPOT_FOLLOW_FILTER = "spot-follow/spotFollow/getTraderListByParam";

  /// 现货跟单-申请成为交易员
  static const String API_SPOT_FOLLOW_APPLY_TRADER = "spot-follow/trader/applyTrader";

  /// 现货跟单-跟单员收益
  static const String API_SPOT_FOLLOW_COPIERS_PROFIT = "spot-follow/copiers/profit";

  /// 现货跟单-跟单员页面-交易员分成
  static const String API_SPOT_FOLLOW_COPIERS_SHARE_PROFIT = "spot-follow/copiers/share-profit";

  /// 现货跟单-跟单员页面-当前跟单
  static const String API_SPOT_FOLLOW_COPIERS_CURRENT = "spot-follow/copiers/current";

  /// 现货跟单-跟单员页面-历史跟单
  static const String API_SPOT_FOLLOW_COPIERS_HISTORIES = "spot-follow/copiers/histories";

  /// 现货跟单-跟单员页面-我的跟随
  static const String API_SPOT_FOLLOW_COPIERS_TRADERS = "spot-follow/copiers/traders";

  /// 现货跟单-跟单员页面-我的关注
  static const String API_SPOT_FOLLOW_COPIERS_FOCUS = "spot-follow/copiers/focuses";

  /// 现货跟单-关注和取消关注交易员（DELETE 取消跟随、POST 跟随交易员、PUT 跟单设置修改、GET 跟单设置详情）
  static const String API_SPOT_FOLLOW_COPIERS = "spot-follow/copiers";

  /// 现货跟单- 是否跟随当前交易员
  static const String API_SPOT_FOLLOW_COPIERS_ISFOLLOW = "spot-follow/copiers/isFollowTrader";

  /// 现货跟单 - 历史委托列表
  static const String API_SPOT_FOLLOW_COPIERS_ORDERS = "spot-follow/copiers/orders/page";

  /// 现货跟单 - 一键清仓
  static const String API_SPOT_FOLLOW_COPIERS_CLEAR_POSITION = "spot-follow/copiers/clearance";

  /// 现货跟单 - 累计分润
  static const String API_SPOT_FOLLOW_TRADER_TOTALPROFIT = "spot-follow/trader/getTotalShareProfit";

  /// 现货跟单 - 今日预估分润
  static const String API_SPOT_FOLLOW_TRADER_TODAYPROFIT = "spot-follow/trader/getTodayProfit";



  /// 现货 - 获取用户资产
  static const String API_SPOT_USER_ASSETS = "app/userMarketInfo.html";

  /// ------------------- follow end ----------------------

  /// ------------------- live start ----------------------

  /// 直播-预告列表
  static const String API_LIVE_PREVIEW = "active/v1/live/preview";

  /// 直播-直播中列表
  static const String API_LIVE_RUNNING = "active/v1/live/running";

  /// 直播-历史直播
  static const String API_LIVE_HISTORY = "active/v1/live/history";

  /// 直播-点赞数+1
  static const String API_LIVE_LIKE = "active/v1/live/like";

  /// 直播-分享数+1
  static const String API_LIVE_SHARE = "active/v1/live/share";

  /// 直播-直播详情
  static const String API_LIVE_DETAIL = "active/v1/live/detail";

  /// 直播-获取签名 （需登录，30秒有效）
  static const String API_LIVE_GEN_USER_SIG = "active/v1/live/gen-user-sig";

  /// 预约
  static const String API_LIVE_SIGN_UP = "active/v1/live/sign_up";

  /// 取消预约
  static const String API_LIVE_CANCEL = "active/v1/live/cancel";

  /// ETF赠金资产
  static const String API_ASSET_ETF_BONUS = "spot-coupon/v1/bonus/balance";

  /// ETF赠金资产加入法币折合/ETF赠金优化需求添加
  static const String API_ASSET_ETF_BONUS2 = "spot-coupon/v1/bonus/balance/convert";

  /// 直播禁言
  static const String API_LIVE_FORBID_MSG = "active/v1/live/forbid-msg";

  /// 推荐1个直播
  static const String API_LIVE_TOP = "active/v1/live/top";

  /// 直播 领取积分
  static const String API_GIFT_SCORE = "active/v1/live/gift/score";

  /// 直播 获取标签列表
  static const String API_LIVE_TAG_LIST = "active/v1/live/tag";

  /// 礼物列表
  static const String API_LIVE_GIFT_LIST = "active/v1/live/gift/list";

  /// 获取用户积分
  static const String API_LIVE_GIFT_USER_SCORE = "active/v1/live/gift/user-score";

  /// 赠送礼物
  static const String API_LIVE_GIFT_SEND = "active/v1/live/gift/send";

  /// 直播 - 获取用户信息
  static const String API_LIVE_USER_INFO = "active/v1/live/anchor/info";

  /// 直播 - 主播的直播列表
  static const String API_LIVE_ANCHOR_LIVE_PAGE = "active/v1/anchor/live/page";
  /// 直播 - 获取上一条直播信息
  static const String API_LIVE_ANCHOR_LAST_INFO = "active/v1/anchor/live/lastDetail";

  /// 直播 - 获取标签list
  static const String API_LIVE_TAG_LIST2 = "active/v1/live/tag/list";

  /// 直播 - 创建直播
  static const String API_LIVE_CREATE = "active/v1/anchor/create/live";
  /// 直播 - 更新直播
  static const String API_LIVE_UPDATE = "active/v1/anchor/update/live";
  /// 直播 - 删除直播
  static const String API_LIVE_DELETE = "active/v1/anchor/delete/live";
  /// 直播 - 结束直播
  static const String API_LIVE_FINISH = "active/v1/anchor/finish/live";


  /// ------------------- live end ----------------------

  /// ------------------- 万能金 start ----------------------
  /// 万能金总额
  static const String API_CONTRACT_GOLD_TOTAL_AMOUNT = "v1/futuresc/thirdClient/trade/almightyGoldTotalAmount";
  /// 万能金使用明细
  static const String API_CONTRACT_UNIVERSAL_DETAIL_LIST = "v1/futuresc/thirdClient/trade/almightyGoldUseDetailsList";
  ///万能金列表
  static const String API_CONTRACT_GOLD_LIST = "v1/futuresc/thirdClient/trade/almightyGoldList";
  /// 是否有万能金仓位
  static const String API_CONTRACT_HAVE_GOLD_POSITION = "v1/futuresc/thirdClient/trade/isUseAlmightyGold";

  /// ------------------- 万能金 end ----------------------
  ///  ------------------- 合约相关接口 end ----------------------

  /// ------------------- open start ----------------------
  /// 请求接口弹窗
  static const String API_OPEN_HOME_POPUP = "/open/home/popup/getHomePopupContent";
  ///  ------------------- open end ----------------------

  /// ------------------- home start ----------------------
  /// 请求首页专业版banner
  static const String API_HOME_PRO_BANNER = "app/bannerList.html";
  /// 请求首页专业版数据流
  static const String API_HOME_PRO_DYNAMIC = "open/entrance/newHome";
  /// 请求首页新手页数据(banner-金刚区)
  static const String API_HOME_NEWER = "open/entrance/app/newNewerHomePage";
  /// 首页专业版notice
  static const String API_HOME_NOTICE = "open/coinw/notice/hp/get";
  /// 首页未读消息数
  static const String API_HOME_UNREAD_MESSAGE = "userLetter/getUnReadCount";
  /// 请求首页理财定期
  static const String API_HOME_EARN = "financial/v1/invest/getFinancialList";
  /// 请求币种Logo
  static const String API_COIN_LOGO = "open/spot/coins";
  /// 请求首页推荐/热度/新币/成交榜/涨幅
  static const String API_HOME_RANKING_LIST = "open/coinw/trade/getAppRankingList";
  ///首页合约跟单
  static const String API_HOME_COPY_TRADING = "open/contract/followInfo";
  /// 首页直播信息
  static const String API_HOME_LIVE_STREAM_INFO = "open/entrance/app/liveStreamingList";

  /// ------------------- home end ----------------------

  /// ------------------- 现货WS start --------------------

  /// 获取现货WS的token/url
  static const String API_SPOT_WS_LOGIN = "pusher/private-token";

  /// 获取现货WS的token/url-未登录
  static const String API_SPOT_WS_LOGIN_OUT = "pusher/public-token";

  /// 首页推荐区 新币榜 热度榜
  static const String SPOT_HOME_MARKET_PART1 = "spot/app_index_ticker:ALL";

  /// 首页 涨幅榜和成交榜
  static const String SPOT_HOME_MARKET_PART2 = "spot/app_newRiseFallApi:ALL";

  /// 行情数据
  static const String SPOT_HOME_MARKET = "spot/app_indexApi:ALL";

  /// ------------------- 现货WS end ----------------------

  /// ------------------- 行情 start ----------------------
  /// 请求接口弹窗
  static const String API_MARKET_AREA = "open/coinw/trade/app/partiton/v2/list";

  /// 最新24小时数据
  static const String API_SPOT_MARKET_STATS = "spot-all/market/stats/";

  /// 分区对应币对
  static const String API_MARKET_COIN_PAIR = "app/exchangeMarket.html";

  ///  ------------------- 行情 end ----------------------

  ///  ------------------- 网格相关接口 start ----------------------
  static const String API_GRID_STRATEGY_LIST = "v1/spot/strategy/list";

  static const String API_GRID_STRATEGY_DETAIL = "v1/spot/strategy/detail";

  /// ------------------- 网格相关接口 end ----------------------
  /// ------------------- WS 替代接口 start----------------------
  /// K线 open/public/v1/custom/{symbol}/getKline
  static const String API_WS_SUPPORT_CANDLES = "open/public/v1/custom/%s/getKline";
  /// 深度
  static const String API_WS_SUPPORT_DEPTH = "open/public/v1/custom/%s/getDepth";
  /// 最新成交
  static const String API_WS_SUPPORT_LAST_DEAL = "open/public/v1/custom/%s/getFills";
  /// tickers
  static const String API_WS_SUPPORT_ALL_TICKER = "open/public/v1/custom/getTickers";
  /// all price
  static const String API_WS_SUPPORT_ALL_PRICE = "open/public/v1/custom/getPriceAndRate";
  /// 仓位模式
  static const String API_WS_SUPPORT_USER_SETTING = "open/v1/custom/positionMode";
  /// 仓位模式
  static const String API_WS_SUPPORT_USER_CONTRACT_ASSETS = "open/v1/custom/accountInfo/2";

/// ------------------- WS 替代接口 end----------------------

  /// ------------------- 合约 start----------------------
  /// 风险基金
  static const String API_CONTRACT_RISK_FUND_BILL = "v1/futuresc/risk/fund/getRiskFundBill";
  /// 获取风险基金总额
  static const String API_CONTRACT_RISK_FUND_TOTAL = "v1/futuresc/risk/fund/getTotalRiskFund";
  /// 基金统计：按币种、日期、type分组【前端折线图使用】
  static const String API_CONTRACT_RISK_FUND_STATISTICS = "v1/futuresc/risk/fund/getRiskFundStatisticsList";
  /// 合约历史-资金流水-列表
  static const String apiContractTradeBills = "v1/futuresc/thirdClient/trade/bills";
  /// 合约历史-资金流水-筛选类型
  static const String apiContractTradeBillParam = "v1/futuresc/thirdClient/trade/billParam";
  /// 合约历史-仓位历史-列表
  static const String apiContractHistoryPositionBill = "v1/futuresc/thirdClient/trade/historyTrade";
  /// 合约历史-历史委托-列表
  static const String apiContractTradeHistory = "v1/futuresc/thirdClient/trade/history";
  /// 合约历史-历史委托详情-头部数据
  static const String apiContractTradeHistoryDetail = "v1/futuresc/thirdClient/trade/historyDetail";
  /// 合约历史-历史委托详情-列表
  static const String apiContractTradeHistoryDetailList = "v1/futuresc/thirdClient/trade/historyDetailList";

  /// ------------------- 合约 end----------------------

  /// ------------------- 现货委托 start --------------------
  /// 现货委托订单列表
  static const String API_SPOT_ALL_ORDERS = "spot-all/orders";
  /// ETF赠金订单列表
  static const String API_ETF_BONUS_ORDERS = "spot-coupon/v1/bonus/order/history";

  /// 现货委托订单取消
  static const String API_SPOT_ORDER_OPEARTION = "spot-order/order/";

  /// 修改计划委托
  static const String API_SPOT_ORDER_MODIFY_PLAN_ORDER = "spot-order/order/planning";

  /// 现货委托支持的右币
  static const String API_SPOT_ALL_CURRENCY = "open/currency/get";
  /// ------------------- 现货委托 end --------------------
  /// ------------------- 用户中心 start----------------------
  /// 拉取问题反馈类型
  static const String API_USER_FEEDBACK = "app/getQuestionTypeList";
  /// 问题反馈提交
  static const String API_USER_FEEDBACK_COMMIT = "app/postQuestion";
  /// 关闭帐户
  static const String API_USER_CLOSEACCOUNT_COMMIT = "v2/users/security/ios/close";
  //设置交易密码、修改登录密码、交易密码
  static const String API_USER_UPDATEPWD = "v2/users/membership/update-pwd";
  //重置交易密码
  static const String API_USER_RESETPWD = "v2/users/membership/reset-trade-pwd";
  //用户详情
  static const String API_USER_DETAIL = "v2/users/membership/user-detail";
  /// 安全日志
  static const String API_USER_USER_LOG = "v2/users/membership/user-log";
  /// 获取安全日志类型
  static const String API_USER_USER_LOG_TYPES = "v2/users/membership/user-log/type";
  /// 邀请返佣 邀请用户基本信息接口
  static const String API_INVENT_USER_PROFILE = "rebate/v1/api/getProfile";
  /// 邀请返佣 我的邀请
  static const String API_INVENT_USER_RECOMMEND = "rebate/v1/api/recommend";
  /// 邀请返佣 周排行
  static const String API_INVENT_WEEK_RANK = "rebate/v1/api/weekRanking";
  /// 邀请返佣 邀请返佣详情
  static const String API_INVENT_PROFIT_DETAIL = "rebate/v1/api/profit/detail";
  /// 邀请返佣 邀请用户基本信息接口
  static const String API_INVENT_SET_RATE = "rebate/v1/api/setRate";
  /// 邀请返佣 分成比例信息
  static const String API_INVENT_GET_RATE = "rebate/v1/api/getRate";
  ///查询用户类型（是否属于代理商体系）
  static const String API_USER_TYPE = "user/getUserType";
  // 上传高级认证视频
  static const String API_USER_KYC_VIDEO_UPLOAD = "app/kyc/video/upload";
  // 海外高级kyc认证
  static const String API_USER_KYC_OVERSEAS_AUTHENTICATE = "app/kyc/overseas/updateKycStatus.html";
  /// 风控自助解封-上传文件
  static const String API_USER_RISK_CONTROL_UPLOAD = "v2/users/membership/self-release/upload";
  /// 风控自助解封-获取自助解封详情
  static const String API_USER_RISK_CONTROL_INFO = "v2/users/membership/self-release/info";
  /// 风控自助解封-申请解封
  static const String API_USER_RISK_CONTROL_APPLY = "v2/users/membership/self-release/apply";
/// ------------------- user 接口 end----------------------
/// ------------------- 福利中心 start----------------------
  // 卡券规则
  static const String API_WELFARE_COUPON_RULER = "spot-coupon/v1/coupon-desc";
  //   福利中心list
  static const String API_WELFARE_LIST = "asset/v1/api/wallet/welfare/list";
  // 卡券详情
  static const String API_COUPON_DETAIL = "spot-coupon/v1/my-coupons/%s";
  // 使用卡券
  static const String API_USE_COUPON = "spot-coupon/v1/my-coupons/%s/used";
  // 領取卡券
  static const String API_RECEIVE_COUPON = "spot-coupon/v1/my-coupons/%s/receive";
/// ------------------- 福利中心 end----------------------


}
