class TechnicianTodayRoutesResModel {
  final bool? success;
  final String? message;
  final TechnicianTodayRoutesData? data;

  TechnicianTodayRoutesResModel({
    this.success,
    this.message,
    this.data,
  });

  factory TechnicianTodayRoutesResModel.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      if (json is Map) {
        json = Map<String, dynamic>.from(json);
      } else {
        return TechnicianTodayRoutesResModel();
      }
    }
    return TechnicianTodayRoutesResModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] != null
          ? TechnicianTodayRoutesData.fromJson(json['data'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (success != null) map['success'] = success;
    if (message != null) map['message'] = message;
    if (data != null) map['data'] = data!.toJson();
    return map;
  }
}

class TechnicianTodayRoutesData {
  final String? configVersion;
  final String? cachedAt;
  final List<String>? serviceDays;
  final List<RouteModel>? routes;
  final List<VisitModel>? visits;
  final List<CustomerModel>? customers;
  final List<PreviousVisitModel>? previousVisits;
  final List<ChecklistModel>? checklists;
  final List<CatalogItemModel>? catalogItems;
  final ReadingConfigModel? readingConfig;
  final DosageRulesModel? dosageRules;
  final BrandingModel? branding;
  final PermissionsModel? permissions;

  TechnicianTodayRoutesData({
    this.configVersion,
    this.cachedAt,
    this.serviceDays,
    this.routes,
    this.visits,
    this.customers,
    this.previousVisits,
    this.checklists,
    this.catalogItems,
    this.readingConfig,
    this.dosageRules,
    this.branding,
    this.permissions,
  });

