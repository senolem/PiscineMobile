enum AppTab {
  currently(tabName: 'Currently'),
  today(tabName: 'Today'),
  weekly(tabName: 'Weekly');

  const AppTab({
    required this.tabName
  });

  final String tabName;
}
