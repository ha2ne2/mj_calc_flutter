class StringUtils {
  /// see: clojure/re-seq
  static List<String> reSeq(RegExp regex, String s) {
    Iterable<Match> matches = regex.allMatches(s);
    return matches.map((match) => match.group(0)!).toList();
  }
}
