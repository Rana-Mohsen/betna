part of 'categories_cubit.dart';

@immutable
abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class CategoriesChoosed extends CategoriesState {
  final String lable;

  CategoriesChoosed(this.lable);
}

class CategoriesAll extends CategoriesState {}

class CategoriesSuccess extends CategoriesState {
  final List<CategoryModel> ctg;

  CategoriesSuccess(this.ctg);
}

class CategoriesError extends CategoriesState {
  final String errMessage;

  CategoriesError(this.errMessage);
}
