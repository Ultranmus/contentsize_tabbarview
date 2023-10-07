# ContentSizeTabBarView

A Flutter package that combines the functionalities of `autoscale_tabbarview` and `expandable_page_view` to provide a `ContentSizeTabBarView` widget. This widget allows you to create a tab bar view where each tab's height automatically adjusts to fit its content. 
- It uses `autoscale_tabbarview` to ensure smooth tab switching animation with the `TabController` and `expandable_page_view` to resize the tab bar view's content.
- This package aims to address a specific use case where `autoscale_tabbarview` on release mode may not resize its content properly, especially when there is a `GridView` or similar widget inside it and the AutoScaleTabBarView itself is inside SingleChildScrollView/CustomScrollView.
- It has been created to provide a solution to this issue while leveraging the strengths of the aforementioned packages. 

## Problem in autoscale_tabbarview package

I have created the problem where autoscale_tabbarview fails, it is inside the example folder in this package repository. Just try to replace ContentSizeTabBarView with AutoScaleTabBarView in debug mode you will not see any problem but when you build apk and use that apk the problem will be visible. If you are not able to recreate the same problem create a issue and i'll help as much as i can.

- Below image shows how autoscale_tabbarview behave when it is inside a CustomScrollView and it contains gridview on release.apk.

<img src ="https://firebasestorage.googleapis.com/v0/b/github-895c7.appspot.com/o/Pettera%2FScreenshot_2023-10-05-17-42-16-474_com.example.pettera_project.jpg?alt=media&token=a11e385f-350e-4466-9333-bf8ffa63dc51&_gl=1*1vs7987*_ga*MjA3OTcyNTA1Ni4xNjkzNzQxMzYy*_ga_CW55HF8NVT*MTY5NjY4MDMwNy4yNC4xLjE2OTY2ODAzNDcuMjAuMC4w" height="500px">

## Credits

- The `ContentSizeTabBarView` widget is inspired by and incorporates components from the following packages:
    - [autoscale_tabbarview](https://pub.dev/packages/autoscale_tabbarview): For smooth tab switching animation and `TabController` integration.
    - [expandable_page_view](https://pub.dev/packages/expandable_page_view): For dynamically resizing tab bar content based on its contents.

All credits go to the authors and contributors of these packages for their valuable contributions to the Flutter community. 

## Installation

To use this package, follow these steps:

1. Add the latest version of the package to your `pubspec.yaml` file and run `dart pub get`:

```
   dependencies:
     content_size_tabbarview: ^0.0.1
 ```   


2. Import the package in your Dart code and use it in your Flutter app:
```
   import 'package:content_size_tabbarview/content_size_tabbarview.dart';
```

## Usage
- Most of the things in this package is similar to autoscale_tabbarview package
  
Here's an example of how to use the ContentSizeTabBarView widget in your Flutter application:
```
import 'package:flutter/material.dart';
import 'package:content_size_tabbarview/content_size_tabbarview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ContentSizeTabBarView Example'),
        ),
        body: DefaultTabController(
                child: ContentSizeTabBarView(
                  children: [
                    Center(child: Text('Tab 1 Content')),
                    Center(child: Text('Tab 2 Content')),
                  ],
                ),
        ),
      ),
    );
  }
}
```   
