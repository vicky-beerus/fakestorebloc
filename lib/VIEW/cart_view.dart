import 'package:fakestorebloc/BLOC/CART_BLOC/cart_bloc.dart';
import 'package:fakestorebloc/REPOSITRY/product_repositry.dart';
import 'package:fakestorebloc/VIEW/hompage_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => CartBloc(
          productReposiry: RepositoryProvider.of<ProductReposiry>(context))
        ..add(CartStartedEvent()),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            icon: Icon(Icons.arrow_back),
          ),
          title: Text("My Cart"),
        ),
        body: Container(
          height: h,
          width: w,
          child: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
            if (state is CartLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CartLoadedState) {
              return ListView.builder(
                  itemCount: state.items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.all(20),
                      height: h * 0.2,
                      width: w,
                      color: Colors.red,
                      child: Text("${state.items}"),
                    );
                  });
            }
            return Text("something went wrong in cartpage");
          }),
        ),
      ),
    );
  }
}
