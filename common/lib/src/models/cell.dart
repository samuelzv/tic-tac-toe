import './cell_value.dart';

class Cell {
  CellValue _value;

  Cell(this._value);

  void setValue(CellValue newValue) {
    _value = newValue;
  }

  CellValue getValue() {
    return _value;
  }
}