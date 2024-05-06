// ignore_for_file: constant_identifier_names

class CommonConst {
  static const int PAGE_DEFAULT = 1;
  static const int PAGE_SIZE_NUM = 10;
  static const int PAGE_SIZE_NUM_NORMAL = 20;
  static const int ASSET_TIME = 20000;
  static const int ASSET_DETAIL_TIME = 10000;

  //骨架图最低展示时间
  static const int SHIMMER_MIN_SECOND = 1200;

  static const String SYMBOL_POSITIVE = "+";
  static const String SYMBOL_NEGATIVE = "-";
  static const String SYMBOL_COLON = ":";
  static const String IS_SUCCESS = "isSuccess";
  static const String FILE_PATH = "filePath";
  static const String FILE_START = "file://";
  static const String ADDRESS_FORMAT = "%s...%s";
  static const String LAUNCH_TO_WEIXIN = "weixin://";
  static const String WEB_PREFIX_HTTP = "http://";
  static const String WEB_PREFIX_HTTPS = "https://";

  static const String TAB_IEO = "IEO";
  static const String TAB_FANS_UP = "FansUp";

  static const String ROWS_PAGE = "rows";
  static const String LIST_PAGE = "list";


  //上传图片加密key
  static const String COINW_PUBLIC_KEY = "-----BEGIN PUBLIC KEY-----\n" +
      "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCerxM2vXIRyGRvMzOnbIzvXrRh\n" +
      "fvHyO0JA5SZwoXJJWLdklxeVbjye1l8gmPTI2Hd33U0rFfQNuhlht71v9MxL5Pk/\n" +
      "0iFAIry3ZPaOj33KgACWWCSH2HGAettuGVblNK5CEH1ppJwsC98sVBWDUBJpAflo\n" +
      "LDGR6TVfa+zqegLZXQIDAQAB\n" +
      "-----END PUBLIC KEY-----\n";

  static const String COINW_PUBLIC_KEY1 = "-----BEGIN PUBLIC KEY-----\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCerxM2vXIRyGRvMzOnbIzvXrRhfvHyO0JA5SZwoXJJWLdklxeVbjye1l8gmPTI2Hd33U0rFfQNuhlht71v9MxL5Pk/0iFAIry3ZPaOj33KgACWWCSH2HGAettuGVblNK5CEH1ppJwsC98sVBWDUBJpAfloLDGR6TVfa+zqegLZXQIDAQAB\n-----END PUBLIC KEY-----";

  static const String COINW_PUBLIC_KEY2 = "-----BEGIN PUBLIC KEY-----\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC90YZbBQVMWg5Tw5oqQMcjxvQsBBzJNo5yE4/ivrCq4cUXxTbE4iM9tfnjZipbMqVRbVy189suVDj2aJr5cihJfWqA9dUYvsPyJ5XaaWMwJf4jiXMVpoMI+SMockCwyBAOybDwPJVwdE/z7CkyIf1tqdJRimohoUQ/497+sFcS9wIDAQAB\n-----END PUBLIC KEY-----";

  static const String OTC_ZH_OTHER_BANK_NAME = "其他银行";
  static const String OTC_ZH_OTHER_BANK_NAME2 = "Others";
  static const String OTC_RU_OTHER_BANK_NAME = "other";
  static const List<String> OTHER_BANK_LIST = [OTC_ZH_OTHER_BANK_NAME,OTC_ZH_OTHER_BANK_NAME2,OTC_RU_OTHER_BANK_NAME,"Other Bank","OtherBank"];

  /// otc visa 免责条款
  static const String VISA_STATEMENT_PARAM = "disclaimer";

  /// follow 分润结算模式
  static const String FOLLOW_SETTLEMENT_PARAM = "followSettlement";

  /// 合约强减更多解释
  static const String contractForceMoreExplain = "contractForceMoreExplain";
}

class RequestConst {
  static const String PAGE_NUM = "pageNum";
  static const String PAGE_CURRENT = "currentPage";
  static const String PAGE_SIZE = "pageSize";
  static const String LANGUAGE = "language";
  static const String ID = "id";
  static const String STATUS = "status";
  static const String TYPE = "type";
}

class ResponseConst {
  static const int IS_BLOCK = 124;
  static const int NEED_FACE_ID = 123;
  static const int LOGOUT = 401;
}

/// native交互
class NativeMethodConst {
  static const String FLUTTER_METHOD_CHANNEL = "flutter_method_channel";
  static const String METHOD_IS_LOGIN = "method_is_login";
  static const String METHOD_API_HOST = "method_api_host";
  static const String METHOD_CONTRACT_HOST = "method_contract_host";
  static const String METHOD_WEB_HOST = "method_web_host";
  static const String METHOD_OTC_WEB_HOST = "method_otc_web_host";
  static const String METHOD_CONTRACT_WS_HOST = "method_contract_ws_host";
  static const String METHOD_SPOT_WS_HOST = "method_spot_ws_host";
  static const String METHOD_ENCRYPT_PARAMS = "method_encrypt_params";
  static const String METHOD_LANGUAGE = "method_language";
  // 获取语言列表
  static const String METHOD_LANGUAGE_LIST = "method_language_list";
  static const String METHOD_ZENDESK_WEB_URL = "method_zendesk_web_url";
  static const String METHOD_GEE_LANGUAGE = "method_gee_language";
  static const String METHOD_LANGUAGE_CONFIG = "method_language_config";

  ///从原生获取现货ws的Url
  static const String METHOD_GET_SPOT_WS_URL = "method_get_spot_ws_url";

  /// 语言补丁 从原生获取
  static const String METHOD_LANGUAGE_PATCH = "method_language_patch";

  static const String METHOD_LOGIN_TOKEN = "method_login_token";
  static const String METHOD_APP_VERSION = "method_app_version";
  static const String METHOD_WEBVIEW_HEADERS = "method_webview_headers";
  static const String METHOD_API_HEADERS = "method_api_headers";
  static const String METHOD_CONTRACT_HEADERS = "method_contract_headers";
  static const String METHOD_CLOSE_FLUTTER_PAGE = "method_close_flutter_page";
  static const String METHOD_IM_UNREAD_NUMBER = "method_im_unread_number";
  static const String METHOD_NATIVE_ENV_DEV = "method_native_env_dev";
  static const String METHOD_SAVE_FLUTTER_API_LOG = "method_save_flutter_api_log";
  static const String METHOD_SAVE_FLUTTER_CUSTOM_LOG = "method_save_flutter_custom_log";

  /// 是否只能使用合约
  static const String METHOD_IS_ONLY_ENABLE_CONTRACT = "method_only_enable_contract";
  /// 是否被禁止提币和划转,0：可以提币和划转，1：禁止提币和划转
  static const String METHOD_FIS_FORBID_WITHDRAW = "method_fis_forbid_withdraw";
  /// 实人认证SDK
  static const String METHOD_VERIFY_FACE_SDK = "method_verify_face_sdk";
  static const String METHOD_UID = "method_uid";
  static const String METHOD_BOTTOM_BAR_HIDE = "method_bottom_bar_hide";
  static const String METHOD_FULL_SCREEN = "method_full_screen";
  static const String METHOD_NATIVE_BOTTOM_HEIGHT = "method_native_bottom_height";
  static const String METHOD_NATIVE_STATUS_HEIGHT = "method_native_status_height";
  static const String METHOD_NATIVE_IOS_SAFE_BOTTOM_HEIGHT = "method_native_ios_safe_bottom_height";


  static const String METHOD_DOWNLOAD_URL = "method_download_url";
  static const String METHOD_ALL_MARKET_INFO = "method_all_market_info";
  static const String METHOD_SUB_ALL_MARK_PRICE = "method_sub_all_mark_price";
  static const String METHOD_UNSUB_ALL_MARK_PRICE = "method_unsub_all_mark_price";
  /// 获取聊天消息列表（包含未读数）
  static const String METHOD_CHAT_LIST = "method_chat_list";
  /// 聊天消息全部已读
  static const String METHOD_CHAT_ALL_READ = "method_chat_all_read";
  /// 根据聊天id从聊天列表中删除对话
  static const String METHOD_CHAT_DELETE_SESSION = "method_chat_delete_session";
  /// 跳转聊天页面
  static const String SHOW_NATIVE_CHAT = "showNativeChat";
  /// 成功Toast提示
  static const String METHOD_SHOW_SUCCESS_TOAST = "method_show_success_toast";
  /// 失败Toast提示
  static const String METHOD_SHOW_FAILURE_TOAST = "method_show_failure_toast";
  /// 警告Toast提示
  static const String METHOD_SHOW_WARNING_TOAST = "method_show_warning_toast";

