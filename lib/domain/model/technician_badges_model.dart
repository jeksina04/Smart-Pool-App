class TechnicianBadgesResModel {
  final bool? success;
  final String? message;
  final TechnicianBadgesData? data;

  TechnicianBadgesResModel({
    this.success,
    this.message,
    this.data,
  });

  factory TechnicianBadgesResModel.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      if (json is Map) {
        json = Map<String, dynamic>.from(json);
      } else {
        return TechnicianBadgesResModel();
      }
    }
    return TechnicianBadgesResModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] != null
          ? TechnicianBadgesData.fromJson(json['data'])
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

class TechnicianBadgesData {
  final int? workOrders;
  final int? shoppingList;
  final int? syncPending;
  final int? notifications;

  TechnicianBadgesData({
    this.workOrders,
    this.shoppingList,
    this.syncPending,
    this.notifications,
  });

  factory TechnicianBadgesData.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      if (json is Map) {
        json = Map<String, dynamic>.from(json);
      } else {
        return TechnicianBadgesData();
      }
    }

    int? parseInt(dynamic val) {
      if (val is int) return val;
      if (val is num) return val.toInt();
      if (val is String) return int.tryParse(val);
      return null;
    }

    return TechnicianBadgesData(
      workOrders: parseInt(json['work_orders'] ?? json['workOrders']),
      shoppingList: parseInt(json['shopping_list'] ?? json['shoppingList']),
      syncPending: parseInt(json['sync_pending'] ?? json['syncPending'] ?? json['sync']),
      notifications: parseInt(json['notifications'] ?? json['notification_count']),
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (workOrders != null) map['work_orders'] = workOrders;
    if (shoppingList != null) map['shopping_list'] = shoppingList;
    if (syncPending != null) map['sync_pending'] = syncPending;
    if (notifications != null) map['notifications'] = notifications;
    return map;
  }
}
