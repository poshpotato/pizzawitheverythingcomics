import 'dart:html';
import 'NavbarController.dart';

void main(){
  NavbarController.loadNavbar();
  ComicController.setInitialComic();
  if(ComicController.displayFile != null) {
    ComicController.displayComic();
  }
}

class ComicController{
  static String currentPage;
  static String currentSeries;
  static String displayFile;
  static void setInitialComic(){

    if(Uri.base.queryParameters["series"] != null) {
      currentSeries = Uri.base.queryParameters["series"];
      print("Series is: $currentSeries");
    } else {
      print("no series.");
      DivElement content = querySelector("#content");
      onError("Series not found.");
      return;
    }

    if(Uri.base.queryParameters["page"] != null) {
      currentPage = Uri.base.queryParameters["page"];
      print("Page number is: $currentPage");
    } else {
      print("no page number.");
      onError("Page not found.");
    }

    displayFile = currentSeries + "_" + currentPage;
  }

  static void displayComic(){
    DivElement content = querySelector("#content");
    content.append(new ImageElement()
      ..onError.listen((e) => onError("Error displaying comic."))
      ..src = "images/" + displayFile + ".png"
      ..className = "comicPage");
  }

  static void onError(String msg){
    querySelector("#content").append(new ParagraphElement()..text=msg..className="error");
  }
}