  factory TechnicianTodayRoutesData.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      if (json is Map) {
        json = Map<String, dynamic>.from(json);
      } else {
        return TechnicianTodayRoutesData();
      }
    }

    return TechnicianTodayRoutesData(
      configVersion: json['config_version'] as String?,
      cachedAt: json['cached_at'] as String?,
      serviceDays: (json['service_days'] as List?)
          ?.map((e) => e.toString())
          .toList(),
      routes: (json['routes'] as List?)
          ?.map((e) => RouteModel.fromJson(e))
          .toList(),
      visits: (json['visits'] as List?)
          ?.map((e) => VisitModel.fromJson(e))
          .toList(),
      customers: (json['customers'] as List?)
          ?.map((e) => CustomerModel.fromJson(e))
          .toList(),
      previousVisits: (json['previous_visits'] as List?)
          ?.map((e) => PreviousVisitModel.fromJson(e))
          .toList(),
      checklists: (json['checklists'] as List?)
          ?.map((e) => ChecklistModel.fromJson(e))
          .toList(),
      catalogItems: (json['catalog_items'] as List?)
          ?.map((e) => CatalogItemModel.fromJson(e))
          .toList(),
      readingConfig: json['reading_config'] != null
          ? ReadingConfigModel.fromJson(json['reading_config'])
          : null,
      dosageRules: json['dosage_rules'] != null
          ? DosageRulesModel.fromJson(json['dosage_rules'])
          : null,
      branding: json['branding'] != null
          ? BrandingModel.fromJson(json['branding'])
          : null,
      permissions: json['permissions'] != null
          ? PermissionsModel.fromJson(json['permissions'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (configVersion != null) map['config_version'] = configVersion;
    if (cachedAt != null) map['cached_at'] = cachedAt;
    if (serviceDays != null) map['service_days'] = serviceDays;
    if (routes != null) map['routes'] = routes!.map((v) => v.toJson()).toList();
    if (visits != null) map['visits'] = visits!.map((v) => v.toJson()).toList();
    if (customers != null) {
      map['customers'] = customers!.map((v) => v.toJson()).toList();
    }
    if (previousVisits != null) {
      map['previous_visits'] =
          previousVisits!.map((v) => v.toJson()).toList();
    }
    if (checklists != null) {
      map['checklists'] = checklists!.map((v) => v.toJson()).toList();
    }
    if (catalogItems != null) {
      map['catalog_items'] = catalogItems!.map((v) => v.toJson()).toList();
    }
    if (readingConfig != null) {
      map['reading_config'] = readingConfig!.toJson();
    }
    if (dosageRules != null) map['dosage_rules'] = dosageRules!.toJson();
    if (branding != null) map['branding'] = branding!.toJson();
    if (permissions != null) map['permissions'] = permissions!.toJson();
    return map;
  }
}

class RouteModel {
  final String? id;
  final String? date;
  final String? status;
  final int? publishVersion;
  final List<RouteStopModel>? stops;
  final bool? isToday;
  final String? nextStopId;
  final RouteSummaryModel? summary;

  RouteModel({
    this.id,
    this.date,
    this.status,
    this.publishVersion,
    this.stops,
    this.isToday,
    this.nextStopId,
    this.summary,
  });

  factory RouteModel.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      if (json is Map) {
        json = Map<String, dynamic>.from(json);
      } else {
        return RouteModel();
      }
    }

    return RouteModel(
      id: json['id']?.toString(),
      date: json['date'] as String?,
      status: json['status'] as String?,
      publishVersion: json['publish_version'] as int?,
      stops: (json['stops'] as List?)
          ?.map((e) => RouteStopModel.fromJson(e))
          .toList(),
      isToday: json['is_today'] as bool?,
      nextStopId: json['next_stop_id']?.toString(),
      summary: json['summary'] != null
          ? RouteSummaryModel.fromJson(json['summary'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (id != null) map['id'] = id;
    if (date != null) map['date'] = date;
    if (status != null) map['status'] = status;
    if (publishVersion != null) map['publish_version'] = publishVersion;
    if (stops != null) map['stops'] = stops!.map((v) => v.toJson()).toList();
    if (isToday != null) map['is_today'] = isToday;
    if (nextStopId != null) map['next_stop_id'] = nextStopId;
    if (summary != null) map['summary'] = summary!.toJson();
    return map;
  }
}

class RouteSummaryModel {
  final int? stopsTotal;
  final int? stopsDone;
  final num? totalMiles;
  final String? endsAt;
  final String? endsAtLabel;

  RouteSummaryModel({
    this.stopsTotal,
    this.stopsDone,
    this.totalMiles,
    this.endsAt,
    this.endsAtLabel,
  });

  factory RouteSummaryModel.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      if (json is Map) {
        json = Map<String, dynamic>.from(json);
      } else {
        return RouteSummaryModel();
      }
    }
    return RouteSummaryModel(
      stopsTotal: json['stops_total'] as int?,
      stopsDone: json['stops_done'] as int?,
      totalMiles: json['total_miles'] as num?,
      endsAt: json['ends_at'] as String?,
      endsAtLabel: json['ends_at_label'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (stopsTotal != null) map['stops_total'] = stopsTotal;
    if (stopsDone != null) map['stops_done'] = stopsDone;
    if (totalMiles != null) map['total_miles'] = totalMiles;
    if (endsAt != null) map['ends_at'] = endsAt;
    if (endsAtLabel != null) map['ends_at_label'] = endsAtLabel;
    return map;
  }
}

class RouteStopModel {
  final String? id;
  final int? sequence;
  final String? visitId;
  final String? contractId;
  final String? poolId;
  final String? estimatedArrival;
  final int? estimatedDurationMinutes;
  final String? status;
  final String? skipReason;
  final String? skippedBy;
  final bool? customerUnavailable;
  final String? kind;
  final WorkOrderSummaryModel? workOrder;
  final String? customerName;
  final JobTypeModel? jobType;
  final num? legMiles;

  RouteStopModel({
    this.id,
    this.sequence,
    this.visitId,
    this.contractId,
    this.poolId,
    this.estimatedArrival,
    this.estimatedDurationMinutes,
    this.status,
    this.skipReason,
    this.skippedBy,
    this.customerUnavailable,
    this.kind,
    this.workOrder,
    this.customerName,
    this.jobType,
    this.legMiles,
  });

  factory RouteStopModel.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      if (json is Map) {
        json = Map<String, dynamic>.from(json);
      } else {
        return RouteStopModel();
      }
    }
    return RouteStopModel(
      id: json['id']?.toString(),
      sequence: json['sequence'] as int?,
      visitId: json['visit_id']?.toString(),
      contractId: json['contract_id']?.toString(),
      poolId: json['pool_id']?.toString(),
      estimatedArrival: json['estimated_arrival'] as String?,
      estimatedDurationMinutes: json['estimated_duration_minutes'] as int?,
      status: json['status'] as String?,
      skipReason: json['skip_reason'] as String?,
      skippedBy: json['skipped_by'] as String?,
      customerUnavailable: json['customer_unavailable'] as bool?,
      kind: json['kind'] as String?,
      workOrder: json['work_order'] != null
          ? WorkOrderSummaryModel.fromJson(json['work_order'])
          : null,
      customerName: json['customer_name'] as String?,
      jobType: json['job_type'] != null
          ? JobTypeModel.fromJson(json['job_type'])
          : null,
      legMiles: json['leg_miles'] as num?,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (id != null) map['id'] = id;
    if (sequence != null) map['sequence'] = sequence;
    if (visitId != null) map['visit_id'] = visitId;
    if (contractId != null) map['contract_id'] = contractId;
    if (poolId != null) map['pool_id'] = poolId;
    if (estimatedArrival != null) map['estimated_arrival'] = estimatedArrival;
    if (estimatedDurationMinutes != null) {
      map['estimated_duration_minutes'] = estimatedDurationMinutes;
    }
    if (status != null) map['status'] = status;
    if (skipReason != null) map['skip_reason'] = skipReason;
    if (skippedBy != null) map['skipped_by'] = skippedBy;
    if (customerUnavailable != null) {
      map['customer_unavailable'] = customerUnavailable;
    }
    if (kind != null) map['kind'] = kind;
    if (workOrder != null) map['work_order'] = workOrder!.toJson();
    if (customerName != null) map['customer_name'] = customerName;
    if (jobType != null) map['job_type'] = jobType!.toJson();
    if (legMiles != null) map['leg_miles'] = legMiles;
    return map;
  }
}

class WorkOrderSummaryModel {
  final String? id;
  final String? number;
  final String? title;

  WorkOrderSummaryModel({
    this.id,
    this.number,
    this.title,
  });

  factory WorkOrderSummaryModel.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      if (json is Map) {
        json = Map<String, dynamic>.from(json);
      } else {
        return WorkOrderSummaryModel();
      }
    }
    return WorkOrderSummaryModel(
      id: json['id']?.toString(),
      number: json['number']?.toString(),
      title: json['title'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (id != null) map['id'] = id;
    if (number != null) map['number'] = number;
    if (title != null) map['title'] = title;
    return map;
  }
}

class JobTypeModel {
  final String? key;
  final String? label;

  JobTypeModel({this.key, this.label});

  factory JobTypeModel.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      if (json is Map) {
        json = Map<String, dynamic>.from(json);
      } else {
        return JobTypeModel();
      }
    }
    return JobTypeModel(
      key: json['key'] as String?,
      label: json['label'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (key != null) map['key'] = key;
    if (label != null) map['label'] = label;
    return map;
  }
}

class VisitModel {
  final String? id;
  final String? serviceContractId;
  final String? poolId;
  final String? technicianMembershipId;
  final String? status;
  final String? scheduledAt;
  final String? arrivedAt;
  final String? completedAt;
  final String? configVersion;
  final String? customerNotes;
  final String? officeNotes;
  final List<dynamic>? checklistItems;
  final List<dynamic>? readings;
  final List<dynamic>? media;
  final String? etag;

  VisitModel({
    this.id,
    this.serviceContractId,
    this.poolId,
    this.technicianMembershipId,
    this.status,
    this.scheduledAt,
    this.arrivedAt,
    this.completedAt,
    this.configVersion,
    this.customerNotes,
    this.officeNotes,
    this.checklistItems,
    this.readings,
    this.media,
    this.etag,
  });

  factory VisitModel.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      if (json is Map) {
        json = Map<String, dynamic>.from(json);
      } else {
        return VisitModel();
      }
    }
    return VisitModel(
      id: json['id']?.toString(),
      serviceContractId: json['service_contract_id']?.toString(),
      poolId: json['pool_id']?.toString(),
      technicianMembershipId: json['technician_membership_id']?.toString(),
      status: json['status'] as String?,
      scheduledAt: json['scheduled_at'] as String?,
      arrivedAt: json['arrived_at'] as String?,
      completedAt: json['completed_at'] as String?,
      configVersion: json['config_version']?.toString(),
      customerNotes: json['customer_notes'] as String?,
      officeNotes: json['office_notes'] as String?,
      checklistItems: json['checklist_items'] as List?,
      readings: json['readings'] as List?,
      media: json['media'] as List?,
      etag: json['etag'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (id != null) map['id'] = id;
    if (serviceContractId != null) {
      map['service_contract_id'] = serviceContractId;
    }
    if (poolId != null) map['pool_id'] = poolId;
    if (technicianMembershipId != null) {
      map['technician_membership_id'] = technicianMembershipId;
    }
    if (status != null) map['status'] = status;
    if (scheduledAt != null) map['scheduled_at'] = scheduledAt;
    if (arrivedAt != null) map['arrived_at'] = arrivedAt;
    if (completedAt != null) map['completed_at'] = completedAt;
    if (configVersion != null) map['config_version'] = configVersion;
    if (customerNotes != null) map['customer_notes'] = customerNotes;
    if (officeNotes != null) map['office_notes'] = officeNotes;
    if (checklistItems != null) map['checklist_items'] = checklistItems;
    if (readings != null) map['readings'] = readings;
    if (media != null) map['media'] = media;
    if (etag != null) map['etag'] = etag;
    return map;
  }
}

class CustomerModel {
  final String? contractId;
  final String? customerId;
  final String? name;
  final String? phone;
  final String? serviceType;
  final CustomerPoolModel? pool;
  final CustomerAddressModel? address;
  final List<dynamic>? extraChecklistItems;
  final int? servicePriceInCents;

  CustomerModel({
    this.contractId,
    this.customerId,
    this.name,
    this.phone,
    this.serviceType,
    this.pool,
    this.address,
    this.extraChecklistItems,
    this.servicePriceInCents,
  });

  factory CustomerModel.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      if (json is Map) {
        json = Map<String, dynamic>.from(json);
      } else {
        return CustomerModel();
      }
    }
    return CustomerModel(
      contractId: json['contract_id']?.toString(),
      customerId: json['customer_id']?.toString(),
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      serviceType: json['service_type'] as String?,
      pool: json['pool'] != null
          ? CustomerPoolModel.fromJson(json['pool'])
          : null,
      address: json['address'] != null
          ? CustomerAddressModel.fromJson(json['address'])
          : null,
      extraChecklistItems: json['extra_checklist_items'] as List?,
      servicePriceInCents: json['service_price_in_cents'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (contractId != null) map['contract_id'] = contractId;
    if (customerId != null) map['customer_id'] = customerId;
    if (name != null) map['name'] = name;
    if (phone != null) map['phone'] = phone;
    if (serviceType != null) map['service_type'] = serviceType;
    if (pool != null) map['pool'] = pool!.toJson();
    if (address != null) map['address'] = address!.toJson();
    if (extraChecklistItems != null) {
      map['extra_checklist_items'] = extraChecklistItems;
    }
    if (servicePriceInCents != null) {
      map['service_price_in_cents'] = servicePriceInCents;
    }
    return map;
  }
}

class CustomerPoolModel {
  final String? id;
  final String? name;
  final int? volumeGallons;
  final String? sanitizer;
  final String? surface;

  CustomerPoolModel({
    this.id,
    this.name,
    this.volumeGallons,
    this.sanitizer,
    this.surface,
  });

  factory CustomerPoolModel.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      if (json is Map) {
        json = Map<String, dynamic>.from(json);
      } else {
        return CustomerPoolModel();
      }
    }
    return CustomerPoolModel(
      id: json['id']?.toString(),
      name: json['name'] as String?,
      volumeGallons: json['volume_gallons'] as int?,
      sanitizer: json['sanitizer'] as String?,
      surface: json['surface'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (id != null) map['id'] = id;
    if (name != null) map['name'] = name;
    if (volumeGallons != null) map['volume_gallons'] = volumeGallons;
    if (sanitizer != null) map['sanitizer'] = sanitizer;
    if (surface != null) map['surface'] = surface;
    return map;
  }
}

class CustomerAddressModel {
  final String? line1;
  final String? city;
  final String? state;
  final String? zip;
  final num? lat;
  final num? lng;
  final String? gateCode;
  final String? accessNotes;
  final bool? dogsOnSite;

  CustomerAddressModel({
    this.line1,
    this.city,
    this.state,
    this.zip,
    this.lat,
    this.lng,
    this.gateCode,
    this.accessNotes,
    this.dogsOnSite,
  });

  factory CustomerAddressModel.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      if (json is Map) {
        json = Map<String, dynamic>.from(json);
      } else {
        return CustomerAddressModel();
      }
    }
    return CustomerAddressModel(
      line1: json['line1'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      zip: json['zip'] as String?,
      lat: json['lat'] as num?,
      lng: json['lng'] as num?,
      gateCode: json['gate_code'] as String?,
      accessNotes: json['access_notes'] as String?,
      dogsOnSite: json['dogs_on_site'] as bool?,
    );
  }

  String get fullAddress {
    final parts = [line1, city, state, zip].where((p) => p != null && p.isNotEmpty).toList();
    return parts.join(', ');
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (line1 != null) map['line1'] = line1;
    if (city != null) map['city'] = city;
    if (state != null) map['state'] = state;
    if (zip != null) map['zip'] = zip;
    if (lat != null) map['lat'] = lat;
    if (lng != null) map['lng'] = lng;
    if (gateCode != null) map['gate_code'] = gateCode;
    if (accessNotes != null) map['access_notes'] = accessNotes;
    if (dogsOnSite != null) map['dogs_on_site'] = dogsOnSite;
    return map;
  }
}

