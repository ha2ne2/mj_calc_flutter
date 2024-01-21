class ListUtils {
  static List<T> removeFirstAndLast<T>(List<T> list) {
    if (list.length > 2) {
      return list.sublist(1, list.length - 1);
    } else {
      return [];
    }
  }
}