  /// 点击社区-精选-banner跳转
  static const String METHOD_BBS_BANNER_CLICK = "method_bbs_banner_click";
  /// 原生给flutter传递登录状态信息
  static const String METHOD_LOGIN_STATE_CHANGE = "method_login_state_change";
  /// 原生给flutter传递消息，打开直播首页
  static const String METHOD_POP_AND_START_LIVE_HOME = "method_pop_and_start_live_home";
  /// 原生给flutter传递消息，打开直播中详情页
  static const String METHOD_POP_AND_START_LIVE_PLAYER = "method_pop_and_start_live_player";
  /// 从原生获取直播sdk鉴权状态
  static const String METHOD_GET_LIVE_SDK_SET_LICENCE_STATUS = "method_get_live_sdk_set_licence_status";
  /// 直播sdk鉴权状态保存到原生
  static const String METHOD_SET_LIVE_SDK_SET_LICENCE_STATUS = "method_set_live_sdk_set_licence_status";
  /// 从原生获取OTC条款弹窗是否弹出过
  static const String METHOD_GET_OTC_CLAUSE_HAVE_ALERT = "method_get_otc_clause_have_alert";
  /// OTC条款弹窗弹出状态保存到原生
  static const String METHOD_SET_OTC_CLAUSE_HAVE_ALERT = "method_set_otc_clause_have_alert";
  /// 刷新社区接口 ios不需要调用
  static const String METHOD_RELOAD_BBS_DATA = "method_reload_bbs_data";

  /// 刷新首页自选数据 ios不需要调用
  static const String METHOD_RELOAD_HOME_SELF = "method_reload_home_self";

  /// mainActivity选中的tab是否是资产tab
  static const String METHOD_SELECTED_TAB_IS_ASSET =
      "method_selected_tab_is_asset";
  /// mainActivity选中的tab是否是社区tab
  static const String METHOD_SELECTED_TAB_IS_BBS = "method_selected_tab_is_bbs";

  /// mainActivity选中的tab是否是首页tab
  static const String METHOD_SELECTED_TAB_IS_HOME = "method_selected_tab_is_home";

  /// 悬浮窗开关状态改变
  static const String METHOD_FLOATING_WINDOW_SWITCH_CHANGED =
      "method_floating_window_switch_changed";

  /// 悬浮窗配置改变
  static const String METHOD_FLOATING_WINDOW_CONFIG_CHANGED =
      "method_floating_window_config_changed";

  /// 合约交易单位
  static const String METHOD_CONTRACT_TRADE_UNIT = "method_contract_trade_unit";

  /// 任务中心-我的赠金-点击事件
  static const String METHOD_TASK_CENTER_CLICK_BONUS =
      "method_task_center_click_bonus";

  /// 弹出原生弹窗
  static const String METHOD_SHOW_NATIVE_DIALOG = "method_show_native_dialog";

  /// 接入原生弹窗管理，更新弹窗model
  static const String METHOD_UPDATE_ALERT_MANAGER = "method_update_alert_manager";
  /// 接入原生弹窗管理，增加弹窗model
  static const String METHOD_ADD_ALERT_MANAGER = "method_add_alert_manager";

  static const String SHOW_NATIVE_LOGIN = "showNativeLogin";
  static const String SHOW_NATIVE_REGISTER = "showNativeRegister";
  static const String SHOW_NATIVE_USER_AUTH = "showNativeUserAuth";
  static const String SHOW_NATIVE_SETUP_TRADE_PASSWORD = "showNativeSetupTradePassword";
  static const String SHOW_NATIVE_IM = "showNativeIM";
  static const String SHOW_NATIVE_RESET_PWD = "showNativeResetPwd";

  /// 在线客服
  static const String SHOW_NATIVE_CUSTOMER_SERVICE = "showNativeCustomerService";

  /// 帮助中心
  static const String SHOW_NATIVE_HELP_SERVICE = "showNativeHelpService";
  /// 提交工单
  static const String SHOW_NATIVE_WORK_ORDER = "showNativeWorkOrder";
  /// App检测工具
  static const String SHOW_NATIVE_DETECTION_TOOL = "showNativeDetectionTool";
  /// 网络切换
  static const String SHOW_NATIVE_NETWORK_SWITCHER = "showNativeNetworkSwitcher";
  static const String SHOW_NATIVE_FEEDBACK = "showNativeFeedback";
  /// 跳轉到安全中心
  static const String SHOW_NATIVE_SAFE_CENTER = "showNativeSafeCenter";

  ///  社区-动态-网格跟随跳转
  static const String SHOW_NATIVE_GRID_SETTING = "showNativeGridSetting";
  //原生分享
  static const String SHOW_NATIVE_SHARE = "showNativeShare";
  static const String SHOW_FLUTTER_BUSINESS_SHOP_PAGE = "showFlutterMerchantPage";
  ///资产
  //当前计价单位
  static const String METHOD_CURRENT_PRICE_UNIT = "method_current_price_unit";
  //当前计价图标
  static const String METHOD_CURRENT_PRICE_SYMBOL = "method_current_price_symbol";
  //原生改变计价方式通知
  static const String METHOD_PRICE_UNIT_CHANGE = "method_price_unit_change";
  //获取useinfo
  static const String METHOD_DATA_USERINFO = "method_data_userinfo";
  //获取followUserinfo
  static const String METHOD_DATA_FOLLOW_USERINFO = "method_data_follow_userinfo";
  //获取现货跟单followUserinfo
  static const String METHOD_DATA_SPOT_FOLLOW_USERINFO = "method_data_spot_follow_userinfo";
  //获取涨跌色
  static const String METHOD_DATA_UP_DOWN_COLOR = "method_data_up_down_color";
  //跳转 tab index
  static const String SHOW_NATIVE_TAB_INDEX = "show_native_tab_index";
  //刷新用户资产
  static const String METHOD_RELOAD_ASSETS_DATA = "method_reload_assets_data";
  //合约使用赠金劵
  static const String METHOD_CONTRACT_USER_BONUS = "method_contract_use_bonus";
  //选择资产并选择上方index
  static const String METHOD_ASSETS_CHOOSE_INDEX = "method_assets_choose_index";
  //跳转安全中心设置交易密码
  static const String METHOD_ASSETS_SAFE_CENTER = "method_assets_safe_center";
  //跳转币币交易
  ///传参需要按照规则来,不然原生解析会报错 pairId传int isETF传bool  symbolName传字符串
  static const String METHOD_ASSETS_SPOT_TRANSACTION = "method_assets_spot_transaction";
  //现货跟单跳转币币交易并开启MainActivity,上边那个跳转是资产跳过去的
  static const String METHOD_ASSETS_SPOT_TRANSACTION_NEW = "method_assets_spot_transaction_new";
  //检查是否开通合约并弹窗
  static const String METHOD_ASSETS_CONSTRACT_STATUS_CHECK = "method_assets_contract_status_check";
  //合约开通状态
  static const String METHOD_ASSETS_CONSTRACT_STATUS = "method_assets_contract_status";
  static const String METHOD_ETF_USER_BONUS = "method_ETF_use_bonus";
  // 打开otc
  static const String METHOD_OPEN_OTC_HOME = "method_open_otc_home";

  /// 从原生获取自选id
  static const String METHOD_SELF_ID_LIST = "method_self_id_list";

  //跳转今日预估分润
  static const String METHOD_PUSH_TODAY_PROFIT = "method_push_today_profit";
  //跳转累计分润
  static const String METHOD_PUSH_TOTAL_PROFIT = "method_push_total_profit";
  // //跳转跟单设置
  // static const String METHOD_PUSH_FOLLOW_SETTIONG = "method_push_follow_setting";
  //跳转历史带单列表
  static const String METHOD_PUSH_FOLLOW_HISTORY = "method_push_follow_history";
  //跳转带单设置
  static const String METHOD_PUSH_TRADER_SETTING = "method_push_trader_setting";

  //跳转合约交易
  static const String METHOD_PUSH_CONTRACT_TRANSCATION = "method_push_contract_transcaction";

  //跳转导航首页
  static const String METHOD_POP_ROOT_VIEW_CONTROLLER = "method_pop_root_view_controller";

  //带单设置后回调
  static const String FLUTTER_FOLLOW_SETTING_CALLBACK = "flutter_event_follow_setting_callback";

  //联系客服
  static const String SHOW_NATIVE_WEB_SERVICE = "show_native_web_service";

  //跳转到hyperPay充值页面
  static const String SHOW_HPY_RECHARGE = "show_hpy_recharge";

  //跳转到hyperPay绑定页面
  static const String SHOW_BIND_HPY = "show_bind_hpy";

  //首页跳转个人中心
  static const String METHOD_HOME_USERCENTER = "method_home_usercenter";

  //首页搜索事件
  static const String METHOD_HOME_SEARCH = "method_home_search";

  //首页跳转扫码
  static const String METHOD_HOME_SCAN = "method_home_scan";
  //原生路由跳转
  static const String METHOD_HOME_ROUTER_PUSH = "method_home_router_push";

