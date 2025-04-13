
class CommandModel{
  String mark;
  String path;
  String command;
  String params;
  CommandModel(this.mark, this.path, this.command, this.params);

  @override
  String toString() {
    return "$mark-:-$path-:-$command-:-$params";
  }

  static CommandModel? parseFromString(String data){

    List<String> listData = data.split("-:-");
    if(listData.length == 4){
      return CommandModel(listData[0],listData[1], listData[2], listData[3]);
    }
    return null;
  }


  static List<CommandModel> parseFromList(List<String> listData){
     List<CommandModel> list = [];
     for (String element in listData) {
       CommandModel? model = CommandModel.parseFromString(element);
       if(model != null){
         list.add(model);
       }
     }
     return list;
  }

  static List<String> parseModelList(List<CommandModel> listData){
    List<String> list = [];
    for (CommandModel element in listData) {
      list.add(element.toString());
    }
    return list;
  }


}