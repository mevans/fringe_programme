abstract class LinkifyElement {}

/// Represents an element containing a link
class LinkElement extends LinkifyElement {
  final String url;

  LinkElement(this.url);

  @override
  String toString() {
    return "LinkElement: $url";
  }
}

/// Represents an element containing text
class TextElement extends LinkifyElement {
  final String text;

  TextElement(this.text);

  @override
  String toString() {
    return "TextElement: $text";
  }
}

final _linkifyRegex = RegExp(r"(http(s)?:\/\/.)?(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)",
    caseSensitive: false);

/// Turns [text] into a list of [LinkifyElement]
List<LinkifyElement> linkify(String text) {
  final list = List<LinkifyElement>();

  if (text == null || text.isEmpty) {
    return list;
  }

  final match = _linkifyRegex.firstMatch(text);
  if (match == null) {
    list.add(TextElement(text));
  } else {
    text = text.replaceFirst(_linkifyRegex, "");

    list.addAll(linkify(text));

    list.add(LinkElement(match.group(0)));
  }

  return list;
}