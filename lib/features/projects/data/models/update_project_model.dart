import 'dart:io';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class UpdateProjectRequest {
  final int? projectId;

  final String? nameAr;
  final String? nameEn;
  final String? projectType;
  final String? status;
  final String? locationAr;

  final DateTime? startDate;
  final DateTime? expectedEndDate;

  final int? constructionDays;
  final String? preferredTime;
  final int? poolCount;
  final String? constructionStatus;
  final double? progressPercentage;
  final int? clientId;
  final String? clientName;
  final String? clientPhone;

  final double? estimatedCost;
  final double? actualCost;

  final int? priority;

  /// 0 مشاريعنا
  /// 1 مشاريع الشركات
  final int? isCompanyProject;

  final String? constructionDaysAr;
  final int? durationWeeks;
  final String? deliveryDays;
  final String? companyPartner;
  final String? descriptionAr;

  /// 1 يظهر بالرئيسية
  /// 0 لا يظهر
  final int? isHomeFeatured;

  /// 1 نشط
  /// 0 موقوف
  final int? isActive;
  final File? image_1;
  final File? image2File;

  /// الصورة الرئيسية
  final File? mainImage;

  /// الصور الإضافية
  final List<File>? additionalImages;

  /// مثل 1,2,5
  final String? technicianIds;

  UpdateProjectRequest({
    this.projectId,
    this.nameAr,
    this.nameEn,
    this.projectType,
    this.status,
    this.locationAr,
    this.startDate,
    this.expectedEndDate,
    this.constructionDays,
    this.preferredTime,
    this.poolCount,
    this.constructionStatus,
    this.progressPercentage,
    this.clientName,
    this.clientPhone,
    this.estimatedCost,
    this.actualCost,
    this.priority,
    this.isCompanyProject,
    this.constructionDaysAr,
    this.durationWeeks,
    this.deliveryDays,
    this.companyPartner,
    this.isHomeFeatured,
    this.isActive,
    this.image2File,
    this.mainImage,
    this.additionalImages,
    this.technicianIds,
    this.descriptionAr,
    this.image_1,
    this.clientId,
  });

  Future<FormData> toFormData() async {
    final formData = FormData();

    void addField(String key, dynamic value) {
      if (value != null) {
        formData.fields.add(MapEntry(key, value.toString()));
      }
    }

    addField("name_ar", nameAr);
    addField("name_en", nameEn);
    addField("project_type", projectType);
    addField("status", status);
    addField("location_ar", locationAr);

    addField(
      "start_date",
      startDate != null ? DateFormat('yyyy-MM-dd').format(startDate!) : null,
    );

    addField(
      "expected_end_date",
      expectedEndDate != null
          ? DateFormat('yyyy-MM-dd').format(expectedEndDate!)
          : null,
    );

    addField("construction_days", constructionDays);
    addField("preferred_time", preferredTime);
    addField("pool_count", poolCount);
    addField("construction_status", constructionStatus);
    addField("progress_percentage", progressPercentage);
    addField("client_id", clientId);
    addField("client_name", clientName);
    addField("client_phone", clientPhone);

    addField("estimated_cost", estimatedCost);
    addField("actual_cost", actualCost);

    addField("priority", priority);

    addField("is_company_project", isCompanyProject);

    addField("construction_days_ar", constructionDaysAr);

    addField("duration_weeks", durationWeeks);

    addField("delivery_days", deliveryDays);

    addField("company_partner", companyPartner);

    addField("is_home_featured", isHomeFeatured);

    addField("is_active", isActive);

    addField("technician_ids", technicianIds);
    addField("description_ar", descriptionAr);

    //-----------------------------------------
    // image_2_file
    //-----------------------------------------

    if (image_1 != null) {
      formData.files.add(
        MapEntry(
          "image_1",
          await MultipartFile.fromFile(
            image2File!.path,
            filename: image2File!.path.split('/').last,
          ),
        ),
      );
    }

    if (image2File != null) {
      formData.files.add(
        MapEntry(
          "image_2_file",
          await MultipartFile.fromFile(
            image2File!.path,
            filename: image2File!.path.split('/').last,
          ),
        ),
      );
    }

    //-----------------------------------------
    // main_image
    //-----------------------------------------

    if (mainImage != null) {
      formData.files.add(
        MapEntry(
          "main_image",
          await MultipartFile.fromFile(
            mainImage!.path,
            filename: mainImage!.path.split('/').last,
          ),
        ),
      );
    }

    //-----------------------------------------
    // additional_images
    //-----------------------------------------

    if (additionalImages != null) {
      for (final image in additionalImages!) {
        formData.files.add(
          MapEntry(
            "additional_images",
            await MultipartFile.fromFile(
              image.path,
              filename: image.path.split('/').last,
            ),
          ),
        );
      }
    }

    return formData;
  }
}
