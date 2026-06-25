class UpdateProjectProgressParams {
  final int projectId;
  final double progressPercentage;
  final String? newStatus;
  final String? adminNotes;

  UpdateProjectProgressParams({
    required this.projectId,
    required this.progressPercentage,
    this.newStatus,
    this.adminNotes,
  });
}