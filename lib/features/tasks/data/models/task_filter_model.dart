class TaskFilterModel {
  final List<String> statuses;
  final List<String> serviceTypes;
  final List<String> locations;

  const TaskFilterModel({
    this.statuses = const [],
    this.serviceTypes = const [],
    this.locations = const [],
  });
}