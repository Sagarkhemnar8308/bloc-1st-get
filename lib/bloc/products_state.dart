part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object?> get props => [];
}

class ProductsInitial extends ProductsState {}


//loading state
class ProductsLoadingState extends ProductsState {}

//loaded state 
class ProductsLoadedState extends ProductsState {
  final List<DataModel> productmodel;
  const ProductsLoadedState({required this.productmodel});
  @override
  List<Object?> get props => [productmodel];
}

//error state 
class ProductsErrorState extends ProductsState {
  final String errorMessage;
  const ProductsErrorState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
