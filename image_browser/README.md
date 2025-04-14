# image_browser

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## 打包
flutter build macos --release   
目录/image_browser/build/macos/Build/Products/Release/image_browser.app

## 图片
通过select file 按钮 选择工程中图片目录，例如flutter工程选择module_core/images文件夹 或者ios的Assets文件夹

## 颜色 
只适配coinwflutter 工程，选择最新UI设计分支，选择目录module_core/ 文件夹，自动加载亮色和暗色模式的色值

## 网络
复制加密字符，进行解密

## 终端
添加命令 可设置备注名称， 工作目录 命令 例如 /usr/bin/python3 或 /usr/local/bin/pod
参数 用空格分割 python3 可执行脚本多语言检测脚本等功能



针对Xcode编译过程中出现的Command PhaseScriptExecution failed错误，结合错误信息bad interpreter: Operation not permitted，以下是具体原因和解决方案：
原因分析
文件被系统安全机制隔离
Mac系统的Gatekeeper会对从网络下载或第三方来源的文件添加com.apple.quarantine属性，导致脚本无法执行
。
脚本权限不足
Pods生成的脚本（如Pods-Runner-frameworks.sh）可能因权限不足或路径问题无法运行
。
符号链接解析问题
某些脚本中使用的readlink命令缺少参数，导致动态库路径解析失败
。
缓存或环境异常
Xcode的DerivedData缓存或Pod依赖文件损坏可能导致脚本执行失败
。
解决方案
1. 移除文件的隔离属性
   在终端中进入项目根目录（如/Users/linzechi/Downloads/imagebrowser/image_browser/macos），执行以下命令：
   bashxattr -d -r com.apple.quarantine .
   此命令会递归移除所有文件的隔离属性，解决因Gatekeeper限制导致的权限问题
   4
   6
   。

2. 修复脚本权限
   确保Pods生成的脚本具有可执行权限：
   bashchmod +x Pods/Target\ Support\ Files/Pods-Runner/Pods-Runner-frameworks.sh
   若问题持续，尝试全局权限修复：
   bashsudo chmod -R 777 Pods/