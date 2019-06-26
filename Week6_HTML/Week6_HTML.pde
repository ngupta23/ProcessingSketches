String url = "https://www.imdb.com/title/tt0058331/";
String[] lines = loadStrings(url);

for (int i=0; i < lines.length; i++){
  print(lines[i]);
}
