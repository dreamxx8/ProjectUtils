
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_browser/constant/gaps.dart';
import 'package:image_browser/page_color_manager/widget/color_item.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_custom_dialog.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_divider.dart';
import 'package:image_browser/page_custom_widget/widget/other/custom_app_bar.dart';
import 'package:image_browser/page_custom_widget/widget/other/custom_input_field_widget.dart';
import 'package:image_browser/page_custom_widget/widget/other/custom_text_field.dart';
import 'package:image_browser/page_custom_widget/widget/other/custom_toast.dart';
import 'package:image_browser/page_custom_widget/widget/other/sheet_common_page_widget.dart';
import 'package:image_browser/terminal/model/command_model.dart';
import 'package:image_browser/terminal/terminal_page.dart';
import 'package:image_browser/theme/bf_global.dart';
import 'package:image_browser/theme/color_ext.dart';
import 'package:image_browser/utils/sp_utils.dart';

class CommandListPage extends StatefulWidget {
  const CommandListPage({Key? key}) : super(key: key);

  @override
  State<CommandListPage> createState() => _CommandListPageState();
}

class _CommandListPageState extends State<CommandListPage> {
  //备注
  TextEditingController markController = TextEditingController();
  // 路径
  TextEditingController pathController = TextEditingController();
  //命令
  TextEditingController commandController = TextEditingController();
  //参数 用空格分割
  TextEditingController paramsController = TextEditingController();

