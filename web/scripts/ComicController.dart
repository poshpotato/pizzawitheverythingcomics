import 'dart:html';
import 'NavbarController.dart';

void main(){
  ComicController.selectComic();
  NavbarController.loadNavbar();
}

class ComicController{
  static int pageNumber;
  static void selectComic(){
    if(Uri.base.queryParameters["page"] != null) {
      pageNumber = int.parse(Uri.base.queryParameters["page"]);
      print("Page number is: $pageNumber");
      DivElement content = querySelector("#content");
      content.append(new ImageElement()
        ..src = "images/hope_$pageNumber.png"
        ..className = "comicPage");
    } else {
      print("no page number.");
      DivElement content = querySelector("#content");
      content.append(new ParagraphElement()..text="Sorry! We couldn't find that page. :("..className="error");
    }
  }
}