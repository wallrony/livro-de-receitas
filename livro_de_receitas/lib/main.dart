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
      debugShowCheckedModeBanner: false,
      title: 'Livro de Receitas',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider(
        create: (context) => RecipeProvider(),
        builder: (context, child) => SafeArea(
          child: HomePage(),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final pages = [
    Map<String, dynamic>.from({
      "title": "Home",
      "icon": Icons.home,
    }),
    Map<String, dynamic>.from({
      "title": "Adicionar",
      "icon": Icons.add,
    }),
  ];

  @override
  void initState() {
    super.initState();

    setSystemColors();
  }

  setSystemColors() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.amber,
      statusBarIconBrightness: Brightness.light,
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
          padding: EdgeInsets.only(bottom: 30),
          color: Colors.grey[100],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              makeHeader(),
              Consumer<RecipeProvider>(
                builder: (context, provider, child) {
                  if (!provider.running && provider.recipes == null) {
                    provider.fetchRecipes();
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
                      ),
                    );
                  }

                  if (provider.running) {
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
                      ),
                    );
                  } else if (!provider.running && provider.error.isNotEmpty) {
                    return Center(
                      child: CustomText(
                        text: provider.error,
                        fontSize: 16,
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

                  return Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      children: provider.recipes
                          .map((recipe) => RecipeItem(recipe: recipe))
                          .toList(),
                    ),
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

  makeHeader() {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(42),
          bottomRight: Radius.circular(42),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 30),
          CustomText(
            text: 'Livro de Receitas',
            fontSize: 24,
            isBold: true,
            color: Colors.white,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 70),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var i = 0; i < pages.length; i++)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        child: GestureDetector(
                          onTap: () => setState(() => _selectedIndex = i),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                pages[i]['icon'],
                                color: _selectedIndex == i
                                    ? Colors.black
                                    : Colors.white70,
                              ),
                              SizedBox(width: 3),
                              CustomText(
                                text: pages[i]['title'],
                                isBold: _selectedIndex == i ? true : false,
                                color: _selectedIndex == i
                                    ? Colors.black
                                    : Colors.white70,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                        width: _selectedIndex == i ? 75 : 0,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(128),
                            bottomRight: Radius.circular(128),
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