  //获取原生新手页显示模块
  static const String METHOD_HOME_NEWER_MODULE_SHOW_STATUS = "method_home_newer_module_show_status";
  //获取原生专业版显示模块
  static const String METHOD_HOME_PRO_MODULE_SHOW_STATUS = "method_home_pro_module_show_status";
  //获取原生当前是专业版还是新手版 true 专业 false 新手
  static const String METHOD_HOME_REQUEST_NEWER_PRO_STATUS = "method_home_request_newer_pro_status";
  //设置原生当前是专业版还是新手版 true 专业 false 新手
  static const String METHOD_HOME_SET_NEWER_PRO_STATUS = "method_home_set_newer_pro_status";

  ///获取当前计价方式的符号跟汇率
  static const String METHOD_HOME_PRICING_METHOD = "method_home_pricing_method";

  /// 跳转原生现货K线
  static const String METHOD_HOME_GO_TO_KLINE = "method_home_go_to_kline";
  /// 跳转原生合约K线
  static const String METHOD_HOME_GO_TO_CONTRACT_KLINE = "method_home_go_to_contract_kline";
  /// 跳转原生行情自选
  static const String METHOD_HOME_GO_TO_MARKET_SELF = "method_home_go_to_market_self";
  /// 跳转原生行情
  static const String METHOD_HOME_GO_TO_MARKET = "method_home_go_to_market";
  /// 跳转社区  关注0 精选1  最新2
  static const String METHOD_HOME_GO_TO_BBS_CHOICE = "method_home_go_to_bbs_choice";

  /// 首页排行榜点击统计
  static const String METHOD_HOME_RANKING_LIST_FIREBASE_EVENT = "method_home_ranking_list_firebase_event";

  /// 跳转社区刷新主页tab(原生给flutter发消息)
  static const String METHOD_RELOAD_BBS_TAB = "method_reload_bbs_tab";
  /// 首页从原生获取自选id
  static const String METHOD_HOME_SELF_ID_LIST = "method_home_self_id_list";
  /// 原生通知Flutter获取自选id
  static const String METHOD_HOME_UPDATE_SELF_ID_LIST = "method_home_update_self_id_list";
  /// 跳转原生跟单大厅首页
  static const String METHOD_HOME_GO_TO_FOLLOW_CENTER = "method_home_go_to_follow_center";
  /// 跳转原生跟单带单员
  static const String METHOD_HOME_GO_TO_FOLLOW_AGENT = "method_home_go_to_follow_agent";
  //OTC快速打开购买链接 flutter --> 原生
  static const String METHOD_OTC_QUICK_OPEN_BUY_LINK_READY = "method_otc_quick_buylink_ready";
  //OTC快速打开购买链接 原生 --> flutter
  static const String METHOD_OTC_NATIVE_TO_FLUTTER_QUICK_OPEN_BUYLINK = "method_otc_native_to_flutter_quick_buylink";
  /// 获取Android手机版本
  static const String METHOD_ANDROID_SDK_INT = "method_android_sdk_int";
  /// 是否显示首页红包
  static const String METHOD_HOME_ENABLE_RED_PACKET = "method_home_enable_red_packet";
  /// 首页红包点击跳转web view
  static const String METHOD_HOME_RED_PACKET_ACTION = "method_home_red_packet_action";
  /// Native 通知 Flutter config/get接口有变动
  static const String METHOD_CONFIG_DATA_CHANGED = "method_config_data_changed";
  ///设置登录密码手机邮箱成功
  static const String METHOD_SET_PWD_SUCCESS = "method_set_pwd_success";
  ///获取提现警告信息
  static const String METHOD_WITHDRAW_LIMIT_TEXT = "method_withdraw_limit_text";
  /// 判断kyc未验证需要拦截
  static const String METHOD_KYC_UNVERIFIED_NEED_INTERCEPT = "method_kyc_unverified_need_intercept";

  static const String METHOD_KYC_POPAVAILABLE = "method_kyc_popavailable";

  /// 获取现货symbolid
  static const String METHOD_GET_SPOT_SYMBOLID = "method_get_spot_symbolid";
  /// 获取现货symbol
  static const String METHOD_GET_SPOT_SYMBOL = "method_get_spot_symbol";
  /// 通知原生刷新用户详情接口
  static const String methodRefreshUserDetail = "method_refresh_user_detail";
  /// 获取应用渠道
  static const String methodGetAppChannel = "method_get_app_channel";
  /// 获取应用渠道
  static const String methodgetCloseAccountChannel = "method_get_close_account_channel";
  ///跳转定投
  static const String METHOD_HOME_GO_TO_INVEST_HOME = "method_go_invest_home";
  /// 去c2认证
  static const String methodGotoC2Verify = "method_goto_c2_verify";
  /// KYC C2 年龄限制
  static const String methodGetKycAgeLimit = "method_get_kyc_age_limit";
  /// KYC C2 每日次数限制
  static const String methodGetKycC2CountLimit = "method_get_kyc_c2_count_limit";
  /// flutter web socket 收到消息记录日志
  static const String methodWebSocketSaveLog = "method_web_socket_save_log";
  /// flutter web socket 状态改变
  static const String methodWebSocketStatusChanged = "method_web_socket_status_changed";
  /// 从内部打开直播页面
  static const String SHOW_LIVE_PAGE = "showLivePage";
  /// 跳转原生我的卡劵
  static const String showNativeMyCoupon = "show_native_my_coupon";
  /// 从原生传递卡劵信息
  static const String methodCouponInfo = "method_coupon_info";
  ///ios内部打印
  static const String methodLogInIOS= "method_log_in_ios";

  ///分享社交平台图片给原生传图片
  static const String METHOD_SOCIAL_SHARE_IMAGE = "method_social_share_image";
}

class JsConst {
  static const String jsChannel = "FlutterCall";
  static const String jsCallName = "callName";
  static const String jsShowHome = "showHome";
  static const String jsClosePage = "closeButtonClick";
  /// 编辑成功
  static const String jsCallOtcEditSuccess = "OTCEditSuccess";
  /// 发布成功
  static const String jsCallOtcPublishSuccess = "OTCPublishSuccess";
  /// 打开 flutter 卡片大厅
  static const String jsCallShowIssueCardHall = "showIssueCardHall";
  /// 打开跟单大厅
  static const String jsCallShowFollow = "showFollow";
  /// 打开邀请返佣
  static const String jsCallShowInvite = "showInvite";
  /// 跳转合约交易
  static const String jsCallShowSwap = "showSwap";
  /// 打开超级赠金账户
  static const String jsShowPrize = "showPrize";
  /// 分享
  static const String jsShowShare = "showShare";
  /// 打开原生功能
  static const String jsShowNativeFunction = "showNativeFunction";
}

/// 语言
class LangConst {
  static const String LANG_ZH_CN = "zh_CN";//简体
  static const String LANG_ZH_TW = "zh_TW";//繁体
  static const String LANG_EN_US = "en_US";//英文
  static const String LANG_TR_TR = "tr_TR";//土耳其
  static const String LANG_KO_KR = "ko_KR";//韩语
  static const String LANG_VI_VN = "vi_VN";//越南语
  static const String LANG_PT_PT = "pt_PT";//葡萄牙
  static const String LANG_RU_RU = "ru_RU";//俄语
  static const String LANG_JA_JP = "ja_JP";//日语
  static const String LANG_FR_FR = "fr_FR";//法语
  static const String LANG_ES_ES = "es_ES";//西班牙语
  static const String LANG_ZH_SHOW = "中文简体";
  static const String LANG_EN_SHOE = "English";
  static const String LANG_ZH = "zh";
  static const String LANG_CN = "CN";
  static const String LANG_EN = "en";
  static const String LANG_US = "US";
}

/// 图片资源
class ImageSourceConst {
  ///新图片
  static const String IC_BASE_BUTTON_ARROW_LEFT = "images/ic_base_button_arrow_left.png";
  static const String IC_BASE_BUTTON_ARROW_RIGHT = "images/ic_base_button_arrow_right.png";
  static const String IC_BASE_CHECKBOX_OFF = "images/ic_base_checkbox_off.png";
  static const String IC_BASE_CHECKBOX_ON = "images/ic_base_checkbox_on.png";
  static const String IC_BASE_CHECKBOX_BLACK_ON = "images/ic_base_checkbox_black_on.png";
  static const String IC_BASE_CHECKBOX_GRAY_OFF = "images/ic_base_checkbox_gray_off.png";
  static const String IC_BASE_FAB = "images/ic_base_fab.png";
  static const String IC_BASE_MORE = "images/ic_base_more.svg";
  static const String IC_BASE_NOTIFICATINS = "images/ic_base_notifications.svg";
  static const String IC_BASE_DOWN_ARROW = "images/ic_base_down_arrow.svg";
  static const String IC_BASE_EXCLAMATION = "images/ic_base_exclamation.svg";
  static const String IC_BASE_ETH_EXAMPLE = "images/ic_base_eth_example.svg";
  ///新图片


