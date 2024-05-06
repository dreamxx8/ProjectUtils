//图片oss对应大小限制
enum ImageSizeEnum { SMALL, MEDIUM, BIG }

extension ImageSizeEnumExtension on ImageSizeEnum {
  int get index => this.index + 1;

  String get value => [
    "?x-oss-process=image/resize,s_200",
    "?x-oss-process=image/resize,s_300",
    "?x-oss-process=image/resize,s_600",
  ][this.index];
}

enum OtcListTypeEnum { BUY, SELL }

