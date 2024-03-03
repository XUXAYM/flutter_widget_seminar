import 'dart:ui';

sealed class Constants {
  /// Цвет подзаголовка list item
  static const subtitleColor = Color(0xFF8E8E93);

  /// Размер картинки
  static const double imageSize = 68;

  /// Закругления краёв картинки
  static const double imageBorderRadiusValue = 4;

  /// Отступ между изображением и блоком с текстом
  static const double imageAndTextSpace = 16;

  /// Отступ list item слева
  static const double startListItemPadding = 20;

  /// Отступ list item справа
  static const double endListItemPadding = 14;

  /// Отступ разделителя слева
  static const double indent =
      startListItemPadding + imageSize + imageAndTextSpace;

  /// Отступ разделителя справа
  static const double endIndent = endListItemPadding;
}
