import 'package:fakestorebloc/BLOC/PRODUCT_BLOC/product_bloc.dart';
import 'package:fakestorebloc/REPOSITRY/product_repositry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (BuildContext context) =>
          ProductBloc(RepositoryProvider.of<ProductReposiry>(context))
            ..add(LoadProductEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Fake Store"),
          backgroundColor: Colors.pink,
        ),
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ProductLoadedState) {
              return Container(
                height: h,
                width: w,
                child: GridView.builder(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10),
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: h * 0.15,
                        width: w * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.network("${state.product.productImage}"),
                      );
                    }),
              );
            }
            if (state is ProductErrorState) {
              return Center(
                child: Text(" vvv ${state.error}"),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}