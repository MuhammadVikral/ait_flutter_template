import 'package:common_dependency/common_dependency.dart' hide Option;
import 'package:widgetbook/widgetbook.dart';

List<Option<DesignButtonType>> get buttonTypeOption {
  List<Option<DesignButtonType>> options = const [
    Option(label: 'filled', value: DesignButtonType.filled),
    Option(label: 'outlined', value: DesignButtonType.outlined),
    Option(label: 'text', value: DesignButtonType.text),
  ];

  return options;
}