class PreviousVisitModel {
  final String? id;
  final String? poolId;
  final String? completedAt;
  final String? customerNotes;
  final List<ReadingItemModel>? readings;

  PreviousVisitModel({
    this.id,
    this.poolId,
    this.completedAt,
    this.customerNotes,
    this.readings,
  });

  factory PreviousVisitModel.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      if (json is Map) {
        json = Map<String, dynamic>.from(json);
      } else {
        return PreviousVisitModel();
      }
    }
    return PreviousVisitModel(
      id: json['id']?.toString(),
      poolId: json['pool_id']?.toString(),
      completedAt: json['completed_at'] as String?,
      customerNotes: json['customer_notes'] as String?,
      readings: (json['readings'] as List?)
          ?.map((e) => ReadingItemModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (id != null) map['id'] = id;
    if (poolId != null) map['pool_id'] = poolId;
    if (completedAt != null) map['completed_at'] = completedAt;
    if (customerNotes != null) map['customer_notes'] = customerNotes;
    if (readings != null) {
      map['readings'] = readings!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class ReadingItemModel {
  final String? parameter;
  final num? value;
  final String? unit;

  ReadingItemModel({this.parameter, this.value, this.unit});

  factory ReadingItemModel.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      if (json is Map) {
        json = Map<String, dynamic>.from(json);
      } else {
        return ReadingItemModel();
      }
    }
    return ReadingItemModel(
      parameter: json['parameter'] as String?,
      value: json['value'] as num?,
      unit: json['unit'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (parameter != null) map['parameter'] = parameter;
    if (value != null) map['value'] = value;
    if (unit != null) map['unit'] = unit;
    return map;
  }
}

class ChecklistModel {
  final String? id;
  final String? name;
  final String? serviceType;
  final int? version;
  final List<ChecklistTaskItemModel>? items;

  ChecklistModel({
    this.id,
    this.name,
    this.serviceType,
    this.version,
    this.items,
  });

  factory ChecklistModel.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      if (json is Map) {
        json = Map<String, dynamic>.from(json);
      } else {
        return ChecklistModel();
      }
    }
    return ChecklistModel(
      id: json['id']?.toString(),
      name: json['name'] as String?,
      serviceType: json['service_type'] as String?,
      version: json['version'] as int?,
      items: (json['items'] as List?)
          ?.map((e) => ChecklistTaskItemModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (id != null) map['id'] = id;
    if (name != null) map['name'] = name;
    if (serviceType != null) map['service_type'] = serviceType;
    if (version != null) map['version'] = version;
    if (items != null) map['items'] = items!.map((v) => v.toJson()).toList();
    return map;
  }
}

class ChecklistTaskItemModel {
  final String? id;
  final String? label;
  final bool? isRequired;
  final bool? requiresPhoto;
  final int? order;

  ChecklistTaskItemModel({
    this.id,
    this.label,
    this.isRequired,
    this.requiresPhoto,
    this.order,
  });

  factory ChecklistTaskItemModel.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      if (json is Map) {
        json = Map<String, dynamic>.from(json);
      } else {
        return ChecklistTaskItemModel();
      }
    }
    return ChecklistTaskItemModel(
      id: json['id']?.toString(),
      label: json['label'] as String?,
      isRequired: json['isRequired'] as bool?,
      requiresPhoto: json['requiresPhoto'] as bool?,
      order: json['order'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (id != null) map['id'] = id;
    if (label != null) map['label'] = label;
    if (isRequired != null) map['isRequired'] = isRequired;
    if (requiresPhoto != null) map['requiresPhoto'] = requiresPhoto;
    if (order != null) map['order'] = order;
    return map;
  }
}

class CatalogItemModel {
  final String? id;
  final String? name;
  final String? unit;
  final int? defaultPrice;

  CatalogItemModel({
    this.id,
    this.name,
    this.unit,
    this.defaultPrice,
  });

  factory CatalogItemModel.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      if (json is Map) {
        json = Map<String, dynamic>.from(json);
      } else {
        return CatalogItemModel();
      }
    }
    return CatalogItemModel(
      id: json['id']?.toString(),
      name: json['name'] as String?,
      unit: json['unit'] as String?,
      defaultPrice: json['default_price'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (id != null) map['id'] = id;
    if (name != null) map['name'] = name;
    if (unit != null) map['unit'] = unit;
    if (defaultPrice != null) map['default_price'] = defaultPrice;
    return map;
  }
}

class ReadingConfigModel {
  final List<ReadingConfigParamModel>? parameters;

  ReadingConfigModel({this.parameters});

  factory ReadingConfigModel.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      if (json is Map) {
        json = Map<String, dynamic>.from(json);
      } else {
        return ReadingConfigModel();
      }
    }
    return ReadingConfigModel(
      parameters: (json['parameters'] as List?)
          ?.map((e) => ReadingConfigParamModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (parameters != null) {
      map['parameters'] = parameters!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class ReadingConfigParamModel {
  final String? code;
  final String? label;
  final String? unit;
  final num? minNormal;
  final num? maxNormal;
  final num? minAllowed;
  final num? maxAllowed;
  final num? step;
  final bool? required;
  final int? version;

  ReadingConfigParamModel({
    this.code,
    this.label,
    this.unit,
    this.minNormal,
    this.maxNormal,
    this.minAllowed,
    this.maxAllowed,
    this.step,
    this.required,
    this.version,
  });

  factory ReadingConfigParamModel.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      if (json is Map) {
        json = Map<String, dynamic>.from(json);
      } else {
        return ReadingConfigParamModel();
      }
    }
    return ReadingConfigParamModel(
      code: json['code'] as String?,
      label: json['label'] as String?,
      unit: json['unit'] as String?,
      minNormal: json['min_normal'] as num?,
      maxNormal: json['max_normal'] as num?,
      minAllowed: json['min_allowed'] as num?,
      maxAllowed: json['max_allowed'] as num?,
      step: json['step'] as num?,
      required: json['required'] as bool?,
      version: json['version'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (code != null) map['code'] = code;
    if (label != null) map['label'] = label;
    if (unit != null) map['unit'] = unit;
    if (minNormal != null) map['min_normal'] = minNormal;
    if (maxNormal != null) map['max_normal'] = maxNormal;
    if (minAllowed != null) map['min_allowed'] = minAllowed;
    if (maxAllowed != null) map['max_allowed'] = maxAllowed;
    if (step != null) map['step'] = step;
    if (required != null) map['required'] = required;
    if (version != null) map['version'] = version;
    return map;
  }
}

class DosageRulesModel {
  final String? version;
  final List<DosageRuleItemModel>? rules;

  DosageRulesModel({this.version, this.rules});

  factory DosageRulesModel.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      if (json is Map) {
        json = Map<String, dynamic>.from(json);
      } else {
        return DosageRulesModel();
      }
    }
    return DosageRulesModel(
      version: json['version'] as String?,
      rules: (json['rules'] as List?)
          ?.map((e) => DosageRuleItemModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (version != null) map['version'] = version;
    if (rules != null) {
      map['rules'] = rules!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class DosageRuleItemModel {
  final String? parameterCode;
  final String? when;
  final num? threshold;
  final num? target;
  final String? chemicalName;
  final String? unit;
  final num? factorPer10kGal;
  final num? minDose;
  final String? instructions;
  final String? warningText;

  DosageRuleItemModel({
    this.parameterCode,
    this.when,
    this.threshold,
    this.target,
    this.chemicalName,
    this.unit,
    this.factorPer10kGal,
    this.minDose,
    this.instructions,
    this.warningText,
  });

  factory DosageRuleItemModel.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      if (json is Map) {
        json = Map<String, dynamic>.from(json);
      } else {
        return DosageRuleItemModel();
      }
    }
    return DosageRuleItemModel(
      parameterCode: json['parameterCode'] as String?,
      when: json['when'] as String?,
      threshold: json['threshold'] as num?,
      target: json['target'] as num?,
      chemicalName: json['chemicalName'] as String?,
      unit: json['unit'] as String?,
      factorPer10kGal: json['factorPer10kGal'] as num?,
      minDose: json['minDose'] as num?,
      instructions: json['instructions'] as String?,
      warningText: json['warningText'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (parameterCode != null) map['parameterCode'] = parameterCode;
    if (when != null) map['when'] = when;
    if (threshold != null) map['threshold'] = threshold;
    if (target != null) map['target'] = target;
    if (chemicalName != null) map['chemicalName'] = chemicalName;
    if (unit != null) map['unit'] = unit;
    if (factorPer10kGal != null) map['factorPer10kGal'] = factorPer10kGal;
    if (minDose != null) map['minDose'] = minDose;
    if (instructions != null) map['instructions'] = instructions;
    if (warningText != null) map['warningText'] = warningText;
    return map;
  }
}

class BrandingModel {
  final String? tradingName;
  final String? logoUrl;
  final String? invoiceAccentColor;
  final String? phone;
  final String? email;
  final String? timezone;

  BrandingModel({
    this.tradingName,
    this.logoUrl,
    this.invoiceAccentColor,
    this.phone,
    this.email,
    this.timezone,
  });

  factory BrandingModel.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      if (json is Map) {
        json = Map<String, dynamic>.from(json);
      } else {
        return BrandingModel();
      }
    }
    return BrandingModel(
      tradingName: json['trading_name'] as String?,
      logoUrl: json['logo_url'] as String?,
      invoiceAccentColor: json['invoice_accent_color'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      timezone: json['timezone'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (tradingName != null) map['trading_name'] = tradingName;
    if (logoUrl != null) map['logo_url'] = logoUrl;
    if (invoiceAccentColor != null) {
      map['invoice_accent_color'] = invoiceAccentColor;
    }
    if (phone != null) map['phone'] = phone;
    if (email != null) map['email'] = email;
    if (timezone != null) map['timezone'] = timezone;
    return map;
  }
}

class PermissionsModel {
  final bool? showPrices;
  final bool? canOptimise;

  PermissionsModel({this.showPrices, this.canOptimise});

  factory PermissionsModel.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      if (json is Map) {
        json = Map<String, dynamic>.from(json);
      } else {
        return PermissionsModel();
      }
    }
    return PermissionsModel(
      showPrices: json['show_prices'] as bool?,
      canOptimise: json['can_optimise'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (showPrices != null) map['show_prices'] = showPrices;
    if (canOptimise != null) map['can_optimise'] = canOptimise;
    return map;
  }
}
