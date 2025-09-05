class AppDimensions {
  static bool isDesktop(double width){
    return width >= 900;
  } 
  
  static bool isTablet(double width){
    return width >= 600 && width < 900;
  } 

  static bool isMobile(double width){
    return width < 600;
  } 
}
