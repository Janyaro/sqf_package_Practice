class MathOperation {
  double getTotalPrice(int weight, int price) {
    while (weight / 40 == 0) {
      weight--;
    }
    double totalTon = weight / 40;
    return totalTon * price;
  }
}
