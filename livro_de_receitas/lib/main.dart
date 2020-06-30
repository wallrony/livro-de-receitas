import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:livrodereceitas/components/custom_text.dart';
import 'package:livrodereceitas/components/recipe_item.dart';
import 'package:provider/provider.dart';
import 'package:livrodereceitas/providers/recipe_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Livro de Receitas',
      theme: ThemeData(
        primarySwatch: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider(
        create: (context) => RecipeProvider(),
        builder: (context, child) => HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    setSystemColors();
  }

  setSystemColors() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.grey[100],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.maxFinite,
                child: CustomText(
                  text: 'Livro de Receitas',
                  fontSize: 24,
                  isBold: true,
                  color: Colors.black,
                  textAlign: TextAlign.center,
                ),
              ),
              Consumer<RecipeProvider>(
                builder: (context, provider, child) {
                  if (provider.running) {
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
                      ),
                    );
                  } else if (!provider.running && provider.recipes.isEmpty) {
                    return Container(
                      child: CustomText(
                        text: 'Não há nenhuma receita cadastrada.',
                        fontSize: 16,
                      ),
                    );
                  }

                  return GridView.count(
                    crossAxisCount: 2,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    children: provider.recipes.map(
                      (recipe) => RecipeItem(recipe: recipe),
                    ).toList(),
                  );
                },
              ),
              // IMPLEMENT CONSUMER THAT RESULTS IN GRIDVIEW
              // IMPLEMENT FLOATING BOTTOM NAVIGATOR (LIST & ADD)
            ],
          ),
        ),
      ),
    );
  }
}
