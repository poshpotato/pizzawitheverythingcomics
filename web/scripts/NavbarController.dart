import 'dart:html';

main(){
  NavbarController.loadNavbar();
}

class NavbarController {
  static loadNavbar(){
    print("Acessing navbar...");
    HttpRequest.getString("navbar.txt").then(onNavbarLoaded);
  }

  static onNavbarLoaded(String navbarHTML){
    print("Loading navbar...");
    querySelector("#navbar").appendHtml(navbarHTML);
    print("Navbar loaded.");
  }
}