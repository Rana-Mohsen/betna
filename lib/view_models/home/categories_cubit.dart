import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());
  chooseCategory({required String lable}) {
    emit(CategoriesChoosed(lable));
  }
  allCategory() {
    emit(CategoriesAll());
  }
  
}