  FocusNode markFocus = FocusNode();
  FocusNode pathFocus = FocusNode();
  FocusNode commandFocus = FocusNode();
  FocusNode paramsFocus = FocusNode();
  List<CommandModel> _commandList = [];
  @override
  void initState() {
    super.initState();
    List<String>? list = SPUtils.getCommandList();
    _commandList = list != null ? CommandModel.parseFromList(list) : [];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text("终端命令列表"),actions: [
        IconButton(
          icon: Icon(Icons.add, color: bfGlobal.themeColors.textPrimary),
          onPressed: (){
            double width = MediaQuery.of(context).size.width;
            removeController();
            CWCommonCustomDialog(
              width: width - 100,
              title: "添加命令",
              content: getAddWidget(),
              showCancelButton: true,
              cancelButtonMsg: "取消",
              confirmButtonMsg: "确认",
              confirmCallback: (){
                _save();
              },
            ).show(context);
          },
        ),
      ], ),
      body: Container(
        margin: const EdgeInsets.only(top: 30, bottom: 30),
        child: ListView.separated(
            itemCount: _commandList.length,
            itemBuilder: (BuildContext context, int index){
              CommandModel model = _commandList[index];
              return InkWell(
                onTap: (){
                  TerminalToolPage.start(context, model);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        constraints: const BoxConstraints(
                          minWidth: 26
                        ),
                          child: Text("${index+1}", style: bfGlobal.themeColors.textPrimary.f16W700,)),
                      Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${model.mark}", style: bfGlobal.themeColors.textPrimary.f14W700,),
                          Gaps.hGap8,
                          Text("命令：${model.command}     参数：${model.params}", style: bfGlobal.themeColors.textSecondary.f12W400,),
                          Gaps.hGap2,
                          Text("目录：${model.path}", style: bfGlobal.themeColors.textSecondary.f12W400,),

                        ],
                      )),
                      IconButton(
                        icon: Icon(Icons.arrow_circle_up, color: bfGlobal.themeColors.textPrimary),
                        onPressed: (){
                          _upData(model);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: bfGlobal.themeColors.textPrimary),
                        onPressed: (){
                          _deleteData(model);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.edit, color: bfGlobal.themeColors.textPrimary),
                        onPressed: (){
                          _edit(model);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.copy, color: bfGlobal.themeColors.textPrimary),
                        onPressed: (){
                          _copyData(model);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index){
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: CWCommonDivider(lineColor: bfGlobal.themeColors.borderPrimary,),
              );
            }
        ),
      ),
    );
  }


  void _save(){
    if(markController.text.isEmpty || commandController.text.isEmpty || paramsController.text.isEmpty || pathController.text.isEmpty){
      return CustomToast.showError("参数错误");
    }
    CommandModel model = CommandModel(markController.text, pathController.text, commandController.text, paramsController.text);
    _commandList.add(model);
    setState(() {});
    saveLocalData();
  }
  void _edit(CommandModel model){
    setControllerValue(model);
    double width = MediaQuery.of(context).size.width;
    CWCommonCustomDialog(
      width: width - 100,
      title: "修改命令",
      content: getAddWidget(),
      showCancelButton: true,
      cancelButtonMsg: "取消",
      confirmButtonMsg: "确认",
      confirmCallback: (){
        if(markController.text.isEmpty || commandController.text.isEmpty || paramsController.text.isEmpty || pathController.text.isEmpty){
          return CustomToast.showError("参数错误");
        }
        setState(() {
          model.mark = markController.text;
          model.command = commandController.text;
          model.params = paramsController.text;
          model.path = pathController.text;
        });
        saveLocalData();
      },
    ).show(context);
  }

  _deleteData(CommandModel model){
    CWCommonCustomDialog(
      title: "提示",
      msg: "确定是否删除",
      showCancelButton: true,
      cancelButtonMsg: "取消",
      confirmButtonMsg: "确认",
      confirmCallback: (){
        setState(() {
          _commandList.remove(model);
        });
        saveLocalData();
      },
    ).show(context);
  }


  _upData(CommandModel model){
    setState(() {
      _commandList.remove(model);
      _commandList.insert(0, model);
      saveLocalData();
    });


  }

  _copyData(CommandModel model){
    String mark = model.mark;
    int lastSpaceIndex = mark.lastIndexOf(' ');
    List parts = [];
    if (lastSpaceIndex != -1) {
      parts.add(mark.substring(0, lastSpaceIndex));
      parts.add(mark.substring(lastSpaceIndex + 1));
    } else {
// 没有空格的情况处理
      parts.add(mark);
    }
    if(parts.length > 1){
      String lastTag = parts.last;
      int? tag = int.tryParse(lastTag);
      if(tag != null){
        mark = parts.first;
        mark = "$mark ${tag + 1}";
      }else{
        mark = "$mark 2";
      }
    }else{
      mark = "$mark 2";
    }

    CommandModel copy = CommandModel(mark, model.path, model.command, model.params);
    int index = _commandList.indexOf(model);

    setState(() {
      _commandList.insert(index+1, copy);
      saveLocalData();
    });
  }




  void removeController(){
    markController.text = "";
    commandController.text = "";
    paramsController.text = "";
    pathController.text = "";

  }


  void setControllerValue(CommandModel model){
    markController.text = model.mark;
    commandController.text = model.command;
    pathController.text = model.path;
    paramsController.text = model.params;
  }
  void saveLocalData(){
    SPUtils.saveCommandList(CommandModel.parseModelList(_commandList));
  }

  Widget getAddWidget(){
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: Column(
          children: [
            CustomInputFieldWidget(markController, "备注", "请输入备注名称",
                focusNode: markFocus),
            CustomInputFieldWidget(pathController, "工作目录", "请输入工作目录",
                focusNode: paramsFocus, iconType: IconType.other,  suffix: TextButton(onPressed: (){
                _selectDocument((String? path){
                  if(path != null){
                    pathController.text = path;
                  }
                });
              }, child: Text("选择目录", style: bfGlobal.themeColors.textBrand.f16W500,)),),
            CustomInputFieldWidget(commandController, "命令", "命令路径例如/usr/bin/python3",
                focusNode: commandFocus, iconType: IconType.other,  suffix: TextButton(onPressed: (){
                _selectCommand((param){
                  commandController.text = param;
                });
              }, child: Text("选择命令", style: bfGlobal.themeColors.textBrand.f16W500,)),),
            CustomInputFieldWidget(paramsController, "参数", "请输入参数",
                focusNode: pathFocus, iconType: IconType.other,  suffix: TextButton(onPressed: (){
                _selectParams((param){
                  paramsController.text = param;
                });
              }, child: Text("选择参数", style: bfGlobal.themeColors.textBrand.f16W500,)),),
          ],
      ),
    );


  }


  _selectDocument(ValueChanged<String?> callback) async {
    // 选择文件夹
    String? folderPath =
        await FilePicker.platform.getDirectoryPath();
    callback(folderPath);
  }



  _selectCommand(ValueChanged<String> callbackParam){
    List<String> values = ["/usr/bin/python3", "/usr/local/bin/pod", "/usr/bin/pip3"];
    double width = MediaQuery.of(context).size.width;
    CWCommonCustomDialog(
      width: width - 100,
      title: "选择命令",
      content: SheetCommonPageWidget(
        selectIndex: (index){
          callbackParam(values[index]);
        },
        //title: "选择命令",
        values: values,
      ),
      showCancelButton: true,
      cancelButtonMsg: "取消",
      confirmButtonMsg: "确认",
      confirmCallback: (){
        _save();
      },
    ).show(context);
  }

  _selectParams(ValueChanged<String> callbackParam){
    List<String> explain = ["iOS pod", "Flutter检查代码中未国际化脚本", "Native android(xml)转ios多语言", "Flutter检测代码中翻译是否缺少不生成镜像", "Flutter发版前检测", "iOS发版"];

    List<String> params = ["install", "./check_not_translate.py", "./android转ios.py", "./language_check.py 0 0", "./language_check.py 1 1", "发版前检脚本.py"];

    List<String> values = [];
    for(int i = 0; i< params.length; i++){
      String param = params[i];
      String title = explain[i];
      values.add("$title - $param");
    }
    double width = MediaQuery.of(context).size.width;
    CWCommonCustomDialog(
      width: width - 100,
      title: "选择命令",
      content: SheetCommonPageWidget(
        selectIndex: (index){
          callbackParam(params[index]);
        },
       // title: "选择命令",
        values: values,
      ),
      showCancelButton: true,
      cancelButtonMsg: "取消",
      confirmButtonMsg: "确认",
      confirmCallback: (){
        _save();
      },
    ).show(context);
  }



}

