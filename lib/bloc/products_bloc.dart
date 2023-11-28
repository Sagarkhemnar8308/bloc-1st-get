import 'package:api/Models/datamodel.dart';
import 'package:api/repo/products_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductLoadedEvent, ProductsState> {
  final ProductRepo productRepo;
  ProductsBloc(this.productRepo) : super(ProductsLoadingState()) {
    on<ProductLoadedEvent>((event, emit) async {
      try {
        emit(ProductsLoadingState());

        //get api
        var data = await productRepo.getProducts();
        emit(ProductsLoadedState(productmodel: data));
      } catch (e) {
        emit(ProductsErrorState(e.toString()));
      }
    });
  }
}