  static const String ICON_COINW = "images/ic_coinw.png";
  static const String ICON_APPBAR_BACK = "images/ic_arrow_back.png";
  static const String ICON_APPBAR_CLOSE = "images/ic_arrow_close.png";
  static const String ICON_APPBAR_CLOSE2 = "images/ic_arrow_close2.svg";
  static const String ICON_APPBAR_BACK_WHITE = "images/ic_arrow_back_white.png";
  static const String LOADING_IN = "images/loading_in.png";
  static const String LOADING_OUT = "images/loading_out.png";
  static const String ICON_ARROW_GRAY_RIGHT = "images/ic_arrow_gray_right.png";
  static const String ICON_CLOSE = "images/ic_close.png";
  static const String ICON_IEO_RECORD = "images/ic_ieo_record.png";
  static const String ICON_EYE_OPEN_GRAY = "images/ic_eye_edittext_open.png";
  static const String ICON_EYE_CLOSE_GRAY = "images/ic_eye_edittext_close.png";
  static const String ICON_STATUS_WAITING = "images/ic_status_waiting.png";
  static const String ICON_STATUS_SUCCESS = "images/ic_status_success.png";
  static const String ICON_NO_DATA = "images/no_data.svg";
  static const String ICON_MENU = "images/ic_menu.png";
  static const String ICON_TRANSFER = "images/ic_transfer.svg";
  static const String ICON_USER_ORDER = "images/ic_user_order.svg";
  static const String ICON_BUSINESS_ORDER = "images/ic_business_order.svg";
  static const String ICON_PAYMENT_SETTING = "images/ic_payment_setting.svg";
  static const String ICON_BUSINESS_MANAGER = "images/ic_business_manager.svg";
  static const String ICON_BLACK_LIST = "images/ic_black_list.svg";
  static const String OTC_BLACK_LIST_2 = "images/otc/otc_black_list_2.svg";
  static const String ICON_FILTER = "images/ic_filter.png";
  static const String ICON_BANK_CARD = "images/ic_bank_card.png";
  static const String ICON_FOREIGN_PAY = "images/ic_foreign_pay.png";
  static const String ICON_OTC_ONLINE = "images/ic_otc_online.png";
  static const String ICON_OTC_VIP = "images/ic_otc_vip.png";
  static const String ICON_OTC_VISA = "images/ic_otc_visa.png";
  static const String ICON_OTC_WX = "images/ic_wx.png";
  static const String ICON_MASTER_CARD = "images/otc/ic_master_card.png";
  static const String ICON_OPEN_C = "images/otc/ic_open_c.png";
  static const String ICON_OTC_ALIPAY = "images/ic_zfb.png";
  static const String ICON_FULL_ARROW_DOWN = "images/ic_full_arrow_down.png";
  static const String ICON_SEARCH = "images/ic_search.png";
  static const String ICON_SEARCH_BLACK = "images/ic_search_black.png";
  static const String ICON_SELECTED = "images/ic_selected.png";
  static const String ICON_PAYMENT_ADD = "images/ic_payment_add.png";
  static const String ICON_USDT = "images/ic_usdt.png";
  static const String ICON_CONVERT =
      "images/ic_convert.png";
  static const String ICON_COPY = "images/ic_copy.png";
  static const String ICON_COPY_ACCENT_COLOR = "images/ic_copy_accent_color.png";
  static const String ICON_CHART = "images/ic_chart.png";
  static const String ICON_ADD = "images/ic_add.png";
  static const String ICON_QRCODE = "images/ic_qrcode.png";
  static const String IC_DROP_DOWN =
      "images/ic_drop_down.png";
  static const String IC_DROP_UP = "images/ic_drop_up.png";
  static const String IC_IMAGE_DEFAUT =
      "images/ic_image_default.png";
  static const String IC_SELECT_DOWN =
      "images/ic_select_down.png";
  static const String IC_ASSETS_CLOSE =
      "images/ic_assets_close.png";
  static const String IC_CLOSE_TRANSPARENT =
      "images/ic_close_transparent.png";
  static const String IC_SCAN = "images/ic_scan.png";
  static const String IC_NETWORK_ERROR = "images/ic_network_error.png";
  static const String TOOL_FLASHLIGHT_CLOSE = "images/tool_flashlight_close.png";
  static const String TOOL_FLASHLIGHT_OPEN = "images/tool_flashlight_open.png";
  static const String TOOL_IMAGE = "images/tool_img.png";
  static const String IC_CHECK_DEFAULT =
      "images/ic_check_default.svg";
  static const String IC_CHECK_SELECTED =
      "images/ic_check_selected.svg";
  static const String ISSUE_CARD_BUSINESS_INTRODUCTION = "images/otc/issue_card_business_introduction.svg";
  static const String ISSUE_CARD_PROBLEM_FEEDBACK = "images/otc/issue_card_problem_feedback.svg";
  static const String ISSUE_CARD_PROMOTION_INTRODUCTION = "images/otc/issue_card_promotion_introduction.svg";
  static const String ISSUE_CARD_TOP_UP_REBATE = "images/otc/issue_card_top_up_rebate.svg";
  static const String ISSUE_CARD_RECORD = "images/otc/issue_card_record.svg";
  static const String ISSUE_CARD_SERVICE = "images/otc/issue_card_service.svg";
  static const String ISSUE_CARD_PROBLEM_FEEDBACK_BLACK = "images/otc/issue_card_problem_feedback_black.svg";
  static const String ISSUE_CARD_SHARE_BG = "images/otc/issue_card_share_bg.jpg";
  static const String ISSUE_CARD_SHARE = "images/otc/issue_card_share.png";
  static const String IC_SUCCESS = "images/ic_success.svg";
  static const String IC_WAITING = "images/ic_waiting.svg";
  static const String IC_WARN = "images/ic_warn.svg";
  static const String IC_FAILED = "images/ic_failed.svg";
  static const String IC_COPY = "images/ic_copy.svg";
  static const String IC_LOGO_BLUE = "images/ic_logo_blue.svg";
  static const String IC_COINW_EN = "images/ic_coinw_en.svg";
  static const String IC_COINW_APP = "images/ic_coinw_app.svg";

  static const String ISSUE_CARD_TRANSFER = "images/otc/issue_card_transfer.svg";

  static const String IC_SHARE_SAVE_PNG = "images/ic_share_save_png.png";
  static const String IC_SHARE_MORE = "images/ic_share_more.png";
  static const String IC_SHARE_FACEBOOK = "images/ic_share_facebook_png.png";
  static const String IC_SHARE_TELEGRAM = "images/ic_share_telegram_png.png";
  static const String IC_SHARE_TWITTER = "images/ic_share_twitter_png.png";
  static const String IC_SHARE_SAVE_NEW = "images/ic_share_saveimage_new.png";
  static const String IC_SHARE_MORE_NEW = "images/ic_share_more_new.png";
  static const String IC_SHARE_LOGO_PNG = "images/ic_share_logo_png.png";
  static const String IC_SHARE_COPY_PNG = "images/ic_share_copy_png.png";
  static const String IC_SHARE_SHEET_TOP_DOWN = "images/ic_share_sheet_top_down.png";

  static const String ICON_DELETE = "images/ic_delete.svg";
  static const String ICON_SETTINGS = "images/ic_settings.svg";
  static const String ICON_MOVE = "images/ic_move.svg";
  static const String IC_SHARE_LOGO = "images/ic_share_logo.png";
  static const String IC_SHARE_LOGO_6TH = "images/contract/ic_share_logo_6th.png";
  static const String IC_FILTER2 = "images/ic_filter2.png";
  static const String BG_POSITION_SHARE = "images/bg_position_share.png";
  static const String BG_POSITION_SHARE_BOTTOM_BAR = "images/bg_position_share_bottom_bar.png";
  static const String BG_SHARE_TRADER = "images/bg_share_trader.png";
  static const String IC_CW_LOGO = "images/ic_cw_logo.png";
  static const String BG_SHARE_TEXT = "images/contract/bg_share_text.png";
  static const String BG_POSITION_SHARE_RQCODE_BORDER = "images/contract/bg_position_share_rqcode_border.png";

