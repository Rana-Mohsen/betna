part of 'categories_cubit.dart';

@immutable
abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class CategoriesChoosed extends CategoriesState {
  final String lable;

  CategoriesChoosed(this.lable);
}
