import 'package:api/bloc/products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
 
@override
  void initState() {
 context.read<ProductsBloc>().add(ProductLoadedEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton(
          style: IconButton.styleFrom(
            backgroundColor: Colors.orange,
          ),
          onPressed: () {
            _showAlertDialog(context);
          },
          icon: const Icon(
            Icons.add,
            size: 20,
            color: Colors.black,
          )),
      appBar: AppBar(
        toolbarHeight: 40,
        backgroundColor: Colors.orange,
        title: const Text("Bloc State Management"),
        centerTitle: true,
        elevation: 0.0,
        bottom: AppBar(
          leading: const SizedBox(),
          toolbarHeight: 16,
          elevation: 0.0,
          backgroundColor: Colors.orange,
          actions: const [Text("- API    ")],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoadingState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is ProductsLoadedState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(" Baap Product",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30),),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.productmodel.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Text(state.productmodel[index].id.toString()),
                        title: Text(state.productmodel[index].title.toString()),
                        trailing: Image.network(
                          state.productmodel[index].image.toString(),
                          height: 40,
                          width: 40,
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (state is ProductsErrorState) {
            return const Center(
              child: Text("Error !"),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Future<void> _showAlertDialog(BuildContext context) async {
    TextEditingController textEditingController1 = TextEditingController();
    TextEditingController textEditingController2 = TextEditingController();
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(child: Text('Add Products')),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: textEditingController1,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(2),
                    ],
                    decoration: const InputDecoration(
                      hintText: "Enter Product ID",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: textEditingController2,
                    decoration: const InputDecoration(
                      hintText: "Enter Product Name",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.blueAccent[300],
                          shape: const StadiumBorder(
                              side: BorderSide(color: Colors.grey))),
                      onPressed: () {
                    
                      },
                      child: const Text("Upload Image")),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.blueAccent[300],
                              shape: const StadiumBorder(
                                  side: BorderSide(color: Colors.grey))),
                          onPressed: () {},
                          child: const Text("Submit")),
                      TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.blueAccent[300],
                              shape: const StadiumBorder(
                                  side: BorderSide(color: Colors.grey))),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancel")),
                    ],
                  ),
                )
              ],
            ),
          ),
         
        );
      },
    );
  }


}