  static const String COMMON_VERIFY_CODE_ICON = "images/common/common_verify_code_icon.png";
  static const String COMMON_WARNING = "images/common/common_warning.png";
  static const String COMMON_WARNING_2 = "images/common/common_warning_2.svg";
  static const String COMMON_ALERT_CION = "images/common/common_alert_icon.png";
  static const String COMMON_SWITCH = "images/common/common_switch.png";
  static const String ICON_SUCCESS = "images/ic_success.png";
  static const String ICON_COPY_BLACK = "images/ic_copy_black.png";
  static const String COMMON_IC_QR_LOGO = "images/common/ic_qr_logo.png";
  static const String COMMON_ADD = "images/common/common_add.svg";
  static const String COMMON_ADD_CIRCLE = "images/common/common_add_circle.svg";
  static const String COMMON_ARROW_LEFT = "images/common/common_arrow_left.svg";
  static const String COMMON_ARROW_RIGHT = "images/common/common_arrow_right.svg";
  static const String COMMON_ARROW_RIGHT2 = "images/common/common_arrow_right2.svg";
  static const String COMMON_CHART = "images/common/common_chart.svg";
  static const String COMMON_CHECK = "images/common/common_check.svg";
  static const String COMMON_CHEVRON_DOWN = "images/common/common_chevron_down.svg";
  static const String COMMON_CHEVRON_LEFT = "images/common/common_chevron_left.svg";
  static const String COMMON_CHEVRON_RIGHT = "images/common/common_chevron_right.svg";
  static const String COMMON_CHEVRON_UP = "images/common/common_chevron_up.svg";
  static const String COMMON_CLOSE = "images/common/common_close.svg";
  static const String COMMON_COMMENT = "images/common/common_comment.svg";
  static const String COMMON_COPY_1 = "images/common/common_copy_1.svg";
  static const String COMMON_COPY_2 = "images/common/common_copy_2.svg";
  static const String COMMON_COPY_3 = "images/common/common_copy_3.svg";
  static const String COMMON_COPY_4 = "images/common/common_copy_4.svg";
  static const String COMMON_DEPOSIT = "images/common/common_deposit.svg";
  static const String COMMON_DISLIKE = "images/common/common_dislike.svg";
  static const String COMMON_DOUBLE_CHEVRON_LEFT = "images/common/common_double_chevron_left.svg";
  static const String COMMON_DOUBLE_CHEVRON_RIGHT = "images/common/common_double_chevron_right.svg";
  static const String COMMON_DRAG = "images/common/common_drag.svg";
  static const String COMMON_EDIT = "images/common/common_edit.svg";
  static const String COMMON_FAIL = "images/common/common_fail.svg";
  static const String COMMON_INFO = "images/common/common_info.svg";
  static const String COMMON_LIKE = "images/common/common_like.svg";
  static const String COMMON_MENU = "images/common/common_menu.svg";
  static const String COMMON_QUESTION = "images/common/common_question.svg";
  static const String COMMON_SHARE = "images/common/common_share.svg";
  static const String COMMON_SOLID_TRIANGLE_DOWN = "images/common/common_solid_triangle_down.svg";
  static const String COMMON_SUCCESS = "images/common/common_success.svg";
  static const String COMMON_TRANSFER = "images/common/common_transfer.svg";
  static const String COMMON_WARN = "images/common/common_warn.svg";
  static const String COMMON_WARN_SOLID = "images/common/common_warn_solid.svg";
  static const String COMMON_UPLOAD = "images/common/common_upload.svg";
  static const String COMMON_DELETE = "images/common/common_delete.svg";
  static const String COMMON_DELETE2 = "images/common/common_delete2.svg";
  static const String COMMON_UPDATE = "images/common/common_update.svg";
  static const String COMMON_BACK_WHITE = "images/common/common_back_white.svg";
  static const String COMMON_SHATE_WHITE = "images/common/common_share_white.png";
  static const String COMMON_DOWM = "images/common/common_down.svg";
  static const String COMMON_UP = "images/common/common_up.svg";
  static const String COMMON_EYE_CLOSE = "images/common/common_eye_close.svg";
  static const String COMMON_EYE_OPEN = "images/common/common_eye_open.svg";


  static const String IC_EDIT_BLACK = "images/common/ic_edit_black.png";


  static const String OTC_QUICK_TRADE_CONFIRM = "images/otc/otc_quick_trade_confirm.png";
  static const String OTC_ORDER_APPEAL = "images/otc/otc_order_appeal.png";
  static const String OTC_ORDER_COMPLETE = "images/otc/otc_order_complete.png";
  static const String OTC_ORDER_WAITING = "images/otc/otc_order_waiting.png";
  static const String OTC_ORDER_CANCEL = "images/otc/otc_order_cancel.png";
  static const String OTC_ORDER_PAID = "images/otc/otc_order_paid.png";
  static const String OTC_ORDER_SEND = "images/otc/otc_order_send.png";
  static const String OTC_WARNING = "images/otc/otc_warning.png";
  static const String OTC_EDIT = "images/otc/otc_edit.png";
  static const String OTC_ADD_QRCODE =
      "images/otc/otc_add_aqcode.png";
  static const String OTC_BANK_GRAY =
      "images/otc/otc_bank_gray.png";
  static const String OTC_BANK_CHECK =
      "images/otc/otc_bank_check.png";
  static const String OTC_PAY_BG =
      "images/otc/otc_pay_bg.png";
  static const String OTC_ORDER_THIRD_PAY =
      "images/otc/otc_order_third_pay.png";
  static const String OTC_PAYMENT_UPI =
      "images/otc/otc_payment_upi.png";
  static const String OTC_PAYMENT_KRW =
      "images/otc/otc_payment_krw.png";
  static const String OTC_PAYMENT_IMPS =
      "images/otc/otc_payment_imps.png";
  static const String OTC_IC_ADVCASH =
      "images/otc/ic_advcash.png";
  static const String OTC_IC_ITEZ = "images/otc/ic_itez.png";
  static const String OTC_IC_ACH = "images/otc/ic_ach.png";
  static const String OTC_REFRESH = "images/otc/otc_refresh.png";
  static const String OTC_PAYMENT_IOMONEY = "images/otc/otc_payment_iomoney.png";
  static const String OTC_PAYMENT_QIWI = "images/otc/otc_payment_qiwi.png";
  static const String OTC_CREDIT_CARD_APPLE = "images/otc/otc_credit_card_apple.png";
  static const String OTC_CREDIT_CARD_BANKCARS = "images/otc/otc_credit_card_bankcars.png";
  static const String OTC_CREDIT_CARD_MASTERCARD = "images/otc/otc_credit_card_mastercard.png";
  static const String OTC_CREDIT_CARD_VISA = "images/otc/otc_credit_card_visa.png";
  static const String OTC_CREDIT_CARD_TRANSFER_BANK = "images/otc/otc_credit_card_transfer_bank.png";
  static const String OTC_CREDIT_CARD_SPA = "images/otc/otc_credit_card_spa.png";
  static const String OTC_CREDIT_CARD_ACH = "images/otc/otc_credit_card_ach.png";
  static const String OTC_CREDIT_CARD_GOOGLE = "images/otc/otc_credit_card_google.png";
  static const String OTC_PAYMENT_COMMON = "images/otc/otc_payment_%s.png";
  static const String OTC_SHARE_BACK = "images/otc/ic_otc_share_back.png";
  static const String OTC_SHARE_BUY_ICON = "images/otc/ic_otc_share_buy_icon.png";
  static const String OTC_CREDIT_FIATPAY = "images/otc/otc_fiatpay.png";
  static const String OTC_CREDIT_LEGEND = "images/otc/otc_legend.png";
  static const String OTC_CREDIT_FIATPAY_SUCCESS = "images/otc/otc_fiatpay_success.png";
  static const String OTC_BUSSUNESS_STATUS_SUCCESS = "images/otc/otc_business_status_success.svg";


  static const String LIVE_ARROW = "images/live/live_arrow.png";
  static const String LIVE_HOME_ARROW = "images/live/live_home_arrow.png";
  static const String LIVE_SUCCESS = "images/live/live_success.png";
  static const String LIVE_SHARE = "images/live/live_share.svg";
  static const String LIVE_SHARE_WHITE = "images/live/live_share_white.svg";
  static const String LIVE_BACK_WHITE = "images/live/live_back_white.png";
  static const String LIVE_WATCH = "images/live/live_watch.svg";
  static const String LIVE_COLLECT = "images/live/live_collect.svg";
  static const String LIVE_COLLECT_RED = "images/live/live_collect_red.svg";
  static const String LIVE_ONLINE = "images/live/live_online.svg";
  static const String LIVE_LIKE = "images/live/live_like.png";
  static const String LIVE_LIVING_GIF = "images/live/live_living.json";
  static const String LIVE_ALERT_CLOSE = "images/live/live_alert_close.png";
  static const String LIVE_LAST = "images/live/live_last.svg";
  static const String LIVE_LAST_WHITE = "images/live/live_last_white.svg";
  static const String LIVE_LAST_DISABLE = "images/live/live_last_disable.svg";
  static const String LIVE_LAST_DISABLE_WHITE = "images/live/live_last_disable_white.svg";
  static const String LIVE_NEXT = "images/live/live_next.svg";
  static const String LIVE_NEXT_WHITE = "images/live/live_next_white.svg";
  static const String LIVE_NEXT_DISABLE = "images/live/live_next_disable.svg";
  static const String LIVE_NEXT_DISABLE_WHITE = "images/live/live_next_disable_white.svg";
  static const String LIVE_GO_FORWARD = "images/live/live_go_forward.svg";
  static const String LIVE_GO_FORWARD_WHITE = "images/live/live_go_forward_white.svg";
  static const String LIVE_GO_BACKWARD = "images/live/live_go_backward.svg";
  static const String LIVE_GO_BACKWARD_WHITE = "images/live/live_go_backward_white.svg";
  static const String LIVE_PLAY = "images/live/live_play.svg";
  static const String LIVE_PLAY_WHITE = "images/live/live_play_white.svg";
  static const String LIVE_PAUSE = "images/live/live_pause.svg";
  static const String LIVE_PAUSE_WHITE = "images/live/live_pause_white.svg";
  static const String LIVE_BARRAGE = "images/live/live_barrage.svg";
  static const String LIVE_BARRAGE_WHITE = "images/live/live_barrage_white.svg";
  static const String LIVE_WINDOW = "images/live/live_window.svg";
  static const String LIVE_FULL_SCREEN = "images/live/live_full_screen.svg";
  static const String LIVE_FULL_SCREEN_WHITE = "images/live/live_full_screen_white.svg";
  static const String LIVE_GIFT = "images/live/live_gift.svg";
  static const String LIVE_HISTORY_ITEM_ICON = "images/live/live_history_item_icon.svg";
  static const String LIVE_RECEIVE_AWARD = "images/live/live_receive_award.png";
  static const String LIVE_TIPS = "images/live/live_tips.svg";
  static const String LIVE_CURRENCY_TRADING = "images/live/live_currency_trading.svg";
  static const String LIVE_RECHARGE = "images/live/live_recharge.svg";
  static const String LIVE_TRANSFER = "images/live/live_transfer.svg";

