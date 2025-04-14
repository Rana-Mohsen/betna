import 'package:betna/core/services/category.api.dart';
import 'package:betna/models/category_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoryApi _api;
  List<CategoryModel> ctgList = [];
  CategoriesCubit(this._api) : super(CategoriesInitial());
  chooseCategory({required String lable}) {
    emit(CategoriesChoosed(lable));
  }

  // allCategory() {
  //   emit(CategoriesAll());
  // }

  Future<void> getCategories() async {
    var ctg = await _api.getCategories();
    ctg.fold(
      (left) {
        emit(CategoriesError(left.errMessage));
      },
      (right) {
        ctgList = right;
        emit(CategoriesSuccess(right));
      },
    );
  }
}
