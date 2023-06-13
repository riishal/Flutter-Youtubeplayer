class Documents {
  final String title;
  final String url;
  final int num;

  Documents({required this.title, required this.url, required this.num});
}

List<Documents> pdf = [
  Documents(
      title: 'Flutter Totorialspoint Simply Easy Learning',
      url: 'https://www.tutorialspoint.com/flutter/flutter_tutorial.pdf',
      num: 185),
  Documents(
      title: 'C Programming Tutorial',
      url: 'https://www.unf.edu/~wkloster/2220/ppts/cprogramming_tutorial.pdf',
      num: 146),
  Documents(
      title: 'Execute Python Programs',
      url: 'https://www.tutorialspoint.com/python3/python3_tutorial.pdf',
      num: 26),
  Documents(
      title: 'Java online documentation',
      url:
          'https://faculty.ksu.edu.sa/sites/default/files/Chap%201.5%20-%20Java%20Documentation.pdf',
      num: 19),
  Documents(
      title: 'php_tutorial.pdf',
      url: 'https://www.tutorialspoint.com/php/php_tutorial.pdf',
      num: 42),
  Documents(
      title: 'javascript_tutorial.pdf',
      url: 'https://www.tutorialspoint.com/javascript/javascript_tutorial.pdf',
      num: 50)
];