  static const String LIVE_MINE_MORE = "images/live/ic_live_mine_more.svg";

  static const String LIVE_MINE_ARROW_DOWN = "images/live/ic_live_mine_arrow_down.svg";
  static const String LIVE_MINE_CREATE_UPLOAD_COVER = "images/live/ic_live_create_upload_cover.svg";


  static const String ASSETS_HOME_HEADER = "images/assets/asset_home_header.png";
  static const String ASSETS_HOME_SEARCH = "images/assets/asset_home_search.png";
  static const String ASSETS_EYE_OPEN = "images/assets/asset_eye_open.png";
  static const String ASSETS_EYE_CLOSE = "images/assets/asset_eye_close.png";
  static const String ASSETS_TRIANGLE_DOWN = "images/assets/asset_triangle_down.png";
  static const String ASSETS_ADDRESS = "images/assets/asset_address.png";
  static const String ASSETS_RECORD = "images/assets/asset_record.png";
  static const String ASSETS_SELECT = "images/assets/asset_select.png";
  static const String ASSETS_OVERVIEW = "images/assets/asset_overview_%s.png";
  static const String ASSETS_ORDERS = "images/assets/asset_button_orders.png";
  static const String ASSETS_GO_OTC = "images/assets/asset_button_go_otc.png";
  static const String ASSETS_RECHARGE = "images/assets/asset_button_recharge.png";
  static const String ASSETS_TRANSFER = "images/assets/asset_button_transfer.png";
  static const String ASSETS_WITHDRAW = "images/assets/asset_button_withdraw.png";
  static const String ASSETS_TRANSACTION = "images/assets/asset_button_transaction.png";
  static const String ASSETS_ITEM_ASSET = "images/assets/asset_item_asset.png";
  static const String ASSETS_ITEM_SPOT = "images/assets/asset_item_spot.png";
  static const String ASSETS_ITEM_OTC = "images/assets/asset_item_otc.png";
  static const String ASSETS_ITEM_CONTRACT = "images/assets/asset_item_contract.png";
  static const String ASSETS_ITEM_COINW = "images/assets/asset_item_coinw.png";
  static const String ASSETS_ITEM_GIFT = "images/assets/asset_item_gift.png";
  static const String ASSETS_ITEM_FOLLOW = "images/assets/asset_item_follow.png";
  static const String ASSETS_ITEM_BANK_CARD = "images/assets/asset_item_back_card.png";
  static const String ASSETS_TRANSFER_BILL = "images/assets/asset_transfer_bill.png";
  static const String ASSETS_TRANSFER_CHANGE = "images/assets/assets_transfer_change.png";
  static const String ASSETS_FILTER_SELECT = "images/assets/assets_filter_select.png";
  static const String ASSETS_FILTER = "images/assets/assets_filter.png";
  static const String ASSETS_DELETE = "images/assets/assets_delete.png";
  static const String ASSETS_ITEM_EDIT = "images/assets/asset_item_edit.png";
  static const String ASSETS_ITEM_TRNSFER = "images/assets/asset_item_transfer.png";
  static const String ASSETS_GUIDE_1 = "images/assets/asset_guide_1.png";
  static const String ASSETS_GUIDE_2 = "images/assets/asset_guide_2.png";
  static const String ASSETS_GUIDE_3 = "images/assets/asset_guide_3.png";
  static const String ASSETS_GUIDE_4 = "images/assets/asset_guide_4.png";
  static const String ASSETS_CALENDER = "images/assets/asset_calender.png";
  static const String ASSETS_BOUNS_STATE_BG = "images/assets/assets_bouns_state_bg.png";
  static const String ASSETS_BUTTON_DELETE = "images/assets/asset_button_delete.png";
  static const String ASSETS_BUTTON_EDIT = "images/assets/asset_button_edit.png";
  static const String ASSETS_BUTTON_GIFT_RECORD = "images/assets/asset_button_gift_record.png";
  static const String ASSETS_BUTTON_UNLOCK = "images/assets/asset_button_unlock.png";
  static const String ASSETS_DOUBT = "images/assets/asset_doubt.png";
  static const String ASSETS_TRANSFER_ACCENT_COLOR = "images/assets/asset_transfer_accent_color.svg";
  static const String ASSETS_TRANSFER_BIG = "images/assets/asset_transfer_big.svg";
  static const String ASSETS_PAY_ICON = "images/assets/asset_hyperpay_icon.svg";
  static const String ASSETS_NORMAL_WITHDRAW = "images/assets/asset_normal_withdraw.svg";

  static const String ASSETS_INVEST_ARROW = "images/assets/asset_invest_arrow.png";
  static const String ASSETS_INVEST_HEADER = "images/assets/asset_invest_header.png";
  static const String ASSETS_INVEST_BG = "images/assets/asset_invest_bg.svg";
  static const String ASSETS_PAY_FONT = "images/assets/asset_hyperpay_font.png";
  static const String ASSETS_HPY_LINK = "images/assets/asset_hpy_link.png";
  static const String ASSETS_HPY_UNLINK = "images/assets/asset_hpy_unlink.png";
  static const String ASSETS_WARNING = "images/assets/asset_warning.png";
  static const String ASSETS_ADDRESS_COIN = "images/assets/asset_address_coin.svg";
  static const String ASSETS_ADDRESS_INNER = "images/assets/asset_address_inner.svg";
  static const String ASSET_SPOT_FOLLOW_HOLD = "images/assets/asset_spot_follow_hold.png";
  static const String ASSETS_BUTTON_BILL = "images/assets/assets_button_bill.svg";
  static const String ASSETS_BUTTON_DEPOSIT = "images/assets/assets_button_deposit.svg";
  static const String ASSETS_BUTTON_TRADE = "images/assets/assets_button_trade.svg";
  static const String ASSETS_BUTTON_TRANSFER = "images/assets/assets_button_transfer.svg";
  static const String ASSETS_BUTTON_WITHDRAW = "images/assets/assets_button_withdraw.svg";

  static const String BBS_COMMENT = "images/bbs/ic_comment.svg";
  static const String BBS_LIKE = "images/bbs/ic_like.svg";
  static const String BBS_LIKED = "images/bbs/ic_liked.svg";
  static const String BBS_NOTIFY = "images/bbs/ic_notify.png";
  static const String BBS_PUBLISH = "images/bbs/ic_publish.png";
  static const String BBS_RELAY = "images/bbs/ic_relay.svg";
  static const String BBS_VIP = "images/bbs/ic_vip.png";
  static const String BBS_NOTICE_MORE = "images/bbs/ic_notice_more.png";
  static const String BBS_NOTICE_BADGE = "images/bbs/ic_notice_badge.png";
  static const String BBS_MINE_CHAT = "images/bbs/ic_mine_chat.png";
  static const String BBS_MINE_FOLLOW = "images/bbs/ic_mine_follow.png";
  static const String BBS_NOTICE_AT_MINE = "images/bbs/ic_notice_at_mine.png";
  static const String BBS_NOTICE_COMMENT = "images/bbs/ic_notice_comment.png";
  static const String BBS_NOTICE_DELETE = "images/bbs/ic_notice_delete.png";
  static const String BBS_AT = "images/bbs/ic_at.svg";
  static const String BBS_SELECT_IMAGE = "images/bbs/ic_select_image.svg";
  static const String BBS_SELECT_IMAGE_OFF = "images/bbs/ic_select_image_off.svg";
  static const String BBS_SELECT_VIDEO = "images/bbs/ic_select_video.svg";
  static const String BBS_SELECT_VIDEO_OFF = "images/bbs/ic_select_video_off.svg";
  static const String BBS_SELECT_FOLLOW = "images/bbs/ic_select_follow.svg";
  static const String BBS_SELECT_FOLLOW_OFF = "images/bbs/ic_select_follow_off.svg";
  static const String BBS_SELECT_GRID = "images/bbs/ic_select_grid.svg";
  static const String BBS_SELECT_GRID_OFF = "images/bbs/ic_select_grid_off.svg";
  static const String BBS_CARD_CLOSE = "images/bbs/ic_card_close.svg";
  static const String BBS_SHARE_BACK = "images/bbs/ic_share_back.png";
  static const String BBS_MINE_EDIT = "images/bbs/ic_mine_edit.png";
  static const String BBS_LOAD_ADD = "images/bbs/ic_load_add.png";
  static const String BBS_LOAD_DEL = "images/bbs/ic_load_del.png";
  static const String BBS_MINE_EDIT_CLOSE = "images/bbs/ic_mine_edit_close.png";
  static const String BBS_IC_PAUSE = "images/bbs/ic_pause.png";

