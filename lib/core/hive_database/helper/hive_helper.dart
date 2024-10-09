import 'package:hive_flutter/hive_flutter.dart';
import 'package:the_quran/core/hive_database/hive_reading_model.dart';

class HiveHelper {
  final box = Hive.box<HiveReadingModel>('readingBox');

  // حفظ القائمة بأكملها
  Future<void> saveReadingModels(List<HiveReadingModel> models) async {
    await box.clear(); // تنظيف الصندوق إذا كنت تخزن قائمة جديدة
    for (var model in models) {
      await box.add(model); // إضافة كل نموذج إلى الصندوق
    }
  }

  // تحميل القائمة
  List<HiveReadingModel> loadReadingModels() {
    return box.values.toList(); // تحويل القيم إلى قائمة
  }

  // إضافة نموذج جديد إلى القائمة
  Future<void> addReadingModel(HiveReadingModel model) async {
    await box.add(model);
  }
}
