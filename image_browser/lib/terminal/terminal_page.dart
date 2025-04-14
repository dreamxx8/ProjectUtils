import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_browser/terminal/model/command_model.dart';
import 'package:image_browser/theme/bf_global.dart';
import 'package:image_browser/utils/common_border.dart';
import 'package:process_run/cmd_run.dart';
import 'package:process_run/process_run.dart';

class TerminalToolPage extends StatefulWidget {
  static const String routeName = "TerminalToolPage";
  CommandModel model;
  static void start(BuildContext context, CommandModel model) {
    Navigator.pushNamed(context, TerminalToolPage.routeName, arguments: model);
  }

  TerminalToolPage(this.model);

  @override
  _TerminalToolPageState createState() => _TerminalToolPageState();
}

class _TerminalToolPageState extends State<TerminalToolPage> {
  final TextEditingController _directoryController = TextEditingController();
  final TextEditingController _loginController = TextEditingController();

  final ScrollController _logScrollController = ScrollController();
  final List<String> _logs = [];
  bool _isExecuting = false;
  String _commandText = "";
  @override
  void initState() {
    super.initState();
    _directoryController.text = widget.model.path;
    _commandText = "${widget.model.command} ${widget.model.params}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Terminal 工具')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 目录输入
            TextField(
              controller: _directoryController,
              decoration: const InputDecoration(
                labelText: '输入项目目录（如：/Users/name/FlutterProjects/my_app）',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            // 执行按钮
            ElevatedButton(
              onPressed: _executePodInstall,
              child: Text(_isExecuting ? '$_commandText 执行中...' : '$_commandText 执行'),
            ),
            const SizedBox(height: 16),
            // 日志展示
            Expanded(
                child: Container(
                  //height: MediaQuery.of(context).size.height * 0.3, // 30%屏幕高度
                  decoration: RegularBorder(colorBorder: bfGlobal.themeColors.borderPrimary, backgroundColor: Colors.transparent),
                  child: TextField(
                    maxLines: null,
                    readOnly: true,
                    controller: _loginController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  /// 执行 pod install
  void _executePodInstall() async {
    if (_isExecuting) return;

    final directory = _directoryController.text.trim();
    if (directory.isEmpty) {
      _addLog('⚠️ 请输入有效目录');
      return;
    }

    setState(() {
      _isExecuting = true;
      _logs.clear();
    });

    try {
      _addLog('📁 切换到目录: $directory');
      List<String> params = widget.model.params.split(RegExp(r' +'));
      await TerminalService.runPodInstall(directory, widget.model.command, params, logCallback: (log){
        if(!_isError(log)){
          _addLog(log);
        }else{
          _addLog('❌ 发生错误: $log');
        }
      });

      _addLog('🎉 执行完成！');
    } catch (e) {
      _addLog('❌ 发生错误: $e');
    } finally {
      setState(() {
        _isExecuting = false;
      });
    }
  }

  bool _isError(String text) {
    return text.contains('error') || text.contains('fail');
  }

  /// 添加日志到界面
  void _addLog(String message) {
    setState(() {
      _logs.add('${DateTime.now().toString().split('.')[0]}: $message');
      _loginController.text += "\n$message";
      //_logScrollController
      //    .jumpTo(_logScrollController.position.maxScrollExtent);
    });
  }
}

class TerminalService {
  //Stream<List<int>>? stream = Stre;
  /// 在指定目录执行 pod install

  static Future<void> runPodInstall(String targetDir, String command, List<String> params, {ValueChanged<String>? logCallback}) async {
    try {
      // 检查目录是否存在
      final dir = Directory(targetDir);
      if (!dir.existsSync()) {
        throw Exception('目录不存在: $targetDir');
      }

// 创建 StreamController（泛型指定数据类型为 List<int>）
      final controller = StreamController<List<int>>();

// 获取 StreamSink（写入端）
      StreamSink<List<int>>? stdout = controller.sink;
      // 获取 Stream（读取端）
      Stream<List<int>> stream = controller.stream;
// 监听 Stream（数据到达时会触发）
      stream.listen((data) {
        String result = utf8.decode(data);
        print('Received data: ${result}');
        logCallback?.call(result);
      });


      // 执行命令：切换目录并运行 pod install
      final result = await run(
          //'/usr/local/bin/pod',
          //'/usr/bin/python3',
          command,
          //['./language_check.py', '0', '0'],
          params,
          workingDirectory: targetDir, // 设置工作目录
          runInShell: true, // 在 shell 中执行
          verbose: true, // 显示详细输出
          stdout: stdout);

      // 打印结果
      if (result.exitCode == 0) {
        logCallback?.call("✅ 执行成功");
        print('✅  成功！');
      } else {
        logCallback?.call("❌执行失败 : ${result.stderr}");
        print('❌失败: ${result.stderr}');
      }
    } catch (e) {
      logCallback?.call('⚠️ 错误: $e');
      print('⚠️ 错误: $e');
      rethrow;
    }
  }
}

/// 日志条目样式
class _LogItem extends StatelessWidget {
  final String text;

  const _LogItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      child: Text(
        text,
        style: TextStyle(
          color: _isError(text) ? Colors.red : Colors.grey[800],
        ),
      ),
    );
  }

  bool _isError(String text) {
    return text.contains('error') || text.contains('fail');
  }
}