  static const String HOME_SCAN = "images/home/ic_home_scan.svg";
  static const String IC_HOME_TRADING_LEADER = "images/home/ic_home_trading_leader.svg";
  static const String HOME_RIGHT_ARROW = "images/home/ic_home_right_arrow.svg";
  static const String HOME_LIVE_CLOSE = "images/home/ic_home_live_close.svg";
  static const String HOME_HORN = "images/home/ic_home_horn.svg";
  static const String HOME_MORE = "images/home/ic_home_more.svg";
  static const String HOME_PROFILE = "images/home/ic_home_profile.svg";
  static const String HOME_NOTIFY = "images/home/ic_home_notify.svg";
  static const String HOME_SEARCH = "images/home/ic_home_search.svg";
  static const String HOME_LIVING = "images/home/ic_home_living.svg";
  static const String HOME_RIGHT_ARROW_BLACK = "images/home/ic_home_right_arrow_black.svg";
  static const String HOME_RED_PACKET = "images/home/ic_home_red_packet.png";
  static const String HOME_READALL_NOTICE = "images/home/notice_home_allread.png";
  static const String HOME_ANNOUCEMENT = "images/home/home_annouce.svg";
  static const String HOME_GIF_COUPON = "images/home/ic_home_coupon.gif";
  static const String SPOT_FOLLOW_HEAD_DEFAULT = "images/follow/ic_spot_follow_head_default.png";
  static const String HOME_NOTIFICATION_CLEAN = "images/home/ic_notification_clean.svg";
  static const String HOME_NOTIFICATION_MESSAGES = "images/home/ic_notification_messages.svg";



  static const String IC_ASSETS_UNIVERSAL_BG = "images/ic_assets_universal_bg.png";
  static const String ASSETS_UNIVERSAL_TAP = "images/assets/assets_universal_tap.png";
  static const String ASSETS_UNIVERSAL_TIME = "images/assets/assets_universal_time.png";

  static const String COMMON_THEM_ARROW = "images/common/common_them_arrow.png";
  static const String COMMON_OPERATION_DETAIL = "images/common/common_operation_detail.png";


  static const String FOLLOW_DOWN_ARROW = "images/follow/follow_down_arrow.png";
  static const String FOLLOW_LOCAL = "images/follow/follow_local.png";
  static const String FOLLOW_LIKE = "images/follow/follow_like.png";
  static const String FOLLOW_LIKE_NO = "images/follow/follow_like_no.png";
  static const String FOLLOW_UNLIKE = "images/follow/follow_unlike.png";
  static const String FOLLOW_UNLIKE_NO = "images/follow/follow_unlike_no.png";
  static const String FOLLOW_SLICES = "images/follow/follow_slices.png";
  static const String FOLLOW_SLICES_NO = "images/follow/follow_slices_no.png";
  static const String FOLLOW_WARNING_BIG = "images/follow/follow_warning_big.png";
  static const String FOLLOW_OPERATION_ARROW = "images/follow/follow_operation_arrow.png";
  static const String FOLLOW_USER_EDIT = "images/follow/follow_user_edit.png";
  static const String FOLLOW_USER_SHARE = "images/follow/follow_user_share.png";
  static const String FOLLOW_SETTING_FAIL = "images/follow/follow_setting_failure.png";
  static const String FOLLOW_SETTING_SUCCESS = "images/follow/follow_setting_success.png";

  static const String BBS_CARD_FOLLOW_BACK = "images/bbs/ic_card_follow_back.jpg";
  static const String BBS_CARD_GRID_BACK = "images/bbs/ic_card_grid_back.jpg";
  static const String BBS_PULL_DOWN_DELETE = "images/bbs/ic_pull_down_delete.svg";

  static const String USER_TASK_CENTER_HEADER = "images/user/bg_task_center_head.png";
  static const String USER_ICON_TASK_NOVICE = "images/user/ic_task_tyro.png";
  static const String USER_ICON_TASK_SPOT = "images/user/ic_task_currency.png";
  static const String USER_ICON_TASK_CONTRACT = "images/user/ic_task_contract.png";
  static const String USER_ICON_TASK_STUDY = "images/user/ic_task_study.png";
  static const String USER_TASK_CENTER_STATUS_WORKING = "images/user/task_center_status_working.png";
  static const String USER_TASK_CENTER_STATUS_EXPIRED = "images/user/task_center_status_expired.png";
  static const String USER_TASK_CENTER_STATUS_DONE = "images/user/task_center_status_done.png";
  static const String USER_KYC_HOME_HEADER = "images/user/bg_kyc_header.png";
  static const String USER_KYC_LEVEL_0 = "images/user/ic_kyc_level_0.svg";
  static const String USER_KYC_LEVEL_1 = "images/user/ic_kyc_level_1.svg";
  static const String USER_KYC_LEVEL_2 = "images/user/ic_kyc_level_2.svg";
  static const String USER_KYC_LEVEL_3 = "images/user/ic_kyc_level_3.svg";
  static const String USER_TASK_CENTER_GO_COMPLETE = "images/user/task_center_go_complete.png";
  static const String USER_IMG_WELFARE_CENTER = "images/user/img_welfare_center.png";
  static const String userSafeCenterAuthLogo = "images/user/ic_safe_center_auth_logo.png";
  static const String USER_ICON_CAMERA = "images/user/ic_camera_36x36.svg";
  static const String USER_RISK_CONTROL_UNSEAL_FAIL = "images/user/ic_risk_control_unseal_fail.png";
  static const String USER_RISK_CONTROL_UNSEAL_SUCCESS = "images/user/ic_risk_control_unseal_success.png";
  static const String USER_RISK_CONTROL_UNSEAL_WAIT = "images/user/ic_risk_control_unseal_wait.png";
  static const String USER_RISK_CONTROL_EXAMPLE = "images/user/risk_control_example.mp4";
  static const String USER_RISK_CONTROL_PDF = "images/user/ic_pdf.png";
  static const String USER_RISK_CONTROL_IMAGE = "images/user/ic_image.png";
  static const String USER_RISK_CONTROL_VIDEO = "images/user/ic_video.png";

  static const String USER_INVENT_HOME_BG = "images/user/user_invent_home_bg.png";
  static const String USER_INVENT_TAG = "images/user/user_invent_tag.png";
  static const String USER_INVENT_CENTER_GIFT = "images/user/user_invent_center_gift.png";
  static const String USER_INVENT_TITLE_BG = "images/user/user_invent_tag_bg.png";
  static const String USER_INVENT_TITLE_BG1 = "images/user/user_invent_tag_bg1.svg";
  static const String USER_INVENT_TITLE_BG2 = "images/user/user_invent_tag_bg2.png";
  static const String USER_INVENT_TITLE_BG3 = "images/user/user_invent_tag_bg3.svg";
  static const String USER_INVENT_RANK1 = "images/user/user_invent_rank1.svg";
  static const String USER_INVENT_RANK2 = "images/user/user_invent_rank2.svg";
  static const String USER_INVENT_RANK3 = "images/user/user_invent_rank3.svg";
  static const String USER_INVENT_SHARE = "images/user/user_invent_share.svg";
  static const String USER_INVENT_TRADE = "images/user/user_invent_trade.svg";
  static const String USER_INVENT_MONEY = "images/user/user_invent_money.svg";

