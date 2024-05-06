// 引入 eventBus 包文件

// 创建EventBus
import 'package:event_bus/event_bus.dart';

EventBus eventBus = new EventBus();

/// event 监听
class EventFn {
  // 想要接收的数据时什么类型的，就定义相同类型的变量
  int index;

  EventFn(this.index);
}
/// 坚挺image刷新
class EventReselectImageUrl {}
