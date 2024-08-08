extension GenderExtension on int {
  String toGender() {
    switch (this) {
      case 1:
        return 'Men';
      case 2:
        return 'Women';
      default:
        return 'Other'; 
    }
  }
}