  static const String CONTRACT_BG_RISK_FUND_HEADER = "images/contract/bg_risk_fund_header.png";
  static const String CONTRACT_IC_RISK_FUND_TOTAL = "images/contract/ic_risk_fund_total.png";
  static const String CONTRACT_BG_POSITION_SHARE = "images/contract/bg_position_share.png";
  static const String CONTRACT_BG_POSITION_SHARE_CHARACTER = "images/contract/bg_position_share_character.png";
  static const String CONTRACT_BG_POSITION_SHARE_BOTTOM_BAR = "images/contract/bg_position_share_bottom_bar.png";
  static const String contractIcEntrustCancel = "images/contract/ic_entrust_cancel.png";
  static const String contractIcEntrustPart = "images/contract/ic_entrust_part.png";

  static const String BASE_TOAST_ICON_SUCCESS = "images/ic_toast_success.svg";
  static const String BASE_TOAST_ICON_FAILURE = "images/ic_toast_failure.svg";
  static const String BASE_TOAST_ICON_WARNING = "images/ic_toast_warning.svg";
  static const String BASE_IC_SHARE = "images/ic_share.svg";

  static const String IC_TIME_COUPON = "images/ic_time_coupon.png";
  static const String BG_COUPON_DETAIL = "images/bg_coupon_detail.png";
  static const String IC_GO_TO_DETAIL = "images/ic_go_to_detail.png";

  static const String SPOT_ENTRUST_COUPOIN = "images/spot/ic_spot_entrust_coupoin.svg";
  static const String SPOT_ENTRUST_FILTER = "images/spot/ic_spot_entrust_filter.png";

  /// kyc 高级认证
  static const String USER_KYC_CAMERA = "images/user/ic_kyc_camera.svg";
  static const String USER_KYC_WIFI = "images/user/ic_kyc_wifi.svg";
  static const String USER_KYC_VIDEO = "images/user/ic_kyc_video.svg";
  static const String USER_KYC_ID_CARD = "images/user/ic_kyc_id_card.svg";
  static const String USER_KYC_CLOCK = "images/user/ic_kyc_clock.svg";
  static const String USER_KYC_NO_GLASS = "images/user/ic_kyc_no_glass.svg";
  static const String USER_KYC_NO_UFO = "images/user/ic_kyc_no_ufo.svg";
  static const String USER_KYC_NO_NOISE = "images/user/ic_kyc_no_noise.svg";
  static const String USER_KYC_NO_CAP = "images/user/ic_kyc_no_cap.svg";
  static const String USER_KYC_CAMERA_REVERSE = "images/user/ic_kyc_camera_reverse.svg";
  static const String USER_KYC_VIDEO_RECORD_START = "images/user/ic_video_record_start.svg";
  static const String USER_KYC_VIDEO_RECORD_STOP = "images/user/ic_video_record_stop.svg";
  static const String USER_KYC_FONT_PLUS = "images/user/ic_font_plus.svg";
  static const String USER_KYC_FONT_MIN = "images/user/ic_font_min.svg";
  static const String USER_KYC_SUCCESS = "images/user/ic_kyc_success.svg";
  static const String USER_KYC_FAILURE = "images/user/ic_kyc_failure.svg";
  static const String USER_KYC_UPLOAD_SUCCESS = "images/user/ic_kyc_upload_success.svg";

  /// 下载应用
  static const String USER_DOWN_BACK_PHONE = "images/user/down_back_phone.png";
  static const String USER_DOWN_BOTTOM_ICON1 = "images/user/down_bottom_icon1.svg";
  static const String USER_DOWN_BOTTOM_ICON2 = "images/user/down_bottom_icon2.svg";
  static const String USER_DOWN_BOTTOM_ICON3 = "images/user/down_bottom_icon3.svg";
  static const String USER_DOWN_BOTTOM_ICON4 = "images/user/down_bottom_icon4.svg";
  static const String USER_DOWN_BOTTOM_ICON5 = "images/user/down_bottom_icon5.svg";
  static const String USER_DOWN_LOGO = "images/user/down_logo.png";
  static const String USER_DOWN_SHARE = "images/user/down_share.svg";
  static const String USER_DOWN_SHARE_PHONE = "images/user/down_share_phone.svg";

  static const String earnHomeBanner = "images/earn/earn_home_banner.png";
  static const String earnHomeSharkBanner = "images/earn/earn_home_shark_banner.png";
  static const String earnIconHot = "images/earn/ic_hot.png";
  static const String earnFill = "images/earn/earn_bill.svg";
  static const String earnCountDown = "images/earn/earn_count_down.png";
  static const String icEarnRight = "images/earn/ic_earn_right.png";
  static const String icEarnSuccess = "images/earn/ic_earn_success.png";
  static const String earnSuccessRhomboid = "images/earn/earn_success_rhomboid.svg";
  static const String earnSuccessLine = "images/earn/earn_success_line.svg";
  static const String earnFilter = "images/earn/earn_filter.svg";
  /// 帮助中心-官方验证
  static const String USER_HELP_CENTER_VERIFY_LOGO = "images/user/ic_help_center_verify_logo.svg";
  static const String USER_HELP_CENTER_VERIFY_SUCCESS = "images/user/ic_official_verification_success.svg";
  static const String USER_HELP_CENTER_VERIFY_FAILED = "images/user/ic_official_verification_ failed.svg";
}

class DevicePlatformConst {
  static const IOS = "iOS";
  static const ANDROID = "Android";
}

class IeoStatusConst {
  static const WAITING = 0; //即将开始
  static const DOING = 1;
  static const DONE = 2;
}

class UserSafeCenter {
  static const String userSafeCenterCloseAccountSelected =  "images/user/close_account_selected.svg";
  static const String userSafeCenterCloseAccountUnselect =  "images/user/close_account_unselect.svg";
  static const String userSafeCenterCloseAccountFail =      "images/user/close_account_fail.svg";
}

class OtcConst {
  static const CNY = 'CNY';
  static const USD = 'USD';
  static const TYPE_PAY_ALL = -1;
  static const TYPE_BANK = 1;
  static const TYPE_WECHAT = 2;
  static const TYPE_ALIPAY = 3;
  static const TYPE_FOREIGN_BANK = 7;
  static const TYPE_MERCURYO = 5;
  static const TYPE_OPENC = 8;
  static const TYPE_THIRD_PARTY = 10000;
  static const TYPE_NGN = 9;
  static const TYPE_INR = 13;
  static const TYPE_UPI = 10;
  static const TYPE_IMPS = 11;
  static const TYPE_KRW = 12;
  static const TYPE_ADVCASH = 14;
  static const TYPE_ITEZ = 15;
  static const TYPE_ACH = 99999;
  static const TYPE_SOFU = 99998;
  static const TYPE_LEGEND = 99997;
  static const TYPE_RUB_QIWI = 16;
  static const TYPE_RUB_IOMONEY = 17;
  static const TYPE_RUB_BANK = 18;
  ///加纳
  static const TYPE_GHS_BANK = 19;
  static const TYPE_GHS_MOMO = 20;
  static const TYPE_GHS_VODAFONE = 21;
  static const TYPE_GHS_AIRTELTIGO = 22;
  static const TYPE_GHS_BITSIKA = 23;
  static const TYPE_GHS_MTN = 24;
  static const TYPE_GHS_WISE = 25;
  static const TYPE_GHS_CHIPPER = 26;
  ///越南支付方式
  static const TYPE_VND_BANK = 29;
  static const TYPE_VND_MOMO = 30;
  static const TYPE_VND_ZALO = 31;
  static const TYPE_VND_VIETTEL = 32;
  ///孟加拉
  static const TYPE_BDT_BANK = 33;
  static const TYPE_BDT_BKASH = 34;
  static const TYPE_BDT_NAGAD = 35;
  static const TYPE_BDT_ROKET = 36;
  static const TYPE_BDT_UPI = 37;

  /// 对应列表和订单的类型
  static const TYPE_TRADE_BUY = 1;
  static const TYPE_TRADE_SELL = 2;

  /// 获取法币 快捷交易,信用卡交易接口参数
  static const TYPE_CURRENCIES_FAST = 1;
  static const TYPE_CURRENCIES_CREDIT_CARD = 2;

  /// 快捷交易金额购买还是数量购买
  static const FAST_ADD_ORDER_AMOUNT = 1;
  static const FAST_ADD_ORDER_NUMBER = 2;

  static const DEFAULT_TAB_OPTIONAL = '1';
  static const DEFAULT_TAB_FAST = '2';
}



class BbsConst {
  static const TYPE_CHOICE = 2;
  static const TYPE_NEWEST = 1;
}

class AppRouteConst {
  static const ROUTE_TASK_CENTER = "app/taskcenter";
  /// 初级认证3 高级认证4 数字为任务ID
  static const APP_ME_VERIFICATION = "app/me/verification";
  /// 充值页面7 18
  static const APP_YJCZ = "app/yjcz";
  /// 合约交易页6 12 13
  static const APP_HEYUE = "app/heyue";
  /// 币币交易页5 17 20
  static const APP_TRADE = "app/trade";
  /// ETF交易页19
  static const APP_ETF = "app/etf";
  /// 资产中心-账户总览15
  static const APP_MYASSET_OVERVIEW = "app/myasset/overview";
}
