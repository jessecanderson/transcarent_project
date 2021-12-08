import 'package:gallery_saver/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:transcarent_project/models/search_model.dart';

class SaveController extends GetxController {
  var isSaving = false.obs;

  savePhoto(ImagesResult result) {
    isSaving(true);
    update();
    GallerySaver.saveImage(result.original).then(
      (value) {
        isSaving(false);
        update();
        Get.snackbar('Image Saved', 'Your image has been saved.');
      },
    );
  }
}
