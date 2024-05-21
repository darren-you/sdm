abstract class BaseItemDTO {
  bool _selectState = false;
  dynamic originDTO;

  String text();

  bool isSelect() => _selectState;

  void cancelSelect() => _selectState = false;

  bool setSelectState(bool selectState) => _selectState = selectState;
}
