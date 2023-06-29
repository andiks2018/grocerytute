import 'package:flutter/material.dart';
import 'package:grocerytute/components/grocery_item_tile.dart';
import 'package:grocerytute/pages/cart_page.dart';
import 'package:provider/provider.dart';
import 'package:grocerytute/model/cart_model.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton:  FloatingActionButton(onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context){
        return const CartPage();
      })),
        backgroundColor: Colors.black,
      child: Icon(Icons.shopping_bag,color: Colors.white),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 48,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text("Good morning"),
            ),

            const SizedBox(height: 4,),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text("Lets order fresh items for you",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ),

            ///
            ///
            ///
            ///
            const SizedBox(height: 24,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Divider(),
            ),
            const SizedBox(height: 24,),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text("Fresh Items", style: TextStyle(fontSize: 16),),
            ),

            Expanded(
                child: Consumer<CartModel>(builder: (context,value,child){
                  return GridView.builder(
                    itemCount: value.shopeItems.length,
                      padding: EdgeInsets.all(12),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount
                        (crossAxisCount: 2,
                      childAspectRatio: 1/1.3
                      ),
                      itemBuilder: (context, index) {
                        return  GroceryItemTile(
                          itemName: value.shopeItems[index][0],
                          itemPrice: value.shopeItems[index][1],
                          imagePath: value.shopeItems[index][2],
                          color: value.shopeItems[index][3],
                          onPressed: (){
                            Provider.of<CartModel>(context,listen: false).addItemToCart(index);
                          },
                        );
                      });
                })),


          ],
        ),
      ),
    );
  }
}
