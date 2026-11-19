// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'openapi.models.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrsError _$ErrsErrorFromJson(Map<String, dynamic> json) => ErrsError(
  code: json['code'] as String?,
  details: json['details'],
  message: json['message'] as String?,
);

Map<String, dynamic> _$ErrsErrorToJson(ErrsError instance) => <String, dynamic>{
  'code': instance.code,
  'details': instance.details,
  'message': instance.message,
};

HandlerAftersaleAdminApplyRequest _$HandlerAftersaleAdminApplyRequestFromJson(
  Map<String, dynamic> json,
) => HandlerAftersaleAdminApplyRequest(
  orderNo: json['order_no'] as String,
  reason: json['reason'] as String?,
  refundPaidCents: (json['refund_paid_cents'] as num?)?.toInt(),
  refundQuotaCents: (json['refund_quota_cents'] as num?)?.toInt(),
  type: handlerAftersaleAdminApplyRequestTypeFromJson(json['type']),
);

Map<String, dynamic> _$HandlerAftersaleAdminApplyRequestToJson(
  HandlerAftersaleAdminApplyRequest instance,
) => <String, dynamic>{
  'order_no': instance.orderNo,
  'reason': instance.reason,
  'refund_paid_cents': instance.refundPaidCents,
  'refund_quota_cents': instance.refundQuotaCents,
  'type': handlerAftersaleAdminApplyRequestTypeToJson(instance.type),
};

HandlerAftersaleAdminRejectRequest _$HandlerAftersaleAdminRejectRequestFromJson(
  Map<String, dynamic> json,
) => HandlerAftersaleAdminRejectRequest(reason: json['reason'] as String);

Map<String, dynamic> _$HandlerAftersaleAdminRejectRequestToJson(
  HandlerAftersaleAdminRejectRequest instance,
) => <String, dynamic>{'reason': instance.reason};

HandlerAftersaleItem _$HandlerAftersaleItemFromJson(
  Map<String, dynamic> json,
) => HandlerAftersaleItem(
  actualRefundedCents: (json['actual_refunded_cents'] as num?)?.toInt(),
  aftersaleNo: json['aftersale_no'] as String?,
  applicantId: (json['applicant_id'] as num?)?.toInt(),
  applicantName: json['applicant_name'] as String?,
  applicantType: handlerAftersaleItemApplicantTypeNullableFromJson(
    json['applicant_type'],
  ),
  applyCount: (json['apply_count'] as num?)?.toInt(),
  applyReason: json['apply_reason'] as String?,
  approvedAt: json['approved_at'] as String?,
  completedAt: json['completed_at'] as String?,
  createdAt: json['created_at'] as String?,
  errorMessage: json['error_message'] as String?,
  id: (json['id'] as num?)?.toInt(),
  isAuto: json['is_auto'] as bool?,
  operatorId: (json['operator_id'] as num?)?.toInt(),
  operatorName: json['operator_name'] as String?,
  order: json['order'] == null
      ? null
      : HandlerAftersaleOrderInfo.fromJson(
          json['order'] as Map<String, dynamic>,
        ),
  orderNo: json['order_no'] as String?,
  orderType: handlerAftersaleItemOrderTypeNullableFromJson(json['order_type']),
  packageOrder: json['package_order'] == null
      ? null
      : HandlerAftersalePackageOrderInfo.fromJson(
          json['package_order'] as Map<String, dynamic>,
        ),
  refundPaidCents: (json['refund_paid_cents'] as num?)?.toInt(),
  refundQuotaCents: (json['refund_quota_cents'] as num?)?.toInt(),
  rejectReason: json['reject_reason'] as String?,
  retryCount: (json['retry_count'] as num?)?.toInt(),
  status: handlerAftersaleItemStatusNullableFromJson(json['status']),
  type: handlerAftersaleItemTypeNullableFromJson(json['type']),
);

Map<String, dynamic> _$HandlerAftersaleItemToJson(
  HandlerAftersaleItem instance,
) => <String, dynamic>{
  'actual_refunded_cents': instance.actualRefundedCents,
  'aftersale_no': instance.aftersaleNo,
  'applicant_id': instance.applicantId,
  'applicant_name': instance.applicantName,
  'applicant_type': handlerAftersaleItemApplicantTypeNullableToJson(
    instance.applicantType,
  ),
  'apply_count': instance.applyCount,
  'apply_reason': instance.applyReason,
  'approved_at': instance.approvedAt,
  'completed_at': instance.completedAt,
  'created_at': instance.createdAt,
  'error_message': instance.errorMessage,
  'id': instance.id,
  'is_auto': instance.isAuto,
  'operator_id': instance.operatorId,
  'operator_name': instance.operatorName,
  'order': instance.order?.toJson(),
  'order_no': instance.orderNo,
  'order_type': handlerAftersaleItemOrderTypeNullableToJson(instance.orderType),
  'package_order': instance.packageOrder?.toJson(),
  'refund_paid_cents': instance.refundPaidCents,
  'refund_quota_cents': instance.refundQuotaCents,
  'reject_reason': instance.rejectReason,
  'retry_count': instance.retryCount,
  'status': handlerAftersaleItemStatusNullableToJson(instance.status),
  'type': handlerAftersaleItemTypeNullableToJson(instance.type),
};

HandlerAftersaleListResponse _$HandlerAftersaleListResponseFromJson(
  Map<String, dynamic> json,
) => HandlerAftersaleListResponse(
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => HandlerAftersaleItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  total: (json['total'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerAftersaleListResponseToJson(
  HandlerAftersaleListResponse instance,
) => <String, dynamic>{
  'items': instance.items?.map((e) => e.toJson()).toList(),
  'total': instance.total,
};

HandlerAftersaleOrderInfo _$HandlerAftersaleOrderInfoFromJson(
  Map<String, dynamic> json,
) => HandlerAftersaleOrderInfo(
  actualPaidCents: (json['actual_paid_cents'] as num?)?.toInt(),
  actualRefundedCents: (json['actual_refunded_cents'] as num?)?.toInt(),
  actualVolumeMl: (json['actual_volume_ml'] as num?)?.toInt(),
  createdAt: json['created_at'] as String?,
  deviceAddress: json['device_address'] as String?,
  deviceName: json['device_name'] as String?,
  deviceSn: json['device_sn'] as String?,
  dispenseResult: handlerAftersaleOrderInfoDispenseResultNullableFromJson(
    json['dispense_result'],
  ),
  dueCents: (json['due_cents'] as num?)?.toInt(),
  id: (json['id'] as num?)?.toInt(),
  orderNo: json['order_no'] as String?,
  paidCents: (json['paid_cents'] as num?)?.toInt(),
  paymentMethod: handlerAftersaleOrderInfoPaymentMethodNullableFromJson(
    json['payment_method'],
  ),
  paymentMethodText: json['payment_method_text'] as String?,
  pricePerLiterCents: (json['price_per_liter_cents'] as num?)?.toInt(),
  quotaDeductedCents: (json['quota_deducted_cents'] as num?)?.toInt(),
  quotaPaidCents: (json['quota_paid_cents'] as num?)?.toInt(),
  quotaRefundedCents: (json['quota_refunded_cents'] as num?)?.toInt(),
  refundedCents: (json['refunded_cents'] as num?)?.toInt(),
  selectedVolumeMl: (json['selected_volume_ml'] as num?)?.toInt(),
  status: handlerAftersaleOrderInfoStatusNullableFromJson(json['status']),
  userCode: json['user_code'] as String?,
  userName: json['user_name'] as String?,
  waterType: json['water_type'] as String?,
);

Map<String, dynamic> _$HandlerAftersaleOrderInfoToJson(
  HandlerAftersaleOrderInfo instance,
) => <String, dynamic>{
  'actual_paid_cents': instance.actualPaidCents,
  'actual_refunded_cents': instance.actualRefundedCents,
  'actual_volume_ml': instance.actualVolumeMl,
  'created_at': instance.createdAt,
  'device_address': instance.deviceAddress,
  'device_name': instance.deviceName,
  'device_sn': instance.deviceSn,
  'dispense_result': handlerAftersaleOrderInfoDispenseResultNullableToJson(
    instance.dispenseResult,
  ),
  'due_cents': instance.dueCents,
  'id': instance.id,
  'order_no': instance.orderNo,
  'paid_cents': instance.paidCents,
  'payment_method': handlerAftersaleOrderInfoPaymentMethodNullableToJson(
    instance.paymentMethod,
  ),
  'payment_method_text': instance.paymentMethodText,
  'price_per_liter_cents': instance.pricePerLiterCents,
  'quota_deducted_cents': instance.quotaDeductedCents,
  'quota_paid_cents': instance.quotaPaidCents,
  'quota_refunded_cents': instance.quotaRefundedCents,
  'refunded_cents': instance.refundedCents,
  'selected_volume_ml': instance.selectedVolumeMl,
  'status': handlerAftersaleOrderInfoStatusNullableToJson(instance.status),
  'user_code': instance.userCode,
  'user_name': instance.userName,
  'water_type': instance.waterType,
};

HandlerAftersalePackageOrderInfo _$HandlerAftersalePackageOrderInfoFromJson(
  Map<String, dynamic> json,
) => HandlerAftersalePackageOrderInfo(
  consumedGiftCents: (json['consumed_gift_cents'] as num?)?.toInt(),
  consumedQuotaCents: (json['consumed_quota_cents'] as num?)?.toInt(),
  createdAt: json['created_at'] as String?,
  giftCents: (json['gift_cents'] as num?)?.toInt(),
  orderNo: json['order_no'] as String?,
  packageName: json['package_name'] as String?,
  paidCents: (json['paid_cents'] as num?)?.toInt(),
  paymentMethod: handlerAftersalePackageOrderInfoPaymentMethodNullableFromJson(
    json['payment_method'],
  ),
  priceCents: (json['price_cents'] as num?)?.toInt(),
  quotaCents: (json['quota_cents'] as num?)?.toInt(),
  refundCents: (json['refund_cents'] as num?)?.toInt(),
  refundStatus: handlerAftersalePackageOrderInfoRefundStatusNullableFromJson(
    json['refund_status'],
  ),
  refundedAt: json['refunded_at'] as String?,
  status: handlerAftersalePackageOrderInfoStatusNullableFromJson(
    json['status'],
  ),
  userCode: json['user_code'] as String?,
  userName: json['user_name'] as String?,
);

Map<String, dynamic> _$HandlerAftersalePackageOrderInfoToJson(
  HandlerAftersalePackageOrderInfo instance,
) => <String, dynamic>{
  'consumed_gift_cents': instance.consumedGiftCents,
  'consumed_quota_cents': instance.consumedQuotaCents,
  'created_at': instance.createdAt,
  'gift_cents': instance.giftCents,
  'order_no': instance.orderNo,
  'package_name': instance.packageName,
  'paid_cents': instance.paidCents,
  'payment_method': handlerAftersalePackageOrderInfoPaymentMethodNullableToJson(
    instance.paymentMethod,
  ),
  'price_cents': instance.priceCents,
  'quota_cents': instance.quotaCents,
  'refund_cents': instance.refundCents,
  'refund_status': handlerAftersalePackageOrderInfoRefundStatusNullableToJson(
    instance.refundStatus,
  ),
  'refunded_at': instance.refundedAt,
  'status': handlerAftersalePackageOrderInfoStatusNullableToJson(
    instance.status,
  ),
  'user_code': instance.userCode,
  'user_name': instance.userName,
};

HandlerAftersalePackageRefundResponse
_$HandlerAftersalePackageRefundResponseFromJson(Map<String, dynamic> json) =>
    HandlerAftersalePackageRefundResponse(
      consumedCents: (json['consumed_cents'] as num?)?.toInt(),
      displayStatus: json['display_status'] as String?,
      ongoingOrderNos:
          (json['ongoing_order_nos'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      orderNo: json['order_no'] as String?,
      packageGiftedCents: (json['package_gifted_cents'] as num?)?.toInt(),
      paidCents: (json['paid_cents'] as num?)?.toInt(),
      refundCents: (json['refund_cents'] as num?)?.toInt(),
      refundFailReason: json['refund_fail_reason'] as String?,
      refundStatus: json['refund_status'] as String?,
      refundable: json['refundable'] as bool?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$HandlerAftersalePackageRefundResponseToJson(
  HandlerAftersalePackageRefundResponse instance,
) => <String, dynamic>{
  'consumed_cents': instance.consumedCents,
  'display_status': instance.displayStatus,
  'ongoing_order_nos': instance.ongoingOrderNos,
  'order_no': instance.orderNo,
  'package_gifted_cents': instance.packageGiftedCents,
  'paid_cents': instance.paidCents,
  'refund_cents': instance.refundCents,
  'refund_fail_reason': instance.refundFailReason,
  'refund_status': instance.refundStatus,
  'refundable': instance.refundable,
  'status': instance.status,
};

HandlerAftersaleStatsResponse _$HandlerAftersaleStatsResponseFromJson(
  Map<String, dynamic> json,
) => HandlerAftersaleStatsResponse(
  completedCount: (json['completed_count'] as num?)?.toInt(),
  failedCount: (json['failed_count'] as num?)?.toInt(),
  refundingCount: (json['refunding_count'] as num?)?.toInt(),
  totalRefundCents: (json['total_refund_cents'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerAftersaleStatsResponseToJson(
  HandlerAftersaleStatsResponse instance,
) => <String, dynamic>{
  'completed_count': instance.completedCount,
  'failed_count': instance.failedCount,
  'refunding_count': instance.refundingCount,
  'total_refund_cents': instance.totalRefundCents,
};

HandlerAlarmAdminHandleFilter _$HandlerAlarmAdminHandleFilterFromJson(
  Map<String, dynamic> json,
) => HandlerAlarmAdminHandleFilter(
  createdFrom: json['created_from'] as String?,
  createdTo: json['created_to'] as String?,
  keyword: json['keyword'] as String?,
  region: json['region'] as String?,
  status: handlerAlarmAdminHandleFilterStatusNullableFromJson(json['status']),
  type: handlerAlarmAdminHandleFilterTypeNullableFromJson(json['type']),
);

Map<String, dynamic> _$HandlerAlarmAdminHandleFilterToJson(
  HandlerAlarmAdminHandleFilter instance,
) => <String, dynamic>{
  'created_from': instance.createdFrom,
  'created_to': instance.createdTo,
  'keyword': instance.keyword,
  'region': instance.region,
  'status': handlerAlarmAdminHandleFilterStatusNullableToJson(instance.status),
  'type': handlerAlarmAdminHandleFilterTypeNullableToJson(instance.type),
};

HandlerAlarmAdminHandleRequest _$HandlerAlarmAdminHandleRequestFromJson(
  Map<String, dynamic> json,
) => HandlerAlarmAdminHandleRequest(
  all: json['all'] as bool?,
  filter: json['filter'] == null
      ? null
      : HandlerAlarmAdminHandleFilter.fromJson(
          json['filter'] as Map<String, dynamic>,
        ),
  ids:
      (json['ids'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      [],
  remark: json['remark'] as String?,
  status: handlerAlarmAdminHandleRequestStatusFromJson(json['status']),
);

Map<String, dynamic> _$HandlerAlarmAdminHandleRequestToJson(
  HandlerAlarmAdminHandleRequest instance,
) => <String, dynamic>{
  'all': instance.all,
  'filter': instance.filter?.toJson(),
  'ids': instance.ids,
  'remark': instance.remark,
  'status': handlerAlarmAdminHandleRequestStatusToJson(instance.status),
};

HandlerAlarmAdminHandleResponse _$HandlerAlarmAdminHandleResponseFromJson(
  Map<String, dynamic> json,
) => HandlerAlarmAdminHandleResponse(
  affected: (json['affected'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerAlarmAdminHandleResponseToJson(
  HandlerAlarmAdminHandleResponse instance,
) => <String, dynamic>{'affected': instance.affected};

HandlerAlarmAdminItem _$HandlerAlarmAdminItemFromJson(
  Map<String, dynamic> json,
) => HandlerAlarmAdminItem(
  createdAt: json['created_at'] as String?,
  deviceId: (json['device_id'] as num?)?.toInt(),
  deviceModel: json['device_model'] as String?,
  deviceName: json['device_name'] as String?,
  deviceRegion: json['device_region'] as String?,
  deviceRegionCode: json['device_region_code'] as String?,
  deviceSn: json['device_sn'] as String?,
  handleRemark: json['handle_remark'] as String?,
  handledAt: json['handled_at'] as String?,
  handlerId: (json['handler_id'] as num?)?.toInt(),
  handlerName: json['handler_name'] as String?,
  id: (json['id'] as num?)?.toInt(),
  level: json['level'] as String?,
  message: json['message'] as String?,
  recoveredAt: json['recovered_at'] as String?,
  status: handlerAlarmAdminItemStatusNullableFromJson(json['status']),
  type: json['type'] as String?,
);

Map<String, dynamic> _$HandlerAlarmAdminItemToJson(
  HandlerAlarmAdminItem instance,
) => <String, dynamic>{
  'created_at': instance.createdAt,
  'device_id': instance.deviceId,
  'device_model': instance.deviceModel,
  'device_name': instance.deviceName,
  'device_region': instance.deviceRegion,
  'device_region_code': instance.deviceRegionCode,
  'device_sn': instance.deviceSn,
  'handle_remark': instance.handleRemark,
  'handled_at': instance.handledAt,
  'handler_id': instance.handlerId,
  'handler_name': instance.handlerName,
  'id': instance.id,
  'level': instance.level,
  'message': instance.message,
  'recovered_at': instance.recoveredAt,
  'status': handlerAlarmAdminItemStatusNullableToJson(instance.status),
  'type': instance.type,
};

HandlerAlarmAdminListResponse _$HandlerAlarmAdminListResponseFromJson(
  Map<String, dynamic> json,
) => HandlerAlarmAdminListResponse(
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) => HandlerAlarmAdminItem.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
  total: (json['total'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerAlarmAdminListResponseToJson(
  HandlerAlarmAdminListResponse instance,
) => <String, dynamic>{
  'items': instance.items?.map((e) => e.toJson()).toList(),
  'total': instance.total,
};

HandlerAlarmAdminRuleItem _$HandlerAlarmAdminRuleItemFromJson(
  Map<String, dynamic> json,
) => HandlerAlarmAdminRuleItem(
  enabled: json['enabled'] as bool?,
  triggerWorkOrder: json['trigger_work_order'] as bool?,
  type: handlerAlarmAdminRuleItemTypeFromJson(json['type']),
);

Map<String, dynamic> _$HandlerAlarmAdminRuleItemToJson(
  HandlerAlarmAdminRuleItem instance,
) => <String, dynamic>{
  'enabled': instance.enabled,
  'trigger_work_order': instance.triggerWorkOrder,
  'type': handlerAlarmAdminRuleItemTypeToJson(instance.type),
};

HandlerAlarmAdminRuleListResponse _$HandlerAlarmAdminRuleListResponseFromJson(
  Map<String, dynamic> json,
) => HandlerAlarmAdminRuleListResponse(
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) => HandlerAlarmAdminRuleResponse.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      [],
);

Map<String, dynamic> _$HandlerAlarmAdminRuleListResponseToJson(
  HandlerAlarmAdminRuleListResponse instance,
) => <String, dynamic>{
  'items': instance.items?.map((e) => e.toJson()).toList(),
};

HandlerAlarmAdminRuleResponse _$HandlerAlarmAdminRuleResponseFromJson(
  Map<String, dynamic> json,
) => HandlerAlarmAdminRuleResponse(
  affectsSale: json['affects_sale'] as bool?,
  description: json['description'] as String?,
  enabled: json['enabled'] as bool?,
  name: json['name'] as String?,
  triggerWorkOrder: json['trigger_work_order'] as bool?,
  type: json['type'] as String?,
);

Map<String, dynamic> _$HandlerAlarmAdminRuleResponseToJson(
  HandlerAlarmAdminRuleResponse instance,
) => <String, dynamic>{
  'affects_sale': instance.affectsSale,
  'description': instance.description,
  'enabled': instance.enabled,
  'name': instance.name,
  'trigger_work_order': instance.triggerWorkOrder,
  'type': instance.type,
};

HandlerAlarmAdminRuleSaveRequest _$HandlerAlarmAdminRuleSaveRequestFromJson(
  Map<String, dynamic> json,
) => HandlerAlarmAdminRuleSaveRequest(
  rules:
      (json['rules'] as List<dynamic>?)
          ?.map(
            (e) =>
                HandlerAlarmAdminRuleItem.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
);

Map<String, dynamic> _$HandlerAlarmAdminRuleSaveRequestToJson(
  HandlerAlarmAdminRuleSaveRequest instance,
) => <String, dynamic>{'rules': instance.rules.map((e) => e.toJson()).toList()};

HandlerAlarmAdminStatsResponse _$HandlerAlarmAdminStatsResponseFromJson(
  Map<String, dynamic> json,
) => HandlerAlarmAdminStatsResponse(
  activeTotal: (json['active_total'] as num?)?.toInt(),
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) =>
                HandlerAlarmAdminTypeCount.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
);

Map<String, dynamic> _$HandlerAlarmAdminStatsResponseToJson(
  HandlerAlarmAdminStatsResponse instance,
) => <String, dynamic>{
  'active_total': instance.activeTotal,
  'items': instance.items?.map((e) => e.toJson()).toList(),
};

HandlerAlarmAdminTypeCount _$HandlerAlarmAdminTypeCountFromJson(
  Map<String, dynamic> json,
) => HandlerAlarmAdminTypeCount(
  affectsSale: json['affects_sale'] as bool?,
  count: (json['count'] as num?)?.toInt(),
  name: json['name'] as String?,
  type: json['type'] as String?,
);

Map<String, dynamic> _$HandlerAlarmAdminTypeCountToJson(
  HandlerAlarmAdminTypeCount instance,
) => <String, dynamic>{
  'affects_sale': instance.affectsSale,
  'count': instance.count,
  'name': instance.name,
  'type': instance.type,
};

HandlerAssetBorrowerRef _$HandlerAssetBorrowerRefFromJson(
  Map<String, dynamic> json,
) => HandlerAssetBorrowerRef(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
);

Map<String, dynamic> _$HandlerAssetBorrowerRefToJson(
  HandlerAssetBorrowerRef instance,
) => <String, dynamic>{'id': instance.id, 'name': instance.name};

HandlerAssetCodeAdminGenerateRequest
_$HandlerAssetCodeAdminGenerateRequestFromJson(Map<String, dynamic> json) =>
    HandlerAssetCodeAdminGenerateRequest(
      assetType: handlerAssetCodeAdminGenerateRequestAssetTypeFromJson(
        json['asset_type'],
      ),
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$HandlerAssetCodeAdminGenerateRequestToJson(
  HandlerAssetCodeAdminGenerateRequest instance,
) => <String, dynamic>{
  'asset_type': handlerAssetCodeAdminGenerateRequestAssetTypeToJson(
    instance.assetType,
  ),
  'count': instance.count,
};

HandlerAssetCodeAdminGenerateResponse
_$HandlerAssetCodeAdminGenerateResponseFromJson(Map<String, dynamic> json) =>
    HandlerAssetCodeAdminGenerateResponse(
      items:
          (json['items'] as List<dynamic>?)
              ?.map(
                (e) => HandlerAssetCodeAdminItem.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          [],
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$HandlerAssetCodeAdminGenerateResponseToJson(
  HandlerAssetCodeAdminGenerateResponse instance,
) => <String, dynamic>{
  'items': instance.items?.map((e) => e.toJson()).toList(),
  'total': instance.total,
};

HandlerAssetCodeAdminItem _$HandlerAssetCodeAdminItemFromJson(
  Map<String, dynamic> json,
) => HandlerAssetCodeAdminItem(
  assetType: json['asset_type'] as String?,
  code: json['code'] as String?,
  createdAt: json['created_at'] as String?,
  id: (json['id'] as num?)?.toInt(),
  seq: (json['seq'] as num?)?.toInt(),
  status: handlerAssetCodeAdminItemStatusNullableFromJson(json['status']),
  usedAt: json['used_at'] as String?,
);

Map<String, dynamic> _$HandlerAssetCodeAdminItemToJson(
  HandlerAssetCodeAdminItem instance,
) => <String, dynamic>{
  'asset_type': instance.assetType,
  'code': instance.code,
  'created_at': instance.createdAt,
  'id': instance.id,
  'seq': instance.seq,
  'status': handlerAssetCodeAdminItemStatusNullableToJson(instance.status),
  'used_at': instance.usedAt,
};

HandlerAssetCodeAdminListResponse _$HandlerAssetCodeAdminListResponseFromJson(
  Map<String, dynamic> json,
) => HandlerAssetCodeAdminListResponse(
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) =>
                HandlerAssetCodeAdminItem.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
  total: (json['total'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerAssetCodeAdminListResponseToJson(
  HandlerAssetCodeAdminListResponse instance,
) => <String, dynamic>{
  'items': instance.items?.map((e) => e.toJson()).toList(),
  'total': instance.total,
};

HandlerAssetDictResponse _$HandlerAssetDictResponseFromJson(
  Map<String, dynamic> json,
) => HandlerAssetDictResponse(
  consumableNames:
      (json['consumable_names'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      [],
  filterSpecs:
      (json['filter_specs'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      [],
  normalPartNames:
      (json['normal_part_names'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      [],
  partSpecs: json['part_specs'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$HandlerAssetDictResponseToJson(
  HandlerAssetDictResponse instance,
) => <String, dynamic>{
  'consumable_names': instance.consumableNames,
  'filter_specs': instance.filterSpecs,
  'normal_part_names': instance.normalPartNames,
  'part_specs': instance.partSpecs,
};

HandlerAssetEquipmentAsset _$HandlerAssetEquipmentAssetFromJson(
  Map<String, dynamic> json,
) => HandlerAssetEquipmentAsset(
  assetType: json['asset_type'] as String?,
  boundAt: json['bound_at'] as String?,
  code: json['code'] as String?,
  spec: json['spec'] as String?,
  status: json['status'] as String?,
  subStatus: json['sub_status'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$HandlerAssetEquipmentAssetToJson(
  HandlerAssetEquipmentAsset instance,
) => <String, dynamic>{
  'asset_type': instance.assetType,
  'bound_at': instance.boundAt,
  'code': instance.code,
  'spec': instance.spec,
  'status': instance.status,
  'sub_status': instance.subStatus,
  'updated_at': instance.updatedAt,
};

HandlerAssetEquipmentDetail _$HandlerAssetEquipmentDetailFromJson(
  Map<String, dynamic> json,
) => HandlerAssetEquipmentDetail(
  address: json['address'] as String?,
  assets:
      (json['assets'] as List<dynamic>?)
          ?.map(
            (e) =>
                HandlerAssetEquipmentAsset.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
  createdAt: json['created_at'] as String?,
  filters:
      (json['filters'] as List<dynamic>?)
          ?.map(
            (e) => HandlerAssetFilterSlot.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
  id: (json['id'] as num?)?.toInt(),
  model: json['model'] as String?,
  name: json['name'] as String?,
  ownership: json['ownership'] as String?,
  region: json['region'] as String?,
  sn: json['sn'] as String?,
  status: json['status'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$HandlerAssetEquipmentDetailToJson(
  HandlerAssetEquipmentDetail instance,
) => <String, dynamic>{
  'address': instance.address,
  'assets': instance.assets?.map((e) => e.toJson()).toList(),
  'created_at': instance.createdAt,
  'filters': instance.filters?.map((e) => e.toJson()).toList(),
  'id': instance.id,
  'model': instance.model,
  'name': instance.name,
  'ownership': instance.ownership,
  'region': instance.region,
  'sn': instance.sn,
  'status': instance.status,
  'updated_at': instance.updatedAt,
};

HandlerAssetEquipmentItem _$HandlerAssetEquipmentItemFromJson(
  Map<String, dynamic> json,
) => HandlerAssetEquipmentItem(
  createdAt: json['created_at'] as String?,
  id: (json['id'] as num?)?.toInt(),
  model: json['model'] as String?,
  name: json['name'] as String?,
  ownership: json['ownership'] as String?,
  region: json['region'] as String?,
  sn: json['sn'] as String?,
  status: json['status'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$HandlerAssetEquipmentItemToJson(
  HandlerAssetEquipmentItem instance,
) => <String, dynamic>{
  'created_at': instance.createdAt,
  'id': instance.id,
  'model': instance.model,
  'name': instance.name,
  'ownership': instance.ownership,
  'region': instance.region,
  'sn': instance.sn,
  'status': instance.status,
  'updated_at': instance.updatedAt,
};

HandlerAssetEquipmentListResponse _$HandlerAssetEquipmentListResponseFromJson(
  Map<String, dynamic> json,
) => HandlerAssetEquipmentListResponse(
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) =>
                HandlerAssetEquipmentItem.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
  total: (json['total'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerAssetEquipmentListResponseToJson(
  HandlerAssetEquipmentListResponse instance,
) => <String, dynamic>{
  'items': instance.items?.map((e) => e.toJson()).toList(),
  'total': instance.total,
};

HandlerAssetEventItem _$HandlerAssetEventItemFromJson(
  Map<String, dynamic> json,
) => HandlerAssetEventItem(
  assetCode: json['asset_code'] as String?,
  assetType: json['asset_type'] as String?,
  event: json['event'] as String?,
  fromStatus: json['from_status'] as String?,
  fromSubStatus: json['from_sub_status'] as String?,
  isCreate: json['is_create'] as bool?,
  operatorName: json['operator_name'] as String?,
  operatorPlatform: json['operator_platform'] as String?,
  relatedNo: json['related_no'] as String?,
  remark: json['remark'] as String?,
  time: json['time'] as String?,
  toStatus: json['to_status'] as String?,
  toSubStatus: json['to_sub_status'] as String?,
);

Map<String, dynamic> _$HandlerAssetEventItemToJson(
  HandlerAssetEventItem instance,
) => <String, dynamic>{
  'asset_code': instance.assetCode,
  'asset_type': instance.assetType,
  'event': instance.event,
  'from_status': instance.fromStatus,
  'from_sub_status': instance.fromSubStatus,
  'is_create': instance.isCreate,
  'operator_name': instance.operatorName,
  'operator_platform': instance.operatorPlatform,
  'related_no': instance.relatedNo,
  'remark': instance.remark,
  'time': instance.time,
  'to_status': instance.toStatus,
  'to_sub_status': instance.toSubStatus,
};

HandlerAssetEventListResponse _$HandlerAssetEventListResponseFromJson(
  Map<String, dynamic> json,
) => HandlerAssetEventListResponse(
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) => HandlerAssetEventItem.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
  total: (json['total'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerAssetEventListResponseToJson(
  HandlerAssetEventListResponse instance,
) => <String, dynamic>{
  'items': instance.items?.map((e) => e.toJson()).toList(),
  'total': instance.total,
};

HandlerAssetFilterSlot _$HandlerAssetFilterSlotFromJson(
  Map<String, dynamic> json,
) => HandlerAssetFilterSlot(
  installedAt: json['installed_at'] as String?,
  lifespanDay: (json['lifespan_day'] as num?)?.toInt(),
  module: json['module'] as String?,
  name: json['name'] as String?,
  seq: (json['seq'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerAssetFilterSlotToJson(
  HandlerAssetFilterSlot instance,
) => <String, dynamic>{
  'installed_at': instance.installedAt,
  'lifespan_day': instance.lifespanDay,
  'module': instance.module,
  'name': instance.name,
  'seq': instance.seq,
};

HandlerAssetItem _$HandlerAssetItemFromJson(Map<String, dynamic> json) =>
    HandlerAssetItem(
      assetType: json['asset_type'] as String?,
      borrowOrderNo: json['borrow_order_no'] as String?,
      borrowedAt: json['borrowed_at'] as String?,
      borrower: json['borrower'] == null
          ? null
          : HandlerAssetBorrowerRef.fromJson(
              json['borrower'] as Map<String, dynamic>,
            ),
      code: json['code'] as String?,
      codeSource: json['code_source'] as String?,
      createdAt: json['created_at'] as String?,
      device: json['device'] == null
          ? null
          : HandlerAssetRef.fromJson(json['device'] as Map<String, dynamic>),
      id: (json['id'] as num?)?.toInt(),
      spec: json['spec'] as String?,
      status: json['status'] as String?,
      subStatus: json['sub_status'] as String?,
      updatedAt: json['updated_at'] as String?,
      warehouse: json['warehouse'] == null
          ? null
          : HandlerAssetRef.fromJson(json['warehouse'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HandlerAssetItemToJson(HandlerAssetItem instance) =>
    <String, dynamic>{
      'asset_type': instance.assetType,
      'borrow_order_no': instance.borrowOrderNo,
      'borrowed_at': instance.borrowedAt,
      'borrower': instance.borrower?.toJson(),
      'code': instance.code,
      'code_source': instance.codeSource,
      'created_at': instance.createdAt,
      'device': instance.device?.toJson(),
      'id': instance.id,
      'spec': instance.spec,
      'status': instance.status,
      'sub_status': instance.subStatus,
      'updated_at': instance.updatedAt,
      'warehouse': instance.warehouse?.toJson(),
    };

HandlerAssetListResponse _$HandlerAssetListResponseFromJson(
  Map<String, dynamic> json,
) => HandlerAssetListResponse(
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => HandlerAssetItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  total: (json['total'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerAssetListResponseToJson(
  HandlerAssetListResponse instance,
) => <String, dynamic>{
  'items': instance.items?.map((e) => e.toJson()).toList(),
  'total': instance.total,
};

HandlerAssetRef _$HandlerAssetRefFromJson(Map<String, dynamic> json) =>
    HandlerAssetRef(
      code: json['code'] as String?,
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$HandlerAssetRefToJson(HandlerAssetRef instance) =>
    <String, dynamic>{
      'code': instance.code,
      'id': instance.id,
      'name': instance.name,
    };

HandlerAssetStockChangeItem _$HandlerAssetStockChangeItemFromJson(
  Map<String, dynamic> json,
) => HandlerAssetStockChangeItem(
  after: (json['after'] as num?)?.toInt(),
  before: (json['before'] as num?)?.toInt(),
  change: (json['change'] as num?)?.toInt(),
  operatorName: json['operator_name'] as String?,
  operatorPlatform: json['operator_platform'] as String?,
  relatedNo: json['related_no'] as String?,
  remark: json['remark'] as String?,
  time: json['time'] as String?,
  type: json['type'] as String?,
);

Map<String, dynamic> _$HandlerAssetStockChangeItemToJson(
  HandlerAssetStockChangeItem instance,
) => <String, dynamic>{
  'after': instance.after,
  'before': instance.before,
  'change': instance.change,
  'operator_name': instance.operatorName,
  'operator_platform': instance.operatorPlatform,
  'related_no': instance.relatedNo,
  'remark': instance.remark,
  'time': instance.time,
  'type': instance.type,
};

HandlerAssetStockChangeListResponse
_$HandlerAssetStockChangeListResponseFromJson(Map<String, dynamic> json) =>
    HandlerAssetStockChangeListResponse(
      items:
          (json['items'] as List<dynamic>?)
              ?.map(
                (e) => HandlerAssetStockChangeItem.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          [],
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$HandlerAssetStockChangeListResponseToJson(
  HandlerAssetStockChangeListResponse instance,
) => <String, dynamic>{
  'items': instance.items?.map((e) => e.toJson()).toList(),
  'total': instance.total,
};

HandlerAssetStockItem _$HandlerAssetStockItemFromJson(
  Map<String, dynamic> json,
) => HandlerAssetStockItem(
  createdAt: json['created_at'] as String?,
  id: (json['id'] as num?)?.toInt(),
  kind: json['kind'] as String?,
  name: json['name'] as String?,
  quantity: (json['quantity'] as num?)?.toInt(),
  spec: json['spec'] as String?,
  unit: json['unit'] as String?,
  updatedAt: json['updated_at'] as String?,
  warehouse: json['warehouse'] == null
      ? null
      : HandlerAssetRef.fromJson(json['warehouse'] as Map<String, dynamic>),
);

Map<String, dynamic> _$HandlerAssetStockItemToJson(
  HandlerAssetStockItem instance,
) => <String, dynamic>{
  'created_at': instance.createdAt,
  'id': instance.id,
  'kind': instance.kind,
  'name': instance.name,
  'quantity': instance.quantity,
  'spec': instance.spec,
  'unit': instance.unit,
  'updated_at': instance.updatedAt,
  'warehouse': instance.warehouse?.toJson(),
};

HandlerAssetStockListResponse _$HandlerAssetStockListResponseFromJson(
  Map<String, dynamic> json,
) => HandlerAssetStockListResponse(
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) => HandlerAssetStockItem.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
  total: (json['total'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerAssetStockListResponseToJson(
  HandlerAssetStockListResponse instance,
) => <String, dynamic>{
  'items': instance.items?.map((e) => e.toJson()).toList(),
  'total': instance.total,
};

HandlerBoardAdminDeviceRank _$HandlerBoardAdminDeviceRankFromJson(
  Map<String, dynamic> json,
) => HandlerBoardAdminDeviceRank(
  deviceId: (json['device_id'] as num?)?.toInt(),
  deviceSn: json['device_sn'] as String?,
  name: json['name'] as String?,
  volumeMl: (json['volume_ml'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerBoardAdminDeviceRankToJson(
  HandlerBoardAdminDeviceRank instance,
) => <String, dynamic>{
  'device_id': instance.deviceId,
  'device_sn': instance.deviceSn,
  'name': instance.name,
  'volume_ml': instance.volumeMl,
};

HandlerBoardAdminDeviceResponse _$HandlerBoardAdminDeviceResponseFromJson(
  Map<String, dynamic> json,
) => HandlerBoardAdminDeviceResponse(
  distribution:
      (json['distribution'] as List<dynamic>?)
          ?.map(
            (e) =>
                HandlerBoardAdminStatusItem.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
  lastSyncAt: json['last_sync_at'] as String?,
  offlineCount: (json['offline_count'] as num?)?.toInt(),
  onlineCount: (json['online_count'] as num?)?.toInt(),
  totalCount: (json['total_count'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerBoardAdminDeviceResponseToJson(
  HandlerBoardAdminDeviceResponse instance,
) => <String, dynamic>{
  'distribution': instance.distribution?.map((e) => e.toJson()).toList(),
  'last_sync_at': instance.lastSyncAt,
  'offline_count': instance.offlineCount,
  'online_count': instance.onlineCount,
  'total_count': instance.totalCount,
};

HandlerBoardAdminDispenseResponse _$HandlerBoardAdminDispenseResponseFromJson(
  Map<String, dynamic> json,
) => HandlerBoardAdminDispenseResponse(
  lastMonth: json['last_month'] == null
      ? null
      : HandlerBoardAdminVolumeCompare.fromJson(
          json['last_month'] as Map<String, dynamic>,
        ),
  month: json['month'] == null
      ? null
      : HandlerBoardAdminVolumeCompare.fromJson(
          json['month'] as Map<String, dynamic>,
        ),
  today: json['today'] == null
      ? null
      : HandlerBoardAdminVolumeCompare.fromJson(
          json['today'] as Map<String, dynamic>,
        ),
  total: json['total'] == null
      ? null
      : HandlerBoardAdminVolumeCompare.fromJson(
          json['total'] as Map<String, dynamic>,
        ),
  trend:
      (json['trend'] as List<dynamic>?)
          ?.map(
            (e) =>
                HandlerBoardAdminMonthItem.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
  yesterday: json['yesterday'] == null
      ? null
      : HandlerBoardAdminVolumeCompare.fromJson(
          json['yesterday'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$HandlerBoardAdminDispenseResponseToJson(
  HandlerBoardAdminDispenseResponse instance,
) => <String, dynamic>{
  'last_month': instance.lastMonth?.toJson(),
  'month': instance.month?.toJson(),
  'today': instance.today?.toJson(),
  'total': instance.total?.toJson(),
  'trend': instance.trend?.map((e) => e.toJson()).toList(),
  'yesterday': instance.yesterday?.toJson(),
};

HandlerBoardAdminDistributionResponse
_$HandlerBoardAdminDistributionResponseFromJson(Map<String, dynamic> json) =>
    HandlerBoardAdminDistributionResponse(
      districtVolumes:
          (json['district_volumes'] as List<dynamic>?)
              ?.map(
                (e) => HandlerBoardAdminDistrictVolume.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          [],
      districts:
          (json['districts'] as List<dynamic>?)
              ?.map(
                (e) => HandlerBoardAdminDistrictShare.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          [],
      provinceCount: (json['province_count'] as num?)?.toInt(),
      provinces:
          (json['provinces'] as List<dynamic>?)
              ?.map(
                (e) => HandlerBoardAdminProvinceShare.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          [],
      totalCount: (json['total_count'] as num?)?.toInt(),
      totalVolumeMl: (json['total_volume_ml'] as num?)?.toInt(),
    );

Map<String, dynamic> _$HandlerBoardAdminDistributionResponseToJson(
  HandlerBoardAdminDistributionResponse instance,
) => <String, dynamic>{
  'district_volumes': instance.districtVolumes?.map((e) => e.toJson()).toList(),
  'districts': instance.districts?.map((e) => e.toJson()).toList(),
  'province_count': instance.provinceCount,
  'provinces': instance.provinces?.map((e) => e.toJson()).toList(),
  'total_count': instance.totalCount,
  'total_volume_ml': instance.totalVolumeMl,
};

HandlerBoardAdminDistrictShare _$HandlerBoardAdminDistrictShareFromJson(
  Map<String, dynamic> json,
) => HandlerBoardAdminDistrictShare(
  deviceCount: (json['device_count'] as num?)?.toInt(),
  province: json['province'] as String?,
  provinceCode: json['province_code'] as String?,
  region: json['region'] as String?,
  regionCode: json['region_code'] as String?,
  regionTh: json['region_th'] as String?,
);

Map<String, dynamic> _$HandlerBoardAdminDistrictShareToJson(
  HandlerBoardAdminDistrictShare instance,
) => <String, dynamic>{
  'device_count': instance.deviceCount,
  'province': instance.province,
  'province_code': instance.provinceCode,
  'region': instance.region,
  'region_code': instance.regionCode,
  'region_th': instance.regionTh,
};

HandlerBoardAdminDistrictVolume _$HandlerBoardAdminDistrictVolumeFromJson(
  Map<String, dynamic> json,
) => HandlerBoardAdminDistrictVolume(
  province: json['province'] as String?,
  provinceCode: json['province_code'] as String?,
  ratio: (json['ratio'] as num?)?.toDouble(),
  region: json['region'] as String?,
  regionCode: json['region_code'] as String?,
  regionTh: json['region_th'] as String?,
  volumeMl: (json['volume_ml'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerBoardAdminDistrictVolumeToJson(
  HandlerBoardAdminDistrictVolume instance,
) => <String, dynamic>{
  'province': instance.province,
  'province_code': instance.provinceCode,
  'ratio': instance.ratio,
  'region': instance.region,
  'region_code': instance.regionCode,
  'region_th': instance.regionTh,
  'volume_ml': instance.volumeMl,
};

HandlerBoardAdminHealthItem _$HandlerBoardAdminHealthItemFromJson(
  Map<String, dynamic> json,
) => HandlerBoardAdminHealthItem(
  latencyMs: (json['latency_ms'] as num?)?.toInt(),
  name: handlerBoardAdminHealthItemNameNullableFromJson(json['name']),
  ok: json['ok'] as bool?,
);

Map<String, dynamic> _$HandlerBoardAdminHealthItemToJson(
  HandlerBoardAdminHealthItem instance,
) => <String, dynamic>{
  'latency_ms': instance.latencyMs,
  'name': handlerBoardAdminHealthItemNameNullableToJson(instance.name),
  'ok': instance.ok,
};

HandlerBoardAdminHealthResponse _$HandlerBoardAdminHealthResponseFromJson(
  Map<String, dynamic> json,
) => HandlerBoardAdminHealthResponse(
  components:
      (json['components'] as List<dynamic>?)
          ?.map(
            (e) =>
                HandlerBoardAdminHealthItem.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
  lastSyncAt: json['last_sync_at'] as String?,
  serverTime: json['server_time'] as String?,
  status: handlerBoardAdminHealthResponseStatusNullableFromJson(json['status']),
  timezone: json['timezone'] as String?,
);

Map<String, dynamic> _$HandlerBoardAdminHealthResponseToJson(
  HandlerBoardAdminHealthResponse instance,
) => <String, dynamic>{
  'components': instance.components?.map((e) => e.toJson()).toList(),
  'last_sync_at': instance.lastSyncAt,
  'server_time': instance.serverTime,
  'status': handlerBoardAdminHealthResponseStatusNullableToJson(
    instance.status,
  ),
  'timezone': instance.timezone,
};

HandlerBoardAdminHeatItem _$HandlerBoardAdminHeatItemFromJson(
  Map<String, dynamic> json,
) => HandlerBoardAdminHeatItem(
  deviceId: (json['device_id'] as num?)?.toInt(),
  deviceSn: json['device_sn'] as String?,
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  name: json['name'] as String?,
  volumeMl: (json['volume_ml'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerBoardAdminHeatItemToJson(
  HandlerBoardAdminHeatItem instance,
) => <String, dynamic>{
  'device_id': instance.deviceId,
  'device_sn': instance.deviceSn,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'name': instance.name,
  'volume_ml': instance.volumeMl,
};

HandlerBoardAdminMonthItem _$HandlerBoardAdminMonthItemFromJson(
  Map<String, dynamic> json,
) => HandlerBoardAdminMonthItem(
  cumulativeMl: (json['cumulative_ml'] as num?)?.toInt(),
  hasData: json['has_data'] as bool?,
  month: json['month'] as String?,
  volumeMl: (json['volume_ml'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerBoardAdminMonthItemToJson(
  HandlerBoardAdminMonthItem instance,
) => <String, dynamic>{
  'cumulative_ml': instance.cumulativeMl,
  'has_data': instance.hasData,
  'month': instance.month,
  'volume_ml': instance.volumeMl,
};

HandlerBoardAdminOverviewResponse _$HandlerBoardAdminOverviewResponseFromJson(
  Map<String, dynamic> json,
) => HandlerBoardAdminOverviewResponse(
  device: json['device'] == null
      ? null
      : HandlerBoardAdminDeviceResponse.fromJson(
          json['device'] as Map<String, dynamic>,
        ),
  dispense: json['dispense'] == null
      ? null
      : HandlerBoardAdminDispenseResponse.fromJson(
          json['dispense'] as Map<String, dynamic>,
        ),
  distribution: json['distribution'] == null
      ? null
      : HandlerBoardAdminDistributionResponse.fromJson(
          json['distribution'] as Map<String, dynamic>,
        ),
  region: json['region'] == null
      ? null
      : HandlerBoardAdminRegionResponse.fromJson(
          json['region'] as Map<String, dynamic>,
        ),
  user: json['user'] == null
      ? null
      : HandlerBoardAdminUserResponse.fromJson(
          json['user'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$HandlerBoardAdminOverviewResponseToJson(
  HandlerBoardAdminOverviewResponse instance,
) => <String, dynamic>{
  'device': instance.device?.toJson(),
  'dispense': instance.dispense?.toJson(),
  'distribution': instance.distribution?.toJson(),
  'region': instance.region?.toJson(),
  'user': instance.user?.toJson(),
};

HandlerBoardAdminProvinceShare _$HandlerBoardAdminProvinceShareFromJson(
  Map<String, dynamic> json,
) => HandlerBoardAdminProvinceShare(
  deviceCount: (json['device_count'] as num?)?.toInt(),
  lastMonthCount: (json['last_month_count'] as num?)?.toInt(),
  momGrowth: (json['mom_growth'] as num?)?.toDouble(),
  ratio: (json['ratio'] as num?)?.toDouble(),
  region: json['region'] as String?,
  regionCode: json['region_code'] as String?,
  regionEn: json['region_en'] as String?,
);

Map<String, dynamic> _$HandlerBoardAdminProvinceShareToJson(
  HandlerBoardAdminProvinceShare instance,
) => <String, dynamic>{
  'device_count': instance.deviceCount,
  'last_month_count': instance.lastMonthCount,
  'mom_growth': instance.momGrowth,
  'ratio': instance.ratio,
  'region': instance.region,
  'region_code': instance.regionCode,
  'region_en': instance.regionEn,
};

HandlerBoardAdminRegionItem _$HandlerBoardAdminRegionItemFromJson(
  Map<String, dynamic> json,
) => HandlerBoardAdminRegionItem(
  deviceCount: (json['device_count'] as num?)?.toInt(),
  region: json['region'] as String?,
  regionCode: json['region_code'] as String?,
  volumeMl: (json['volume_ml'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerBoardAdminRegionItemToJson(
  HandlerBoardAdminRegionItem instance,
) => <String, dynamic>{
  'device_count': instance.deviceCount,
  'region': instance.region,
  'region_code': instance.regionCode,
  'volume_ml': instance.volumeMl,
};

HandlerBoardAdminRegionResponse _$HandlerBoardAdminRegionResponseFromJson(
  Map<String, dynamic> json,
) => HandlerBoardAdminRegionResponse(
  heatmap:
      (json['heatmap'] as List<dynamic>?)
          ?.map(
            (e) =>
                HandlerBoardAdminHeatItem.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
  regions:
      (json['regions'] as List<dynamic>?)
          ?.map(
            (e) =>
                HandlerBoardAdminRegionItem.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
);

Map<String, dynamic> _$HandlerBoardAdminRegionResponseToJson(
  HandlerBoardAdminRegionResponse instance,
) => <String, dynamic>{
  'heatmap': instance.heatmap?.map((e) => e.toJson()).toList(),
  'regions': instance.regions?.map((e) => e.toJson()).toList(),
};

HandlerBoardAdminStatusItem _$HandlerBoardAdminStatusItemFromJson(
  Map<String, dynamic> json,
) => HandlerBoardAdminStatusItem(
  count: (json['count'] as num?)?.toInt(),
  status: handlerBoardAdminStatusItemStatusNullableFromJson(json['status']),
);

Map<String, dynamic> _$HandlerBoardAdminStatusItemToJson(
  HandlerBoardAdminStatusItem instance,
) => <String, dynamic>{
  'count': instance.count,
  'status': handlerBoardAdminStatusItemStatusNullableToJson(instance.status),
};

HandlerBoardAdminTickerItem _$HandlerBoardAdminTickerItemFromJson(
  Map<String, dynamic> json,
) => HandlerBoardAdminTickerItem(
  count: (json['count'] as num?)?.toInt(),
  region: json['region'] as String?,
  regionCode: json['region_code'] as String?,
  type: handlerBoardAdminTickerItemTypeNullableFromJson(json['type']),
);

Map<String, dynamic> _$HandlerBoardAdminTickerItemToJson(
  HandlerBoardAdminTickerItem instance,
) => <String, dynamic>{
  'count': instance.count,
  'region': instance.region,
  'region_code': instance.regionCode,
  'type': handlerBoardAdminTickerItemTypeNullableToJson(instance.type),
};

HandlerBoardAdminTickerResponse _$HandlerBoardAdminTickerResponseFromJson(
  Map<String, dynamic> json,
) => HandlerBoardAdminTickerResponse(
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) =>
                HandlerBoardAdminTickerItem.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
  total: (json['total'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerBoardAdminTickerResponseToJson(
  HandlerBoardAdminTickerResponse instance,
) => <String, dynamic>{
  'items': instance.items?.map((e) => e.toJson()).toList(),
  'total': instance.total,
};

HandlerBoardAdminUserResponse _$HandlerBoardAdminUserResponseFromJson(
  Map<String, dynamic> json,
) => HandlerBoardAdminUserResponse(
  activeDays: (json['active_days'] as num?)?.toInt(),
  activeUsers: (json['active_users'] as num?)?.toInt(),
  lastMonthUsers: (json['last_month_users'] as num?)?.toInt(),
  topDevices:
      (json['top_devices'] as List<dynamic>?)
          ?.map(
            (e) =>
                HandlerBoardAdminDeviceRank.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
  totalUsers: (json['total_users'] as num?)?.toInt(),
  usersGrowth: (json['users_growth'] as num?)?.toDouble(),
);

Map<String, dynamic> _$HandlerBoardAdminUserResponseToJson(
  HandlerBoardAdminUserResponse instance,
) => <String, dynamic>{
  'active_days': instance.activeDays,
  'active_users': instance.activeUsers,
  'last_month_users': instance.lastMonthUsers,
  'top_devices': instance.topDevices?.map((e) => e.toJson()).toList(),
  'total_users': instance.totalUsers,
  'users_growth': instance.usersGrowth,
};

HandlerBoardAdminVolumeCompare _$HandlerBoardAdminVolumeCompareFromJson(
  Map<String, dynamic> json,
) => HandlerBoardAdminVolumeCompare(
  compareMl: (json['compare_ml'] as num?)?.toInt(),
  growth: (json['growth'] as num?)?.toDouble(),
  volumeMl: (json['volume_ml'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerBoardAdminVolumeCompareToJson(
  HandlerBoardAdminVolumeCompare instance,
) => <String, dynamic>{
  'compare_ml': instance.compareMl,
  'growth': instance.growth,
  'volume_ml': instance.volumeMl,
};

HandlerConfigAdminBrightnessLightItem
_$HandlerConfigAdminBrightnessLightItemFromJson(Map<String, dynamic> json) =>
    HandlerConfigAdminBrightnessLightItem(
      endLux: (json['end_lux'] as num?)?.toInt(),
      nits: (json['nits'] as num?)?.toInt(),
    );

Map<String, dynamic> _$HandlerConfigAdminBrightnessLightItemToJson(
  HandlerConfigAdminBrightnessLightItem instance,
) => <String, dynamic>{'end_lux': instance.endLux, 'nits': instance.nits};

HandlerConfigAdminBrightnessLightSlot
_$HandlerConfigAdminBrightnessLightSlotFromJson(Map<String, dynamic> json) =>
    HandlerConfigAdminBrightnessLightSlot(
      endLux: (json['end_lux'] as num).toInt(),
      nits: (json['nits'] as num?)?.toInt(),
    );

Map<String, dynamic> _$HandlerConfigAdminBrightnessLightSlotToJson(
  HandlerConfigAdminBrightnessLightSlot instance,
) => <String, dynamic>{'end_lux': instance.endLux, 'nits': instance.nits};

HandlerConfigAdminBrightnessRequest
_$HandlerConfigAdminBrightnessRequestFromJson(Map<String, dynamic> json) =>
    HandlerConfigAdminBrightnessRequest(
      lightSlots:
          (json['light_slots'] as List<dynamic>?)
              ?.map(
                (e) => HandlerConfigAdminBrightnessLightSlot.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          [],
      slots:
          (json['slots'] as List<dynamic>?)
              ?.map(
                (e) => HandlerConfigAdminBrightnessSlot.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          [],
    );

Map<String, dynamic> _$HandlerConfigAdminBrightnessRequestToJson(
  HandlerConfigAdminBrightnessRequest instance,
) => <String, dynamic>{
  'light_slots': instance.lightSlots?.map((e) => e.toJson()).toList(),
  'slots': instance.slots?.map((e) => e.toJson()).toList(),
};

HandlerConfigAdminBrightnessResponse
_$HandlerConfigAdminBrightnessResponseFromJson(Map<String, dynamic> json) =>
    HandlerConfigAdminBrightnessResponse(
      lightSlots:
          (json['light_slots'] as List<dynamic>?)
              ?.map(
                (e) => HandlerConfigAdminBrightnessLightItem.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          [],
      slots:
          (json['slots'] as List<dynamic>?)
              ?.map(
                (e) => HandlerConfigAdminBrightnessSpan.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          [],
    );

Map<String, dynamic> _$HandlerConfigAdminBrightnessResponseToJson(
  HandlerConfigAdminBrightnessResponse instance,
) => <String, dynamic>{
  'light_slots': instance.lightSlots?.map((e) => e.toJson()).toList(),
  'slots': instance.slots?.map((e) => e.toJson()).toList(),
};

HandlerConfigAdminBrightnessSlot _$HandlerConfigAdminBrightnessSlotFromJson(
  Map<String, dynamic> json,
) => HandlerConfigAdminBrightnessSlot(
  nits: (json['nits'] as num?)?.toInt(),
  start: json['start'] as String,
);

Map<String, dynamic> _$HandlerConfigAdminBrightnessSlotToJson(
  HandlerConfigAdminBrightnessSlot instance,
) => <String, dynamic>{'nits': instance.nits, 'start': instance.start};

HandlerConfigAdminBrightnessSpan _$HandlerConfigAdminBrightnessSpanFromJson(
  Map<String, dynamic> json,
) => HandlerConfigAdminBrightnessSpan(
  end: json['end'] as String?,
  nits: (json['nits'] as num?)?.toInt(),
  start: json['start'] as String?,
);

Map<String, dynamic> _$HandlerConfigAdminBrightnessSpanToJson(
  HandlerConfigAdminBrightnessSpan instance,
) => <String, dynamic>{
  'end': instance.end,
  'nits': instance.nits,
  'start': instance.start,
};

HandlerConfigAdminDeviceParamsRequest
_$HandlerConfigAdminDeviceParamsRequestFromJson(Map<String, dynamic> json) =>
    HandlerConfigAdminDeviceParamsRequest(
      cycleFlushIntervalMinutes: (json['cycle_flush_interval_minutes'] as num?)
          ?.toInt(),
      cycleFlushSeconds: (json['cycle_flush_seconds'] as num?)?.toInt(),
      fullTankFlushSeconds: (json['full_tank_flush_seconds'] as num?)?.toInt(),
      lightDelaySeconds: (json['light_delay_seconds'] as num?)?.toInt(),
      lockDelaySeconds: (json['lock_delay_seconds'] as num?)?.toInt(),
      mineralPrerinseTdsPpm: (json['mineral_prerinse_tds_ppm'] as num?)
          ?.toInt(),
      ozoneIntervalMinutes: (json['ozone_interval_minutes'] as num?)?.toInt(),
      ozoneSeconds: (json['ozone_seconds'] as num?)?.toInt(),
      wasteFlushIntervalMinutes: (json['waste_flush_interval_minutes'] as num?)
          ?.toInt(),
      wasteFlushSeconds: (json['waste_flush_seconds'] as num?)?.toInt(),
    );

Map<String, dynamic> _$HandlerConfigAdminDeviceParamsRequestToJson(
  HandlerConfigAdminDeviceParamsRequest instance,
) => <String, dynamic>{
  'cycle_flush_interval_minutes': instance.cycleFlushIntervalMinutes,
  'cycle_flush_seconds': instance.cycleFlushSeconds,
  'full_tank_flush_seconds': instance.fullTankFlushSeconds,
  'light_delay_seconds': instance.lightDelaySeconds,
  'lock_delay_seconds': instance.lockDelaySeconds,
  'mineral_prerinse_tds_ppm': instance.mineralPrerinseTdsPpm,
  'ozone_interval_minutes': instance.ozoneIntervalMinutes,
  'ozone_seconds': instance.ozoneSeconds,
  'waste_flush_interval_minutes': instance.wasteFlushIntervalMinutes,
  'waste_flush_seconds': instance.wasteFlushSeconds,
};

HandlerConfigAdminDeviceParamsResponse
_$HandlerConfigAdminDeviceParamsResponseFromJson(Map<String, dynamic> json) =>
    HandlerConfigAdminDeviceParamsResponse(
      configured: json['configured'] as bool?,
      cycleFlushIntervalMinutes: (json['cycle_flush_interval_minutes'] as num?)
          ?.toInt(),
      cycleFlushSeconds: (json['cycle_flush_seconds'] as num?)?.toInt(),
      fullTankFlushSeconds: (json['full_tank_flush_seconds'] as num?)?.toInt(),
      lightDelaySeconds: (json['light_delay_seconds'] as num?)?.toInt(),
      lockDelaySeconds: (json['lock_delay_seconds'] as num?)?.toInt(),
      mineralPrerinseTdsPpm: (json['mineral_prerinse_tds_ppm'] as num?)
          ?.toInt(),
      ozoneIntervalMinutes: (json['ozone_interval_minutes'] as num?)?.toInt(),
      ozoneSeconds: (json['ozone_seconds'] as num?)?.toInt(),
      wasteFlushIntervalMinutes: (json['waste_flush_interval_minutes'] as num?)
          ?.toInt(),
      wasteFlushSeconds: (json['waste_flush_seconds'] as num?)?.toInt(),
    );

Map<String, dynamic> _$HandlerConfigAdminDeviceParamsResponseToJson(
  HandlerConfigAdminDeviceParamsResponse instance,
) => <String, dynamic>{
  'configured': instance.configured,
  'cycle_flush_interval_minutes': instance.cycleFlushIntervalMinutes,
  'cycle_flush_seconds': instance.cycleFlushSeconds,
  'full_tank_flush_seconds': instance.fullTankFlushSeconds,
  'light_delay_seconds': instance.lightDelaySeconds,
  'lock_delay_seconds': instance.lockDelaySeconds,
  'mineral_prerinse_tds_ppm': instance.mineralPrerinseTdsPpm,
  'ozone_interval_minutes': instance.ozoneIntervalMinutes,
  'ozone_seconds': instance.ozoneSeconds,
  'waste_flush_interval_minutes': instance.wasteFlushIntervalMinutes,
  'waste_flush_seconds': instance.wasteFlushSeconds,
};

HandlerConfigAdminFilterItem _$HandlerConfigAdminFilterItemFromJson(
  Map<String, dynamic> json,
) => HandlerConfigAdminFilterItem(
  lifespanDays: (json['lifespan_days'] as num?)?.toInt(),
  module: handlerConfigAdminFilterItemModuleNullableFromJson(json['module']),
  name: json['name'] as String?,
  seq: (json['seq'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerConfigAdminFilterItemToJson(
  HandlerConfigAdminFilterItem instance,
) => <String, dynamic>{
  'lifespan_days': instance.lifespanDays,
  'module': handlerConfigAdminFilterItemModuleNullableToJson(instance.module),
  'name': instance.name,
  'seq': instance.seq,
};

HandlerConfigAdminFilterLifespan _$HandlerConfigAdminFilterLifespanFromJson(
  Map<String, dynamic> json,
) => HandlerConfigAdminFilterLifespan(
  lifespanDays: (json['lifespan_days'] as num).toInt(),
  module: handlerConfigAdminFilterLifespanModuleFromJson(json['module']),
  seq: (json['seq'] as num).toInt(),
);

Map<String, dynamic> _$HandlerConfigAdminFilterLifespanToJson(
  HandlerConfigAdminFilterLifespan instance,
) => <String, dynamic>{
  'lifespan_days': instance.lifespanDays,
  'module': handlerConfigAdminFilterLifespanModuleToJson(instance.module),
  'seq': instance.seq,
};

HandlerConfigAdminFiltersRequest _$HandlerConfigAdminFiltersRequestFromJson(
  Map<String, dynamic> json,
) => HandlerConfigAdminFiltersRequest(
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) => HandlerConfigAdminFilterLifespan.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      [],
);

Map<String, dynamic> _$HandlerConfigAdminFiltersRequestToJson(
  HandlerConfigAdminFiltersRequest instance,
) => <String, dynamic>{'items': instance.items.map((e) => e.toJson()).toList()};

HandlerConfigAdminFiltersResponse _$HandlerConfigAdminFiltersResponseFromJson(
  Map<String, dynamic> json,
) => HandlerConfigAdminFiltersResponse(
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) => HandlerConfigAdminFilterItem.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      [],
);

Map<String, dynamic> _$HandlerConfigAdminFiltersResponseToJson(
  HandlerConfigAdminFiltersResponse instance,
) => <String, dynamic>{
  'items': instance.items?.map((e) => e.toJson()).toList(),
};

HandlerConfigAdminPriceRequest _$HandlerConfigAdminPriceRequestFromJson(
  Map<String, dynamic> json,
) => HandlerConfigAdminPriceRequest(
  mineralWaterCents: (json['mineral_water_cents'] as num?)?.toInt(),
  pureWaterCents: (json['pure_water_cents'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerConfigAdminPriceRequestToJson(
  HandlerConfigAdminPriceRequest instance,
) => <String, dynamic>{
  'mineral_water_cents': instance.mineralWaterCents,
  'pure_water_cents': instance.pureWaterCents,
};

HandlerConfigAdminPriceResponse _$HandlerConfigAdminPriceResponseFromJson(
  Map<String, dynamic> json,
) => HandlerConfigAdminPriceResponse(
  configured: json['configured'] as bool?,
  mineralWaterCents: (json['mineral_water_cents'] as num?)?.toInt(),
  pureWaterCents: (json['pure_water_cents'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerConfigAdminPriceResponseToJson(
  HandlerConfigAdminPriceResponse instance,
) => <String, dynamic>{
  'configured': instance.configured,
  'mineral_water_cents': instance.mineralWaterCents,
  'pure_water_cents': instance.pureWaterCents,
};

HandlerConfigAdminRuntimeItem _$HandlerConfigAdminRuntimeItemFromJson(
  Map<String, dynamic> json,
) => HandlerConfigAdminRuntimeItem(
  configured: json['configured'] as bool?,
  key: json['key'] as String?,
  label: json['label'] as String?,
  max: (json['max'] as num?)?.toDouble(),
  min: (json['min'] as num?)?.toDouble(),
  unit: json['unit'] as String?,
  value: json['value'],
);

Map<String, dynamic> _$HandlerConfigAdminRuntimeItemToJson(
  HandlerConfigAdminRuntimeItem instance,
) => <String, dynamic>{
  'configured': instance.configured,
  'key': instance.key,
  'label': instance.label,
  'max': instance.max,
  'min': instance.min,
  'unit': instance.unit,
  'value': instance.value,
};

HandlerConfigAdminRuntimeResponse _$HandlerConfigAdminRuntimeResponseFromJson(
  Map<String, dynamic> json,
) => HandlerConfigAdminRuntimeResponse(
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) => HandlerConfigAdminRuntimeItem.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      [],
);

Map<String, dynamic> _$HandlerConfigAdminRuntimeResponseToJson(
  HandlerConfigAdminRuntimeResponse instance,
) => <String, dynamic>{
  'items': instance.items?.map((e) => e.toJson()).toList(),
};

HandlerConfigAdminRuntimeSaveRequest
_$HandlerConfigAdminRuntimeSaveRequestFromJson(Map<String, dynamic> json) =>
    HandlerConfigAdminRuntimeSaveRequest(values: json['values'] as Object);

Map<String, dynamic> _$HandlerConfigAdminRuntimeSaveRequestToJson(
  HandlerConfigAdminRuntimeSaveRequest instance,
) => <String, dynamic>{'values': instance.values};

HandlerConfigAdminSlotsRequest _$HandlerConfigAdminSlotsRequestFromJson(
  Map<String, dynamic> json,
) => HandlerConfigAdminSlotsRequest(
  volumesMl:
      (json['volumes_ml'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      [],
);

Map<String, dynamic> _$HandlerConfigAdminSlotsRequestToJson(
  HandlerConfigAdminSlotsRequest instance,
) => <String, dynamic>{'volumes_ml': instance.volumesMl};

HandlerConfigAdminSlotsResponse _$HandlerConfigAdminSlotsResponseFromJson(
  Map<String, dynamic> json,
) => HandlerConfigAdminSlotsResponse(
  volumesMl:
      (json['volumes_ml'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      [],
);

Map<String, dynamic> _$HandlerConfigAdminSlotsResponseToJson(
  HandlerConfigAdminSlotsResponse instance,
) => <String, dynamic>{'volumes_ml': instance.volumesMl};

HandlerConfigAdminStorageLocalRequest
_$HandlerConfigAdminStorageLocalRequestFromJson(Map<String, dynamic> json) =>
    HandlerConfigAdminStorageLocalRequest(
      publicBaseUrl: json['public_base_url'] as String,
    );

Map<String, dynamic> _$HandlerConfigAdminStorageLocalRequestToJson(
  HandlerConfigAdminStorageLocalRequest instance,
) => <String, dynamic>{'public_base_url': instance.publicBaseUrl};

HandlerConfigAdminStorageLocalResponse
_$HandlerConfigAdminStorageLocalResponseFromJson(Map<String, dynamic> json) =>
    HandlerConfigAdminStorageLocalResponse(
      publicBaseUrl: json['public_base_url'] as String?,
    );

Map<String, dynamic> _$HandlerConfigAdminStorageLocalResponseToJson(
  HandlerConfigAdminStorageLocalResponse instance,
) => <String, dynamic>{'public_base_url': instance.publicBaseUrl};

HandlerConfigAdminStorageRequest _$HandlerConfigAdminStorageRequestFromJson(
  Map<String, dynamic> json,
) => HandlerConfigAdminStorageRequest(
  driver: handlerConfigAdminStorageRequestDriverFromJson(json['driver']),
  local: json['local'] == null
      ? null
      : HandlerConfigAdminStorageLocalRequest.fromJson(
          json['local'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$HandlerConfigAdminStorageRequestToJson(
  HandlerConfigAdminStorageRequest instance,
) => <String, dynamic>{
  'driver': handlerConfigAdminStorageRequestDriverToJson(instance.driver),
  'local': instance.local?.toJson(),
};

HandlerConfigAdminStorageResponse _$HandlerConfigAdminStorageResponseFromJson(
  Map<String, dynamic> json,
) => HandlerConfigAdminStorageResponse(
  driver: handlerConfigAdminStorageResponseDriverNullableFromJson(
    json['driver'],
  ),
  local: json['local'] == null
      ? null
      : HandlerConfigAdminStorageLocalResponse.fromJson(
          json['local'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$HandlerConfigAdminStorageResponseToJson(
  HandlerConfigAdminStorageResponse instance,
) => <String, dynamic>{
  'driver': handlerConfigAdminStorageResponseDriverNullableToJson(
    instance.driver,
  ),
  'local': instance.local?.toJson(),
};

HandlerConfigAdminTankItem _$HandlerConfigAdminTankItemFromJson(
  Map<String, dynamic> json,
) => HandlerConfigAdminTankItem(
  enabled: json['enabled'] as bool?,
  highLevelThresholdMl: (json['high_level_threshold_ml'] as num?)?.toInt(),
  mlPerMm: (json['ml_per_mm'] as num?)?.toDouble(),
  model: json['model'] as String,
  tankCapacityMl: (json['tank_capacity_ml'] as num?)?.toInt(),
  waterMakeThresholdMl: (json['water_make_threshold_ml'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerConfigAdminTankItemToJson(
  HandlerConfigAdminTankItem instance,
) => <String, dynamic>{
  'enabled': instance.enabled,
  'high_level_threshold_ml': instance.highLevelThresholdMl,
  'ml_per_mm': instance.mlPerMm,
  'model': instance.model,
  'tank_capacity_ml': instance.tankCapacityMl,
  'water_make_threshold_ml': instance.waterMakeThresholdMl,
};

HandlerConfigAdminTankRequest _$HandlerConfigAdminTankRequestFromJson(
  Map<String, dynamic> json,
) => HandlerConfigAdminTankRequest(
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) =>
                HandlerConfigAdminTankItem.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
);

Map<String, dynamic> _$HandlerConfigAdminTankRequestToJson(
  HandlerConfigAdminTankRequest instance,
) => <String, dynamic>{'items': instance.items.map((e) => e.toJson()).toList()};

HandlerConfigAdminTankResponse _$HandlerConfigAdminTankResponseFromJson(
  Map<String, dynamic> json,
) => HandlerConfigAdminTankResponse(
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) =>
                HandlerConfigAdminTankItem.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
);

Map<String, dynamic> _$HandlerConfigAdminTankResponseToJson(
  HandlerConfigAdminTankResponse instance,
) => <String, dynamic>{
  'items': instance.items?.map((e) => e.toJson()).toList(),
};

HandlerConfigAdminTankStatusRequest
_$HandlerConfigAdminTankStatusRequestFromJson(Map<String, dynamic> json) =>
    HandlerConfigAdminTankStatusRequest(
      status: handlerConfigAdminTankStatusRequestStatusFromJson(json['status']),
    );

Map<String, dynamic> _$HandlerConfigAdminTankStatusRequestToJson(
  HandlerConfigAdminTankStatusRequest instance,
) => <String, dynamic>{
  'status': handlerConfigAdminTankStatusRequestStatusToJson(instance.status),
};

HandlerConfigAdminVolumeRequest _$HandlerConfigAdminVolumeRequestFromJson(
  Map<String, dynamic> json,
) => HandlerConfigAdminVolumeRequest(volume: (json['volume'] as num).toInt());

Map<String, dynamic> _$HandlerConfigAdminVolumeRequestToJson(
  HandlerConfigAdminVolumeRequest instance,
) => <String, dynamic>{'volume': instance.volume};

HandlerConfigAdminVolumeResponse _$HandlerConfigAdminVolumeResponseFromJson(
  Map<String, dynamic> json,
) => HandlerConfigAdminVolumeResponse(
  configured: json['configured'] as bool?,
  volume: (json['volume'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerConfigAdminVolumeResponseToJson(
  HandlerConfigAdminVolumeResponse instance,
) => <String, dynamic>{
  'configured': instance.configured,
  'volume': instance.volume,
};

HandlerDeviceAdminAddressRequest _$HandlerDeviceAdminAddressRequestFromJson(
  Map<String, dynamic> json,
) => HandlerDeviceAdminAddressRequest(
  address: json['address'] as String?,
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  region: json['region'] as String?,
);

Map<String, dynamic> _$HandlerDeviceAdminAddressRequestToJson(
  HandlerDeviceAdminAddressRequest instance,
) => <String, dynamic>{
  'address': instance.address,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'region': instance.region,
};

HandlerDeviceAdminChipUIDRequest _$HandlerDeviceAdminChipUIDRequestFromJson(
  Map<String, dynamic> json,
) => HandlerDeviceAdminChipUIDRequest(chipUid: json['chip_uid'] as String?);

Map<String, dynamic> _$HandlerDeviceAdminChipUIDRequestToJson(
  HandlerDeviceAdminChipUIDRequest instance,
) => <String, dynamic>{'chip_uid': instance.chipUid};

HandlerDeviceAdminCreateRequest _$HandlerDeviceAdminCreateRequestFromJson(
  Map<String, dynamic> json,
) => HandlerDeviceAdminCreateRequest(
  address: json['address'] as String?,
  autoWaterEnabled: json['auto_water_enabled'] as bool?,
  chipUid: json['chip_uid'] as String?,
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  model: json['model'] as String,
  name: json['name'] as String,
  ownership: handlerDeviceAdminCreateRequestOwnershipNullableFromJson(
    json['ownership'],
  ),
  region: json['region'] as String,
  remark: json['remark'] as String?,
  saleEnabled: json['sale_enabled'] as bool?,
);

Map<String, dynamic> _$HandlerDeviceAdminCreateRequestToJson(
  HandlerDeviceAdminCreateRequest instance,
) => <String, dynamic>{
  'address': instance.address,
  'auto_water_enabled': instance.autoWaterEnabled,
  'chip_uid': instance.chipUid,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'model': instance.model,
  'name': instance.name,
  'ownership': handlerDeviceAdminCreateRequestOwnershipNullableToJson(
    instance.ownership,
  ),
  'region': instance.region,
  'remark': instance.remark,
  'sale_enabled': instance.saleEnabled,
};

HandlerDeviceAdminFilter _$HandlerDeviceAdminFilterFromJson(
  Map<String, dynamic> json,
) => HandlerDeviceAdminFilter(
  installedAt: json['installed_at'] as String?,
  lifespanDays: (json['lifespan_days'] as num?)?.toInt(),
  module: handlerDeviceAdminFilterModuleNullableFromJson(json['module']),
  name: json['name'] as String?,
  remainingDays: (json['remaining_days'] as num?)?.toInt(),
  seq: (json['seq'] as num?)?.toInt(),
  usedDays: (json['used_days'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerDeviceAdminFilterToJson(
  HandlerDeviceAdminFilter instance,
) => <String, dynamic>{
  'installed_at': instance.installedAt,
  'lifespan_days': instance.lifespanDays,
  'module': handlerDeviceAdminFilterModuleNullableToJson(instance.module),
  'name': instance.name,
  'remaining_days': instance.remainingDays,
  'seq': instance.seq,
  'used_days': instance.usedDays,
};

HandlerDeviceAdminFilterPosition _$HandlerDeviceAdminFilterPositionFromJson(
  Map<String, dynamic> json,
) => HandlerDeviceAdminFilterPosition(
  module: handlerDeviceAdminFilterPositionModuleFromJson(json['module']),
  seq: (json['seq'] as num).toInt(),
);

Map<String, dynamic> _$HandlerDeviceAdminFilterPositionToJson(
  HandlerDeviceAdminFilterPosition instance,
) => <String, dynamic>{
  'module': handlerDeviceAdminFilterPositionModuleToJson(instance.module),
  'seq': instance.seq,
};

HandlerDeviceAdminFilterResetRequest
_$HandlerDeviceAdminFilterResetRequestFromJson(Map<String, dynamic> json) =>
    HandlerDeviceAdminFilterResetRequest(
      filters:
          (json['filters'] as List<dynamic>?)
              ?.map(
                (e) => HandlerDeviceAdminFilterPosition.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          [],
    );

Map<String, dynamic> _$HandlerDeviceAdminFilterResetRequestToJson(
  HandlerDeviceAdminFilterResetRequest instance,
) => <String, dynamic>{
  'filters': instance.filters.map((e) => e.toJson()).toList(),
};

HandlerDeviceAdminItem _$HandlerDeviceAdminItemFromJson(
  Map<String, dynamic> json,
) => HandlerDeviceAdminItem(
  address: json['address'] as String?,
  alarmCount: (json['alarm_count'] as num?)?.toInt(),
  autoWaterEnabled: json['auto_water_enabled'] as bool?,
  blockers:
      (json['blockers'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      [],
  chipUid: json['chip_uid'] as String?,
  freeDispenseEnabled: json['free_dispense_enabled'] as bool?,
  id: (json['id'] as num?)?.toInt(),
  lastReportAt: json['last_report_at'] as String?,
  maintenanceEnabled: json['maintenance_enabled'] as bool?,
  model: json['model'] as String?,
  name: json['name'] as String?,
  networkStatus: json['network_status'] as String?,
  ownership: json['ownership'] as String?,
  region: json['region'] as String?,
  regionPath: json['region_path'] == null
      ? null
      : HandlerRegionPathResponse.fromJson(
          json['region_path'] as Map<String, dynamic>,
        ),
  runStatus: json['run_status'] as String?,
  saleEnabled: json['sale_enabled'] as bool?,
  sellable: json['sellable'] as bool?,
  sn: json['sn'] as String?,
  tankCapacityMl: (json['tank_capacity_ml'] as num?)?.toInt(),
  tdsMineral: (json['tds_mineral'] as num?)?.toInt(),
  tdsPure: (json['tds_pure'] as num?)?.toInt(),
  tdsRaw: (json['tds_raw'] as num?)?.toInt(),
  todayDispenseMl: (json['today_dispense_ml'] as num?)?.toInt(),
  waterLevelMl: (json['water_level_ml'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerDeviceAdminItemToJson(
  HandlerDeviceAdminItem instance,
) => <String, dynamic>{
  'address': instance.address,
  'alarm_count': instance.alarmCount,
  'auto_water_enabled': instance.autoWaterEnabled,
  'blockers': instance.blockers,
  'chip_uid': instance.chipUid,
  'free_dispense_enabled': instance.freeDispenseEnabled,
  'id': instance.id,
  'last_report_at': instance.lastReportAt,
  'maintenance_enabled': instance.maintenanceEnabled,
  'model': instance.model,
  'name': instance.name,
  'network_status': instance.networkStatus,
  'ownership': instance.ownership,
  'region': instance.region,
  'region_path': instance.regionPath?.toJson(),
  'run_status': instance.runStatus,
  'sale_enabled': instance.saleEnabled,
  'sellable': instance.sellable,
  'sn': instance.sn,
  'tank_capacity_ml': instance.tankCapacityMl,
  'tds_mineral': instance.tdsMineral,
  'tds_pure': instance.tdsPure,
  'tds_raw': instance.tdsRaw,
  'today_dispense_ml': instance.todayDispenseMl,
  'water_level_ml': instance.waterLevelMl,
};

HandlerDeviceAdminLightLockParams _$HandlerDeviceAdminLightLockParamsFromJson(
  Map<String, dynamic> json,
) => HandlerDeviceAdminLightLockParams(
  lightDelaySeconds: (json['light_delay_seconds'] as num?)?.toInt(),
  lockDelaySeconds: (json['lock_delay_seconds'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerDeviceAdminLightLockParamsToJson(
  HandlerDeviceAdminLightLockParams instance,
) => <String, dynamic>{
  'light_delay_seconds': instance.lightDelaySeconds,
  'lock_delay_seconds': instance.lockDelaySeconds,
};

HandlerDeviceAdminListResponse _$HandlerDeviceAdminListResponseFromJson(
  Map<String, dynamic> json,
) => HandlerDeviceAdminListResponse(
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) => HandlerDeviceAdminItem.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
  total: (json['total'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerDeviceAdminListResponseToJson(
  HandlerDeviceAdminListResponse instance,
) => <String, dynamic>{
  'items': instance.items?.map((e) => e.toJson()).toList(),
  'total': instance.total,
};

HandlerDeviceAdminNameRequest _$HandlerDeviceAdminNameRequestFromJson(
  Map<String, dynamic> json,
) => HandlerDeviceAdminNameRequest(name: json['name'] as String);

Map<String, dynamic> _$HandlerDeviceAdminNameRequestToJson(
  HandlerDeviceAdminNameRequest instance,
) => <String, dynamic>{'name': instance.name};

HandlerDeviceAdminParamsResponse _$HandlerDeviceAdminParamsResponseFromJson(
  Map<String, dynamic> json,
) => HandlerDeviceAdminParamsResponse(
  lightLock: json['light_lock'] == null
      ? null
      : HandlerDeviceAdminLightLockParams.fromJson(
          json['light_lock'] as Map<String, dynamic>,
        ),
  updatedAt: json['updated_at'] as String?,
  voice: json['voice'] == null
      ? null
      : HandlerDeviceAdminVoiceParams.fromJson(
          json['voice'] as Map<String, dynamic>,
        ),
  wash: json['wash'] == null
      ? null
      : HandlerDeviceAdminWashParams.fromJson(
          json['wash'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$HandlerDeviceAdminParamsResponseToJson(
  HandlerDeviceAdminParamsResponse instance,
) => <String, dynamic>{
  'light_lock': instance.lightLock?.toJson(),
  'updated_at': instance.updatedAt,
  'voice': instance.voice?.toJson(),
  'wash': instance.wash?.toJson(),
};

HandlerDeviceAdminParts _$HandlerDeviceAdminPartsFromJson(
  Map<String, dynamic> json,
) => HandlerDeviceAdminParts(
  relays:
      (json['relays'] as List<dynamic>?)
          ?.map(
            (e) => HandlerDeviceAdminRelay.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
  reportedAt: json['reported_at'] as String?,
);

Map<String, dynamic> _$HandlerDeviceAdminPartsToJson(
  HandlerDeviceAdminParts instance,
) => <String, dynamic>{
  'relays': instance.relays?.map((e) => e.toJson()).toList(),
  'reported_at': instance.reportedAt,
};

HandlerDeviceAdminPrice _$HandlerDeviceAdminPriceFromJson(
  Map<String, dynamic> json,
) => HandlerDeviceAdminPrice(
  mineralWaterCents: (json['mineral_water_cents'] as num?)?.toInt(),
  pureWaterCents: (json['pure_water_cents'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerDeviceAdminPriceToJson(
  HandlerDeviceAdminPrice instance,
) => <String, dynamic>{
  'mineral_water_cents': instance.mineralWaterCents,
  'pure_water_cents': instance.pureWaterCents,
};

HandlerDeviceAdminRelay _$HandlerDeviceAdminRelayFromJson(
  Map<String, dynamic> json,
) => HandlerDeviceAdminRelay(
  code: handlerDeviceAdminRelayCodeNullableFromJson(json['code']),
  on: json['on'] as bool?,
);

Map<String, dynamic> _$HandlerDeviceAdminRelayToJson(
  HandlerDeviceAdminRelay instance,
) => <String, dynamic>{
  'code': handlerDeviceAdminRelayCodeNullableToJson(instance.code),
  'on': instance.on,
};

HandlerDeviceAdminRemarkRequest _$HandlerDeviceAdminRemarkRequestFromJson(
  Map<String, dynamic> json,
) => HandlerDeviceAdminRemarkRequest(remark: json['remark'] as String?);

Map<String, dynamic> _$HandlerDeviceAdminRemarkRequestToJson(
  HandlerDeviceAdminRemarkRequest instance,
) => <String, dynamic>{'remark': instance.remark};

HandlerDeviceAdminReportRequest _$HandlerDeviceAdminReportRequestFromJson(
  Map<String, dynamic> json,
) => HandlerDeviceAdminReportRequest(
  boardOnline: json['board_online'] as bool?,
  externalWaterOk: json['external_water_ok'] as bool?,
  floatHigh: json['float_high'] as bool?,
  floatLow: json['float_low'] as bool?,
  flowMeterFault: json['flow_meter_fault'] as bool?,
  lastFullAt: json['last_full_at'] as String?,
  levelMm: (json['level_mm'] as num?)?.toInt(),
  relays: json['relays'] as Map<String, dynamic>?,
  tdsMineral: (json['tds_mineral'] as num?)?.toInt(),
  tdsPure: (json['tds_pure'] as num?)?.toInt(),
  tdsRaw: (json['tds_raw'] as num?)?.toInt(),
  tdsTank: (json['tds_tank'] as num?)?.toInt(),
  waterLevelMl: (json['water_level_ml'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerDeviceAdminReportRequestToJson(
  HandlerDeviceAdminReportRequest instance,
) => <String, dynamic>{
  'board_online': instance.boardOnline,
  'external_water_ok': instance.externalWaterOk,
  'float_high': instance.floatHigh,
  'float_low': instance.floatLow,
  'flow_meter_fault': instance.flowMeterFault,
  'last_full_at': instance.lastFullAt,
  'level_mm': instance.levelMm,
  'relays': instance.relays,
  'tds_mineral': instance.tdsMineral,
  'tds_pure': instance.tdsPure,
  'tds_raw': instance.tdsRaw,
  'tds_tank': instance.tdsTank,
  'water_level_ml': instance.waterLevelMl,
};

HandlerDeviceAdminResponse _$HandlerDeviceAdminResponseFromJson(
  Map<String, dynamic> json,
) => HandlerDeviceAdminResponse(
  address: json['address'] as String?,
  autoWaterEnabled: json['auto_water_enabled'] as bool?,
  blockers:
      (json['blockers'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      [],
  boardOnline: json['board_online'] as bool?,
  chipUid: json['chip_uid'] as String?,
  components: json['components'] == null
      ? null
      : HandlerDeviceAdminParts.fromJson(
          json['components'] as Map<String, dynamic>,
        ),
  createdAt: json['created_at'] as String?,
  externalWaterOk: json['external_water_ok'] as bool?,
  filters:
      (json['filters'] as List<dynamic>?)
          ?.map(
            (e) => HandlerDeviceAdminFilter.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
  firmwareVersion: json['firmware_version'] as String?,
  floatHigh: json['float_high'] as bool?,
  floatLow: json['float_low'] as bool?,
  flowMeterFault: json['flow_meter_fault'] as bool?,
  freeDispenseEnabled: json['free_dispense_enabled'] as bool?,
  id: (json['id'] as num?)?.toInt(),
  lastFullAt: json['last_full_at'] as String?,
  lastReportAt: json['last_report_at'] as String?,
  latitude: (json['latitude'] as num?)?.toDouble(),
  levelMm: (json['level_mm'] as num?)?.toInt(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  maintenanceEnabled: json['maintenance_enabled'] as bool?,
  meters:
      (json['meters'] as List<dynamic>?)
          ?.map(
            (e) => HandlerMeterAdminItem.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
  model: json['model'] as String?,
  modemVersion: json['modem_version'] as String?,
  name: json['name'] as String?,
  networkStatus: handlerDeviceAdminResponseNetworkStatusNullableFromJson(
    json['network_status'],
  ),
  onlineSince: json['online_since'] as String?,
  ownership: json['ownership'] as String?,
  price: json['price'] == null
      ? null
      : HandlerDeviceAdminPrice.fromJson(json['price'] as Map<String, dynamic>),
  region: json['region'] as String?,
  regionPath: json['region_path'] == null
      ? null
      : HandlerRegionPathResponse.fromJson(
          json['region_path'] as Map<String, dynamic>,
        ),
  remark: json['remark'] as String?,
  runStatus: handlerDeviceAdminResponseRunStatusNullableFromJson(
    json['run_status'],
  ),
  saleEnabled: json['sale_enabled'] as bool?,
  sellable: json['sellable'] as bool?,
  slotsMl:
      (json['slots_ml'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      [],
  sn: json['sn'] as String?,
  soldSinceFullMl: (json['sold_since_full_ml'] as num?)?.toInt(),
  tankCapacityMl: (json['tank_capacity_ml'] as num?)?.toInt(),
  tankState: handlerDeviceAdminResponseTankStateNullableFromJson(
    json['tank_state'],
  ),
  tdsMineral: (json['tds_mineral'] as num?)?.toInt(),
  tdsPure: (json['tds_pure'] as num?)?.toInt(),
  tdsRaw: (json['tds_raw'] as num?)?.toInt(),
  tdsTank: (json['tds_tank'] as num?)?.toInt(),
  todayDispenseMl: (json['today_dispense_ml'] as num?)?.toInt(),
  todayOrderCount: (json['today_order_count'] as num?)?.toInt(),
  totalDispenseMl: (json['total_dispense_ml'] as num?)?.toInt(),
  waterLevel: handlerDeviceAdminResponseWaterLevelNullableFromJson(
    json['water_level'],
  ),
  waterLevelMl: (json['water_level_ml'] as num?)?.toInt(),
  waterMakeThresholdMl: (json['water_make_threshold_ml'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerDeviceAdminResponseToJson(
  HandlerDeviceAdminResponse instance,
) => <String, dynamic>{
  'address': instance.address,
  'auto_water_enabled': instance.autoWaterEnabled,
  'blockers': instance.blockers,
  'board_online': instance.boardOnline,
  'chip_uid': instance.chipUid,
  'components': instance.components?.toJson(),
  'created_at': instance.createdAt,
  'external_water_ok': instance.externalWaterOk,
  'filters': instance.filters?.map((e) => e.toJson()).toList(),
  'firmware_version': instance.firmwareVersion,
  'float_high': instance.floatHigh,
  'float_low': instance.floatLow,
  'flow_meter_fault': instance.flowMeterFault,
  'free_dispense_enabled': instance.freeDispenseEnabled,
  'id': instance.id,
  'last_full_at': instance.lastFullAt,
  'last_report_at': instance.lastReportAt,
  'latitude': instance.latitude,
  'level_mm': instance.levelMm,
  'longitude': instance.longitude,
  'maintenance_enabled': instance.maintenanceEnabled,
  'meters': instance.meters?.map((e) => e.toJson()).toList(),
  'model': instance.model,
  'modem_version': instance.modemVersion,
  'name': instance.name,
  'network_status': handlerDeviceAdminResponseNetworkStatusNullableToJson(
    instance.networkStatus,
  ),
  'online_since': instance.onlineSince,
  'ownership': instance.ownership,
  'price': instance.price?.toJson(),
  'region': instance.region,
  'region_path': instance.regionPath?.toJson(),
  'remark': instance.remark,
  'run_status': handlerDeviceAdminResponseRunStatusNullableToJson(
    instance.runStatus,
  ),
  'sale_enabled': instance.saleEnabled,
  'sellable': instance.sellable,
  'slots_ml': instance.slotsMl,
  'sn': instance.sn,
  'sold_since_full_ml': instance.soldSinceFullMl,
  'tank_capacity_ml': instance.tankCapacityMl,
  'tank_state': handlerDeviceAdminResponseTankStateNullableToJson(
    instance.tankState,
  ),
  'tds_mineral': instance.tdsMineral,
  'tds_pure': instance.tdsPure,
  'tds_raw': instance.tdsRaw,
  'tds_tank': instance.tdsTank,
  'today_dispense_ml': instance.todayDispenseMl,
  'today_order_count': instance.todayOrderCount,
  'total_dispense_ml': instance.totalDispenseMl,
  'water_level': handlerDeviceAdminResponseWaterLevelNullableToJson(
    instance.waterLevel,
  ),
  'water_level_ml': instance.waterLevelMl,
  'water_make_threshold_ml': instance.waterMakeThresholdMl,
};

HandlerDeviceAdminSaveRequest _$HandlerDeviceAdminSaveRequestFromJson(
  Map<String, dynamic> json,
) => HandlerDeviceAdminSaveRequest(
  address: json['address'] as String?,
  autoWaterEnabled: json['auto_water_enabled'] as bool?,
  chipUid: json['chip_uid'] as String?,
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  model: json['model'] as String,
  name: json['name'] as String,
  ownership: handlerDeviceAdminSaveRequestOwnershipNullableFromJson(
    json['ownership'],
  ),
  region: json['region'] as String?,
  remark: json['remark'] as String?,
  saleEnabled: json['sale_enabled'] as bool?,
);

Map<String, dynamic> _$HandlerDeviceAdminSaveRequestToJson(
  HandlerDeviceAdminSaveRequest instance,
) => <String, dynamic>{
  'address': instance.address,
  'auto_water_enabled': instance.autoWaterEnabled,
  'chip_uid': instance.chipUid,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'model': instance.model,
  'name': instance.name,
  'ownership': handlerDeviceAdminSaveRequestOwnershipNullableToJson(
    instance.ownership,
  ),
  'region': instance.region,
  'remark': instance.remark,
  'sale_enabled': instance.saleEnabled,
};

HandlerDeviceAdminSlotsRequest _$HandlerDeviceAdminSlotsRequestFromJson(
  Map<String, dynamic> json,
) => HandlerDeviceAdminSlotsRequest(
  volumesMl:
      (json['volumes_ml'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      [],
);

Map<String, dynamic> _$HandlerDeviceAdminSlotsRequestToJson(
  HandlerDeviceAdminSlotsRequest instance,
) => <String, dynamic>{'volumes_ml': instance.volumesMl};

HandlerDeviceAdminVoiceParams _$HandlerDeviceAdminVoiceParamsFromJson(
  Map<String, dynamic> json,
) => HandlerDeviceAdminVoiceParams(
  speakerVolume: (json['speaker_volume'] as num?)?.toInt(),
  voiceEnabled: json['voice_enabled'] as bool?,
);

Map<String, dynamic> _$HandlerDeviceAdminVoiceParamsToJson(
  HandlerDeviceAdminVoiceParams instance,
) => <String, dynamic>{
  'speaker_volume': instance.speakerVolume,
  'voice_enabled': instance.voiceEnabled,
};

HandlerDeviceAdminVoiceRequest _$HandlerDeviceAdminVoiceRequestFromJson(
  Map<String, dynamic> json,
) => HandlerDeviceAdminVoiceRequest(
  speakerVolume: (json['speaker_volume'] as num?)?.toInt(),
  voiceEnabled: json['voice_enabled'] as bool,
);

Map<String, dynamic> _$HandlerDeviceAdminVoiceRequestToJson(
  HandlerDeviceAdminVoiceRequest instance,
) => <String, dynamic>{
  'speaker_volume': instance.speakerVolume,
  'voice_enabled': instance.voiceEnabled,
};

HandlerDeviceAdminWashParams _$HandlerDeviceAdminWashParamsFromJson(
  Map<String, dynamic> json,
) => HandlerDeviceAdminWashParams(
  cycleFlushIntervalMinutes: (json['cycle_flush_interval_minutes'] as num?)
      ?.toInt(),
  cycleFlushSeconds: (json['cycle_flush_seconds'] as num?)?.toInt(),
  fullTankFlushSeconds: (json['full_tank_flush_seconds'] as num?)?.toInt(),
  mineralPrerinseTdsPpm: (json['mineral_prerinse_tds_ppm'] as num?)?.toInt(),
  ozoneIntervalMinutes: (json['ozone_interval_minutes'] as num?)?.toInt(),
  ozoneSeconds: (json['ozone_seconds'] as num?)?.toInt(),
  wasteFlushIntervalMinutes: (json['waste_flush_interval_minutes'] as num?)
      ?.toInt(),
  wasteFlushSeconds: (json['waste_flush_seconds'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerDeviceAdminWashParamsToJson(
  HandlerDeviceAdminWashParams instance,
) => <String, dynamic>{
  'cycle_flush_interval_minutes': instance.cycleFlushIntervalMinutes,
  'cycle_flush_seconds': instance.cycleFlushSeconds,
  'full_tank_flush_seconds': instance.fullTankFlushSeconds,
  'mineral_prerinse_tds_ppm': instance.mineralPrerinseTdsPpm,
  'ozone_interval_minutes': instance.ozoneIntervalMinutes,
  'ozone_seconds': instance.ozoneSeconds,
  'waste_flush_interval_minutes': instance.wasteFlushIntervalMinutes,
  'waste_flush_seconds': instance.wasteFlushSeconds,
};

HandlerDeviceCommandAdminControlItem
_$HandlerDeviceCommandAdminControlItemFromJson(Map<String, dynamic> json) =>
    HandlerDeviceCommandAdminControlItem(
      blocker: handlerDeviceCommandAdminControlItemBlockerNullableFromJson(
        json['blocker'],
      ),
      enabled: json['enabled'] as bool?,
      key: handlerDeviceCommandAdminControlItemKeyNullableFromJson(json['key']),
      on: json['on'] as bool?,
    );

Map<String, dynamic> _$HandlerDeviceCommandAdminControlItemToJson(
  HandlerDeviceCommandAdminControlItem instance,
) => <String, dynamic>{
  'blocker': handlerDeviceCommandAdminControlItemBlockerNullableToJson(
    instance.blocker,
  ),
  'enabled': instance.enabled,
  'key': handlerDeviceCommandAdminControlItemKeyNullableToJson(instance.key),
  'on': instance.on,
};

HandlerDeviceCommandAdminControlsResponse
_$HandlerDeviceCommandAdminControlsResponseFromJson(
  Map<String, dynamic> json,
) => HandlerDeviceCommandAdminControlsResponse(
  boardOnline: json['board_online'] as bool?,
  busy: json['busy'] as bool?,
  dispenseMaxMl: (json['dispense_max_ml'] as num?)?.toInt(),
  dispenseMinMl: (json['dispense_min_ml'] as num?)?.toInt(),
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) => HandlerDeviceCommandAdminControlItem.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      [],
  mineralWaterCents: (json['mineral_water_cents'] as num?)?.toInt(),
  online: json['online'] as bool?,
  pureWaterCents: (json['pure_water_cents'] as num?)?.toInt(),
  runStatus: handlerDeviceCommandAdminControlsResponseRunStatusNullableFromJson(
    json['run_status'],
  ),
  waterLevelMl: (json['water_level_ml'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerDeviceCommandAdminControlsResponseToJson(
  HandlerDeviceCommandAdminControlsResponse instance,
) => <String, dynamic>{
  'board_online': instance.boardOnline,
  'busy': instance.busy,
  'dispense_max_ml': instance.dispenseMaxMl,
  'dispense_min_ml': instance.dispenseMinMl,
  'items': instance.items?.map((e) => e.toJson()).toList(),
  'mineral_water_cents': instance.mineralWaterCents,
  'online': instance.online,
  'pure_water_cents': instance.pureWaterCents,
  'run_status':
      handlerDeviceCommandAdminControlsResponseRunStatusNullableToJson(
        instance.runStatus,
      ),
  'water_level_ml': instance.waterLevelMl,
};

HandlerDeviceCommandAdminDispenseReportRequest
_$HandlerDeviceCommandAdminDispenseReportRequestFromJson(
  Map<String, dynamic> json,
) => HandlerDeviceCommandAdminDispenseReportRequest(
  dispensedMl: (json['dispensed_ml'] as num?)?.toInt(),
  event: handlerDeviceCommandAdminDispenseReportRequestEventFromJson(
    json['event'],
  ),
);

Map<String, dynamic> _$HandlerDeviceCommandAdminDispenseReportRequestToJson(
  HandlerDeviceCommandAdminDispenseReportRequest instance,
) => <String, dynamic>{
  'dispensed_ml': instance.dispensedMl,
  'event': handlerDeviceCommandAdminDispenseReportRequestEventToJson(
    instance.event,
  ),
};

HandlerDeviceCommandAdminDispenseRequest
_$HandlerDeviceCommandAdminDispenseRequestFromJson(Map<String, dynamic> json) =>
    HandlerDeviceCommandAdminDispenseRequest(
      volumeMl: (json['volume_ml'] as num).toInt(),
      waterType: handlerDeviceCommandAdminDispenseRequestWaterTypeFromJson(
        json['water_type'],
      ),
    );

Map<String, dynamic> _$HandlerDeviceCommandAdminDispenseRequestToJson(
  HandlerDeviceCommandAdminDispenseRequest instance,
) => <String, dynamic>{
  'volume_ml': instance.volumeMl,
  'water_type': handlerDeviceCommandAdminDispenseRequestWaterTypeToJson(
    instance.waterType,
  ),
};

HandlerDeviceCommandAdminFilterReset
_$HandlerDeviceCommandAdminFilterResetFromJson(Map<String, dynamic> json) =>
    HandlerDeviceCommandAdminFilterReset(
      lifespanDays: (json['lifespan_days'] as num?)?.toInt(),
      module: handlerDeviceCommandAdminFilterResetModuleNullableFromJson(
        json['module'],
      ),
      name: json['name'] as String?,
      seq: (json['seq'] as num?)?.toInt(),
    );

Map<String, dynamic> _$HandlerDeviceCommandAdminFilterResetToJson(
  HandlerDeviceCommandAdminFilterReset instance,
) => <String, dynamic>{
  'lifespan_days': instance.lifespanDays,
  'module': handlerDeviceCommandAdminFilterResetModuleNullableToJson(
    instance.module,
  ),
  'name': instance.name,
  'seq': instance.seq,
};

HandlerDeviceCommandAdminItem _$HandlerDeviceCommandAdminItemFromJson(
  Map<String, dynamic> json,
) => HandlerDeviceCommandAdminItem(
  completedAt: json['completed_at'] as String?,
  createdAt: json['created_at'] as String?,
  deviceId: (json['device_id'] as num?)?.toInt(),
  deviceModel: json['device_model'] as String?,
  deviceName: json['device_name'] as String?,
  deviceRegion: json['device_region'] as String?,
  deviceRegionCode: json['device_region_code'] as String?,
  deviceSn: json['device_sn'] as String?,
  dispensedMl: (json['dispensed_ml'] as num?)?.toInt(),
  executedAt: json['executed_at'] as String?,
  id: (json['id'] as num?)?.toInt(),
  operatorId: (json['operator_id'] as num?)?.toInt(),
  operatorName: json['operator_name'] as String?,
  params: json['params'] == null
      ? null
      : HandlerDeviceCommandAdminParams.fromJson(
          json['params'] as Map<String, dynamic>,
        ),
  pauseCount: (json['pause_count'] as num?)?.toInt(),
  result: json['result'] as String?,
  retryBlockedReason: json['retry_blocked_reason'] as String?,
  retryable: json['retryable'] as bool?,
  status: handlerDeviceCommandAdminItemStatusNullableFromJson(json['status']),
  type: json['type'] as String?,
);

Map<String, dynamic> _$HandlerDeviceCommandAdminItemToJson(
  HandlerDeviceCommandAdminItem instance,
) => <String, dynamic>{
  'completed_at': instance.completedAt,
  'created_at': instance.createdAt,
  'device_id': instance.deviceId,
  'device_model': instance.deviceModel,
  'device_name': instance.deviceName,
  'device_region': instance.deviceRegion,
  'device_region_code': instance.deviceRegionCode,
  'device_sn': instance.deviceSn,
  'dispensed_ml': instance.dispensedMl,
  'executed_at': instance.executedAt,
  'id': instance.id,
  'operator_id': instance.operatorId,
  'operator_name': instance.operatorName,
  'params': instance.params?.toJson(),
  'pause_count': instance.pauseCount,
  'result': instance.result,
  'retry_blocked_reason': instance.retryBlockedReason,
  'retryable': instance.retryable,
  'status': handlerDeviceCommandAdminItemStatusNullableToJson(instance.status),
  'type': instance.type,
};

HandlerDeviceCommandAdminListResponse
_$HandlerDeviceCommandAdminListResponseFromJson(Map<String, dynamic> json) =>
    HandlerDeviceCommandAdminListResponse(
      items:
          (json['items'] as List<dynamic>?)
              ?.map(
                (e) => HandlerDeviceCommandAdminItem.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          [],
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$HandlerDeviceCommandAdminListResponseToJson(
  HandlerDeviceCommandAdminListResponse instance,
) => <String, dynamic>{
  'items': instance.items?.map((e) => e.toJson()).toList(),
  'total': instance.total,
};

HandlerDeviceCommandAdminParams _$HandlerDeviceCommandAdminParamsFromJson(
  Map<String, dynamic> json,
) => HandlerDeviceCommandAdminParams(
  cycleFlushIntervalMinutes: (json['cycle_flush_interval_minutes'] as num?)
      ?.toInt(),
  cycleFlushSeconds: (json['cycle_flush_seconds'] as num?)?.toInt(),
  fileSha256: json['file_sha256'] as String?,
  fileSize: (json['file_size'] as num?)?.toInt(),
  filters:
      (json['filters'] as List<dynamic>?)
          ?.map(
            (e) => HandlerDeviceCommandAdminFilterReset.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      [],
  firmwareType: handlerDeviceCommandAdminParamsFirmwareTypeNullableFromJson(
    json['firmware_type'],
  ),
  firmwareVersion: json['firmware_version'] as String?,
  fullTankFlushSeconds: (json['full_tank_flush_seconds'] as num?)?.toInt(),
  host: json['host'] as String?,
  key: json['key'] as String?,
  label: json['label'] as String?,
  lightDelaySeconds: (json['light_delay_seconds'] as num?)?.toInt(),
  lockDelaySeconds: (json['lock_delay_seconds'] as num?)?.toInt(),
  mineralPrerinseTdsPpm: (json['mineral_prerinse_tds_ppm'] as num?)?.toInt(),
  model: json['model'] as String?,
  ozoneIntervalMinutes: (json['ozone_interval_minutes'] as num?)?.toInt(),
  ozoneSeconds: (json['ozone_seconds'] as num?)?.toInt(),
  port: (json['port'] as num?)?.toInt(),
  section: handlerDeviceCommandAdminParamsSectionNullableFromJson(
    json['section'],
  ),
  speakerVolume: (json['speaker_volume'] as num?)?.toInt(),
  taskNo: json['task_no'] as String?,
  upgradeType: handlerDeviceCommandAdminParamsUpgradeTypeNullableFromJson(
    json['upgrade_type'],
  ),
  url: json['url'] as String?,
  value: json['value'],
  voiceEnabled: json['voice_enabled'] as bool?,
  volumeMl: (json['volume_ml'] as num?)?.toInt(),
  wasteFlushIntervalMinutes: (json['waste_flush_interval_minutes'] as num?)
      ?.toInt(),
  wasteFlushSeconds: (json['waste_flush_seconds'] as num?)?.toInt(),
  waterType: handlerDeviceCommandAdminParamsWaterTypeNullableFromJson(
    json['water_type'],
  ),
);

Map<String, dynamic> _$HandlerDeviceCommandAdminParamsToJson(
  HandlerDeviceCommandAdminParams instance,
) => <String, dynamic>{
  'cycle_flush_interval_minutes': instance.cycleFlushIntervalMinutes,
  'cycle_flush_seconds': instance.cycleFlushSeconds,
  'file_sha256': instance.fileSha256,
  'file_size': instance.fileSize,
  'filters': instance.filters?.map((e) => e.toJson()).toList(),
  'firmware_type': handlerDeviceCommandAdminParamsFirmwareTypeNullableToJson(
    instance.firmwareType,
  ),
  'firmware_version': instance.firmwareVersion,
  'full_tank_flush_seconds': instance.fullTankFlushSeconds,
  'host': instance.host,
  'key': instance.key,
  'label': instance.label,
  'light_delay_seconds': instance.lightDelaySeconds,
  'lock_delay_seconds': instance.lockDelaySeconds,
  'mineral_prerinse_tds_ppm': instance.mineralPrerinseTdsPpm,
  'model': instance.model,
  'ozone_interval_minutes': instance.ozoneIntervalMinutes,
  'ozone_seconds': instance.ozoneSeconds,
  'port': instance.port,
  'section': handlerDeviceCommandAdminParamsSectionNullableToJson(
    instance.section,
  ),
  'speaker_volume': instance.speakerVolume,
  'task_no': instance.taskNo,
  'upgrade_type': handlerDeviceCommandAdminParamsUpgradeTypeNullableToJson(
    instance.upgradeType,
  ),
  'url': instance.url,
  'value': instance.value,
  'voice_enabled': instance.voiceEnabled,
  'volume_ml': instance.volumeMl,
  'waste_flush_interval_minutes': instance.wasteFlushIntervalMinutes,
  'waste_flush_seconds': instance.wasteFlushSeconds,
  'water_type': handlerDeviceCommandAdminParamsWaterTypeNullableToJson(
    instance.waterType,
  ),
};

HandlerDeviceCommandAdminServerConfigRequest
_$HandlerDeviceCommandAdminServerConfigRequestFromJson(
  Map<String, dynamic> json,
) => HandlerDeviceCommandAdminServerConfigRequest(
  host: json['host'] as String,
  port: (json['port'] as num).toInt(),
);

Map<String, dynamic> _$HandlerDeviceCommandAdminServerConfigRequestToJson(
  HandlerDeviceCommandAdminServerConfigRequest instance,
) => <String, dynamic>{'host': instance.host, 'port': instance.port};

HandlerDeviceCommandAdminStatsResponse
_$HandlerDeviceCommandAdminStatsResponseFromJson(Map<String, dynamic> json) =>
    HandlerDeviceCommandAdminStatsResponse(
      avgDurationSec: (json['avg_duration_sec'] as num?)?.toDouble(),
      successRate: (json['success_rate'] as num?)?.toDouble(),
      todayTotal: (json['today_total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$HandlerDeviceCommandAdminStatsResponseToJson(
  HandlerDeviceCommandAdminStatsResponse instance,
) => <String, dynamic>{
  'avg_duration_sec': instance.avgDurationSec,
  'success_rate': instance.successRate,
  'today_total': instance.todayTotal,
};

HandlerDeviceCommandAdminSwitchRequest
_$HandlerDeviceCommandAdminSwitchRequestFromJson(Map<String, dynamic> json) =>
    HandlerDeviceCommandAdminSwitchRequest(enabled: json['enabled'] as bool);

Map<String, dynamic> _$HandlerDeviceCommandAdminSwitchRequestToJson(
  HandlerDeviceCommandAdminSwitchRequest instance,
) => <String, dynamic>{'enabled': instance.enabled};

HandlerFirmwareAdminItem _$HandlerFirmwareAdminItemFromJson(
  Map<String, dynamic> json,
) => HandlerFirmwareAdminItem(
  channel: json['channel'] as String?,
  createdAt: json['created_at'] as String?,
  displayVersion: json['display_version'] as String?,
  downloadUrl: json['download_url'] as String?,
  fileName: json['file_name'] as String?,
  fileSha256: json['file_sha256'] as String?,
  fileSize: (json['file_size'] as num?)?.toInt(),
  hardwareId: (json['hardware_id'] as num?)?.toInt(),
  id: (json['id'] as num?)?.toInt(),
  imageLength: (json['image_length'] as num?)?.toInt(),
  isCurrent: json['is_current'] as bool?,
  keyId: (json['key_id'] as num?)?.toInt(),
  loadAddress: (json['load_address'] as num?)?.toInt(),
  manifestVersion: (json['manifest_version'] as num?)?.toInt(),
  minimumBootVersion: (json['minimum_boot_version'] as num?)?.toInt(),
  packageCrc32: json['package_crc32'] as String?,
  packageId: json['package_id'] as String?,
  packageLength: (json['package_length'] as num?)?.toInt(),
  releaseNote: json['release_note'] as String?,
  securityCounter: (json['security_counter'] as num?)?.toInt(),
  signatureAlgorithm: json['signature_algorithm'] as String?,
  signatureFormat: json['signature_format'] as String?,
  signatureVerified: json['signature_verified'] as bool?,
  trustedKeyFingerprint: json['trusted_key_fingerprint'] as String?,
  type: handlerFirmwareAdminItemTypeNullableFromJson(json['type']),
  uploaderId: (json['uploader_id'] as num?)?.toInt(),
  uploaderName: json['uploader_name'] as String?,
  version: json['version'] as String?,
);

Map<String, dynamic> _$HandlerFirmwareAdminItemToJson(
  HandlerFirmwareAdminItem instance,
) => <String, dynamic>{
  'channel': instance.channel,
  'created_at': instance.createdAt,
  'display_version': instance.displayVersion,
  'download_url': instance.downloadUrl,
  'file_name': instance.fileName,
  'file_sha256': instance.fileSha256,
  'file_size': instance.fileSize,
  'hardware_id': instance.hardwareId,
  'id': instance.id,
  'image_length': instance.imageLength,
  'is_current': instance.isCurrent,
  'key_id': instance.keyId,
  'load_address': instance.loadAddress,
  'manifest_version': instance.manifestVersion,
  'minimum_boot_version': instance.minimumBootVersion,
  'package_crc32': instance.packageCrc32,
  'package_id': instance.packageId,
  'package_length': instance.packageLength,
  'release_note': instance.releaseNote,
  'security_counter': instance.securityCounter,
  'signature_algorithm': instance.signatureAlgorithm,
  'signature_format': instance.signatureFormat,
  'signature_verified': instance.signatureVerified,
  'trusted_key_fingerprint': instance.trustedKeyFingerprint,
  'type': handlerFirmwareAdminItemTypeNullableToJson(instance.type),
  'uploader_id': instance.uploaderId,
  'uploader_name': instance.uploaderName,
  'version': instance.version,
};

HandlerFirmwareAdminListResponse _$HandlerFirmwareAdminListResponseFromJson(
  Map<String, dynamic> json,
) => HandlerFirmwareAdminListResponse(
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) => HandlerFirmwareAdminItem.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
  total: (json['total'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerFirmwareAdminListResponseToJson(
  HandlerFirmwareAdminListResponse instance,
) => <String, dynamic>{
  'items': instance.items?.map((e) => e.toJson()).toList(),
  'total': instance.total,
};

HandlerFirmwareTaskAdminCreateRequest
_$HandlerFirmwareTaskAdminCreateRequestFromJson(Map<String, dynamic> json) =>
    HandlerFirmwareTaskAdminCreateRequest(
      deviceIds:
          (json['device_ids'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      firmwareId: (json['firmware_id'] as num).toInt(),
      upgradeType:
          handlerFirmwareTaskAdminCreateRequestUpgradeTypeNullableFromJson(
            json['upgrade_type'],
          ),
    );

Map<String, dynamic> _$HandlerFirmwareTaskAdminCreateRequestToJson(
  HandlerFirmwareTaskAdminCreateRequest instance,
) => <String, dynamic>{
  'device_ids': instance.deviceIds,
  'firmware_id': instance.firmwareId,
  'upgrade_type':
      handlerFirmwareTaskAdminCreateRequestUpgradeTypeNullableToJson(
        instance.upgradeType,
      ),
};

HandlerFirmwareTaskAdminCreateResponse
_$HandlerFirmwareTaskAdminCreateResponseFromJson(Map<String, dynamic> json) =>
    HandlerFirmwareTaskAdminCreateResponse(
      items:
          (json['items'] as List<dynamic>?)
              ?.map(
                (e) => HandlerFirmwareTaskAdminItem.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          [],
    );

Map<String, dynamic> _$HandlerFirmwareTaskAdminCreateResponseToJson(
  HandlerFirmwareTaskAdminCreateResponse instance,
) => <String, dynamic>{
  'items': instance.items?.map((e) => e.toJson()).toList(),
};

HandlerFirmwareTaskAdminItem _$HandlerFirmwareTaskAdminItemFromJson(
  Map<String, dynamic> json,
) => HandlerFirmwareTaskAdminItem(
  bootUpdateState: (json['boot_update_state'] as num?)?.toInt(),
  bootloaderVersion: (json['bootloader_version'] as num?)?.toInt(),
  clientVersion: json['client_version'] as String?,
  commandId: (json['command_id'] as num?)?.toInt(),
  completedAt: json['completed_at'] as String?,
  createdAt: json['created_at'] as String?,
  deviceId: (json['device_id'] as num?)?.toInt(),
  deviceName: json['device_name'] as String?,
  deviceSn: json['device_sn'] as String?,
  deviceStatus: (json['device_status'] as num?)?.toInt(),
  dispatchedAt: json['dispatched_at'] as String?,
  displayVersion: json['display_version'] as String?,
  durableOffset: (json['durable_offset'] as num?)?.toInt(),
  failReason: json['fail_reason'] as String?,
  failureStage: json['failure_stage'] as String?,
  firmwareAfter: json['firmware_after'] as String?,
  firmwareBefore: json['firmware_before'] as String?,
  firmwareId: (json['firmware_id'] as num?)?.toInt(),
  firmwareType: handlerFirmwareTaskAdminItemFirmwareTypeNullableFromJson(
    json['firmware_type'],
  ),
  firmwareVersion: json['firmware_version'] as String?,
  fromVersion: json['from_version'] as String?,
  id: (json['id'] as num?)?.toInt(),
  imageId: (json['image_id'] as num?)?.toInt(),
  operatorId: (json['operator_id'] as num?)?.toInt(),
  operatorName: json['operator_name'] as String?,
  otaStartedAt: json['ota_started_at'] as String?,
  otaUpdatedAt: json['ota_updated_at'] as String?,
  packageId: json['package_id'] as String?,
  packageLength: (json['package_length'] as num?)?.toInt(),
  phase: json['phase'] as String?,
  retryCount: (json['retry_count'] as num?)?.toInt(),
  securityCounter: (json['security_counter'] as num?)?.toInt(),
  status: handlerFirmwareTaskAdminItemStatusNullableFromJson(json['status']),
  targetUidHex: json['target_uid_hex'] as String?,
  taskNo: json['task_no'] as String?,
  terminalOutcome: json['terminal_outcome'] as String?,
  transportError: json['transport_error'] as String?,
  upgradeType: handlerFirmwareTaskAdminItemUpgradeTypeNullableFromJson(
    json['upgrade_type'],
  ),
);

Map<String, dynamic> _$HandlerFirmwareTaskAdminItemToJson(
  HandlerFirmwareTaskAdminItem instance,
) => <String, dynamic>{
  'boot_update_state': instance.bootUpdateState,
  'bootloader_version': instance.bootloaderVersion,
  'client_version': instance.clientVersion,
  'command_id': instance.commandId,
  'completed_at': instance.completedAt,
  'created_at': instance.createdAt,
  'device_id': instance.deviceId,
  'device_name': instance.deviceName,
  'device_sn': instance.deviceSn,
  'device_status': instance.deviceStatus,
  'dispatched_at': instance.dispatchedAt,
  'display_version': instance.displayVersion,
  'durable_offset': instance.durableOffset,
  'fail_reason': instance.failReason,
  'failure_stage': instance.failureStage,
  'firmware_after': instance.firmwareAfter,
  'firmware_before': instance.firmwareBefore,
  'firmware_id': instance.firmwareId,
  'firmware_type': handlerFirmwareTaskAdminItemFirmwareTypeNullableToJson(
    instance.firmwareType,
  ),
  'firmware_version': instance.firmwareVersion,
  'from_version': instance.fromVersion,
  'id': instance.id,
  'image_id': instance.imageId,
  'operator_id': instance.operatorId,
  'operator_name': instance.operatorName,
  'ota_started_at': instance.otaStartedAt,
  'ota_updated_at': instance.otaUpdatedAt,
  'package_id': instance.packageId,
  'package_length': instance.packageLength,
  'phase': instance.phase,
  'retry_count': instance.retryCount,
  'security_counter': instance.securityCounter,
  'status': handlerFirmwareTaskAdminItemStatusNullableToJson(instance.status),
  'target_uid_hex': instance.targetUidHex,
  'task_no': instance.taskNo,
  'terminal_outcome': instance.terminalOutcome,
  'transport_error': instance.transportError,
  'upgrade_type': handlerFirmwareTaskAdminItemUpgradeTypeNullableToJson(
    instance.upgradeType,
  ),
};

HandlerFirmwareTaskAdminListResponse
_$HandlerFirmwareTaskAdminListResponseFromJson(Map<String, dynamic> json) =>
    HandlerFirmwareTaskAdminListResponse(
      items:
          (json['items'] as List<dynamic>?)
              ?.map(
                (e) => HandlerFirmwareTaskAdminItem.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          [],
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$HandlerFirmwareTaskAdminListResponseToJson(
  HandlerFirmwareTaskAdminListResponse instance,
) => <String, dynamic>{
  'items': instance.items?.map((e) => e.toJson()).toList(),
  'total': instance.total,
};

HandlerFirmwareTaskAdminResultRequest
_$HandlerFirmwareTaskAdminResultRequestFromJson(Map<String, dynamic> json) =>
    HandlerFirmwareTaskAdminResultRequest(
      reason: json['reason'] as String?,
      result: handlerFirmwareTaskAdminResultRequestResultFromJson(
        json['result'],
      ),
    );

Map<String, dynamic> _$HandlerFirmwareTaskAdminResultRequestToJson(
  HandlerFirmwareTaskAdminResultRequest instance,
) => <String, dynamic>{
  'reason': instance.reason,
  'result': handlerFirmwareTaskAdminResultRequestResultToJson(instance.result),
};

HandlerICCardAdminDeductRequest _$HandlerICCardAdminDeductRequestFromJson(
  Map<String, dynamic> json,
) => HandlerICCardAdminDeductRequest(
  amountCents: (json['amount_cents'] as num).toInt(),
  remark: json['remark'] as String?,
);

Map<String, dynamic> _$HandlerICCardAdminDeductRequestToJson(
  HandlerICCardAdminDeductRequest instance,
) => <String, dynamic>{
  'amount_cents': instance.amountCents,
  'remark': instance.remark,
};

HandlerICCardAdminDetailResponse _$HandlerICCardAdminDetailResponseFromJson(
  Map<String, dynamic> json,
) => HandlerICCardAdminDetailResponse(
  availableCents: (json['available_cents'] as num?)?.toInt(),
  balanceCents: (json['balance_cents'] as num?)?.toInt(),
  cardNo: json['card_no'] as String?,
  createdAt: json['created_at'] as String?,
  frozenCents: (json['frozen_cents'] as num?)?.toInt(),
  id: (json['id'] as num?)?.toInt(),
  ledgerTotal: (json['ledger_total'] as num?)?.toInt(),
  ledgers:
      (json['ledgers'] as List<dynamic>?)
          ?.map(
            (e) =>
                HandlerICCardLedgerRecord.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
  matchedAt: json['matched_at'] as String?,
  remark: json['remark'] as String?,
  status: handlerICCardAdminDetailResponseStatusNullableFromJson(
    json['status'],
  ),
  supplierId: (json['supplier_id'] as num?)?.toInt(),
  uid: json['uid'] as String?,
);

Map<String, dynamic> _$HandlerICCardAdminDetailResponseToJson(
  HandlerICCardAdminDetailResponse instance,
) => <String, dynamic>{
  'available_cents': instance.availableCents,
  'balance_cents': instance.balanceCents,
  'card_no': instance.cardNo,
  'created_at': instance.createdAt,
  'frozen_cents': instance.frozenCents,
  'id': instance.id,
  'ledger_total': instance.ledgerTotal,
  'ledgers': instance.ledgers?.map((e) => e.toJson()).toList(),
  'matched_at': instance.matchedAt,
  'remark': instance.remark,
  'status': handlerICCardAdminDetailResponseStatusNullableToJson(
    instance.status,
  ),
  'supplier_id': instance.supplierId,
  'uid': instance.uid,
};

HandlerICCardAdminGenerateRequest _$HandlerICCardAdminGenerateRequestFromJson(
  Map<String, dynamic> json,
) => HandlerICCardAdminGenerateRequest(
  count: (json['count'] as num).toInt(),
  requestId: json['request_id'] as String?,
  supplierId: (json['supplier_id'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerICCardAdminGenerateRequestToJson(
  HandlerICCardAdminGenerateRequest instance,
) => <String, dynamic>{
  'count': instance.count,
  'request_id': instance.requestId,
  'supplier_id': instance.supplierId,
};

HandlerICCardAdminIssueRequest _$HandlerICCardAdminIssueRequestFromJson(
  Map<String, dynamic> json,
) => HandlerICCardAdminIssueRequest(
  cardNo: json['card_no'] as String,
  initialCents: (json['initial_cents'] as num?)?.toInt(),
  remark: json['remark'] as String?,
);

Map<String, dynamic> _$HandlerICCardAdminIssueRequestToJson(
  HandlerICCardAdminIssueRequest instance,
) => <String, dynamic>{
  'card_no': instance.cardNo,
  'initial_cents': instance.initialCents,
  'remark': instance.remark,
};

HandlerICCardAdminItem _$HandlerICCardAdminItemFromJson(
  Map<String, dynamic> json,
) => HandlerICCardAdminItem(
  availableCents: (json['available_cents'] as num?)?.toInt(),
  balanceCents: (json['balance_cents'] as num?)?.toInt(),
  cardNo: json['card_no'] as String?,
  consumeCount: (json['consume_count'] as num?)?.toInt(),
  createdAt: json['created_at'] as String?,
  frozenCents: (json['frozen_cents'] as num?)?.toInt(),
  id: (json['id'] as num?)?.toInt(),
  lastConsumeAt: json['last_consume_at'] as String?,
  matchedAt: json['matched_at'] as String?,
  remark: json['remark'] as String?,
  status: handlerICCardAdminItemStatusNullableFromJson(json['status']),
  supplierId: (json['supplier_id'] as num?)?.toInt(),
  totalConsumeCents: (json['total_consume_cents'] as num?)?.toInt(),
  totalRechargeCents: (json['total_recharge_cents'] as num?)?.toInt(),
  uid: json['uid'] as String?,
);

Map<String, dynamic> _$HandlerICCardAdminItemToJson(
  HandlerICCardAdminItem instance,
) => <String, dynamic>{
  'available_cents': instance.availableCents,
  'balance_cents': instance.balanceCents,
  'card_no': instance.cardNo,
  'consume_count': instance.consumeCount,
  'created_at': instance.createdAt,
  'frozen_cents': instance.frozenCents,
  'id': instance.id,
  'last_consume_at': instance.lastConsumeAt,
  'matched_at': instance.matchedAt,
  'remark': instance.remark,
  'status': handlerICCardAdminItemStatusNullableToJson(instance.status),
  'supplier_id': instance.supplierId,
  'total_consume_cents': instance.totalConsumeCents,
  'total_recharge_cents': instance.totalRechargeCents,
  'uid': instance.uid,
};

HandlerICCardAdminListResponse _$HandlerICCardAdminListResponseFromJson(
  Map<String, dynamic> json,
) => HandlerICCardAdminListResponse(
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) => HandlerICCardAdminItem.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
  maxCardNo: json['max_card_no'] as String?,
  total: (json['total'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerICCardAdminListResponseToJson(
  HandlerICCardAdminListResponse instance,
) => <String, dynamic>{
  'items': instance.items?.map((e) => e.toJson()).toList(),
  'max_card_no': instance.maxCardNo,
  'total': instance.total,
};

HandlerICCardAdminRechargeRequest _$HandlerICCardAdminRechargeRequestFromJson(
  Map<String, dynamic> json,
) => HandlerICCardAdminRechargeRequest(
  amountCents: (json['amount_cents'] as num).toInt(),
  remark: json['remark'] as String?,
);

Map<String, dynamic> _$HandlerICCardAdminRechargeRequestToJson(
  HandlerICCardAdminRechargeRequest instance,
) => <String, dynamic>{
  'amount_cents': instance.amountCents,
  'remark': instance.remark,
};

HandlerICCardAdminStatusRequest _$HandlerICCardAdminStatusRequestFromJson(
  Map<String, dynamic> json,
) => HandlerICCardAdminStatusRequest(
  remark: json['remark'] as String?,
  status: handlerICCardAdminStatusRequestStatusFromJson(json['status']),
);

Map<String, dynamic> _$HandlerICCardAdminStatusRequestToJson(
  HandlerICCardAdminStatusRequest instance,
) => <String, dynamic>{
  'remark': instance.remark,
  'status': handlerICCardAdminStatusRequestStatusToJson(instance.status),
};

HandlerICCardBatchAmountRequest _$HandlerICCardBatchAmountRequestFromJson(
  Map<String, dynamic> json,
) => HandlerICCardBatchAmountRequest(
  amountCents: (json['amount_cents'] as num).toInt(),
  cardIds:
      (json['card_ids'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      [],
  remark: json['remark'] as String,
  requestId: json['request_id'] as String,
);

Map<String, dynamic> _$HandlerICCardBatchAmountRequestToJson(
  HandlerICCardBatchAmountRequest instance,
) => <String, dynamic>{
  'amount_cents': instance.amountCents,
  'card_ids': instance.cardIds,
  'remark': instance.remark,
  'request_id': instance.requestId,
};

HandlerICCardBatchDetailResponse _$HandlerICCardBatchDetailResponseFromJson(
  Map<String, dynamic> json,
) => HandlerICCardBatchDetailResponse(
  amountCents: (json['amount_cents'] as num?)?.toInt(),
  createdAt: json['created_at'] as String?,
  failCount: (json['fail_count'] as num?)?.toInt(),
  id: (json['id'] as num?)?.toInt(),
  itemTotal: (json['item_total'] as num?)?.toInt(),
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) => HandlerICCardBatchItemRecord.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      [],
  operatorId: (json['operator_id'] as num?)?.toInt(),
  operatorName: json['operator_name'] as String?,
  pendingCount: (json['pending_count'] as num?)?.toInt(),
  remark: json['remark'] as String?,
  successCount: (json['success_count'] as num?)?.toInt(),
  totalCount: (json['total_count'] as num?)?.toInt(),
  type: handlerICCardBatchDetailResponseTypeNullableFromJson(json['type']),
);

Map<String, dynamic> _$HandlerICCardBatchDetailResponseToJson(
  HandlerICCardBatchDetailResponse instance,
) => <String, dynamic>{
  'amount_cents': instance.amountCents,
  'created_at': instance.createdAt,
  'fail_count': instance.failCount,
  'id': instance.id,
  'item_total': instance.itemTotal,
  'items': instance.items?.map((e) => e.toJson()).toList(),
  'operator_id': instance.operatorId,
  'operator_name': instance.operatorName,
  'pending_count': instance.pendingCount,
  'remark': instance.remark,
  'success_count': instance.successCount,
  'total_count': instance.totalCount,
  'type': handlerICCardBatchDetailResponseTypeNullableToJson(instance.type),
};

HandlerICCardBatchItemRecord _$HandlerICCardBatchItemRecordFromJson(
  Map<String, dynamic> json,
) => HandlerICCardBatchItemRecord(
  amountCents: (json['amount_cents'] as num?)?.toInt(),
  cardId: (json['card_id'] as num?)?.toInt(),
  cardNo: json['card_no'] as String?,
  remark: json['remark'] as String?,
  seq: (json['seq'] as num?)?.toInt(),
  status: handlerICCardBatchItemRecordStatusNullableFromJson(json['status']),
);

Map<String, dynamic> _$HandlerICCardBatchItemRecordToJson(
  HandlerICCardBatchItemRecord instance,
) => <String, dynamic>{
  'amount_cents': instance.amountCents,
  'card_id': instance.cardId,
  'card_no': instance.cardNo,
  'remark': instance.remark,
  'seq': instance.seq,
  'status': handlerICCardBatchItemRecordStatusNullableToJson(instance.status),
};

HandlerICCardBatchListResponse _$HandlerICCardBatchListResponseFromJson(
  Map<String, dynamic> json,
) => HandlerICCardBatchListResponse(
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) =>
                HandlerICCardBatchResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
  total: (json['total'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerICCardBatchListResponseToJson(
  HandlerICCardBatchListResponse instance,
) => <String, dynamic>{
  'items': instance.items?.map((e) => e.toJson()).toList(),
  'total': instance.total,
};

HandlerICCardBatchResponse _$HandlerICCardBatchResponseFromJson(
  Map<String, dynamic> json,
) => HandlerICCardBatchResponse(
  amountCents: (json['amount_cents'] as num?)?.toInt(),
  createdAt: json['created_at'] as String?,
  failCount: (json['fail_count'] as num?)?.toInt(),
  id: (json['id'] as num?)?.toInt(),
  operatorId: (json['operator_id'] as num?)?.toInt(),
  operatorName: json['operator_name'] as String?,
  pendingCount: (json['pending_count'] as num?)?.toInt(),
  remark: json['remark'] as String?,
  successCount: (json['success_count'] as num?)?.toInt(),
  totalCount: (json['total_count'] as num?)?.toInt(),
  type: handlerICCardBatchResponseTypeNullableFromJson(json['type']),
);

Map<String, dynamic> _$HandlerICCardBatchResponseToJson(
  HandlerICCardBatchResponse instance,
) => <String, dynamic>{
  'amount_cents': instance.amountCents,
  'created_at': instance.createdAt,
  'fail_count': instance.failCount,
  'id': instance.id,
  'operator_id': instance.operatorId,
  'operator_name': instance.operatorName,
  'pending_count': instance.pendingCount,
  'remark': instance.remark,
  'success_count': instance.successCount,
  'total_count': instance.totalCount,
  'type': handlerICCardBatchResponseTypeNullableToJson(instance.type),
};

HandlerICCardBatchResultResponse _$HandlerICCardBatchResultResponseFromJson(
  Map<String, dynamic> json,
) => HandlerICCardBatchResultResponse(
  amountCents: (json['amount_cents'] as num?)?.toInt(),
  createdAt: json['created_at'] as String?,
  failCount: (json['fail_count'] as num?)?.toInt(),
  id: (json['id'] as num?)?.toInt(),
  message: json['message'] as String?,
  operatorId: (json['operator_id'] as num?)?.toInt(),
  operatorName: json['operator_name'] as String?,
  pendingCount: (json['pending_count'] as num?)?.toInt(),
  remark: json['remark'] as String?,
  successCount: (json['success_count'] as num?)?.toInt(),
  totalCount: (json['total_count'] as num?)?.toInt(),
  type: handlerICCardBatchResultResponseTypeNullableFromJson(json['type']),
);

Map<String, dynamic> _$HandlerICCardBatchResultResponseToJson(
  HandlerICCardBatchResultResponse instance,
) => <String, dynamic>{
  'amount_cents': instance.amountCents,
  'created_at': instance.createdAt,
  'fail_count': instance.failCount,
  'id': instance.id,
  'message': instance.message,
  'operator_id': instance.operatorId,
  'operator_name': instance.operatorName,
  'pending_count': instance.pendingCount,
  'remark': instance.remark,
  'success_count': instance.successCount,
  'total_count': instance.totalCount,
  'type': handlerICCardBatchResultResponseTypeNullableToJson(instance.type),
};

HandlerICCardBatchStatusRequest _$HandlerICCardBatchStatusRequestFromJson(
  Map<String, dynamic> json,
) => HandlerICCardBatchStatusRequest(
  cardIds:
      (json['card_ids'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      [],
  remark: json['remark'] as String?,
  requestId: json['request_id'] as String,
  status: handlerICCardBatchStatusRequestStatusFromJson(json['status']),
);

Map<String, dynamic> _$HandlerICCardBatchStatusRequestToJson(
  HandlerICCardBatchStatusRequest instance,
) => <String, dynamic>{
  'card_ids': instance.cardIds,
  'remark': instance.remark,
  'request_id': instance.requestId,
  'status': handlerICCardBatchStatusRequestStatusToJson(instance.status),
};

HandlerICCardLedgerRecord _$HandlerICCardLedgerRecordFromJson(
  Map<String, dynamic> json,
) => HandlerICCardLedgerRecord(
  amountCents: (json['amount_cents'] as num?)?.toInt(),
  balanceCents: (json['balance_cents'] as num?)?.toInt(),
  category: json['category'] as String?,
  createdAt: json['created_at'] as String?,
  operatorId: (json['operator_id'] as num?)?.toInt(),
  relatedOrderNo: json['related_order_no'] as String?,
  relatedRefType: json['related_ref_type'] as String?,
  remark: json['remark'] as String?,
  type: json['type'] as String?,
);

Map<String, dynamic> _$HandlerICCardLedgerRecordToJson(
  HandlerICCardLedgerRecord instance,
) => <String, dynamic>{
  'amount_cents': instance.amountCents,
  'balance_cents': instance.balanceCents,
  'category': instance.category,
  'created_at': instance.createdAt,
  'operator_id': instance.operatorId,
  'related_order_no': instance.relatedOrderNo,
  'related_ref_type': instance.relatedRefType,
  'remark': instance.remark,
  'type': instance.type,
};

HandlerICCardOfflineBackfillRequest
_$HandlerICCardOfflineBackfillRequestFromJson(Map<String, dynamic> json) =>
    HandlerICCardOfflineBackfillRequest(
      items:
          (json['items'] as List<dynamic>?)
              ?.map(
                (e) => HandlerICCardOfflineItemRequest.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          [],
    );

Map<String, dynamic> _$HandlerICCardOfflineBackfillRequestToJson(
  HandlerICCardOfflineBackfillRequest instance,
) => <String, dynamic>{'items': instance.items.map((e) => e.toJson()).toList()};

HandlerICCardOfflineBackfillResponse
_$HandlerICCardOfflineBackfillResponseFromJson(Map<String, dynamic> json) =>
    HandlerICCardOfflineBackfillResponse(
      items:
          (json['items'] as List<dynamic>?)
              ?.map(
                (e) => HandlerICCardOfflineResultResponse.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          [],
    );

Map<String, dynamic> _$HandlerICCardOfflineBackfillResponseToJson(
  HandlerICCardOfflineBackfillResponse instance,
) => <String, dynamic>{
  'items': instance.items?.map((e) => e.toJson()).toList(),
};

HandlerICCardOfflineItemRequest _$HandlerICCardOfflineItemRequestFromJson(
  Map<String, dynamic> json,
) => HandlerICCardOfflineItemRequest(
  amountCents: (json['amount_cents'] as num?)?.toInt(),
  cardNo: json['card_no'] as String,
  selectedVolumeMl: (json['selected_volume_ml'] as num?)?.toInt(),
  swipedAt: json['swiped_at'] as String,
  traceNo: json['trace_no'] as String,
  volumeMl: (json['volume_ml'] as num?)?.toInt(),
  waterType: handlerICCardOfflineItemRequestWaterTypeFromJson(
    json['water_type'],
  ),
);

Map<String, dynamic> _$HandlerICCardOfflineItemRequestToJson(
  HandlerICCardOfflineItemRequest instance,
) => <String, dynamic>{
  'amount_cents': instance.amountCents,
  'card_no': instance.cardNo,
  'selected_volume_ml': instance.selectedVolumeMl,
  'swiped_at': instance.swipedAt,
  'trace_no': instance.traceNo,
  'volume_ml': instance.volumeMl,
  'water_type': handlerICCardOfflineItemRequestWaterTypeToJson(
    instance.waterType,
  ),
};

HandlerICCardOfflineListResponse _$HandlerICCardOfflineListResponseFromJson(
  Map<String, dynamic> json,
) => HandlerICCardOfflineListResponse(
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) => HandlerICCardOfflineResponse.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      [],
  total: (json['total'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerICCardOfflineListResponseToJson(
  HandlerICCardOfflineListResponse instance,
) => <String, dynamic>{
  'items': instance.items?.map((e) => e.toJson()).toList(),
  'total': instance.total,
};

HandlerICCardOfflineResponse _$HandlerICCardOfflineResponseFromJson(
  Map<String, dynamic> json,
) => HandlerICCardOfflineResponse(
  amountCents: (json['amount_cents'] as num?)?.toInt(),
  balanceAfterCents: (json['balance_after_cents'] as num?)?.toInt(),
  cardNo: json['card_no'] as String?,
  createdAt: json['created_at'] as String?,
  deviceSn: json['device_sn'] as String?,
  id: (json['id'] as num?)?.toInt(),
  note: json['note'] as String?,
  orderNo: json['order_no'] as String?,
  status: handlerICCardOfflineResponseStatusNullableFromJson(json['status']),
  swipedAt: json['swiped_at'] as String?,
  traceNo: json['trace_no'] as String?,
  volumeMl: (json['volume_ml'] as num?)?.toInt(),
  waterType: json['water_type'] as String?,
);

Map<String, dynamic> _$HandlerICCardOfflineResponseToJson(
  HandlerICCardOfflineResponse instance,
) => <String, dynamic>{
  'amount_cents': instance.amountCents,
  'balance_after_cents': instance.balanceAfterCents,
  'card_no': instance.cardNo,
  'created_at': instance.createdAt,
  'device_sn': instance.deviceSn,
  'id': instance.id,
  'note': instance.note,
  'order_no': instance.orderNo,
  'status': handlerICCardOfflineResponseStatusNullableToJson(instance.status),
  'swiped_at': instance.swipedAt,
  'trace_no': instance.traceNo,
  'volume_ml': instance.volumeMl,
  'water_type': instance.waterType,
};

HandlerICCardOfflineResultResponse _$HandlerICCardOfflineResultResponseFromJson(
  Map<String, dynamic> json,
) => HandlerICCardOfflineResultResponse(
  balanceAfterCents: (json['balance_after_cents'] as num?)?.toInt(),
  note: json['note'] as String?,
  orderNo: json['order_no'] as String?,
  status: handlerICCardOfflineResultResponseStatusNullableFromJson(
    json['status'],
  ),
  traceNo: json['trace_no'] as String?,
);

Map<String, dynamic> _$HandlerICCardOfflineResultResponseToJson(
  HandlerICCardOfflineResultResponse instance,
) => <String, dynamic>{
  'balance_after_cents': instance.balanceAfterCents,
  'note': instance.note,
  'order_no': instance.orderNo,
  'status': handlerICCardOfflineResultResponseStatusNullableToJson(
    instance.status,
  ),
  'trace_no': instance.traceNo,
};

HandlerICCardRechargeOrderListResponse
_$HandlerICCardRechargeOrderListResponseFromJson(Map<String, dynamic> json) =>
    HandlerICCardRechargeOrderListResponse(
      items:
          (json['items'] as List<dynamic>?)
              ?.map(
                (e) => HandlerICCardRechargeOrderResponse.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          [],
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$HandlerICCardRechargeOrderListResponseToJson(
  HandlerICCardRechargeOrderListResponse instance,
) => <String, dynamic>{
  'items': instance.items?.map((e) => e.toJson()).toList(),
  'total': instance.total,
};

HandlerICCardRechargeOrderRequest _$HandlerICCardRechargeOrderRequestFromJson(
  Map<String, dynamic> json,
) => HandlerICCardRechargeOrderRequest(
  amountCents: (json['amount_cents'] as num).toInt(),
  method: handlerICCardRechargeOrderRequestMethodFromJson(json['method']),
);

Map<String, dynamic> _$HandlerICCardRechargeOrderRequestToJson(
  HandlerICCardRechargeOrderRequest instance,
) => <String, dynamic>{
  'amount_cents': instance.amountCents,
  'method': handlerICCardRechargeOrderRequestMethodToJson(instance.method),
};

HandlerICCardRechargeOrderResponse _$HandlerICCardRechargeOrderResponseFromJson(
  Map<String, dynamic> json,
) => HandlerICCardRechargeOrderResponse(
  abnormal: json['abnormal'] as bool?,
  abnormalReason: json['abnormal_reason'] as String?,
  amountCents: (json['amount_cents'] as num?)?.toInt(),
  cardNo: json['card_no'] as String?,
  createdAt: json['created_at'] as String?,
  orderNo: json['order_no'] as String?,
  paidAt: json['paid_at'] as String?,
  paidCents: (json['paid_cents'] as num?)?.toInt(),
  payUrl: json['pay_url'] as String?,
  paymentMethod:
      handlerICCardRechargeOrderResponsePaymentMethodNullableFromJson(
        json['payment_method'],
      ),
  qrCode: json['qr_code'] as String?,
  refundCents: (json['refund_cents'] as num?)?.toInt(),
  refundStatus: handlerICCardRechargeOrderResponseRefundStatusNullableFromJson(
    json['refund_status'],
  ),
  status: handlerICCardRechargeOrderResponseStatusNullableFromJson(
    json['status'],
  ),
);

Map<String, dynamic> _$HandlerICCardRechargeOrderResponseToJson(
  HandlerICCardRechargeOrderResponse instance,
) => <String, dynamic>{
  'abnormal': instance.abnormal,
  'abnormal_reason': instance.abnormalReason,
  'amount_cents': instance.amountCents,
  'card_no': instance.cardNo,
  'created_at': instance.createdAt,
  'order_no': instance.orderNo,
  'paid_at': instance.paidAt,
  'paid_cents': instance.paidCents,
  'pay_url': instance.payUrl,
  'payment_method':
      handlerICCardRechargeOrderResponsePaymentMethodNullableToJson(
        instance.paymentMethod,
      ),
  'qr_code': instance.qrCode,
  'refund_cents': instance.refundCents,
  'refund_status': handlerICCardRechargeOrderResponseRefundStatusNullableToJson(
    instance.refundStatus,
  ),
  'status': handlerICCardRechargeOrderResponseStatusNullableToJson(
    instance.status,
  ),
};

HandlerICCardStatsResponse _$HandlerICCardStatsResponseFromJson(
  Map<String, dynamic> json,
) => HandlerICCardStatsResponse(
  activeCount: (json['active_count'] as num?)?.toInt(),
  issuedCount: (json['issued_count'] as num?)?.toInt(),
  todayConsumeCents: (json['today_consume_cents'] as num?)?.toInt(),
  todayConsumeCount: (json['today_consume_count'] as num?)?.toInt(),
  totalBalanceCents: (json['total_balance_cents'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerICCardStatsResponseToJson(
  HandlerICCardStatsResponse instance,
) => <String, dynamic>{
  'active_count': instance.activeCount,
  'issued_count': instance.issuedCount,
  'today_consume_cents': instance.todayConsumeCents,
  'today_consume_count': instance.todayConsumeCount,
  'total_balance_cents': instance.totalBalanceCents,
};

HandlerICCardSyncListResponse _$HandlerICCardSyncListResponseFromJson(
  Map<String, dynamic> json,
) => HandlerICCardSyncListResponse(
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) =>
                HandlerICCardSyncResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
  total: (json['total'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerICCardSyncListResponseToJson(
  HandlerICCardSyncListResponse instance,
) => <String, dynamic>{
  'items': instance.items?.map((e) => e.toJson()).toList(),
  'total': instance.total,
};

HandlerICCardSyncResponse _$HandlerICCardSyncResponseFromJson(
  Map<String, dynamic> json,
) => HandlerICCardSyncResponse(
  cardCount: (json['card_count'] as num?)?.toInt(),
  createdAt: json['created_at'] as String?,
  deliveredAt: json['delivered_at'] as String?,
  deviceSn: json['device_sn'] as String?,
  errorMessage: json['error_message'] as String?,
  failCount: (json['fail_count'] as num?)?.toInt(),
  id: (json['id'] as num?)?.toInt(),
  negativeCardCount: (json['negative_card_count'] as num?)?.toInt(),
  status: handlerICCardSyncResponseStatusNullableFromJson(json['status']),
);

Map<String, dynamic> _$HandlerICCardSyncResponseToJson(
  HandlerICCardSyncResponse instance,
) => <String, dynamic>{
  'card_count': instance.cardCount,
  'created_at': instance.createdAt,
  'delivered_at': instance.deliveredAt,
  'device_sn': instance.deviceSn,
  'error_message': instance.errorMessage,
  'fail_count': instance.failCount,
  'id': instance.id,
  'negative_card_count': instance.negativeCardCount,
  'status': handlerICCardSyncResponseStatusNullableToJson(instance.status),
};

HandlerICCardSyncResultRequest _$HandlerICCardSyncResultRequestFromJson(
  Map<String, dynamic> json,
) => HandlerICCardSyncResultRequest(
  reason: json['reason'] as String?,
  status: handlerICCardSyncResultRequestStatusFromJson(json['status']),
);

Map<String, dynamic> _$HandlerICCardSyncResultRequestToJson(
  HandlerICCardSyncResultRequest instance,
) => <String, dynamic>{
  'reason': instance.reason,
  'status': handlerICCardSyncResultRequestStatusToJson(instance.status),
};

HandlerICCardSyncResultResponse _$HandlerICCardSyncResultResponseFromJson(
  Map<String, dynamic> json,
) => HandlerICCardSyncResultResponse(
  alarmRaised: json['alarm_raised'] as bool?,
  cardCount: (json['card_count'] as num?)?.toInt(),
  createdAt: json['created_at'] as String?,
  deliveredAt: json['delivered_at'] as String?,
  deviceSn: json['device_sn'] as String?,
  errorMessage: json['error_message'] as String?,
  failCount: (json['fail_count'] as num?)?.toInt(),
  id: (json['id'] as num?)?.toInt(),
  negativeCardCount: (json['negative_card_count'] as num?)?.toInt(),
  status: handlerICCardSyncResultResponseStatusNullableFromJson(json['status']),
);

Map<String, dynamic> _$HandlerICCardSyncResultResponseToJson(
  HandlerICCardSyncResultResponse instance,
) => <String, dynamic>{
  'alarm_raised': instance.alarmRaised,
  'card_count': instance.cardCount,
  'created_at': instance.createdAt,
  'delivered_at': instance.deliveredAt,
  'device_sn': instance.deviceSn,
  'error_message': instance.errorMessage,
  'fail_count': instance.failCount,
  'id': instance.id,
  'negative_card_count': instance.negativeCardCount,
  'status': handlerICCardSyncResultResponseStatusNullableToJson(
    instance.status,
  ),
};

HandlerKioskActivateRequest _$HandlerKioskActivateRequestFromJson(
  Map<String, dynamic> json,
) => HandlerKioskActivateRequest(chipUid: json['chip_uid'] as String);

Map<String, dynamic> _$HandlerKioskActivateRequestToJson(
  HandlerKioskActivateRequest instance,
) => <String, dynamic>{'chip_uid': instance.chipUid};

HandlerKioskActivateResponse _$HandlerKioskActivateResponseFromJson(
  Map<String, dynamic> json,
) => HandlerKioskActivateResponse(
  accountReady: json['account_ready'] as bool?,
  secret: json['secret'] as String?,
  sn: json['sn'] as String?,
);

Map<String, dynamic> _$HandlerKioskActivateResponseToJson(
  HandlerKioskActivateResponse instance,
) => <String, dynamic>{
  'account_ready': instance.accountReady,
  'secret': instance.secret,
  'sn': instance.sn,
};

HandlerKioskRecordingPlaybackFailureRequest
_$HandlerKioskRecordingPlaybackFailureRequestFromJson(
  Map<String, dynamic> json,
) => HandlerKioskRecordingPlaybackFailureRequest(
  errorCode: json['error_code'] as String,
);

Map<String, dynamic> _$HandlerKioskRecordingPlaybackFailureRequestToJson(
  HandlerKioskRecordingPlaybackFailureRequest instance,
) => <String, dynamic>{'error_code': instance.errorCode};

HandlerKioskRecordingSegment _$HandlerKioskRecordingSegmentFromJson(
  Map<String, dynamic> json,
) => HandlerKioskRecordingSegment(
  durationMs: (json['duration_ms'] as num).toInt(),
  endedAt: json['ended_at'] as String,
  segmentId: json['segment_id'] as String,
  sha256: json['sha256'] as String,
  sizeBytes: (json['size_bytes'] as num).toInt(),
  startedAt: json['started_at'] as String,
  state: handlerKioskRecordingSegmentStateFromJson(json['state']),
);

Map<String, dynamic> _$HandlerKioskRecordingSegmentToJson(
  HandlerKioskRecordingSegment instance,
) => <String, dynamic>{
  'duration_ms': instance.durationMs,
  'ended_at': instance.endedAt,
  'segment_id': instance.segmentId,
  'sha256': instance.sha256,
  'size_bytes': instance.sizeBytes,
  'started_at': instance.startedAt,
  'state': handlerKioskRecordingSegmentStateToJson(instance.state),
};

HandlerKioskRecordingSegmentsRequest
_$HandlerKioskRecordingSegmentsRequestFromJson(Map<String, dynamic> json) =>
    HandlerKioskRecordingSegmentsRequest(
      segments:
          (json['segments'] as List<dynamic>?)
              ?.map(
                (e) => HandlerKioskRecordingSegment.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          [],
    );

Map<String, dynamic> _$HandlerKioskRecordingSegmentsRequestToJson(
  HandlerKioskRecordingSegmentsRequest instance,
) => <String, dynamic>{
  'segments': instance.segments.map((e) => e.toJson()).toList(),
};

HandlerKioskRecordingUploadProgressResponse
_$HandlerKioskRecordingUploadProgressResponseFromJson(
  Map<String, dynamic> json,
) => HandlerKioskRecordingUploadProgressResponse(
  complete: json['complete'] as bool?,
  totalBytes: (json['total_bytes'] as num?)?.toInt(),
  uploadedBytes: (json['uploaded_bytes'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerKioskRecordingUploadProgressResponseToJson(
  HandlerKioskRecordingUploadProgressResponse instance,
) => <String, dynamic>{
  'complete': instance.complete,
  'total_bytes': instance.totalBytes,
  'uploaded_bytes': instance.uploadedBytes,
};

HandlerKioskRecordingUploadTarget _$HandlerKioskRecordingUploadTargetFromJson(
  Map<String, dynamic> json,
) => HandlerKioskRecordingUploadTarget(
  chunkSizeBytes: (json['chunk_size_bytes'] as num?)?.toInt(),
  expiresAt: json['expires_at'] as String?,
  maxBytes: (json['max_bytes'] as num?)?.toInt(),
  segmentId: json['segment_id'] as String?,
  sha256: json['sha256'] as String?,
  uploadUrl: json['upload_url'] as String?,
  uploadedBytes: (json['uploaded_bytes'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerKioskRecordingUploadTargetToJson(
  HandlerKioskRecordingUploadTarget instance,
) => <String, dynamic>{
  'chunk_size_bytes': instance.chunkSizeBytes,
  'expires_at': instance.expiresAt,
  'max_bytes': instance.maxBytes,
  'segment_id': instance.segmentId,
  'sha256': instance.sha256,
  'upload_url': instance.uploadUrl,
  'uploaded_bytes': instance.uploadedBytes,
};

HandlerKioskRecordingUploadTargetsResponse
_$HandlerKioskRecordingUploadTargetsResponseFromJson(
  Map<String, dynamic> json,
) => HandlerKioskRecordingUploadTargetsResponse(
  files:
      (json['files'] as List<dynamic>?)
          ?.map(
            (e) => HandlerKioskRecordingUploadTarget.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      [],
  playbackId: (json['playback_id'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerKioskRecordingUploadTargetsResponseToJson(
  HandlerKioskRecordingUploadTargetsResponse instance,
) => <String, dynamic>{
  'files': instance.files?.map((e) => e.toJson()).toList(),
  'playback_id': instance.playbackId,
};

HandlerKioskSyncCardResponse _$HandlerKioskSyncCardResponseFromJson(
  Map<String, dynamic> json,
) => HandlerKioskSyncCardResponse(
  balanceCents: (json['balance_cents'] as num?)?.toInt(),
  cardNo: json['card_no'] as String?,
  uid: json['uid'] as String?,
);

Map<String, dynamic> _$HandlerKioskSyncCardResponseToJson(
  HandlerKioskSyncCardResponse instance,
) => <String, dynamic>{
  'balance_cents': instance.balanceCents,
  'card_no': instance.cardNo,
  'uid': instance.uid,
};

HandlerKioskSyncResponse _$HandlerKioskSyncResponseFromJson(
  Map<String, dynamic> json,
) => HandlerKioskSyncResponse(
  cards:
      (json['cards'] as List<dynamic>?)
          ?.map(
            (e) => HandlerKioskSyncCardResponse.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      [],
);

Map<String, dynamic> _$HandlerKioskSyncResponseToJson(
  HandlerKioskSyncResponse instance,
) => <String, dynamic>{
  'cards': instance.cards?.map((e) => e.toJson()).toList(),
};

HandlerMenuAdminListResponse _$HandlerMenuAdminListResponseFromJson(
  Map<String, dynamic> json,
) => HandlerMenuAdminListResponse(
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) => HandlerMenuAdminResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
  total: (json['total'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerMenuAdminListResponseToJson(
  HandlerMenuAdminListResponse instance,
) => <String, dynamic>{
  'items': instance.items?.map((e) => e.toJson()).toList(),
  'total': instance.total,
};

HandlerMenuAdminResponse _$HandlerMenuAdminResponseFromJson(
  Map<String, dynamic> json,
) => HandlerMenuAdminResponse(
  code: json['code'] as String?,
  group: json['group'] as String?,
  name: json['name'] as String?,
  sort: (json['sort'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerMenuAdminResponseToJson(
  HandlerMenuAdminResponse instance,
) => <String, dynamic>{
  'code': instance.code,
  'group': instance.group,
  'name': instance.name,
  'sort': instance.sort,
};

HandlerMeterAdminItem _$HandlerMeterAdminItemFromJson(
  Map<String, dynamic> json,
) => HandlerMeterAdminItem(
  accumulatedMilli: (json['accumulated_milli'] as num?)?.toInt(),
  baseMilli: (json['base_milli'] as num?)?.toInt(),
  baudRate: (json['baud_rate'] as num?)?.toInt(),
  commParams: json['comm_params'] as String?,
  deviceId: (json['device_id'] as num?)?.toInt(),
  deviceModel: json['device_model'] as String?,
  deviceName: json['device_name'] as String?,
  deviceRegion: json['device_region'] as String?,
  deviceRegionCode: json['device_region_code'] as String?,
  deviceSn: json['device_sn'] as String?,
  factoryOriginalMilli: (json['factory_original_milli'] as num?)?.toInt(),
  failCount: (json['fail_count'] as num?)?.toInt(),
  id: (json['id'] as num?)?.toInt(),
  lastReadAt: json['last_read_at'] as String?,
  latestMilli: (json['latest_milli'] as num?)?.toInt(),
  rangeUsageMilli: (json['range_usage_milli'] as num?)?.toInt(),
  readStatus: handlerMeterAdminItemReadStatusNullableFromJson(
    json['read_status'],
  ),
  type: json['type'] as String?,
  unit: json['unit'] as String?,
  valveStatus: handlerMeterAdminItemValveStatusNullableFromJson(
    json['valve_status'],
  ),
);

Map<String, dynamic> _$HandlerMeterAdminItemToJson(
  HandlerMeterAdminItem instance,
) => <String, dynamic>{
  'accumulated_milli': instance.accumulatedMilli,
  'base_milli': instance.baseMilli,
  'baud_rate': instance.baudRate,
  'comm_params': instance.commParams,
  'device_id': instance.deviceId,
  'device_model': instance.deviceModel,
  'device_name': instance.deviceName,
  'device_region': instance.deviceRegion,
  'device_region_code': instance.deviceRegionCode,
  'device_sn': instance.deviceSn,
  'factory_original_milli': instance.factoryOriginalMilli,
  'fail_count': instance.failCount,
  'id': instance.id,
  'last_read_at': instance.lastReadAt,
  'latest_milli': instance.latestMilli,
  'range_usage_milli': instance.rangeUsageMilli,
  'read_status': handlerMeterAdminItemReadStatusNullableToJson(
    instance.readStatus,
  ),
  'type': instance.type,
  'unit': instance.unit,
  'valve_status': handlerMeterAdminItemValveStatusNullableToJson(
    instance.valveStatus,
  ),
};

HandlerMeterAdminListResponse _$HandlerMeterAdminListResponseFromJson(
  Map<String, dynamic> json,
) => HandlerMeterAdminListResponse(
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) => HandlerMeterAdminItem.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
  total: (json['total'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerMeterAdminListResponseToJson(
  HandlerMeterAdminListResponse instance,
) => <String, dynamic>{
  'items': instance.items?.map((e) => e.toJson()).toList(),
  'total': instance.total,
};

HandlerMeterAdminReadingCreateRequest
_$HandlerMeterAdminReadingCreateRequestFromJson(Map<String, dynamic> json) =>
    HandlerMeterAdminReadingCreateRequest(
      readAt: json['read_at'] as String?,
      success: json['success'] as bool?,
      type: handlerMeterAdminReadingCreateRequestTypeFromJson(json['type']),
      valueMilli: (json['value_milli'] as num?)?.toInt(),
      valveStatus:
          handlerMeterAdminReadingCreateRequestValveStatusNullableFromJson(
            json['valve_status'],
          ),
    );

Map<String, dynamic> _$HandlerMeterAdminReadingCreateRequestToJson(
  HandlerMeterAdminReadingCreateRequest instance,
) => <String, dynamic>{
  'read_at': instance.readAt,
  'success': instance.success,
  'type': handlerMeterAdminReadingCreateRequestTypeToJson(instance.type),
  'value_milli': instance.valueMilli,
  'valve_status':
      handlerMeterAdminReadingCreateRequestValveStatusNullableToJson(
        instance.valveStatus,
      ),
};

HandlerMeterAdminReadingCreateResponse
_$HandlerMeterAdminReadingCreateResponseFromJson(Map<String, dynamic> json) =>
    HandlerMeterAdminReadingCreateResponse(
      failCount: (json['fail_count'] as num?)?.toInt(),
      reading: json['reading'] == null
          ? null
          : HandlerMeterAdminReadingItem.fromJson(
              json['reading'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$HandlerMeterAdminReadingCreateResponseToJson(
  HandlerMeterAdminReadingCreateResponse instance,
) => <String, dynamic>{
  'fail_count': instance.failCount,
  'reading': instance.reading?.toJson(),
};

HandlerMeterAdminReadingItem _$HandlerMeterAdminReadingItemFromJson(
  Map<String, dynamic> json,
) => HandlerMeterAdminReadingItem(
  abnormal: json['abnormal'] as bool?,
  abnormalReason: json['abnormal_reason'] as String?,
  accumulatedMilli: (json['accumulated_milli'] as num?)?.toInt(),
  baseChange: json['base_change'] as bool?,
  baseChangeReason: json['base_change_reason'] as String?,
  baseMilli: (json['base_milli'] as num?)?.toInt(),
  deltaMilli: (json['delta_milli'] as num?)?.toInt(),
  id: (json['id'] as num?)?.toInt(),
  readAt: json['read_at'] as String?,
  valueMilli: (json['value_milli'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerMeterAdminReadingItemToJson(
  HandlerMeterAdminReadingItem instance,
) => <String, dynamic>{
  'abnormal': instance.abnormal,
  'abnormal_reason': instance.abnormalReason,
  'accumulated_milli': instance.accumulatedMilli,
  'base_change': instance.baseChange,
  'base_change_reason': instance.baseChangeReason,
  'base_milli': instance.baseMilli,
  'delta_milli': instance.deltaMilli,
  'id': instance.id,
  'read_at': instance.readAt,
  'value_milli': instance.valueMilli,
};

HandlerMeterAdminReadingListResponse
_$HandlerMeterAdminReadingListResponseFromJson(Map<String, dynamic> json) =>
    HandlerMeterAdminReadingListResponse(
      items:
          (json['items'] as List<dynamic>?)
              ?.map(
                (e) => HandlerMeterAdminReadingItem.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          [],
      meter: json['meter'] == null
          ? null
          : HandlerMeterAdminItem.fromJson(
              json['meter'] as Map<String, dynamic>,
            ),
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$HandlerMeterAdminReadingListResponseToJson(
  HandlerMeterAdminReadingListResponse instance,
) => <String, dynamic>{
  'items': instance.items?.map((e) => e.toJson()).toList(),
  'meter': instance.meter?.toJson(),
  'total': instance.total,
};

HandlerMeterAdminRebaseRequest _$HandlerMeterAdminRebaseRequestFromJson(
  Map<String, dynamic> json,
) => HandlerMeterAdminRebaseRequest(
  baseMilli: (json['base_milli'] as num).toInt(),
  factoryOriginalMilli: (json['factory_original_milli'] as num?)?.toInt(),
  reason: handlerMeterAdminRebaseRequestReasonFromJson(json['reason']),
);

Map<String, dynamic> _$HandlerMeterAdminRebaseRequestToJson(
  HandlerMeterAdminRebaseRequest instance,
) => <String, dynamic>{
  'base_milli': instance.baseMilli,
  'factory_original_milli': instance.factoryOriginalMilli,
  'reason': handlerMeterAdminRebaseRequestReasonToJson(instance.reason),
};

HandlerMeterAdminStatsResponse _$HandlerMeterAdminStatsResponseFromJson(
  Map<String, dynamic> json,
) => HandlerMeterAdminStatsResponse(
  normalDeviceCount: (json['normal_device_count'] as num?)?.toInt(),
  rangeUsageMilli: (json['range_usage_milli'] as num?)?.toInt(),
  unit: json['unit'] as String?,
  usageFrom: json['usage_from'] as String?,
  usageTo: json['usage_to'] as String?,
);

Map<String, dynamic> _$HandlerMeterAdminStatsResponseToJson(
  HandlerMeterAdminStatsResponse instance,
) => <String, dynamic>{
  'normal_device_count': instance.normalDeviceCount,
  'range_usage_milli': instance.rangeUsageMilli,
  'unit': instance.unit,
  'usage_from': instance.usageFrom,
  'usage_to': instance.usageTo,
};

HandlerMockPayCreateRequest _$HandlerMockPayCreateRequestFromJson(
  Map<String, dynamic> json,
) => HandlerMockPayCreateRequest(
  amountCents: (json['amount_cents'] as num).toInt(),
  channel: handlerMockPayCreateRequestChannelFromJson(json['channel']),
  orderNo: json['order_no'] as String,
  subject: json['subject'] as String?,
);

Map<String, dynamic> _$HandlerMockPayCreateRequestToJson(
  HandlerMockPayCreateRequest instance,
) => <String, dynamic>{
  'amount_cents': instance.amountCents,
  'channel': handlerMockPayCreateRequestChannelToJson(instance.channel),
  'order_no': instance.orderNo,
  'subject': instance.subject,
};

HandlerMockPayCreateResponse _$HandlerMockPayCreateResponseFromJson(
  Map<String, dynamic> json,
) => HandlerMockPayCreateResponse(
  channel: json['channel'] as String?,
  channelOrderNo: json['channel_order_no'] as String?,
  expiresAt: json['expires_at'] as String?,
  orderNo: json['order_no'] as String?,
  payUrl: json['pay_url'] as String?,
  qrCode: json['qr_code'] as String?,
);

Map<String, dynamic> _$HandlerMockPayCreateResponseToJson(
  HandlerMockPayCreateResponse instance,
) => <String, dynamic>{
  'channel': instance.channel,
  'channel_order_no': instance.channelOrderNo,
  'expires_at': instance.expiresAt,
  'order_no': instance.orderNo,
  'pay_url': instance.payUrl,
  'qr_code': instance.qrCode,
};

HandlerMockPayRefundFailureRequest _$HandlerMockPayRefundFailureRequestFromJson(
  Map<String, dynamic> json,
) => HandlerMockPayRefundFailureRequest(fails: json['fails'] as bool?);

Map<String, dynamic> _$HandlerMockPayRefundFailureRequestToJson(
  HandlerMockPayRefundFailureRequest instance,
) => <String, dynamic>{'fails': instance.fails};

HandlerMockPayRefundPendingRequest _$HandlerMockPayRefundPendingRequestFromJson(
  Map<String, dynamic> json,
) => HandlerMockPayRefundPendingRequest(pending: json['pending'] as bool?);

Map<String, dynamic> _$HandlerMockPayRefundPendingRequestToJson(
  HandlerMockPayRefundPendingRequest instance,
) => <String, dynamic>{'pending': instance.pending};

HandlerMockPayRefundRecord _$HandlerMockPayRefundRecordFromJson(
  Map<String, dynamic> json,
) => HandlerMockPayRefundRecord(
  amountCents: (json['amount_cents'] as num?)?.toInt(),
  channelRefundNo: json['channel_refund_no'] as String?,
  refundNo: json['refund_no'] as String?,
  refundedAt: json['refunded_at'] as String?,
  state: handlerMockPayRefundRecordStateNullableFromJson(json['state']),
);

Map<String, dynamic> _$HandlerMockPayRefundRecordToJson(
  HandlerMockPayRefundRecord instance,
) => <String, dynamic>{
  'amount_cents': instance.amountCents,
  'channel_refund_no': instance.channelRefundNo,
  'refund_no': instance.refundNo,
  'refunded_at': instance.refundedAt,
  'state': handlerMockPayRefundRecordStateNullableToJson(instance.state),
};

HandlerMockPayRefundRequest _$HandlerMockPayRefundRequestFromJson(
  Map<String, dynamic> json,
) => HandlerMockPayRefundRequest(
  amountCents: (json['amount_cents'] as num).toInt(),
  reason: json['reason'] as String?,
  refundNo: json['refund_no'] as String,
);

Map<String, dynamic> _$HandlerMockPayRefundRequestToJson(
  HandlerMockPayRefundRequest instance,
) => <String, dynamic>{
  'amount_cents': instance.amountCents,
  'reason': instance.reason,
  'refund_no': instance.refundNo,
};

HandlerMockPayTradeResponse _$HandlerMockPayTradeResponseFromJson(
  Map<String, dynamic> json,
) => HandlerMockPayTradeResponse(
  amountCents: (json['amount_cents'] as num?)?.toInt(),
  cancelUrl: json['cancel_url'] as String?,
  channel: json['channel'] as String?,
  channelOrderNo: json['channel_order_no'] as String?,
  confirmUrl: json['confirm_url'] as String?,
  orderNo: json['order_no'] as String?,
  paidAt: json['paid_at'] as String?,
  refundFails: json['refund_fails'] as bool?,
  refundPending: json['refund_pending'] as bool?,
  refundedCents: (json['refunded_cents'] as num?)?.toInt(),
  refunds:
      (json['refunds'] as List<dynamic>?)
          ?.map(
            (e) =>
                HandlerMockPayRefundRecord.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
  state: handlerMockPayTradeResponseStateNullableFromJson(json['state']),
);

Map<String, dynamic> _$HandlerMockPayTradeResponseToJson(
  HandlerMockPayTradeResponse instance,
) => <String, dynamic>{
  'amount_cents': instance.amountCents,
  'cancel_url': instance.cancelUrl,
  'channel': instance.channel,
  'channel_order_no': instance.channelOrderNo,
  'confirm_url': instance.confirmUrl,
  'order_no': instance.orderNo,
  'paid_at': instance.paidAt,
  'refund_fails': instance.refundFails,
  'refund_pending': instance.refundPending,
  'refunded_cents': instance.refundedCents,
  'refunds': instance.refunds?.map((e) => e.toJson()).toList(),
  'state': handlerMockPayTradeResponseStateNullableToJson(instance.state),
};

HandlerOrderAdminDetailResponse _$HandlerOrderAdminDetailResponseFromJson(
  Map<String, dynamic> json,
) => HandlerOrderAdminDetailResponse(
  abnormal: json['abnormal'] as bool?,
  abnormalReason: json['abnormal_reason'] as String?,
  actualPaidCents: (json['actual_paid_cents'] as num?)?.toInt(),
  actualRefundedCents: (json['actual_refunded_cents'] as num?)?.toInt(),
  actualVolumeMl: (json['actual_volume_ml'] as num?)?.toInt(),
  aftersaleNo: json['aftersale_no'] as String?,
  aftersaleRejectReason: json['aftersale_reject_reason'] as String?,
  aftersaleReviews:
      (json['aftersale_reviews'] as List<dynamic>?)
          ?.map(
            (e) => HandlerOrderAftersaleReviewItem.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      [],
  aftersaleStatus: json['aftersale_status'] as String?,
  cancelReason: json['cancel_reason'] as String?,
  cancelledAt: json['cancelled_at'] as String?,
  cardPaidCents: (json['card_paid_cents'] as num?)?.toInt(),
  cardRefundedCents: (json['card_refunded_cents'] as num?)?.toInt(),
  channelPaidCents: (json['channel_paid_cents'] as num?)?.toInt(),
  channelPaymentMethod:
      handlerOrderAdminDetailResponseChannelPaymentMethodNullableFromJson(
        json['channel_payment_method'],
      ),
  channelRefundedCents: (json['channel_refunded_cents'] as num?)?.toInt(),
  completedAt: json['completed_at'] as String?,
  createdAt: json['created_at'] as String?,
  deviceAddress: json['device_address'] as String?,
  deviceId: (json['device_id'] as num?)?.toInt(),
  deviceName: json['device_name'] as String?,
  deviceSn: json['device_sn'] as String?,
  dispenseEndReason:
      handlerOrderAdminDetailResponseDispenseEndReasonNullableFromJson(
        json['dispense_end_reason'],
      ),
  dispenseResult: handlerOrderAdminDetailResponseDispenseResultNullableFromJson(
    json['dispense_result'],
  ),
  dispenseStartedAt: json['dispense_started_at'] as String?,
  displayStatus: handlerOrderAdminDetailResponseDisplayStatusNullableFromJson(
    json['display_status'],
  ),
  dueCents: (json['due_cents'] as num?)?.toInt(),
  icCardNo: json['ic_card_no'] as String?,
  id: (json['id'] as num?)?.toInt(),
  interactionStartedAt: json['interaction_started_at'] as String?,
  orderNo: json['order_no'] as String?,
  paidAt: json['paid_at'] as String?,
  paidCents: (json['paid_cents'] as num?)?.toInt(),
  pauseCount: (json['pause_count'] as num?)?.toInt(),
  paused: json['paused'] as bool?,
  paymentMethod: handlerOrderAdminDetailResponsePaymentMethodNullableFromJson(
    json['payment_method'],
  ),
  paymentMethodText: json['payment_method_text'] as String?,
  pays:
      (json['pays'] as List<dynamic>?)
          ?.map((e) => HandlerOrderPayItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  pendingRefundCents: (json['pending_refund_cents'] as num?)?.toInt(),
  pricePerLiterCents: (json['price_per_liter_cents'] as num?)?.toInt(),
  quotaDeductedCents: (json['quota_deducted_cents'] as num?)?.toInt(),
  quotaPaidCents: (json['quota_paid_cents'] as num?)?.toInt(),
  quotaRefundedCents: (json['quota_refunded_cents'] as num?)?.toInt(),
  refundProgress: handlerOrderAdminDetailResponseRefundProgressNullableFromJson(
    json['refund_progress'],
  ),
  refundStatus: handlerOrderAdminDetailResponseRefundStatusNullableFromJson(
    json['refund_status'],
  ),
  refundablePaidCents: (json['refundable_paid_cents'] as num?)?.toInt(),
  refundableQuotaCents: (json['refundable_quota_cents'] as num?)?.toInt(),
  refundedCents: (json['refunded_cents'] as num?)?.toInt(),
  refunds:
      (json['refunds'] as List<dynamic>?)
          ?.map(
            (e) => HandlerOrderRefundItem.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
  resultConfirmable: json['result_confirmable'] as bool?,
  resultConfirmableAt: json['result_confirmable_at'] as String?,
  resultConfirmingAt: json['result_confirming_at'] as String?,
  selectedVolumeMl: (json['selected_volume_ml'] as num?)?.toInt(),
  sessionId: json['session_id'] as String?,
  status: handlerOrderAdminDetailResponseStatusNullableFromJson(json['status']),
  statusLogs:
      (json['status_logs'] as List<dynamic>?)
          ?.map(
            (e) =>
                HandlerOrderStatusLogItem.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
  topupCents: (json['topup_cents'] as num?)?.toInt(),
  topupKind: handlerOrderAdminDetailResponseTopupKindNullableFromJson(
    json['topup_kind'],
  ),
  topupOrderNo: json['topup_order_no'] as String?,
  totalCents: (json['total_cents'] as num?)?.toInt(),
  tradeNo: json['trade_no'] as String?,
  waterType: json['water_type'] as String?,
);

Map<String, dynamic> _$HandlerOrderAdminDetailResponseToJson(
  HandlerOrderAdminDetailResponse instance,
) => <String, dynamic>{
  'abnormal': instance.abnormal,
  'abnormal_reason': instance.abnormalReason,
  'actual_paid_cents': instance.actualPaidCents,
  'actual_refunded_cents': instance.actualRefundedCents,
  'actual_volume_ml': instance.actualVolumeMl,
  'aftersale_no': instance.aftersaleNo,
  'aftersale_reject_reason': instance.aftersaleRejectReason,
  'aftersale_reviews': instance.aftersaleReviews
      ?.map((e) => e.toJson())
      .toList(),
  'aftersale_status': instance.aftersaleStatus,
  'cancel_reason': instance.cancelReason,
  'cancelled_at': instance.cancelledAt,
  'card_paid_cents': instance.cardPaidCents,
  'card_refunded_cents': instance.cardRefundedCents,
  'channel_paid_cents': instance.channelPaidCents,
  'channel_payment_method':
      handlerOrderAdminDetailResponseChannelPaymentMethodNullableToJson(
        instance.channelPaymentMethod,
      ),
  'channel_refunded_cents': instance.channelRefundedCents,
  'completed_at': instance.completedAt,
  'created_at': instance.createdAt,
  'device_address': instance.deviceAddress,
  'device_id': instance.deviceId,
  'device_name': instance.deviceName,
  'device_sn': instance.deviceSn,
  'dispense_end_reason':
      handlerOrderAdminDetailResponseDispenseEndReasonNullableToJson(
        instance.dispenseEndReason,
      ),
  'dispense_result':
      handlerOrderAdminDetailResponseDispenseResultNullableToJson(
        instance.dispenseResult,
      ),
  'dispense_started_at': instance.dispenseStartedAt,
  'display_status': handlerOrderAdminDetailResponseDisplayStatusNullableToJson(
    instance.displayStatus,
  ),
  'due_cents': instance.dueCents,
  'ic_card_no': instance.icCardNo,
  'id': instance.id,
  'interaction_started_at': instance.interactionStartedAt,
  'order_no': instance.orderNo,
  'paid_at': instance.paidAt,
  'paid_cents': instance.paidCents,
  'pause_count': instance.pauseCount,
  'paused': instance.paused,
  'payment_method': handlerOrderAdminDetailResponsePaymentMethodNullableToJson(
    instance.paymentMethod,
  ),
  'payment_method_text': instance.paymentMethodText,
  'pays': instance.pays?.map((e) => e.toJson()).toList(),
  'pending_refund_cents': instance.pendingRefundCents,
  'price_per_liter_cents': instance.pricePerLiterCents,
  'quota_deducted_cents': instance.quotaDeductedCents,
  'quota_paid_cents': instance.quotaPaidCents,
  'quota_refunded_cents': instance.quotaRefundedCents,
  'refund_progress':
      handlerOrderAdminDetailResponseRefundProgressNullableToJson(
        instance.refundProgress,
      ),
  'refund_status': handlerOrderAdminDetailResponseRefundStatusNullableToJson(
    instance.refundStatus,
  ),
  'refundable_paid_cents': instance.refundablePaidCents,
  'refundable_quota_cents': instance.refundableQuotaCents,
  'refunded_cents': instance.refundedCents,
  'refunds': instance.refunds?.map((e) => e.toJson()).toList(),
  'result_confirmable': instance.resultConfirmable,
  'result_confirmable_at': instance.resultConfirmableAt,
  'result_confirming_at': instance.resultConfirmingAt,
  'selected_volume_ml': instance.selectedVolumeMl,
  'session_id': instance.sessionId,
  'status': handlerOrderAdminDetailResponseStatusNullableToJson(
    instance.status,
  ),
  'status_logs': instance.statusLogs?.map((e) => e.toJson()).toList(),
  'topup_cents': instance.topupCents,
  'topup_kind': handlerOrderAdminDetailResponseTopupKindNullableToJson(
    instance.topupKind,
  ),
  'topup_order_no': instance.topupOrderNo,
  'total_cents': instance.totalCents,
  'trade_no': instance.tradeNo,
  'water_type': instance.waterType,
};

HandlerOrderAdminDispenseRequest _$HandlerOrderAdminDispenseRequestFromJson(
  Map<String, dynamic> json,
) => HandlerOrderAdminDispenseRequest(
  actualVolumeMl: (json['actual_volume_ml'] as num?)?.toInt(),
  remark: json['remark'] as String?,
);

Map<String, dynamic> _$HandlerOrderAdminDispenseRequestToJson(
  HandlerOrderAdminDispenseRequest instance,
) => <String, dynamic>{
  'actual_volume_ml': instance.actualVolumeMl,
  'remark': instance.remark,
};

HandlerOrderAdminItem _$HandlerOrderAdminItemFromJson(
  Map<String, dynamic> json,
) => HandlerOrderAdminItem(
  abnormal: json['abnormal'] as bool?,
  abnormalReason: json['abnormal_reason'] as String?,
  actualPaidCents: (json['actual_paid_cents'] as num?)?.toInt(),
  actualRefundedCents: (json['actual_refunded_cents'] as num?)?.toInt(),
  actualVolumeMl: (json['actual_volume_ml'] as num?)?.toInt(),
  aftersaleNo: json['aftersale_no'] as String?,
  aftersaleStatus: json['aftersale_status'] as String?,
  cancelReason: json['cancel_reason'] as String?,
  cancelledAt: json['cancelled_at'] as String?,
  completedAt: json['completed_at'] as String?,
  createdAt: json['created_at'] as String?,
  deviceAddress: json['device_address'] as String?,
  deviceId: (json['device_id'] as num?)?.toInt(),
  deviceName: json['device_name'] as String?,
  deviceRegion: json['device_region'] as String?,
  deviceRegionCode: json['device_region_code'] as String?,
  deviceSn: json['device_sn'] as String?,
  dispenseEndReason: handlerOrderAdminItemDispenseEndReasonNullableFromJson(
    json['dispense_end_reason'],
  ),
  dispenseFinishedAt: json['dispense_finished_at'] as String?,
  dispenseResult: handlerOrderAdminItemDispenseResultNullableFromJson(
    json['dispense_result'],
  ),
  dispenseStartedAt: json['dispense_started_at'] as String?,
  displayStatus: handlerOrderAdminItemDisplayStatusNullableFromJson(
    json['display_status'],
  ),
  dueCents: (json['due_cents'] as num?)?.toInt(),
  icBalanceAfter: (json['ic_balance_after'] as num?)?.toInt(),
  icBalanceBefore: (json['ic_balance_before'] as num?)?.toInt(),
  icCardNo: json['ic_card_no'] as String?,
  id: (json['id'] as num?)?.toInt(),
  interactionStartedAt: json['interaction_started_at'] as String?,
  orderNo: json['order_no'] as String?,
  originPaidCents: (json['origin_paid_cents'] as num?)?.toInt(),
  originPaymentMethod: handlerOrderAdminItemOriginPaymentMethodNullableFromJson(
    json['origin_payment_method'],
  ),
  paidAt: json['paid_at'] as String?,
  paidCents: (json['paid_cents'] as num?)?.toInt(),
  pauseCount: (json['pause_count'] as num?)?.toInt(),
  paused: json['paused'] as bool?,
  paymentMethod: handlerOrderAdminItemPaymentMethodNullableFromJson(
    json['payment_method'],
  ),
  paymentMethodText: json['payment_method_text'] as String?,
  pendingRefundCents: (json['pending_refund_cents'] as num?)?.toInt(),
  pricePerLiterCents: (json['price_per_liter_cents'] as num?)?.toInt(),
  quotaDeductedCents: (json['quota_deducted_cents'] as num?)?.toInt(),
  quotaPaidCents: (json['quota_paid_cents'] as num?)?.toInt(),
  quotaRefundedCents: (json['quota_refunded_cents'] as num?)?.toInt(),
  refundProgress: handlerOrderAdminItemRefundProgressNullableFromJson(
    json['refund_progress'],
  ),
  refundStatus: handlerOrderAdminItemRefundStatusNullableFromJson(
    json['refund_status'],
  ),
  refundablePaidCents: (json['refundable_paid_cents'] as num?)?.toInt(),
  refundableQuotaCents: (json['refundable_quota_cents'] as num?)?.toInt(),
  refundedCents: (json['refunded_cents'] as num?)?.toInt(),
  resultConfirmable: json['result_confirmable'] as bool?,
  resultConfirmableAt: json['result_confirmable_at'] as String?,
  resultConfirmingAt: json['result_confirming_at'] as String?,
  selectedVolumeMl: (json['selected_volume_ml'] as num?)?.toInt(),
  sessionId: json['session_id'] as String?,
  status: handlerOrderAdminItemStatusNullableFromJson(json['status']),
  topupPaidCents: (json['topup_paid_cents'] as num?)?.toInt(),
  topupPaymentMethod: handlerOrderAdminItemTopupPaymentMethodNullableFromJson(
    json['topup_payment_method'],
  ),
  totalCents: (json['total_cents'] as num?)?.toInt(),
  tradeNo: json['trade_no'] as String?,
  userCode: json['user_code'] as String?,
  userName: json['user_name'] as String?,
  waterType: json['water_type'] as String?,
);

Map<String, dynamic> _$HandlerOrderAdminItemToJson(
  HandlerOrderAdminItem instance,
) => <String, dynamic>{
  'abnormal': instance.abnormal,
  'abnormal_reason': instance.abnormalReason,
  'actual_paid_cents': instance.actualPaidCents,
  'actual_refunded_cents': instance.actualRefundedCents,
  'actual_volume_ml': instance.actualVolumeMl,
  'aftersale_no': instance.aftersaleNo,
  'aftersale_status': instance.aftersaleStatus,
  'cancel_reason': instance.cancelReason,
  'cancelled_at': instance.cancelledAt,
  'completed_at': instance.completedAt,
  'created_at': instance.createdAt,
  'device_address': instance.deviceAddress,
  'device_id': instance.deviceId,
  'device_name': instance.deviceName,
  'device_region': instance.deviceRegion,
  'device_region_code': instance.deviceRegionCode,
  'device_sn': instance.deviceSn,
  'dispense_end_reason': handlerOrderAdminItemDispenseEndReasonNullableToJson(
    instance.dispenseEndReason,
  ),
  'dispense_finished_at': instance.dispenseFinishedAt,
  'dispense_result': handlerOrderAdminItemDispenseResultNullableToJson(
    instance.dispenseResult,
  ),
  'dispense_started_at': instance.dispenseStartedAt,
  'display_status': handlerOrderAdminItemDisplayStatusNullableToJson(
    instance.displayStatus,
  ),
  'due_cents': instance.dueCents,
  'ic_balance_after': instance.icBalanceAfter,
  'ic_balance_before': instance.icBalanceBefore,
  'ic_card_no': instance.icCardNo,
  'id': instance.id,
  'interaction_started_at': instance.interactionStartedAt,
  'order_no': instance.orderNo,
  'origin_paid_cents': instance.originPaidCents,
  'origin_payment_method':
      handlerOrderAdminItemOriginPaymentMethodNullableToJson(
        instance.originPaymentMethod,
      ),
  'paid_at': instance.paidAt,
  'paid_cents': instance.paidCents,
  'pause_count': instance.pauseCount,
  'paused': instance.paused,
  'payment_method': handlerOrderAdminItemPaymentMethodNullableToJson(
    instance.paymentMethod,
  ),
  'payment_method_text': instance.paymentMethodText,
  'pending_refund_cents': instance.pendingRefundCents,
  'price_per_liter_cents': instance.pricePerLiterCents,
  'quota_deducted_cents': instance.quotaDeductedCents,
  'quota_paid_cents': instance.quotaPaidCents,
  'quota_refunded_cents': instance.quotaRefundedCents,
  'refund_progress': handlerOrderAdminItemRefundProgressNullableToJson(
    instance.refundProgress,
  ),
  'refund_status': handlerOrderAdminItemRefundStatusNullableToJson(
    instance.refundStatus,
  ),
  'refundable_paid_cents': instance.refundablePaidCents,
  'refundable_quota_cents': instance.refundableQuotaCents,
  'refunded_cents': instance.refundedCents,
  'result_confirmable': instance.resultConfirmable,
  'result_confirmable_at': instance.resultConfirmableAt,
  'result_confirming_at': instance.resultConfirmingAt,
  'selected_volume_ml': instance.selectedVolumeMl,
  'session_id': instance.sessionId,
  'status': handlerOrderAdminItemStatusNullableToJson(instance.status),
  'topup_paid_cents': instance.topupPaidCents,
  'topup_payment_method': handlerOrderAdminItemTopupPaymentMethodNullableToJson(
    instance.topupPaymentMethod,
  ),
  'total_cents': instance.totalCents,
  'trade_no': instance.tradeNo,
  'user_code': instance.userCode,
  'user_name': instance.userName,
  'water_type': instance.waterType,
};

HandlerOrderAdminListResponse _$HandlerOrderAdminListResponseFromJson(
  Map<String, dynamic> json,
) => HandlerOrderAdminListResponse(
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) => HandlerOrderAdminItem.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
  total: (json['total'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerOrderAdminListResponseToJson(
  HandlerOrderAdminListResponse instance,
) => <String, dynamic>{
  'items': instance.items?.map((e) => e.toJson()).toList(),
  'total': instance.total,
};

HandlerOrderAftersaleReviewItem _$HandlerOrderAftersaleReviewItemFromJson(
  Map<String, dynamic> json,
) => HandlerOrderAftersaleReviewItem(
  applicantId: (json['applicant_id'] as num?)?.toInt(),
  applicantName: json['applicant_name'] as String?,
  appliedAt: json['applied_at'] as String?,
  applyReason: json['apply_reason'] as String?,
  refundPaidCents: (json['refund_paid_cents'] as num?)?.toInt(),
  refundQuotaCents: (json['refund_quota_cents'] as num?)?.toInt(),
  rejectReason: json['reject_reason'] as String?,
  result: handlerOrderAftersaleReviewItemResultNullableFromJson(json['result']),
  reviewedAt: json['reviewed_at'] as String?,
  reviewerId: (json['reviewer_id'] as num?)?.toInt(),
  reviewerName: json['reviewer_name'] as String?,
  round: (json['round'] as num?)?.toInt(),
  type: handlerOrderAftersaleReviewItemTypeNullableFromJson(json['type']),
);

Map<String, dynamic> _$HandlerOrderAftersaleReviewItemToJson(
  HandlerOrderAftersaleReviewItem instance,
) => <String, dynamic>{
  'applicant_id': instance.applicantId,
  'applicant_name': instance.applicantName,
  'applied_at': instance.appliedAt,
  'apply_reason': instance.applyReason,
  'refund_paid_cents': instance.refundPaidCents,
  'refund_quota_cents': instance.refundQuotaCents,
  'reject_reason': instance.rejectReason,
  'result': handlerOrderAftersaleReviewItemResultNullableToJson(
    instance.result,
  ),
  'reviewed_at': instance.reviewedAt,
  'reviewer_id': instance.reviewerId,
  'reviewer_name': instance.reviewerName,
  'round': instance.round,
  'type': handlerOrderAftersaleReviewItemTypeNullableToJson(instance.type),
};

HandlerOrderCancelRequest _$HandlerOrderCancelRequestFromJson(
  Map<String, dynamic> json,
) => HandlerOrderCancelRequest(reason: json['reason'] as String?);

Map<String, dynamic> _$HandlerOrderCancelRequestToJson(
  HandlerOrderCancelRequest instance,
) => <String, dynamic>{'reason': instance.reason};

HandlerOrderCardPayRequest _$HandlerOrderCardPayRequestFromJson(
  Map<String, dynamic> json,
) => HandlerOrderCardPayRequest(cardNo: json['card_no'] as String);

Map<String, dynamic> _$HandlerOrderCardPayRequestToJson(
  HandlerOrderCardPayRequest instance,
) => <String, dynamic>{'card_no': instance.cardNo};

HandlerOrderCardPayResponse _$HandlerOrderCardPayResponseFromJson(
  Map<String, dynamic> json,
) => HandlerOrderCardPayResponse(
  needsTopup: json['needs_topup'] as bool?,
  order: json['order'] == null
      ? null
      : HandlerOrderResponse.fromJson(json['order'] as Map<String, dynamic>),
  paidCents: (json['paid_cents'] as num?)?.toInt(),
  shortCents: (json['short_cents'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerOrderCardPayResponseToJson(
  HandlerOrderCardPayResponse instance,
) => <String, dynamic>{
  'needs_topup': instance.needsTopup,
  'order': instance.order?.toJson(),
  'paid_cents': instance.paidCents,
  'short_cents': instance.shortCents,
};

HandlerOrderCardTopupPayRequest _$HandlerOrderCardTopupPayRequestFromJson(
  Map<String, dynamic> json,
) => HandlerOrderCardTopupPayRequest(
  method: handlerOrderCardTopupPayRequestMethodFromJson(json['method']),
);

Map<String, dynamic> _$HandlerOrderCardTopupPayRequestToJson(
  HandlerOrderCardTopupPayRequest instance,
) => <String, dynamic>{
  'method': handlerOrderCardTopupPayRequestMethodToJson(instance.method),
};

HandlerOrderCardTopupPayResponse _$HandlerOrderCardTopupPayResponseFromJson(
  Map<String, dynamic> json,
) => HandlerOrderCardTopupPayResponse(
  channel: json['channel'] as String?,
  expiresAt: json['expires_at'] as String?,
  order: json['order'] == null
      ? null
      : HandlerOrderResponse.fromJson(json['order'] as Map<String, dynamic>),
  payUrl: json['pay_url'] as String?,
  qrcode: json['qrcode'] as String?,
  topupCents: (json['topup_cents'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerOrderCardTopupPayResponseToJson(
  HandlerOrderCardTopupPayResponse instance,
) => <String, dynamic>{
  'channel': instance.channel,
  'expires_at': instance.expiresAt,
  'order': instance.order?.toJson(),
  'pay_url': instance.payUrl,
  'qrcode': instance.qrcode,
  'topup_cents': instance.topupCents,
};

HandlerOrderCardTopupRequest _$HandlerOrderCardTopupRequestFromJson(
  Map<String, dynamic> json,
) => HandlerOrderCardTopupRequest(
  method: handlerOrderCardTopupRequestMethodFromJson(json['method']),
  topupCents: (json['topup_cents'] as num).toInt(),
);

Map<String, dynamic> _$HandlerOrderCardTopupRequestToJson(
  HandlerOrderCardTopupRequest instance,
) => <String, dynamic>{
  'method': handlerOrderCardTopupRequestMethodToJson(instance.method),
  'topup_cents': instance.topupCents,
};

HandlerOrderClientDetailResponse _$HandlerOrderClientDetailResponseFromJson(
  Map<String, dynamic> json,
) => HandlerOrderClientDetailResponse(
  abnormal: json['abnormal'] as bool?,
  abnormalReason: json['abnormal_reason'] as String?,
  actualPaidCents: (json['actual_paid_cents'] as num?)?.toInt(),
  actualRefundedCents: (json['actual_refunded_cents'] as num?)?.toInt(),
  actualVolumeMl: (json['actual_volume_ml'] as num?)?.toInt(),
  aftersaleStatus:
      handlerOrderClientDetailResponseAftersaleStatusNullableFromJson(
        json['aftersale_status'],
      ),
  aftersaleType: handlerOrderClientDetailResponseAftersaleTypeNullableFromJson(
    json['aftersale_type'],
  ),
  cancelReason: json['cancel_reason'] as String?,
  cancelledAt: json['cancelled_at'] as String?,
  channelPaymentMethod:
      handlerOrderClientDetailResponseChannelPaymentMethodNullableFromJson(
        json['channel_payment_method'],
      ),
  completedAt: json['completed_at'] as String?,
  createdAt: json['created_at'] as String?,
  deviceAddress: json['device_address'] as String?,
  deviceId: (json['device_id'] as num?)?.toInt(),
  deviceName: json['device_name'] as String?,
  deviceSn: json['device_sn'] as String?,
  dispenseEndReason:
      handlerOrderClientDetailResponseDispenseEndReasonNullableFromJson(
        json['dispense_end_reason'],
      ),
  dispenseResult:
      handlerOrderClientDetailResponseDispenseResultNullableFromJson(
        json['dispense_result'],
      ),
  dispenseStartedAt: json['dispense_started_at'] as String?,
  displayStatus: handlerOrderClientDetailResponseDisplayStatusNullableFromJson(
    json['display_status'],
  ),
  dueCents: (json['due_cents'] as num?)?.toInt(),
  id: (json['id'] as num?)?.toInt(),
  interactionStartedAt: json['interaction_started_at'] as String?,
  orderNo: json['order_no'] as String?,
  paidAt: json['paid_at'] as String?,
  paidCents: (json['paid_cents'] as num?)?.toInt(),
  pauseCount: (json['pause_count'] as num?)?.toInt(),
  paused: json['paused'] as bool?,
  paymentMethod: handlerOrderClientDetailResponsePaymentMethodNullableFromJson(
    json['payment_method'],
  ),
  pays:
      (json['pays'] as List<dynamic>?)
          ?.map((e) => HandlerOrderPayItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  pendingRefundCents: (json['pending_refund_cents'] as num?)?.toInt(),
  pricePerLiterCents: (json['price_per_liter_cents'] as num?)?.toInt(),
  quotaDeductedCents: (json['quota_deducted_cents'] as num?)?.toInt(),
  quotaPaidCents: (json['quota_paid_cents'] as num?)?.toInt(),
  quotaRefundedCents: (json['quota_refunded_cents'] as num?)?.toInt(),
  refundProgress:
      handlerOrderClientDetailResponseRefundProgressNullableFromJson(
        json['refund_progress'],
      ),
  refundStatus: handlerOrderClientDetailResponseRefundStatusNullableFromJson(
    json['refund_status'],
  ),
  refundedCents: (json['refunded_cents'] as num?)?.toInt(),
  refunds:
      (json['refunds'] as List<dynamic>?)
          ?.map(
            (e) => HandlerOrderClientRefundItem.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      [],
  selectedVolumeMl: (json['selected_volume_ml'] as num?)?.toInt(),
  sessionId: json['session_id'] as String?,
  status: handlerOrderClientDetailResponseStatusNullableFromJson(
    json['status'],
  ),
  topupKind: handlerOrderClientDetailResponseTopupKindNullableFromJson(
    json['topup_kind'],
  ),
  totalCents: (json['total_cents'] as num?)?.toInt(),
  tradeNo: json['trade_no'] as String?,
  userCode: json['user_code'] as String?,
  waterType: json['water_type'] as String?,
);

Map<String, dynamic> _$HandlerOrderClientDetailResponseToJson(
  HandlerOrderClientDetailResponse instance,
) => <String, dynamic>{
  'abnormal': instance.abnormal,
  'abnormal_reason': instance.abnormalReason,
  'actual_paid_cents': instance.actualPaidCents,
  'actual_refunded_cents': instance.actualRefundedCents,
  'actual_volume_ml': instance.actualVolumeMl,
  'aftersale_status':
      handlerOrderClientDetailResponseAftersaleStatusNullableToJson(
        instance.aftersaleStatus,
      ),
  'aftersale_type': handlerOrderClientDetailResponseAftersaleTypeNullableToJson(
    instance.aftersaleType,
  ),
  'cancel_reason': instance.cancelReason,
  'cancelled_at': instance.cancelledAt,
  'channel_payment_method':
      handlerOrderClientDetailResponseChannelPaymentMethodNullableToJson(
        instance.channelPaymentMethod,
      ),
  'completed_at': instance.completedAt,
  'created_at': instance.createdAt,
  'device_address': instance.deviceAddress,
  'device_id': instance.deviceId,
  'device_name': instance.deviceName,
  'device_sn': instance.deviceSn,
  'dispense_end_reason':
      handlerOrderClientDetailResponseDispenseEndReasonNullableToJson(
        instance.dispenseEndReason,
      ),
  'dispense_result':
      handlerOrderClientDetailResponseDispenseResultNullableToJson(
        instance.dispenseResult,
      ),
  'dispense_started_at': instance.dispenseStartedAt,
  'display_status': handlerOrderClientDetailResponseDisplayStatusNullableToJson(
    instance.displayStatus,
  ),
  'due_cents': instance.dueCents,
  'id': instance.id,
  'interaction_started_at': instance.interactionStartedAt,
  'order_no': instance.orderNo,
  'paid_at': instance.paidAt,
  'paid_cents': instance.paidCents,
  'pause_count': instance.pauseCount,
  'paused': instance.paused,
  'payment_method': handlerOrderClientDetailResponsePaymentMethodNullableToJson(
    instance.paymentMethod,
  ),
  'pays': instance.pays?.map((e) => e.toJson()).toList(),
  'pending_refund_cents': instance.pendingRefundCents,
  'price_per_liter_cents': instance.pricePerLiterCents,
  'quota_deducted_cents': instance.quotaDeductedCents,
  'quota_paid_cents': instance.quotaPaidCents,
  'quota_refunded_cents': instance.quotaRefundedCents,
  'refund_progress':
      handlerOrderClientDetailResponseRefundProgressNullableToJson(
        instance.refundProgress,
      ),
  'refund_status': handlerOrderClientDetailResponseRefundStatusNullableToJson(
    instance.refundStatus,
  ),
  'refunded_cents': instance.refundedCents,
  'refunds': instance.refunds?.map((e) => e.toJson()).toList(),
  'selected_volume_ml': instance.selectedVolumeMl,
  'session_id': instance.sessionId,
  'status': handlerOrderClientDetailResponseStatusNullableToJson(
    instance.status,
  ),
  'topup_kind': handlerOrderClientDetailResponseTopupKindNullableToJson(
    instance.topupKind,
  ),
  'total_cents': instance.totalCents,
  'trade_no': instance.tradeNo,
  'user_code': instance.userCode,
  'water_type': instance.waterType,
};

HandlerOrderClientRefundItem _$HandlerOrderClientRefundItemFromJson(
  Map<String, dynamic> json,
) => HandlerOrderClientRefundItem(
  amountCents: (json['amount_cents'] as num?)?.toInt(),
  channel: handlerOrderClientRefundItemChannelNullableFromJson(json['channel']),
  createdAt: json['created_at'] as String?,
  reason: json['reason'] as String?,
  refundNo: json['refund_no'] as String?,
  status: handlerOrderClientRefundItemStatusNullableFromJson(json['status']),
  tradeNo: json['trade_no'] as String?,
);

Map<String, dynamic> _$HandlerOrderClientRefundItemToJson(
  HandlerOrderClientRefundItem instance,
) => <String, dynamic>{
  'amount_cents': instance.amountCents,
  'channel': handlerOrderClientRefundItemChannelNullableToJson(
    instance.channel,
  ),
  'created_at': instance.createdAt,
  'reason': instance.reason,
  'refund_no': instance.refundNo,
  'status': handlerOrderClientRefundItemStatusNullableToJson(instance.status),
  'trade_no': instance.tradeNo,
};

HandlerOrderListResponse _$HandlerOrderListResponseFromJson(
  Map<String, dynamic> json,
) => HandlerOrderListResponse(
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) => HandlerOrderRefundedResponse.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      [],
  total: (json['total'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerOrderListResponseToJson(
  HandlerOrderListResponse instance,
) => <String, dynamic>{
  'items': instance.items?.map((e) => e.toJson()).toList(),
  'total': instance.total,
};

HandlerOrderOngoingResponse _$HandlerOrderOngoingResponseFromJson(
  Map<String, dynamic> json,
) => HandlerOrderOngoingResponse(
  orders:
      (json['orders'] as List<dynamic>?)
          ?.map((e) => HandlerOrderResponse.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
);

Map<String, dynamic> _$HandlerOrderOngoingResponseToJson(
  HandlerOrderOngoingResponse instance,
) => <String, dynamic>{
  'orders': instance.orders?.map((e) => e.toJson()).toList(),
};

HandlerOrderPayItem _$HandlerOrderPayItemFromJson(Map<String, dynamic> json) =>
    HandlerOrderPayItem(
      amountCents: (json['amount_cents'] as num?)?.toInt(),
      cardNo: json['card_no'] as String?,
      channel: handlerOrderPayItemChannelNullableFromJson(json['channel']),
      channelOrderNo: json['channel_order_no'] as String?,
      paidAt: json['paid_at'] as String?,
      tradeNo: json['trade_no'] as String?,
    );

Map<String, dynamic> _$HandlerOrderPayItemToJson(
  HandlerOrderPayItem instance,
) => <String, dynamic>{
  'amount_cents': instance.amountCents,
  'card_no': instance.cardNo,
  'channel': handlerOrderPayItemChannelNullableToJson(instance.channel),
  'channel_order_no': instance.channelOrderNo,
  'paid_at': instance.paidAt,
  'trade_no': instance.tradeNo,
};

HandlerOrderPaymentRequest _$HandlerOrderPaymentRequestFromJson(
  Map<String, dynamic> json,
) => HandlerOrderPaymentRequest(sessionId: json['session_id'] as String?);

Map<String, dynamic> _$HandlerOrderPaymentRequestToJson(
  HandlerOrderPaymentRequest instance,
) => <String, dynamic>{'session_id': instance.sessionId};

HandlerOrderPaymentResponse _$HandlerOrderPaymentResponseFromJson(
  Map<String, dynamic> json,
) => HandlerOrderPaymentResponse(
  channel: json['channel'] as String?,
  expiresAt: json['expires_at'] as String?,
  orderNo: json['order_no'] as String?,
  payUrl: json['pay_url'] as String?,
  payableCents: (json['payable_cents'] as num?)?.toInt(),
  qrCode: json['qr_code'] as String?,
  quotaDeductCents: (json['quota_deduct_cents'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerOrderPaymentResponseToJson(
  HandlerOrderPaymentResponse instance,
) => <String, dynamic>{
  'channel': instance.channel,
  'expires_at': instance.expiresAt,
  'order_no': instance.orderNo,
  'pay_url': instance.payUrl,
  'payable_cents': instance.payableCents,
  'qr_code': instance.qrCode,
  'quota_deduct_cents': instance.quotaDeductCents,
};

HandlerOrderProgressRequest _$HandlerOrderProgressRequestFromJson(
  Map<String, dynamic> json,
) => HandlerOrderProgressRequest(
  actualVolumeMl: (json['actual_volume_ml'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerOrderProgressRequestToJson(
  HandlerOrderProgressRequest instance,
) => <String, dynamic>{'actual_volume_ml': instance.actualVolumeMl};

HandlerOrderQuoteRequest _$HandlerOrderQuoteRequestFromJson(
  Map<String, dynamic> json,
) => HandlerOrderQuoteRequest(
  deviceSn: json['device_sn'] as String,
  method: handlerOrderQuoteRequestMethodFromJson(json['method']),
  volumeMl: (json['volume_ml'] as num).toInt(),
  waterType: handlerOrderQuoteRequestWaterTypeFromJson(json['water_type']),
);

Map<String, dynamic> _$HandlerOrderQuoteRequestToJson(
  HandlerOrderQuoteRequest instance,
) => <String, dynamic>{
  'device_sn': instance.deviceSn,
  'method': handlerOrderQuoteRequestMethodToJson(instance.method),
  'volume_ml': instance.volumeMl,
  'water_type': handlerOrderQuoteRequestWaterTypeToJson(instance.waterType),
};

HandlerOrderQuoteResponse _$HandlerOrderQuoteResponseFromJson(
  Map<String, dynamic> json,
) => HandlerOrderQuoteResponse(
  freeMode: json['free_mode'] as bool?,
  payableCents: (json['payable_cents'] as num?)?.toInt(),
  pricePerLiterCents: (json['price_per_liter_cents'] as num?)?.toInt(),
  quotaDeductCents: (json['quota_deduct_cents'] as num?)?.toInt(),
  totalCents: (json['total_cents'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerOrderQuoteResponseToJson(
  HandlerOrderQuoteResponse instance,
) => <String, dynamic>{
  'free_mode': instance.freeMode,
  'payable_cents': instance.payableCents,
  'price_per_liter_cents': instance.pricePerLiterCents,
  'quota_deduct_cents': instance.quotaDeductCents,
  'total_cents': instance.totalCents,
};

HandlerOrderRefundItem _$HandlerOrderRefundItemFromJson(
  Map<String, dynamic> json,
) => HandlerOrderRefundItem(
  amountCents: (json['amount_cents'] as num?)?.toInt(),
  channel: handlerOrderRefundItemChannelNullableFromJson(json['channel']),
  createdAt: json['created_at'] as String?,
  error: json['error'] as String?,
  reason: json['reason'] as String?,
  refundNo: json['refund_no'] as String?,
  retryCount: (json['retry_count'] as num?)?.toInt(),
  status: handlerOrderRefundItemStatusNullableFromJson(json['status']),
  tradeNo: json['trade_no'] as String?,
);

Map<String, dynamic> _$HandlerOrderRefundItemToJson(
  HandlerOrderRefundItem instance,
) => <String, dynamic>{
  'amount_cents': instance.amountCents,
  'channel': handlerOrderRefundItemChannelNullableToJson(instance.channel),
  'created_at': instance.createdAt,
  'error': instance.error,
  'reason': instance.reason,
  'refund_no': instance.refundNo,
  'retry_count': instance.retryCount,
  'status': handlerOrderRefundItemStatusNullableToJson(instance.status),
  'trade_no': instance.tradeNo,
};

HandlerOrderRefundedResponse _$HandlerOrderRefundedResponseFromJson(
  Map<String, dynamic> json,
) => HandlerOrderRefundedResponse(
  abnormal: json['abnormal'] as bool?,
  abnormalReason: json['abnormal_reason'] as String?,
  actualPaidCents: (json['actual_paid_cents'] as num?)?.toInt(),
  actualRefundedCents: (json['actual_refunded_cents'] as num?)?.toInt(),
  actualVolumeMl: (json['actual_volume_ml'] as num?)?.toInt(),
  cancelReason: json['cancel_reason'] as String?,
  cancelledAt: json['cancelled_at'] as String?,
  completedAt: json['completed_at'] as String?,
  createdAt: json['created_at'] as String?,
  deviceAddress: json['device_address'] as String?,
  deviceId: (json['device_id'] as num?)?.toInt(),
  deviceName: json['device_name'] as String?,
  deviceSn: json['device_sn'] as String?,
  dispenseEndReason:
      handlerOrderRefundedResponseDispenseEndReasonNullableFromJson(
        json['dispense_end_reason'],
      ),
  dispenseResult: handlerOrderRefundedResponseDispenseResultNullableFromJson(
    json['dispense_result'],
  ),
  dispenseStartedAt: json['dispense_started_at'] as String?,
  displayStatus: handlerOrderRefundedResponseDisplayStatusNullableFromJson(
    json['display_status'],
  ),
  dueCents: (json['due_cents'] as num?)?.toInt(),
  id: (json['id'] as num?)?.toInt(),
  interactionStartedAt: json['interaction_started_at'] as String?,
  orderNo: json['order_no'] as String?,
  paidAt: json['paid_at'] as String?,
  paidCents: (json['paid_cents'] as num?)?.toInt(),
  pauseCount: (json['pause_count'] as num?)?.toInt(),
  paused: json['paused'] as bool?,
  paymentMethod: handlerOrderRefundedResponsePaymentMethodNullableFromJson(
    json['payment_method'],
  ),
  paymentMethodText: json['payment_method_text'] as String?,
  pays:
      (json['pays'] as List<dynamic>?)
          ?.map((e) => HandlerOrderPayItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  pendingRefundCents: (json['pending_refund_cents'] as num?)?.toInt(),
  pricePerLiterCents: (json['price_per_liter_cents'] as num?)?.toInt(),
  quotaDeductedCents: (json['quota_deducted_cents'] as num?)?.toInt(),
  quotaPaidCents: (json['quota_paid_cents'] as num?)?.toInt(),
  quotaRefundedCents: (json['quota_refunded_cents'] as num?)?.toInt(),
  refundProgress: handlerOrderRefundedResponseRefundProgressNullableFromJson(
    json['refund_progress'],
  ),
  refundStatus: handlerOrderRefundedResponseRefundStatusNullableFromJson(
    json['refund_status'],
  ),
  refundedCents: (json['refunded_cents'] as num?)?.toInt(),
  selectedVolumeMl: (json['selected_volume_ml'] as num?)?.toInt(),
  sessionId: json['session_id'] as String?,
  status: handlerOrderRefundedResponseStatusNullableFromJson(json['status']),
  totalCents: (json['total_cents'] as num?)?.toInt(),
  tradeNo: json['trade_no'] as String?,
  waterType: json['water_type'] as String?,
);

Map<String, dynamic> _$HandlerOrderRefundedResponseToJson(
  HandlerOrderRefundedResponse instance,
) => <String, dynamic>{
  'abnormal': instance.abnormal,
  'abnormal_reason': instance.abnormalReason,
  'actual_paid_cents': instance.actualPaidCents,
  'actual_refunded_cents': instance.actualRefundedCents,
  'actual_volume_ml': instance.actualVolumeMl,
  'cancel_reason': instance.cancelReason,
  'cancelled_at': instance.cancelledAt,
  'completed_at': instance.completedAt,
  'created_at': instance.createdAt,
  'device_address': instance.deviceAddress,
  'device_id': instance.deviceId,
  'device_name': instance.deviceName,
  'device_sn': instance.deviceSn,
  'dispense_end_reason':
      handlerOrderRefundedResponseDispenseEndReasonNullableToJson(
        instance.dispenseEndReason,
      ),
  'dispense_result': handlerOrderRefundedResponseDispenseResultNullableToJson(
    instance.dispenseResult,
  ),
  'dispense_started_at': instance.dispenseStartedAt,
  'display_status': handlerOrderRefundedResponseDisplayStatusNullableToJson(
    instance.displayStatus,
  ),
  'due_cents': instance.dueCents,
  'id': instance.id,
  'interaction_started_at': instance.interactionStartedAt,
  'order_no': instance.orderNo,
  'paid_at': instance.paidAt,
  'paid_cents': instance.paidCents,
  'pause_count': instance.pauseCount,
  'paused': instance.paused,
  'payment_method': handlerOrderRefundedResponsePaymentMethodNullableToJson(
    instance.paymentMethod,
  ),
  'payment_method_text': instance.paymentMethodText,
  'pays': instance.pays?.map((e) => e.toJson()).toList(),
  'pending_refund_cents': instance.pendingRefundCents,
  'price_per_liter_cents': instance.pricePerLiterCents,
  'quota_deducted_cents': instance.quotaDeductedCents,
  'quota_paid_cents': instance.quotaPaidCents,
  'quota_refunded_cents': instance.quotaRefundedCents,
  'refund_progress': handlerOrderRefundedResponseRefundProgressNullableToJson(
    instance.refundProgress,
  ),
  'refund_status': handlerOrderRefundedResponseRefundStatusNullableToJson(
    instance.refundStatus,
  ),
  'refunded_cents': instance.refundedCents,
  'selected_volume_ml': instance.selectedVolumeMl,
  'session_id': instance.sessionId,
  'status': handlerOrderRefundedResponseStatusNullableToJson(instance.status),
  'total_cents': instance.totalCents,
  'trade_no': instance.tradeNo,
  'water_type': instance.waterType,
};

HandlerOrderResponse _$HandlerOrderResponseFromJson(
  Map<String, dynamic> json,
) => HandlerOrderResponse(
  abnormal: json['abnormal'] as bool?,
  abnormalReason: json['abnormal_reason'] as String?,
  actualPaidCents: (json['actual_paid_cents'] as num?)?.toInt(),
  actualVolumeMl: (json['actual_volume_ml'] as num?)?.toInt(),
  cancelReason: json['cancel_reason'] as String?,
  cancelledAt: json['cancelled_at'] as String?,
  completedAt: json['completed_at'] as String?,
  createdAt: json['created_at'] as String?,
  deviceAddress: json['device_address'] as String?,
  deviceId: (json['device_id'] as num?)?.toInt(),
  deviceName: json['device_name'] as String?,
  deviceSn: json['device_sn'] as String?,
  dispenseEndReason: handlerOrderResponseDispenseEndReasonNullableFromJson(
    json['dispense_end_reason'],
  ),
  dispenseResult: handlerOrderResponseDispenseResultNullableFromJson(
    json['dispense_result'],
  ),
  dispenseStartedAt: json['dispense_started_at'] as String?,
  displayStatus: handlerOrderResponseDisplayStatusNullableFromJson(
    json['display_status'],
  ),
  dueCents: (json['due_cents'] as num?)?.toInt(),
  id: (json['id'] as num?)?.toInt(),
  interactionStartedAt: json['interaction_started_at'] as String?,
  orderNo: json['order_no'] as String?,
  paidAt: json['paid_at'] as String?,
  paidCents: (json['paid_cents'] as num?)?.toInt(),
  pauseCount: (json['pause_count'] as num?)?.toInt(),
  paused: json['paused'] as bool?,
  paymentMethod: handlerOrderResponsePaymentMethodNullableFromJson(
    json['payment_method'],
  ),
  pendingRefundCents: (json['pending_refund_cents'] as num?)?.toInt(),
  pricePerLiterCents: (json['price_per_liter_cents'] as num?)?.toInt(),
  quotaDeductedCents: (json['quota_deducted_cents'] as num?)?.toInt(),
  quotaPaidCents: (json['quota_paid_cents'] as num?)?.toInt(),
  refundStatus: handlerOrderResponseRefundStatusNullableFromJson(
    json['refund_status'],
  ),
  refundedCents: (json['refunded_cents'] as num?)?.toInt(),
  selectedVolumeMl: (json['selected_volume_ml'] as num?)?.toInt(),
  sessionId: json['session_id'] as String?,
  status: handlerOrderResponseStatusNullableFromJson(json['status']),
  totalCents: (json['total_cents'] as num?)?.toInt(),
  tradeNo: json['trade_no'] as String?,
  waterType: json['water_type'] as String?,
);

Map<String, dynamic> _$HandlerOrderResponseToJson(
  HandlerOrderResponse instance,
) => <String, dynamic>{
  'abnormal': instance.abnormal,
  'abnormal_reason': instance.abnormalReason,
  'actual_paid_cents': instance.actualPaidCents,
  'actual_volume_ml': instance.actualVolumeMl,
  'cancel_reason': instance.cancelReason,
  'cancelled_at': instance.cancelledAt,
  'completed_at': instance.completedAt,
  'created_at': instance.createdAt,
  'device_address': instance.deviceAddress,
  'device_id': instance.deviceId,
  'device_name': instance.deviceName,
  'device_sn': instance.deviceSn,
  'dispense_end_reason': handlerOrderResponseDispenseEndReasonNullableToJson(
    instance.dispenseEndReason,
  ),
  'dispense_result': handlerOrderResponseDispenseResultNullableToJson(
    instance.dispenseResult,
  ),
  'dispense_started_at': instance.dispenseStartedAt,
  'display_status': handlerOrderResponseDisplayStatusNullableToJson(
    instance.displayStatus,
  ),
  'due_cents': instance.dueCents,
  'id': instance.id,
  'interaction_started_at': instance.interactionStartedAt,
  'order_no': instance.orderNo,
  'paid_at': instance.paidAt,
  'paid_cents': instance.paidCents,
  'pause_count': instance.pauseCount,
  'paused': instance.paused,
  'payment_method': handlerOrderResponsePaymentMethodNullableToJson(
    instance.paymentMethod,
  ),
  'pending_refund_cents': instance.pendingRefundCents,
  'price_per_liter_cents': instance.pricePerLiterCents,
  'quota_deducted_cents': instance.quotaDeductedCents,
  'quota_paid_cents': instance.quotaPaidCents,
  'refund_status': handlerOrderResponseRefundStatusNullableToJson(
    instance.refundStatus,
  ),
  'refunded_cents': instance.refundedCents,
  'selected_volume_ml': instance.selectedVolumeMl,
  'session_id': instance.sessionId,
  'status': handlerOrderResponseStatusNullableToJson(instance.status),
  'total_cents': instance.totalCents,
  'trade_no': instance.tradeNo,
  'water_type': instance.waterType,
};

HandlerOrderStatsResponse _$HandlerOrderStatsResponseFromJson(
  Map<String, dynamic> json,
) => HandlerOrderStatsResponse(
  resultConfirming: (json['result_confirming'] as num?)?.toInt(),
  todayCount: (json['today_count'] as num?)?.toInt(),
  todayMineralVolumeMl: (json['today_mineral_volume_ml'] as num?)?.toInt(),
  todayPureVolumeMl: (json['today_pure_volume_ml'] as num?)?.toInt(),
  todayRevenueCents: (json['today_revenue_cents'] as num?)?.toInt(),
  todayVolumeMl: (json['today_volume_ml'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerOrderStatsResponseToJson(
  HandlerOrderStatsResponse instance,
) => <String, dynamic>{
  'result_confirming': instance.resultConfirming,
  'today_count': instance.todayCount,
  'today_mineral_volume_ml': instance.todayMineralVolumeMl,
  'today_pure_volume_ml': instance.todayPureVolumeMl,
  'today_revenue_cents': instance.todayRevenueCents,
  'today_volume_ml': instance.todayVolumeMl,
};

HandlerOrderStatusLogItem _$HandlerOrderStatusLogItemFromJson(
  Map<String, dynamic> json,
) => HandlerOrderStatusLogItem(
  createdAt: json['created_at'] as String?,
  event: json['event'] as String?,
  fromStatus: json['from_status'] as String?,
  operatorId: (json['operator_id'] as num?)?.toInt(),
  remark: json['remark'] as String?,
  source: json['source'] as String?,
  toStatus: json['to_status'] as String?,
);

Map<String, dynamic> _$HandlerOrderStatusLogItemToJson(
  HandlerOrderStatusLogItem instance,
) => <String, dynamic>{
  'created_at': instance.createdAt,
  'event': instance.event,
  'from_status': instance.fromStatus,
  'operator_id': instance.operatorId,
  'remark': instance.remark,
  'source': instance.source,
  'to_status': instance.toStatus,
};

HandlerPackageAdminListResponse _$HandlerPackageAdminListResponseFromJson(
  Map<String, dynamic> json,
) => HandlerPackageAdminListResponse(
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) =>
                HandlerPackageAdminResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
  total: (json['total'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerPackageAdminListResponseToJson(
  HandlerPackageAdminListResponse instance,
) => <String, dynamic>{
  'items': instance.items?.map((e) => e.toJson()).toList(),
  'total': instance.total,
};

HandlerPackageAdminResponse _$HandlerPackageAdminResponseFromJson(
  Map<String, dynamic> json,
) => HandlerPackageAdminResponse(
  createdAt: json['created_at'] as String?,
  description: json['description'] as String?,
  giftCents: (json['gift_cents'] as num?)?.toInt(),
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  nameI18n: json['name_i18n'] as Map<String, dynamic>?,
  packageNo: json['package_no'] as String?,
  priceCents: (json['price_cents'] as num?)?.toInt(),
  quotaCents: (json['quota_cents'] as num?)?.toInt(),
  saleAmountCents: (json['sale_amount_cents'] as num?)?.toInt(),
  saleEndAt: json['sale_end_at'] as String?,
  saleStartAt: json['sale_start_at'] as String?,
  soldCount: (json['sold_count'] as num?)?.toInt(),
  status: handlerPackageAdminResponseStatusNullableFromJson(json['status']),
  totalCents: (json['total_cents'] as num?)?.toInt(),
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$HandlerPackageAdminResponseToJson(
  HandlerPackageAdminResponse instance,
) => <String, dynamic>{
  'created_at': instance.createdAt,
  'description': instance.description,
  'gift_cents': instance.giftCents,
  'id': instance.id,
  'name': instance.name,
  'name_i18n': instance.nameI18n,
  'package_no': instance.packageNo,
  'price_cents': instance.priceCents,
  'quota_cents': instance.quotaCents,
  'sale_amount_cents': instance.saleAmountCents,
  'sale_end_at': instance.saleEndAt,
  'sale_start_at': instance.saleStartAt,
  'sold_count': instance.soldCount,
  'status': handlerPackageAdminResponseStatusNullableToJson(instance.status),
  'total_cents': instance.totalCents,
  'updated_at': instance.updatedAt,
};

HandlerPackageAdminSaveRequest _$HandlerPackageAdminSaveRequestFromJson(
  Map<String, dynamic> json,
) => HandlerPackageAdminSaveRequest(
  description: json['description'] as String?,
  giftCents: (json['gift_cents'] as num?)?.toInt(),
  nameI18n: json['name_i18n'] as Map<String, dynamic>,
  priceCents: (json['price_cents'] as num).toInt(),
  saleEndAt: json['sale_end_at'] as String,
  saleStartAt: json['sale_start_at'] as String,
);

Map<String, dynamic> _$HandlerPackageAdminSaveRequestToJson(
  HandlerPackageAdminSaveRequest instance,
) => <String, dynamic>{
  'description': instance.description,
  'gift_cents': instance.giftCents,
  'name_i18n': instance.nameI18n,
  'price_cents': instance.priceCents,
  'sale_end_at': instance.saleEndAt,
  'sale_start_at': instance.saleStartAt,
};

HandlerPackageBuyRequest _$HandlerPackageBuyRequestFromJson(
  Map<String, dynamic> json,
) => HandlerPackageBuyRequest(
  method: handlerPackageBuyRequestMethodFromJson(json['method']),
  packageId: (json['package_id'] as num).toInt(),
);

Map<String, dynamic> _$HandlerPackageBuyRequestToJson(
  HandlerPackageBuyRequest instance,
) => <String, dynamic>{
  'method': handlerPackageBuyRequestMethodToJson(instance.method),
  'package_id': instance.packageId,
};

HandlerPackageOrderAdminListResponse
_$HandlerPackageOrderAdminListResponseFromJson(Map<String, dynamic> json) =>
    HandlerPackageOrderAdminListResponse(
      items:
          (json['items'] as List<dynamic>?)
              ?.map(
                (e) => HandlerPackageOrderAdminResponse.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          [],
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$HandlerPackageOrderAdminListResponseToJson(
  HandlerPackageOrderAdminListResponse instance,
) => <String, dynamic>{
  'items': instance.items?.map((e) => e.toJson()).toList(),
  'total': instance.total,
};

HandlerPackageOrderAdminResponse _$HandlerPackageOrderAdminResponseFromJson(
  Map<String, dynamic> json,
) => HandlerPackageOrderAdminResponse(
  aftersaleNo: json['aftersale_no'] as String?,
  consumedQuotaCents: (json['consumed_quota_cents'] as num?)?.toInt(),
  createdAt: json['created_at'] as String?,
  giftCents: (json['gift_cents'] as num?)?.toInt(),
  id: (json['id'] as num?)?.toInt(),
  orderNo: json['order_no'] as String?,
  packageName: json['package_name'] as String?,
  packageNo: json['package_no'] as String?,
  paidAt: json['paid_at'] as String?,
  paymentMethod: handlerPackageOrderAdminResponsePaymentMethodNullableFromJson(
    json['payment_method'],
  ),
  priceCents: (json['price_cents'] as num?)?.toInt(),
  quotaCents: (json['quota_cents'] as num?)?.toInt(),
  refundCents: (json['refund_cents'] as num?)?.toInt(),
  refundError: json['refund_error'] as String?,
  refundRetryCount: (json['refund_retry_count'] as num?)?.toInt(),
  refundStatus: handlerPackageOrderAdminResponseRefundStatusNullableFromJson(
    json['refund_status'],
  ),
  refundedAt: json['refunded_at'] as String?,
  remainPaidCents: (json['remain_paid_cents'] as num?)?.toInt(),
  status: handlerPackageOrderAdminResponseStatusNullableFromJson(
    json['status'],
  ),
  totalCents: (json['total_cents'] as num?)?.toInt(),
  userCode: json['user_code'] as String?,
  userId: (json['user_id'] as num?)?.toInt(),
  userName: json['user_name'] as String?,
);

Map<String, dynamic> _$HandlerPackageOrderAdminResponseToJson(
  HandlerPackageOrderAdminResponse instance,
) => <String, dynamic>{
  'aftersale_no': instance.aftersaleNo,
  'consumed_quota_cents': instance.consumedQuotaCents,
  'created_at': instance.createdAt,
  'gift_cents': instance.giftCents,
  'id': instance.id,
  'order_no': instance.orderNo,
  'package_name': instance.packageName,
  'package_no': instance.packageNo,
  'paid_at': instance.paidAt,
  'payment_method': handlerPackageOrderAdminResponsePaymentMethodNullableToJson(
    instance.paymentMethod,
  ),
  'price_cents': instance.priceCents,
  'quota_cents': instance.quotaCents,
  'refund_cents': instance.refundCents,
  'refund_error': instance.refundError,
  'refund_retry_count': instance.refundRetryCount,
  'refund_status': handlerPackageOrderAdminResponseRefundStatusNullableToJson(
    instance.refundStatus,
  ),
  'refunded_at': instance.refundedAt,
  'remain_paid_cents': instance.remainPaidCents,
  'status': handlerPackageOrderAdminResponseStatusNullableToJson(
    instance.status,
  ),
  'total_cents': instance.totalCents,
  'user_code': instance.userCode,
  'user_id': instance.userId,
  'user_name': instance.userName,
};

HandlerPackageOrderDetailResponse _$HandlerPackageOrderDetailResponseFromJson(
  Map<String, dynamic> json,
) => HandlerPackageOrderDetailResponse(
  consumedGiftQuotaCents: (json['consumed_gift_quota_cents'] as num?)?.toInt(),
  consumedQuotaCents: (json['consumed_quota_cents'] as num?)?.toInt(),
  createdAt: json['created_at'] as String?,
  displayStatus: handlerPackageOrderDetailResponseDisplayStatusNullableFromJson(
    json['display_status'],
  ),
  giftCents: (json['gift_cents'] as num?)?.toInt(),
  orderNo: json['order_no'] as String?,
  packageName: json['package_name'] as String?,
  paidAt: json['paid_at'] as String?,
  payUrl: json['pay_url'] as String?,
  paymentMethod: handlerPackageOrderDetailResponsePaymentMethodNullableFromJson(
    json['payment_method'],
  ),
  priceCents: (json['price_cents'] as num?)?.toInt(),
  qrCode: json['qr_code'] as String?,
  quotaCents: (json['quota_cents'] as num?)?.toInt(),
  refundCents: (json['refund_cents'] as num?)?.toInt(),
  refundFailReason: json['refund_fail_reason'] as String?,
  refundRequestedAt: json['refund_requested_at'] as String?,
  refundStatus: handlerPackageOrderDetailResponseRefundStatusNullableFromJson(
    json['refund_status'],
  ),
  refundedAt: json['refunded_at'] as String?,
  remainPaidCents: (json['remain_paid_cents'] as num?)?.toInt(),
  status: handlerPackageOrderDetailResponseStatusNullableFromJson(
    json['status'],
  ),
  totalCents: (json['total_cents'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerPackageOrderDetailResponseToJson(
  HandlerPackageOrderDetailResponse instance,
) => <String, dynamic>{
  'consumed_gift_quota_cents': instance.consumedGiftQuotaCents,
  'consumed_quota_cents': instance.consumedQuotaCents,
  'created_at': instance.createdAt,
  'display_status':
      handlerPackageOrderDetailResponseDisplayStatusNullableToJson(
        instance.displayStatus,
      ),
  'gift_cents': instance.giftCents,
  'order_no': instance.orderNo,
  'package_name': instance.packageName,
  'paid_at': instance.paidAt,
  'pay_url': instance.payUrl,
  'payment_method':
      handlerPackageOrderDetailResponsePaymentMethodNullableToJson(
        instance.paymentMethod,
      ),
  'price_cents': instance.priceCents,
  'qr_code': instance.qrCode,
  'quota_cents': instance.quotaCents,
  'refund_cents': instance.refundCents,
  'refund_fail_reason': instance.refundFailReason,
  'refund_requested_at': instance.refundRequestedAt,
  'refund_status': handlerPackageOrderDetailResponseRefundStatusNullableToJson(
    instance.refundStatus,
  ),
  'refunded_at': instance.refundedAt,
  'remain_paid_cents': instance.remainPaidCents,
  'status': handlerPackageOrderDetailResponseStatusNullableToJson(
    instance.status,
  ),
  'total_cents': instance.totalCents,
};

HandlerPackageOrderListResponse _$HandlerPackageOrderListResponseFromJson(
  Map<String, dynamic> json,
) => HandlerPackageOrderListResponse(
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) =>
                HandlerPackageOrderResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
  total: (json['total'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerPackageOrderListResponseToJson(
  HandlerPackageOrderListResponse instance,
) => <String, dynamic>{
  'items': instance.items?.map((e) => e.toJson()).toList(),
  'total': instance.total,
};

HandlerPackageOrderResponse _$HandlerPackageOrderResponseFromJson(
  Map<String, dynamic> json,
) => HandlerPackageOrderResponse(
  createdAt: json['created_at'] as String?,
  displayStatus: handlerPackageOrderResponseDisplayStatusNullableFromJson(
    json['display_status'],
  ),
  giftCents: (json['gift_cents'] as num?)?.toInt(),
  orderNo: json['order_no'] as String?,
  packageName: json['package_name'] as String?,
  paidAt: json['paid_at'] as String?,
  payUrl: json['pay_url'] as String?,
  paymentMethod: handlerPackageOrderResponsePaymentMethodNullableFromJson(
    json['payment_method'],
  ),
  priceCents: (json['price_cents'] as num?)?.toInt(),
  qrCode: json['qr_code'] as String?,
  quotaCents: (json['quota_cents'] as num?)?.toInt(),
  refundStatus: handlerPackageOrderResponseRefundStatusNullableFromJson(
    json['refund_status'],
  ),
  status: handlerPackageOrderResponseStatusNullableFromJson(json['status']),
  totalCents: (json['total_cents'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerPackageOrderResponseToJson(
  HandlerPackageOrderResponse instance,
) => <String, dynamic>{
  'created_at': instance.createdAt,
  'display_status': handlerPackageOrderResponseDisplayStatusNullableToJson(
    instance.displayStatus,
  ),
  'gift_cents': instance.giftCents,
  'order_no': instance.orderNo,
  'package_name': instance.packageName,
  'paid_at': instance.paidAt,
  'pay_url': instance.payUrl,
  'payment_method': handlerPackageOrderResponsePaymentMethodNullableToJson(
    instance.paymentMethod,
  ),
  'price_cents': instance.priceCents,
  'qr_code': instance.qrCode,
  'quota_cents': instance.quotaCents,
  'refund_status': handlerPackageOrderResponseRefundStatusNullableToJson(
    instance.refundStatus,
  ),
  'status': handlerPackageOrderResponseStatusNullableToJson(instance.status),
  'total_cents': instance.totalCents,
};

HandlerPackageOrderStatsResponse _$HandlerPackageOrderStatsResponseFromJson(
  Map<String, dynamic> json,
) => HandlerPackageOrderStatsResponse(
  completedCount: (json['completed_count'] as num?)?.toInt(),
  refundAmountCents: (json['refund_amount_cents'] as num?)?.toInt(),
  todayAmountCents: (json['today_amount_cents'] as num?)?.toInt(),
  todayCount: (json['today_count'] as num?)?.toInt(),
  totalAmountCents: (json['total_amount_cents'] as num?)?.toInt(),
  totalCount: (json['total_count'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerPackageOrderStatsResponseToJson(
  HandlerPackageOrderStatsResponse instance,
) => <String, dynamic>{
  'completed_count': instance.completedCount,
  'refund_amount_cents': instance.refundAmountCents,
  'today_amount_cents': instance.todayAmountCents,
  'today_count': instance.todayCount,
  'total_amount_cents': instance.totalAmountCents,
  'total_count': instance.totalCount,
};

HandlerPackageStatsResponse _$HandlerPackageStatsResponseFromJson(
  Map<String, dynamic> json,
) => HandlerPackageStatsResponse(
  historyCount: (json['history_count'] as num?)?.toInt(),
  onSaleCount: (json['on_sale_count'] as num?)?.toInt(),
  saleAmountCents: (json['sale_amount_cents'] as num?)?.toInt(),
  soldCount: (json['sold_count'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerPackageStatsResponseToJson(
  HandlerPackageStatsResponse instance,
) => <String, dynamic>{
  'history_count': instance.historyCount,
  'on_sale_count': instance.onSaleCount,
  'sale_amount_cents': instance.saleAmountCents,
  'sold_count': instance.soldCount,
};

HandlerRecordingAdminCamera _$HandlerRecordingAdminCameraFromJson(
  Map<String, dynamic> json,
) => HandlerRecordingAdminCamera(
  actualRetentionHours: (json['actual_retention_hours'] as num?)?.toInt(),
  errorCode: json['error_code'] as String?,
  freeBytes: (json['free_bytes'] as num?)?.toInt(),
  lastRecordedAt: json['last_recorded_at'] as String?,
  online: json['online'] as bool?,
  recording: json['recording'] as bool?,
  reportedAt: json['reported_at'] as String?,
  retentionDays: (json['retention_days'] as num?)?.toInt(),
  status: handlerRecordingAdminCameraStatusNullableFromJson(json['status']),
  storagePath: json['storage_path'] as String?,
  totalBytes: (json['total_bytes'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerRecordingAdminCameraToJson(
  HandlerRecordingAdminCamera instance,
) => <String, dynamic>{
  'actual_retention_hours': instance.actualRetentionHours,
  'error_code': instance.errorCode,
  'free_bytes': instance.freeBytes,
  'last_recorded_at': instance.lastRecordedAt,
  'online': instance.online,
  'recording': instance.recording,
  'reported_at': instance.reportedAt,
  'retention_days': instance.retentionDays,
  'status': handlerRecordingAdminCameraStatusNullableToJson(instance.status),
  'storage_path': instance.storagePath,
  'total_bytes': instance.totalBytes,
};

HandlerRecordingAdminCoverage _$HandlerRecordingAdminCoverageFromJson(
  Map<String, dynamic> json,
) => HandlerRecordingAdminCoverage(
  endedAt: json['ended_at'] as String?,
  segmentId: json['segment_id'] as String?,
  startedAt: json['started_at'] as String?,
);

Map<String, dynamic> _$HandlerRecordingAdminCoverageToJson(
  HandlerRecordingAdminCoverage instance,
) => <String, dynamic>{
  'ended_at': instance.endedAt,
  'segment_id': instance.segmentId,
  'started_at': instance.startedAt,
};

HandlerRecordingAdminInterval _$HandlerRecordingAdminIntervalFromJson(
  Map<String, dynamic> json,
) => HandlerRecordingAdminInterval(
  businessNo: json['business_no'] as String?,
  commandType: json['command_type'] as String?,
  endedAt: json['ended_at'] as String?,
  id: json['id'] as String?,
  kind: handlerRecordingAdminIntervalKindNullableFromJson(json['kind']),
  playbackEndedAt: json['playback_ended_at'] as String?,
  playbackStartedAt: json['playback_started_at'] as String?,
  recordingState: handlerRecordingAdminIntervalRecordingStateNullableFromJson(
    json['recording_state'],
  ),
  startedAt: json['started_at'] as String?,
  summary: json['summary'] as String?,
  title: json['title'] as String?,
);

Map<String, dynamic> _$HandlerRecordingAdminIntervalToJson(
  HandlerRecordingAdminInterval instance,
) => <String, dynamic>{
  'business_no': instance.businessNo,
  'command_type': instance.commandType,
  'ended_at': instance.endedAt,
  'id': instance.id,
  'kind': handlerRecordingAdminIntervalKindNullableToJson(instance.kind),
  'playback_ended_at': instance.playbackEndedAt,
  'playback_started_at': instance.playbackStartedAt,
  'recording_state': handlerRecordingAdminIntervalRecordingStateNullableToJson(
    instance.recordingState,
  ),
  'started_at': instance.startedAt,
  'summary': instance.summary,
  'title': instance.title,
};

HandlerRecordingAdminOverviewResponse
_$HandlerRecordingAdminOverviewResponseFromJson(Map<String, dynamic> json) =>
    HandlerRecordingAdminOverviewResponse(
      camera: json['camera'] == null
          ? null
          : HandlerRecordingAdminCamera.fromJson(
              json['camera'] as Map<String, dynamic>,
            ),
      coverage:
          (json['coverage'] as List<dynamic>?)
              ?.map(
                (e) => HandlerRecordingAdminCoverage.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          [],
      date: json['date'] as String?,
      intervals:
          (json['intervals'] as List<dynamic>?)
              ?.map(
                (e) => HandlerRecordingAdminInterval.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          [],
      maxPlaybackDurationSeconds:
          (json['max_playback_duration_seconds'] as num?)?.toInt(),
      timezone: json['timezone'] as String?,
    );

Map<String, dynamic> _$HandlerRecordingAdminOverviewResponseToJson(
  HandlerRecordingAdminOverviewResponse instance,
) => <String, dynamic>{
  'camera': instance.camera?.toJson(),
  'coverage': instance.coverage?.map((e) => e.toJson()).toList(),
  'date': instance.date,
  'intervals': instance.intervals?.map((e) => e.toJson()).toList(),
  'max_playback_duration_seconds': instance.maxPlaybackDurationSeconds,
  'timezone': instance.timezone,
};

HandlerRecordingAdminPlaybackCreateRequest
_$HandlerRecordingAdminPlaybackCreateRequestFromJson(
  Map<String, dynamic> json,
) => HandlerRecordingAdminPlaybackCreateRequest(
  endedAt: json['ended_at'] as String,
  startedAt: json['started_at'] as String,
);

Map<String, dynamic> _$HandlerRecordingAdminPlaybackCreateRequestToJson(
  HandlerRecordingAdminPlaybackCreateRequest instance,
) => <String, dynamic>{
  'ended_at': instance.endedAt,
  'started_at': instance.startedAt,
};

HandlerRecordingAdminPlaybackFile _$HandlerRecordingAdminPlaybackFileFromJson(
  Map<String, dynamic> json,
) => HandlerRecordingAdminPlaybackFile(
  endedAt: json['ended_at'] as String?,
  position: (json['position'] as num?)?.toInt(),
  segmentId: json['segment_id'] as String?,
  sizeBytes: (json['size_bytes'] as num?)?.toInt(),
  startedAt: json['started_at'] as String?,
  status: handlerRecordingAdminPlaybackFileStatusNullableFromJson(
    json['status'],
  ),
  uploadedBytes: (json['uploaded_bytes'] as num?)?.toInt(),
  url: json['url'] as String?,
);

Map<String, dynamic> _$HandlerRecordingAdminPlaybackFileToJson(
  HandlerRecordingAdminPlaybackFile instance,
) => <String, dynamic>{
  'ended_at': instance.endedAt,
  'position': instance.position,
  'segment_id': instance.segmentId,
  'size_bytes': instance.sizeBytes,
  'started_at': instance.startedAt,
  'status': handlerRecordingAdminPlaybackFileStatusNullableToJson(
    instance.status,
  ),
  'uploaded_bytes': instance.uploadedBytes,
  'url': instance.url,
};

HandlerRecordingAdminPlaybackResponse
_$HandlerRecordingAdminPlaybackResponseFromJson(Map<String, dynamic> json) =>
    HandlerRecordingAdminPlaybackResponse(
      clipEndedAt: json['clip_ended_at'] as String?,
      clipStartedAt: json['clip_started_at'] as String?,
      errorCode: json['error_code'] as String?,
      expiresAt: json['expires_at'] as String?,
      files:
          (json['files'] as List<dynamic>?)
              ?.map(
                (e) => HandlerRecordingAdminPlaybackFile.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          [],
      id: (json['id'] as num?)?.toInt(),
      progress: (json['progress'] as num?)?.toInt(),
      status: handlerRecordingAdminPlaybackResponseStatusNullableFromJson(
        json['status'],
      ),
      totalBytes: (json['total_bytes'] as num?)?.toInt(),
      uploadedBytes: (json['uploaded_bytes'] as num?)?.toInt(),
    );

Map<String, dynamic> _$HandlerRecordingAdminPlaybackResponseToJson(
  HandlerRecordingAdminPlaybackResponse instance,
) => <String, dynamic>{
  'clip_ended_at': instance.clipEndedAt,
  'clip_started_at': instance.clipStartedAt,
  'error_code': instance.errorCode,
  'expires_at': instance.expiresAt,
  'files': instance.files?.map((e) => e.toJson()).toList(),
  'id': instance.id,
  'progress': instance.progress,
  'status': handlerRecordingAdminPlaybackResponseStatusNullableToJson(
    instance.status,
  ),
  'total_bytes': instance.totalBytes,
  'uploaded_bytes': instance.uploadedBytes,
};

HandlerRegionNode _$HandlerRegionNodeFromJson(Map<String, dynamic> json) =>
    HandlerRegionNode(
      children:
          (json['children'] as List<dynamic>?)
              ?.map(
                (e) => HandlerRegionNode.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          [],
      code: json['code'] as String?,
      id: (json['id'] as num?)?.toInt(),
      level: json['level'] as String?,
      name: json['name'] as String?,
      nameEn: json['name_en'] as String?,
      nameTh: json['name_th'] as String?,
    );

Map<String, dynamic> _$HandlerRegionNodeToJson(HandlerRegionNode instance) =>
    <String, dynamic>{
      'children': instance.children?.map((e) => e.toJson()).toList(),
      'code': instance.code,
      'id': instance.id,
      'level': instance.level,
      'name': instance.name,
      'name_en': instance.nameEn,
      'name_th': instance.nameTh,
    };

HandlerRegionPathNode _$HandlerRegionPathNodeFromJson(
  Map<String, dynamic> json,
) => HandlerRegionPathNode(
  code: json['code'] as String?,
  id: (json['id'] as num?)?.toInt(),
  level: json['level'] as String?,
  name: json['name'] as String?,
  nameEn: json['name_en'] as String?,
  nameTh: json['name_th'] as String?,
);

Map<String, dynamic> _$HandlerRegionPathNodeToJson(
  HandlerRegionPathNode instance,
) => <String, dynamic>{
  'code': instance.code,
  'id': instance.id,
  'level': instance.level,
  'name': instance.name,
  'name_en': instance.nameEn,
  'name_th': instance.nameTh,
};

HandlerRegionPathResponse _$HandlerRegionPathResponseFromJson(
  Map<String, dynamic> json,
) => HandlerRegionPathResponse(
  district: json['district'] == null
      ? null
      : HandlerRegionPathNode.fromJson(
          json['district'] as Map<String, dynamic>,
        ),
  province: json['province'] == null
      ? null
      : HandlerRegionPathNode.fromJson(
          json['province'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$HandlerRegionPathResponseToJson(
  HandlerRegionPathResponse instance,
) => <String, dynamic>{
  'district': instance.district?.toJson(),
  'province': instance.province?.toJson(),
};

HandlerRegionTreeResponse _$HandlerRegionTreeResponseFromJson(
  Map<String, dynamic> json,
) => HandlerRegionTreeResponse(
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => HandlerRegionNode.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
);

Map<String, dynamic> _$HandlerRegionTreeResponseToJson(
  HandlerRegionTreeResponse instance,
) => <String, dynamic>{'data': instance.data?.map((e) => e.toJson()).toList()};

HandlerRoleAdminListResponse _$HandlerRoleAdminListResponseFromJson(
  Map<String, dynamic> json,
) => HandlerRoleAdminListResponse(
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) => HandlerRoleAdminResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
  total: (json['total'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerRoleAdminListResponseToJson(
  HandlerRoleAdminListResponse instance,
) => <String, dynamic>{
  'items': instance.items?.map((e) => e.toJson()).toList(),
  'total': instance.total,
};

HandlerRoleAdminResponse _$HandlerRoleAdminResponseFromJson(
  Map<String, dynamic> json,
) => HandlerRoleAdminResponse(
  code: json['code'] as String?,
  createdAt: json['created_at'] as String?,
  description: json['description'] as String?,
  id: (json['id'] as num?)?.toInt(),
  menuCodes:
      (json['menu_codes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      [],
  menuCount: (json['menu_count'] as num?)?.toInt(),
  name: json['name'] as String?,
  permissions: json['permissions'] as Map<String, dynamic>?,
  platform: json['platform'] as String?,
  preset: json['preset'] as bool?,
  staffCount: (json['staff_count'] as num?)?.toInt(),
  status: handlerRoleAdminResponseStatusNullableFromJson(json['status']),
  system: json['system'] as bool?,
);

Map<String, dynamic> _$HandlerRoleAdminResponseToJson(
  HandlerRoleAdminResponse instance,
) => <String, dynamic>{
  'code': instance.code,
  'created_at': instance.createdAt,
  'description': instance.description,
  'id': instance.id,
  'menu_codes': instance.menuCodes,
  'menu_count': instance.menuCount,
  'name': instance.name,
  'permissions': instance.permissions,
  'platform': instance.platform,
  'preset': instance.preset,
  'staff_count': instance.staffCount,
  'status': handlerRoleAdminResponseStatusNullableToJson(instance.status),
  'system': instance.system,
};

HandlerRoleAdminSaveRequest _$HandlerRoleAdminSaveRequestFromJson(
  Map<String, dynamic> json,
) => HandlerRoleAdminSaveRequest(
  description: json['description'] as String?,
  name: json['name'] as String,
  permissions: json['permissions'] as Map<String, dynamic>?,
  platform: handlerRoleAdminSaveRequestPlatformNullableFromJson(
    json['platform'],
  ),
);

Map<String, dynamic> _$HandlerRoleAdminSaveRequestToJson(
  HandlerRoleAdminSaveRequest instance,
) => <String, dynamic>{
  'description': instance.description,
  'name': instance.name,
  'permissions': instance.permissions,
  'platform': handlerRoleAdminSaveRequestPlatformNullableToJson(
    instance.platform,
  ),
};

HandlerRoleAdminStatusRequest _$HandlerRoleAdminStatusRequestFromJson(
  Map<String, dynamic> json,
) => HandlerRoleAdminStatusRequest(
  status: handlerRoleAdminStatusRequestStatusFromJson(json['status']),
);

Map<String, dynamic> _$HandlerRoleAdminStatusRequestToJson(
  HandlerRoleAdminStatusRequest instance,
) => <String, dynamic>{
  'status': handlerRoleAdminStatusRequestStatusToJson(instance.status),
};

HandlerScanCodeResponse _$HandlerScanCodeResponseFromJson(
  Map<String, dynamic> json,
) => HandlerScanCodeResponse(
  deviceSn: json['device_sn'] as String?,
  expiresAt: json['expires_at'] as String?,
  rotateAt: json['rotate_at'] as String?,
  sessionId: json['session_id'] as String?,
  token: json['token'] as String?,
  url: json['url'] as String?,
);

Map<String, dynamic> _$HandlerScanCodeResponseToJson(
  HandlerScanCodeResponse instance,
) => <String, dynamic>{
  'device_sn': instance.deviceSn,
  'expires_at': instance.expiresAt,
  'rotate_at': instance.rotateAt,
  'session_id': instance.sessionId,
  'token': instance.token,
  'url': instance.url,
};

HandlerServerTimeResponse _$HandlerServerTimeResponseFromJson(
  Map<String, dynamic> json,
) => HandlerServerTimeResponse(
  now: json['now'] as String?,
  timezone: json['timezone'] as String?,
  unixMs: (json['unix_ms'] as num?)?.toInt(),
  utcOffsetSeconds: (json['utc_offset_seconds'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerServerTimeResponseToJson(
  HandlerServerTimeResponse instance,
) => <String, dynamic>{
  'now': instance.now,
  'timezone': instance.timezone,
  'unix_ms': instance.unixMs,
  'utc_offset_seconds': instance.utcOffsetSeconds,
};

HandlerSessionClientMethodRequest _$HandlerSessionClientMethodRequestFromJson(
  Map<String, dynamic> json,
) => HandlerSessionClientMethodRequest(
  paymentMethod: handlerSessionClientMethodRequestPaymentMethodFromJson(
    json['payment_method'],
  ),
);

Map<String, dynamic> _$HandlerSessionClientMethodRequestToJson(
  HandlerSessionClientMethodRequest instance,
) => <String, dynamic>{
  'payment_method': handlerSessionClientMethodRequestPaymentMethodToJson(
    instance.paymentMethod,
  ),
};

HandlerSessionCodeResponse _$HandlerSessionCodeResponseFromJson(
  Map<String, dynamic> json,
) => HandlerSessionCodeResponse(
  code: json['code'] == null
      ? null
      : HandlerScanCodeResponse.fromJson(json['code'] as Map<String, dynamic>),
  session: json['session'] == null
      ? null
      : HandlerSessionResponse.fromJson(
          json['session'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$HandlerSessionCodeResponseToJson(
  HandlerSessionCodeResponse instance,
) => <String, dynamic>{
  'code': instance.code?.toJson(),
  'session': instance.session?.toJson(),
};

HandlerSessionConnectivity _$HandlerSessionConnectivityFromJson(
  Map<String, dynamic> json,
) => HandlerSessionConnectivity(
  iccardAvailable: json['iccard_available'] as bool?,
  offlineMinutes: (json['offline_minutes'] as num?)?.toInt(),
  online: json['online'] as bool?,
  windowMinutes: (json['window_minutes'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerSessionConnectivityToJson(
  HandlerSessionConnectivity instance,
) => <String, dynamic>{
  'iccard_available': instance.iccardAvailable,
  'offline_minutes': instance.offlineMinutes,
  'online': instance.online,
  'window_minutes': instance.windowMinutes,
};

HandlerSessionEventData _$HandlerSessionEventDataFromJson(
  Map<String, dynamic> json,
) => HandlerSessionEventData(
  abnormalReason: json['abnormal_reason'] as String?,
  actualVolumeMl: (json['actual_volume_ml'] as num?)?.toInt(),
  cause: handlerSessionEventDataCauseNullableFromJson(json['cause']),
  dispenseEndReason: json['dispense_end_reason'] as String?,
  dispenseResult: json['dispense_result'] as String?,
  displayname: json['displayname'] as String?,
  orderId: (json['order_id'] as num?)?.toInt(),
  orderNo: json['order_no'] as String?,
  orderStatus: json['order_status'] as String?,
  paidCents: (json['paid_cents'] as num?)?.toInt(),
  pauseCount: (json['pause_count'] as num?)?.toInt(),
  pauseLimit: (json['pause_limit'] as num?)?.toInt(),
  payAttempt: (json['pay_attempt'] as num?)?.toInt(),
  paymentMethod: json['payment_method'] as String?,
  pictureUrl: json['picture_url'] as String?,
  reason: json['reason'] as String?,
  refundCents: (json['refund_cents'] as num?)?.toInt(),
  refundTotalCents: (json['refund_total_cents'] as num?)?.toInt(),
  resultConfirming: json['result_confirming'] as bool?,
  shortCents: (json['short_cents'] as num?)?.toInt(),
  source: json['source'] as String?,
  stageDeadline: json['stage_deadline'] as String?,
  stageRemainingMs: (json['stage_remaining_ms'] as num?)?.toInt(),
  startEpoch: (json['start_epoch'] as num?)?.toInt(),
  started: json['started'] as bool?,
  totalCents: (json['total_cents'] as num?)?.toInt(),
  userId: (json['user_id'] as num?)?.toInt(),
  volumeMl: (json['volume_ml'] as num?)?.toInt(),
  waterType: json['water_type'] as String?,
);

Map<String, dynamic> _$HandlerSessionEventDataToJson(
  HandlerSessionEventData instance,
) => <String, dynamic>{
  'abnormal_reason': instance.abnormalReason,
  'actual_volume_ml': instance.actualVolumeMl,
  'cause': handlerSessionEventDataCauseNullableToJson(instance.cause),
  'dispense_end_reason': instance.dispenseEndReason,
  'dispense_result': instance.dispenseResult,
  'displayname': instance.displayname,
  'order_id': instance.orderId,
  'order_no': instance.orderNo,
  'order_status': instance.orderStatus,
  'paid_cents': instance.paidCents,
  'pause_count': instance.pauseCount,
  'pause_limit': instance.pauseLimit,
  'pay_attempt': instance.payAttempt,
  'payment_method': instance.paymentMethod,
  'picture_url': instance.pictureUrl,
  'reason': instance.reason,
  'refund_cents': instance.refundCents,
  'refund_total_cents': instance.refundTotalCents,
  'result_confirming': instance.resultConfirming,
  'short_cents': instance.shortCents,
  'source': instance.source,
  'stage_deadline': instance.stageDeadline,
  'stage_remaining_ms': instance.stageRemainingMs,
  'start_epoch': instance.startEpoch,
  'started': instance.started,
  'total_cents': instance.totalCents,
  'user_id': instance.userId,
  'volume_ml': instance.volumeMl,
  'water_type': instance.waterType,
};

HandlerSessionEventFrame _$HandlerSessionEventFrameFromJson(
  Map<String, dynamic> json,
) => HandlerSessionEventFrame(
  data: json['data'] == null
      ? null
      : HandlerSessionEventData.fromJson(json['data'] as Map<String, dynamic>),
  event: handlerSessionEventFrameEventNullableFromJson(json['event']),
  id: (json['id'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerSessionEventFrameToJson(
  HandlerSessionEventFrame instance,
) => <String, dynamic>{
  'data': instance.data?.toJson(),
  'event': handlerSessionEventFrameEventNullableToJson(instance.event),
  'id': instance.id,
};

HandlerSessionFilter _$HandlerSessionFilterFromJson(
  Map<String, dynamic> json,
) => HandlerSessionFilter(
  lifePercent: (json['life_percent'] as num?)?.toInt(),
  replacedAt: json['replaced_at'] as String?,
  type: handlerSessionFilterTypeNullableFromJson(json['type']),
);

Map<String, dynamic> _$HandlerSessionFilterToJson(
  HandlerSessionFilter instance,
) => <String, dynamic>{
  'life_percent': instance.lifePercent,
  'replaced_at': instance.replacedAt,
  'type': handlerSessionFilterTypeNullableToJson(instance.type),
};

HandlerSessionMethodRequest _$HandlerSessionMethodRequestFromJson(
  Map<String, dynamic> json,
) => HandlerSessionMethodRequest(
  paymentMethod: handlerSessionMethodRequestPaymentMethodFromJson(
    json['payment_method'],
  ),
);

Map<String, dynamic> _$HandlerSessionMethodRequestToJson(
  HandlerSessionMethodRequest instance,
) => <String, dynamic>{
  'payment_method': handlerSessionMethodRequestPaymentMethodToJson(
    instance.paymentMethod,
  ),
};

HandlerSessionOrderResponse _$HandlerSessionOrderResponseFromJson(
  Map<String, dynamic> json,
) => HandlerSessionOrderResponse(
  abnormal: json['abnormal'] as bool?,
  abnormalReason: json['abnormal_reason'] as String?,
  actualPaidCents: (json['actual_paid_cents'] as num?)?.toInt(),
  actualRefundedCents: (json['actual_refunded_cents'] as num?)?.toInt(),
  actualVolumeMl: (json['actual_volume_ml'] as num?)?.toInt(),
  cancelReason: json['cancel_reason'] as String?,
  cancelledAt: json['cancelled_at'] as String?,
  completedAt: json['completed_at'] as String?,
  createdAt: json['created_at'] as String?,
  deviceAddress: json['device_address'] as String?,
  deviceId: (json['device_id'] as num?)?.toInt(),
  deviceName: json['device_name'] as String?,
  deviceSn: json['device_sn'] as String?,
  dispenseEndReason:
      handlerSessionOrderResponseDispenseEndReasonNullableFromJson(
        json['dispense_end_reason'],
      ),
  dispenseResult: handlerSessionOrderResponseDispenseResultNullableFromJson(
    json['dispense_result'],
  ),
  dispenseStartedAt: json['dispense_started_at'] as String?,
  displayStatus: handlerSessionOrderResponseDisplayStatusNullableFromJson(
    json['display_status'],
  ),
  dueCents: (json['due_cents'] as num?)?.toInt(),
  estimatedRefundCents: (json['estimated_refund_cents'] as num?)?.toInt(),
  id: (json['id'] as num?)?.toInt(),
  interactionStartedAt: json['interaction_started_at'] as String?,
  orderNo: json['order_no'] as String?,
  paidAt: json['paid_at'] as String?,
  paidCents: (json['paid_cents'] as num?)?.toInt(),
  pauseCount: (json['pause_count'] as num?)?.toInt(),
  paused: json['paused'] as bool?,
  paymentMethod: handlerSessionOrderResponsePaymentMethodNullableFromJson(
    json['payment_method'],
  ),
  pays:
      (json['pays'] as List<dynamic>?)
          ?.map((e) => HandlerOrderPayItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  pendingRefundCents: (json['pending_refund_cents'] as num?)?.toInt(),
  pricePerLiterCents: (json['price_per_liter_cents'] as num?)?.toInt(),
  quotaDeductedCents: (json['quota_deducted_cents'] as num?)?.toInt(),
  quotaPaidCents: (json['quota_paid_cents'] as num?)?.toInt(),
  quotaRefundedCents: (json['quota_refunded_cents'] as num?)?.toInt(),
  refundProgress: handlerSessionOrderResponseRefundProgressNullableFromJson(
    json['refund_progress'],
  ),
  refundStatus: handlerSessionOrderResponseRefundStatusNullableFromJson(
    json['refund_status'],
  ),
  refundedCents: (json['refunded_cents'] as num?)?.toInt(),
  selectedVolumeMl: (json['selected_volume_ml'] as num?)?.toInt(),
  sessionId: json['session_id'] as String?,
  status: handlerSessionOrderResponseStatusNullableFromJson(json['status']),
  totalCents: (json['total_cents'] as num?)?.toInt(),
  tradeNo: json['trade_no'] as String?,
  waterType: json['water_type'] as String?,
);

Map<String, dynamic> _$HandlerSessionOrderResponseToJson(
  HandlerSessionOrderResponse instance,
) => <String, dynamic>{
  'abnormal': instance.abnormal,
  'abnormal_reason': instance.abnormalReason,
  'actual_paid_cents': instance.actualPaidCents,
  'actual_refunded_cents': instance.actualRefundedCents,
  'actual_volume_ml': instance.actualVolumeMl,
  'cancel_reason': instance.cancelReason,
  'cancelled_at': instance.cancelledAt,
  'completed_at': instance.completedAt,
  'created_at': instance.createdAt,
  'device_address': instance.deviceAddress,
  'device_id': instance.deviceId,
  'device_name': instance.deviceName,
  'device_sn': instance.deviceSn,
  'dispense_end_reason':
      handlerSessionOrderResponseDispenseEndReasonNullableToJson(
        instance.dispenseEndReason,
      ),
  'dispense_result': handlerSessionOrderResponseDispenseResultNullableToJson(
    instance.dispenseResult,
  ),
  'dispense_started_at': instance.dispenseStartedAt,
  'display_status': handlerSessionOrderResponseDisplayStatusNullableToJson(
    instance.displayStatus,
  ),
  'due_cents': instance.dueCents,
  'estimated_refund_cents': instance.estimatedRefundCents,
  'id': instance.id,
  'interaction_started_at': instance.interactionStartedAt,
  'order_no': instance.orderNo,
  'paid_at': instance.paidAt,
  'paid_cents': instance.paidCents,
  'pause_count': instance.pauseCount,
  'paused': instance.paused,
  'payment_method': handlerSessionOrderResponsePaymentMethodNullableToJson(
    instance.paymentMethod,
  ),
  'pays': instance.pays?.map((e) => e.toJson()).toList(),
  'pending_refund_cents': instance.pendingRefundCents,
  'price_per_liter_cents': instance.pricePerLiterCents,
  'quota_deducted_cents': instance.quotaDeductedCents,
  'quota_paid_cents': instance.quotaPaidCents,
  'quota_refunded_cents': instance.quotaRefundedCents,
  'refund_progress': handlerSessionOrderResponseRefundProgressNullableToJson(
    instance.refundProgress,
  ),
  'refund_status': handlerSessionOrderResponseRefundStatusNullableToJson(
    instance.refundStatus,
  ),
  'refunded_cents': instance.refundedCents,
  'selected_volume_ml': instance.selectedVolumeMl,
  'session_id': instance.sessionId,
  'status': handlerSessionOrderResponseStatusNullableToJson(instance.status),
  'total_cents': instance.totalCents,
  'trade_no': instance.tradeNo,
  'water_type': instance.waterType,
};

HandlerSessionPaymentResponse _$HandlerSessionPaymentResponseFromJson(
  Map<String, dynamic> json,
) => HandlerSessionPaymentResponse(
  expiresAt: json['expires_at'] as String?,
  payUrl: json['pay_url'] as String?,
  payableCents: (json['payable_cents'] as num?)?.toInt(),
  qrCode: json['qr_code'] as String?,
);

Map<String, dynamic> _$HandlerSessionPaymentResponseToJson(
  HandlerSessionPaymentResponse instance,
) => <String, dynamic>{
  'expires_at': instance.expiresAt,
  'pay_url': instance.payUrl,
  'payable_cents': instance.payableCents,
  'qr_code': instance.qrCode,
};

HandlerSessionResponse _$HandlerSessionResponseFromJson(
  Map<String, dynamic> json,
) => HandlerSessionResponse(
  address: json['address'] as String?,
  available: json['available'] as bool?,
  blockers:
      (json['blockers'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      [],
  code: handlerSessionResponseCodeNullableFromJson(json['code']),
  connectivity: json['connectivity'] == null
      ? null
      : HandlerSessionConnectivity.fromJson(
          json['connectivity'] as Map<String, dynamic>,
        ),
  deviceName: json['device_name'] as String?,
  deviceSn: json['device_sn'] as String?,
  endCause: handlerSessionResponseEndCauseNullableFromJson(json['end_cause']),
  filters:
      (json['filters'] as List<dynamic>?)
          ?.map((e) => HandlerSessionFilter.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  freeMode: json['free_mode'] as bool?,
  joined: json['joined'] as bool?,
  message: json['message'] as String?,
  mineralPriceCents: (json['mineral_price_cents'] as num?)?.toInt(),
  onlinePaymentMethods: handlerSessionResponseOnlinePaymentMethodsListFromJson(
    json['online_payment_methods'] as List?,
  ),
  order: json['order'] == null
      ? null
      : HandlerSessionOrderResponse.fromJson(
          json['order'] as Map<String, dynamic>,
        ),
  pauseLimit: (json['pause_limit'] as num?)?.toInt(),
  payment: json['payment'] == null
      ? null
      : HandlerSessionPaymentResponse.fromJson(
          json['payment'] as Map<String, dynamic>,
        ),
  paymentMethod: json['payment_method'] as String?,
  purePriceCents: (json['pure_price_cents'] as num?)?.toInt(),
  reason: handlerSessionResponseReasonNullableFromJson(json['reason']),
  sellable: json['sellable'] as bool?,
  sessionId: json['session_id'] as String?,
  slots:
      (json['slots'] as List<dynamic>?)
          ?.map(
            (e) => HandlerSessionSlotOption.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
  stage: handlerSessionResponseStageNullableFromJson(json['stage']),
  stageDeadline: json['stage_deadline'] as String?,
  stageRemainingMs: (json['stage_remaining_ms'] as num?)?.toInt(),
  tdsMineral: (json['tds_mineral'] as num?)?.toInt(),
  tdsPure: (json['tds_pure'] as num?)?.toInt(),
  tdsRaw: (json['tds_raw'] as num?)?.toInt(),
  title: json['title'] as String?,
  todayDispenseMl: (json['today_dispense_ml'] as num?)?.toInt(),
  totalDispenseMl: (json['total_dispense_ml'] as num?)?.toInt(),
  version: (json['version'] as num?)?.toInt(),
  volumeMl: (json['volume_ml'] as num?)?.toInt(),
  waterLevel: handlerSessionResponseWaterLevelNullableFromJson(
    json['water_level'],
  ),
  waterType: json['water_type'] as String?,
);

Map<String, dynamic> _$HandlerSessionResponseToJson(
  HandlerSessionResponse instance,
) => <String, dynamic>{
  'address': instance.address,
  'available': instance.available,
  'blockers': instance.blockers,
  'code': handlerSessionResponseCodeNullableToJson(instance.code),
  'connectivity': instance.connectivity?.toJson(),
  'device_name': instance.deviceName,
  'device_sn': instance.deviceSn,
  'end_cause': handlerSessionResponseEndCauseNullableToJson(instance.endCause),
  'filters': instance.filters?.map((e) => e.toJson()).toList(),
  'free_mode': instance.freeMode,
  'joined': instance.joined,
  'message': instance.message,
  'mineral_price_cents': instance.mineralPriceCents,
  'online_payment_methods':
      handlerSessionResponseOnlinePaymentMethodsListToJson(
        instance.onlinePaymentMethods,
      ),
  'order': instance.order?.toJson(),
  'pause_limit': instance.pauseLimit,
  'payment': instance.payment?.toJson(),
  'payment_method': instance.paymentMethod,
  'pure_price_cents': instance.purePriceCents,
  'reason': handlerSessionResponseReasonNullableToJson(instance.reason),
  'sellable': instance.sellable,
  'session_id': instance.sessionId,
  'slots': instance.slots?.map((e) => e.toJson()).toList(),
  'stage': handlerSessionResponseStageNullableToJson(instance.stage),
  'stage_deadline': instance.stageDeadline,
  'stage_remaining_ms': instance.stageRemainingMs,
  'tds_mineral': instance.tdsMineral,
  'tds_pure': instance.tdsPure,
  'tds_raw': instance.tdsRaw,
  'title': instance.title,
  'today_dispense_ml': instance.todayDispenseMl,
  'total_dispense_ml': instance.totalDispenseMl,
  'version': instance.version,
  'volume_ml': instance.volumeMl,
  'water_level': handlerSessionResponseWaterLevelNullableToJson(
    instance.waterLevel,
  ),
  'water_type': instance.waterType,
};

HandlerSessionScanDevice _$HandlerSessionScanDeviceFromJson(
  Map<String, dynamic> json,
) => HandlerSessionScanDevice(
  address: json['address'] as String?,
  name: json['name'] as String?,
  runStatus: handlerSessionScanDeviceRunStatusNullableFromJson(
    json['run_status'],
  ),
  sn: json['sn'] as String?,
  waterLevel: handlerSessionScanDeviceWaterLevelNullableFromJson(
    json['water_level'],
  ),
  waterLevelMl: (json['water_level_ml'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerSessionScanDeviceToJson(
  HandlerSessionScanDevice instance,
) => <String, dynamic>{
  'address': instance.address,
  'name': instance.name,
  'run_status': handlerSessionScanDeviceRunStatusNullableToJson(
    instance.runStatus,
  ),
  'sn': instance.sn,
  'water_level': handlerSessionScanDeviceWaterLevelNullableToJson(
    instance.waterLevel,
  ),
  'water_level_ml': instance.waterLevelMl,
};

HandlerSessionScanRequest _$HandlerSessionScanRequestFromJson(
  Map<String, dynamic> json,
) => HandlerSessionScanRequest(token: json['token'] as String);

Map<String, dynamic> _$HandlerSessionScanRequestToJson(
  HandlerSessionScanRequest instance,
) => <String, dynamic>{'token': instance.token};

HandlerSessionScanResponse _$HandlerSessionScanResponseFromJson(
  Map<String, dynamic> json,
) => HandlerSessionScanResponse(
  address: json['address'] as String?,
  available: json['available'] as bool?,
  blockers:
      (json['blockers'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      [],
  code: handlerSessionScanResponseCodeNullableFromJson(json['code']),
  connectivity: json['connectivity'] == null
      ? null
      : HandlerSessionConnectivity.fromJson(
          json['connectivity'] as Map<String, dynamic>,
        ),
  device: json['device'] == null
      ? null
      : HandlerSessionScanDevice.fromJson(
          json['device'] as Map<String, dynamic>,
        ),
  deviceName: json['device_name'] as String?,
  deviceSn: json['device_sn'] as String?,
  endCause: handlerSessionScanResponseEndCauseNullableFromJson(
    json['end_cause'],
  ),
  filters:
      (json['filters'] as List<dynamic>?)
          ?.map((e) => HandlerSessionFilter.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  freeMode: json['free_mode'] as bool?,
  joined: json['joined'] as bool?,
  message: json['message'] as String?,
  mineralPriceCents: (json['mineral_price_cents'] as num?)?.toInt(),
  onlinePaymentMethods:
      handlerSessionScanResponseOnlinePaymentMethodsListFromJson(
        json['online_payment_methods'] as List?,
      ),
  order: json['order'] == null
      ? null
      : HandlerSessionOrderResponse.fromJson(
          json['order'] as Map<String, dynamic>,
        ),
  pauseLimit: (json['pause_limit'] as num?)?.toInt(),
  payment: json['payment'] == null
      ? null
      : HandlerSessionPaymentResponse.fromJson(
          json['payment'] as Map<String, dynamic>,
        ),
  paymentMethod: json['payment_method'] as String?,
  purePriceCents: (json['pure_price_cents'] as num?)?.toInt(),
  reason: handlerSessionScanResponseReasonNullableFromJson(json['reason']),
  sellable: json['sellable'] as bool?,
  sessionId: json['session_id'] as String?,
  slots:
      (json['slots'] as List<dynamic>?)
          ?.map(
            (e) => HandlerSessionSlotOption.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
  stage: handlerSessionScanResponseStageNullableFromJson(json['stage']),
  stageDeadline: json['stage_deadline'] as String?,
  stageRemainingMs: (json['stage_remaining_ms'] as num?)?.toInt(),
  tdsMineral: (json['tds_mineral'] as num?)?.toInt(),
  tdsPure: (json['tds_pure'] as num?)?.toInt(),
  tdsRaw: (json['tds_raw'] as num?)?.toInt(),
  title: json['title'] as String?,
  todayDispenseMl: (json['today_dispense_ml'] as num?)?.toInt(),
  totalDispenseMl: (json['total_dispense_ml'] as num?)?.toInt(),
  version: (json['version'] as num?)?.toInt(),
  volumeMl: (json['volume_ml'] as num?)?.toInt(),
  waterLevel: handlerSessionScanResponseWaterLevelNullableFromJson(
    json['water_level'],
  ),
  waterType: json['water_type'] as String?,
);

Map<String, dynamic> _$HandlerSessionScanResponseToJson(
  HandlerSessionScanResponse instance,
) => <String, dynamic>{
  'address': instance.address,
  'available': instance.available,
  'blockers': instance.blockers,
  'code': handlerSessionScanResponseCodeNullableToJson(instance.code),
  'connectivity': instance.connectivity?.toJson(),
  'device': instance.device?.toJson(),
  'device_name': instance.deviceName,
  'device_sn': instance.deviceSn,
  'end_cause': handlerSessionScanResponseEndCauseNullableToJson(
    instance.endCause,
  ),
  'filters': instance.filters?.map((e) => e.toJson()).toList(),
  'free_mode': instance.freeMode,
  'joined': instance.joined,
  'message': instance.message,
  'mineral_price_cents': instance.mineralPriceCents,
  'online_payment_methods':
      handlerSessionScanResponseOnlinePaymentMethodsListToJson(
        instance.onlinePaymentMethods,
      ),
  'order': instance.order?.toJson(),
  'pause_limit': instance.pauseLimit,
  'payment': instance.payment?.toJson(),
  'payment_method': instance.paymentMethod,
  'pure_price_cents': instance.purePriceCents,
  'reason': handlerSessionScanResponseReasonNullableToJson(instance.reason),
  'sellable': instance.sellable,
  'session_id': instance.sessionId,
  'slots': instance.slots?.map((e) => e.toJson()).toList(),
  'stage': handlerSessionScanResponseStageNullableToJson(instance.stage),
  'stage_deadline': instance.stageDeadline,
  'stage_remaining_ms': instance.stageRemainingMs,
  'tds_mineral': instance.tdsMineral,
  'tds_pure': instance.tdsPure,
  'tds_raw': instance.tdsRaw,
  'title': instance.title,
  'today_dispense_ml': instance.todayDispenseMl,
  'total_dispense_ml': instance.totalDispenseMl,
  'version': instance.version,
  'volume_ml': instance.volumeMl,
  'water_level': handlerSessionScanResponseWaterLevelNullableToJson(
    instance.waterLevel,
  ),
  'water_type': instance.waterType,
};

HandlerSessionSlotOption _$HandlerSessionSlotOptionFromJson(
  Map<String, dynamic> json,
) => HandlerSessionSlotOption(
  mineralTotalCents: (json['mineral_total_cents'] as num?)?.toInt(),
  pureTotalCents: (json['pure_total_cents'] as num?)?.toInt(),
  volumeMl: (json['volume_ml'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerSessionSlotOptionToJson(
  HandlerSessionSlotOption instance,
) => <String, dynamic>{
  'mineral_total_cents': instance.mineralTotalCents,
  'pure_total_cents': instance.pureTotalCents,
  'volume_ml': instance.volumeMl,
};

HandlerSessionSlotRequest _$HandlerSessionSlotRequestFromJson(
  Map<String, dynamic> json,
) => HandlerSessionSlotRequest(
  confirm: json['confirm'] as bool?,
  volumeMl: (json['volume_ml'] as num).toInt(),
  waterType: handlerSessionSlotRequestWaterTypeFromJson(json['water_type']),
);

Map<String, dynamic> _$HandlerSessionSlotRequestToJson(
  HandlerSessionSlotRequest instance,
) => <String, dynamic>{
  'confirm': instance.confirm,
  'volume_ml': instance.volumeMl,
  'water_type': handlerSessionSlotRequestWaterTypeToJson(instance.waterType),
};

HandlerStaffAdminChangePasswordRequest
_$HandlerStaffAdminChangePasswordRequestFromJson(Map<String, dynamic> json) =>
    HandlerStaffAdminChangePasswordRequest(
      newPassword: json['new_password'] as String,
      oldPassword: json['old_password'] as String,
    );

Map<String, dynamic> _$HandlerStaffAdminChangePasswordRequestToJson(
  HandlerStaffAdminChangePasswordRequest instance,
) => <String, dynamic>{
  'new_password': instance.newPassword,
  'old_password': instance.oldPassword,
};

HandlerStaffAdminCreateRequest _$HandlerStaffAdminCreateRequestFromJson(
  Map<String, dynamic> json,
) => HandlerStaffAdminCreateRequest(
  login: json['login'] as String,
  name: json['name'] as String,
  password: json['password'] as String,
  phone: json['phone'] as String?,
  regions:
      (json['regions'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      [],
  remark: json['remark'] as String?,
  roleIds:
      (json['role_ids'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      [],
  warehouses:
      (json['warehouses'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      [],
);

Map<String, dynamic> _$HandlerStaffAdminCreateRequestToJson(
  HandlerStaffAdminCreateRequest instance,
) => <String, dynamic>{
  'login': instance.login,
  'name': instance.name,
  'password': instance.password,
  'phone': instance.phone,
  'regions': instance.regions,
  'remark': instance.remark,
  'role_ids': instance.roleIds,
  'warehouses': instance.warehouses,
};

HandlerStaffAdminListResponse _$HandlerStaffAdminListResponseFromJson(
  Map<String, dynamic> json,
) => HandlerStaffAdminListResponse(
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) =>
                HandlerStaffAdminResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
  total: (json['total'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerStaffAdminListResponseToJson(
  HandlerStaffAdminListResponse instance,
) => <String, dynamic>{
  'items': instance.items?.map((e) => e.toJson()).toList(),
  'total': instance.total,
};

HandlerStaffAdminLoginRequest _$HandlerStaffAdminLoginRequestFromJson(
  Map<String, dynamic> json,
) => HandlerStaffAdminLoginRequest(
  login: json['login'] as String,
  password: json['password'] as String,
);

Map<String, dynamic> _$HandlerStaffAdminLoginRequestToJson(
  HandlerStaffAdminLoginRequest instance,
) => <String, dynamic>{'login': instance.login, 'password': instance.password};

HandlerStaffAdminLoginResponse _$HandlerStaffAdminLoginResponseFromJson(
  Map<String, dynamic> json,
) => HandlerStaffAdminLoginResponse(
  login: json['login'] as String?,
  name: json['name'] as String?,
  staffId: (json['staff_id'] as num?)?.toInt(),
  token: json['token'] as String?,
);

Map<String, dynamic> _$HandlerStaffAdminLoginResponseToJson(
  HandlerStaffAdminLoginResponse instance,
) => <String, dynamic>{
  'login': instance.login,
  'name': instance.name,
  'staff_id': instance.staffId,
  'token': instance.token,
};

HandlerStaffAdminMenuResponse _$HandlerStaffAdminMenuResponseFromJson(
  Map<String, dynamic> json,
) => HandlerStaffAdminMenuResponse(
  code: json['code'] as String?,
  group: json['group'] as String?,
  level: json['level'] as String?,
  name: json['name'] as String?,
  sort: (json['sort'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerStaffAdminMenuResponseToJson(
  HandlerStaffAdminMenuResponse instance,
) => <String, dynamic>{
  'code': instance.code,
  'group': instance.group,
  'level': instance.level,
  'name': instance.name,
  'sort': instance.sort,
};

HandlerStaffAdminProfileResponse _$HandlerStaffAdminProfileResponseFromJson(
  Map<String, dynamic> json,
) => HandlerStaffAdminProfileResponse(
  login: json['login'] as String?,
  menus:
      (json['menus'] as List<dynamic>?)
          ?.map(
            (e) => HandlerStaffAdminMenuResponse.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      [],
  name: json['name'] as String?,
  phone: json['phone'] as String?,
  preset: json['preset'] as bool?,
  roles:
      (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
  staffId: (json['staff_id'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerStaffAdminProfileResponseToJson(
  HandlerStaffAdminProfileResponse instance,
) => <String, dynamic>{
  'login': instance.login,
  'menus': instance.menus?.map((e) => e.toJson()).toList(),
  'name': instance.name,
  'phone': instance.phone,
  'preset': instance.preset,
  'roles': instance.roles,
  'staff_id': instance.staffId,
};

HandlerStaffAdminResponse _$HandlerStaffAdminResponseFromJson(
  Map<String, dynamic> json,
) => HandlerStaffAdminResponse(
  createdAt: json['created_at'] as String?,
  hasValid: json['has_valid'] as bool?,
  id: (json['id'] as num?)?.toInt(),
  login: json['login'] as String?,
  name: json['name'] as String?,
  phone: json['phone'] as String?,
  preset: json['preset'] as bool?,
  regions:
      (json['regions'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      [],
  remark: json['remark'] as String?,
  roles:
      (json['roles'] as List<dynamic>?)
          ?.map(
            (e) => HandlerStaffAdminRoleResponse.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      [],
  status: handlerStaffAdminResponseStatusNullableFromJson(json['status']),
  warehouses:
      (json['warehouses'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      [],
);

Map<String, dynamic> _$HandlerStaffAdminResponseToJson(
  HandlerStaffAdminResponse instance,
) => <String, dynamic>{
  'created_at': instance.createdAt,
  'has_valid': instance.hasValid,
  'id': instance.id,
  'login': instance.login,
  'name': instance.name,
  'phone': instance.phone,
  'preset': instance.preset,
  'regions': instance.regions,
  'remark': instance.remark,
  'roles': instance.roles?.map((e) => e.toJson()).toList(),
  'status': handlerStaffAdminResponseStatusNullableToJson(instance.status),
  'warehouses': instance.warehouses,
};

HandlerStaffAdminRoleResponse _$HandlerStaffAdminRoleResponseFromJson(
  Map<String, dynamic> json,
) => HandlerStaffAdminRoleResponse(
  code: json['code'] as String?,
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  platform: json['platform'] as String?,
  status: json['status'] as String?,
);

Map<String, dynamic> _$HandlerStaffAdminRoleResponseToJson(
  HandlerStaffAdminRoleResponse instance,
) => <String, dynamic>{
  'code': instance.code,
  'id': instance.id,
  'name': instance.name,
  'platform': instance.platform,
  'status': instance.status,
};

HandlerStaffAdminStatusRequest _$HandlerStaffAdminStatusRequestFromJson(
  Map<String, dynamic> json,
) => HandlerStaffAdminStatusRequest(
  status: handlerStaffAdminStatusRequestStatusFromJson(json['status']),
);

Map<String, dynamic> _$HandlerStaffAdminStatusRequestToJson(
  HandlerStaffAdminStatusRequest instance,
) => <String, dynamic>{
  'status': handlerStaffAdminStatusRequestStatusToJson(instance.status),
};

HandlerStaffAdminUpdateRequest _$HandlerStaffAdminUpdateRequestFromJson(
  Map<String, dynamic> json,
) => HandlerStaffAdminUpdateRequest(
  name: json['name'] as String,
  password: json['password'] as String?,
  phone: json['phone'] as String?,
  regions:
      (json['regions'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      [],
  remark: json['remark'] as String?,
  roleIds:
      (json['role_ids'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      [],
  warehouses:
      (json['warehouses'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      [],
);

Map<String, dynamic> _$HandlerStaffAdminUpdateRequestToJson(
  HandlerStaffAdminUpdateRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'password': instance.password,
  'phone': instance.phone,
  'regions': instance.regions,
  'remark': instance.remark,
  'role_ids': instance.roleIds,
  'warehouses': instance.warehouses,
};

HandlerTestkitAlarmScanResponse _$HandlerTestkitAlarmScanResponseFromJson(
  Map<String, dynamic> json,
) => HandlerTestkitAlarmScanResponse(
  raised: (json['raised'] as num?)?.toInt(),
  swept: (json['swept'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerTestkitAlarmScanResponseToJson(
  HandlerTestkitAlarmScanResponse instance,
) => <String, dynamic>{'raised': instance.raised, 'swept': instance.swept};

HandlerTestkitCardSyncRoundResponse
_$HandlerTestkitCardSyncRoundResponseFromJson(Map<String, dynamic> json) =>
    HandlerTestkitCardSyncRoundResponse(
      planned: (json['planned'] as num?)?.toInt(),
      skipped: (json['skipped'] as num?)?.toInt(),
    );

Map<String, dynamic> _$HandlerTestkitCardSyncRoundResponseToJson(
  HandlerTestkitCardSyncRoundResponse instance,
) => <String, dynamic>{
  'planned': instance.planned,
  'skipped': instance.skipped,
};

HandlerTestkitDoneResponse _$HandlerTestkitDoneResponseFromJson(
  Map<String, dynamic> json,
) => HandlerTestkitDoneResponse(message: json['message'] as String?);

Map<String, dynamic> _$HandlerTestkitDoneResponseToJson(
  HandlerTestkitDoneResponse instance,
) => <String, dynamic>{'message': instance.message};

HandlerTestkitFilterAgeRequest _$HandlerTestkitFilterAgeRequestFromJson(
  Map<String, dynamic> json,
) => HandlerTestkitFilterAgeRequest(days: (json['days'] as num).toInt());

Map<String, dynamic> _$HandlerTestkitFilterAgeRequestToJson(
  HandlerTestkitFilterAgeRequest instance,
) => <String, dynamic>{'days': instance.days};

HandlerTestkitKioskSignRequest _$HandlerTestkitKioskSignRequestFromJson(
  Map<String, dynamic> json,
) => HandlerTestkitKioskSignRequest(
  body: json['body'] as String?,
  method: handlerTestkitKioskSignRequestMethodFromJson(json['method']),
  path: json['path'] as String,
  sn: json['sn'] as String,
);

Map<String, dynamic> _$HandlerTestkitKioskSignRequestToJson(
  HandlerTestkitKioskSignRequest instance,
) => <String, dynamic>{
  'body': instance.body,
  'method': handlerTestkitKioskSignRequestMethodToJson(instance.method),
  'path': instance.path,
  'sn': instance.sn,
};

HandlerTestkitKioskSignResponse _$HandlerTestkitKioskSignResponseFromJson(
  Map<String, dynamic> json,
) => HandlerTestkitKioskSignResponse(
  nonce: json['nonce'] as String?,
  signature: json['signature'] as String?,
  sn: json['sn'] as String?,
  timestamp: (json['timestamp'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerTestkitKioskSignResponseToJson(
  HandlerTestkitKioskSignResponse instance,
) => <String, dynamic>{
  'nonce': instance.nonce,
  'signature': instance.signature,
  'sn': instance.sn,
  'timestamp': instance.timestamp,
};

HandlerTestkitOfflineRequest _$HandlerTestkitOfflineRequestFromJson(
  Map<String, dynamic> json,
) => HandlerTestkitOfflineRequest(
  offlineMinutes: (json['offline_minutes'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerTestkitOfflineRequestToJson(
  HandlerTestkitOfflineRequest instance,
) => <String, dynamic>{'offline_minutes': instance.offlineMinutes};

HandlerTestkitRequestItem _$HandlerTestkitRequestItemFromJson(
  Map<String, dynamic> json,
) => HandlerTestkitRequestItem(
  at: json['at'] as String?,
  deviceSn: json['device_sn'] as String?,
  durationMs: (json['duration_ms'] as num?)?.toInt(),
  method: json['method'] as String?,
  path: json['path'] as String?,
  request: json['request'] as String?,
  response: json['response'] as String?,
  status: (json['status'] as num?)?.toInt(),
  userId: (json['user_id'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerTestkitRequestItemToJson(
  HandlerTestkitRequestItem instance,
) => <String, dynamic>{
  'at': instance.at,
  'device_sn': instance.deviceSn,
  'duration_ms': instance.durationMs,
  'method': instance.method,
  'path': instance.path,
  'request': instance.request,
  'response': instance.response,
  'status': instance.status,
  'user_id': instance.userId,
};

HandlerTestkitRequestListResponse _$HandlerTestkitRequestListResponseFromJson(
  Map<String, dynamic> json,
) => HandlerTestkitRequestListResponse(
  enabled: json['enabled'] as bool?,
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) =>
                HandlerTestkitRequestItem.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
);

Map<String, dynamic> _$HandlerTestkitRequestListResponseToJson(
  HandlerTestkitRequestListResponse instance,
) => <String, dynamic>{
  'enabled': instance.enabled,
  'items': instance.items?.map((e) => e.toJson()).toList(),
};

HandlerTestkitUserItem _$HandlerTestkitUserItemFromJson(
  Map<String, dynamic> json,
) => HandlerTestkitUserItem(
  displayName: json['display_name'] as String?,
  id: (json['id'] as num?)?.toInt(),
  lineUserId: json['line_user_id'] as String?,
  userId: json['user_id'] as String?,
);

Map<String, dynamic> _$HandlerTestkitUserItemToJson(
  HandlerTestkitUserItem instance,
) => <String, dynamic>{
  'display_name': instance.displayName,
  'id': instance.id,
  'line_user_id': instance.lineUserId,
  'user_id': instance.userId,
};

HandlerTestkitUserListResponse _$HandlerTestkitUserListResponseFromJson(
  Map<String, dynamic> json,
) => HandlerTestkitUserListResponse(
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) => HandlerTestkitUserItem.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
  total: (json['total'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerTestkitUserListResponseToJson(
  HandlerTestkitUserListResponse instance,
) => <String, dynamic>{
  'items': instance.items?.map((e) => e.toJson()).toList(),
  'total': instance.total,
};

HandlerUserAdminDeductRequest _$HandlerUserAdminDeductRequestFromJson(
  Map<String, dynamic> json,
) => HandlerUserAdminDeductRequest(
  amountCents: (json['amount_cents'] as num).toInt(),
  remark: json['remark'] as String?,
);

Map<String, dynamic> _$HandlerUserAdminDeductRequestToJson(
  HandlerUserAdminDeductRequest instance,
) => <String, dynamic>{
  'amount_cents': instance.amountCents,
  'remark': instance.remark,
};

HandlerUserAdminGrantRequest _$HandlerUserAdminGrantRequestFromJson(
  Map<String, dynamic> json,
) => HandlerUserAdminGrantRequest(
  amountCents: (json['amount_cents'] as num).toInt(),
  remark: json['remark'] as String?,
);

Map<String, dynamic> _$HandlerUserAdminGrantRequestToJson(
  HandlerUserAdminGrantRequest instance,
) => <String, dynamic>{
  'amount_cents': instance.amountCents,
  'remark': instance.remark,
};

HandlerUserAdminItem _$HandlerUserAdminItemFromJson(
  Map<String, dynamic> json,
) => HandlerUserAdminItem(
  adminGiftedBalanceCents: (json['admin_gifted_balance_cents'] as num?)
      ?.toInt(),
  createdAt: json['created_at'] as String?,
  displayName: json['display_name'] as String?,
  giftedTotalCents: (json['gifted_total_cents'] as num?)?.toInt(),
  hasPackage: json['has_package'] as bool?,
  id: (json['id'] as num?)?.toInt(),
  isActive: json['is_active'] as bool?,
  lastActiveAt: json['last_active_at'] as String?,
  packageGiftedBalanceCents: (json['package_gifted_balance_cents'] as num?)
      ?.toInt(),
  pictureUrl: json['picture_url'] as String?,
  quotaBalanceCents: (json['quota_balance_cents'] as num?)?.toInt(),
  recentOrderCents: (json['recent_order_cents'] as num?)?.toInt(),
  recentVolumeMl: (json['recent_volume_ml'] as num?)?.toInt(),
  totalOrderCents: (json['total_order_cents'] as num?)?.toInt(),
  totalPaidCents: (json['total_paid_cents'] as num?)?.toInt(),
  totalVolumeMl: (json['total_volume_ml'] as num?)?.toInt(),
  userId: json['user_id'] as String?,
);

Map<String, dynamic> _$HandlerUserAdminItemToJson(
  HandlerUserAdminItem instance,
) => <String, dynamic>{
  'admin_gifted_balance_cents': instance.adminGiftedBalanceCents,
  'created_at': instance.createdAt,
  'display_name': instance.displayName,
  'gifted_total_cents': instance.giftedTotalCents,
  'has_package': instance.hasPackage,
  'id': instance.id,
  'is_active': instance.isActive,
  'last_active_at': instance.lastActiveAt,
  'package_gifted_balance_cents': instance.packageGiftedBalanceCents,
  'picture_url': instance.pictureUrl,
  'quota_balance_cents': instance.quotaBalanceCents,
  'recent_order_cents': instance.recentOrderCents,
  'recent_volume_ml': instance.recentVolumeMl,
  'total_order_cents': instance.totalOrderCents,
  'total_paid_cents': instance.totalPaidCents,
  'total_volume_ml': instance.totalVolumeMl,
  'user_id': instance.userId,
};

HandlerUserAdminLedgerRecord _$HandlerUserAdminLedgerRecordFromJson(
  Map<String, dynamic> json,
) => HandlerUserAdminLedgerRecord(
  amountCents: (json['amount_cents'] as num?)?.toInt(),
  balanceCents: (json['balance_cents'] as num?)?.toInt(),
  createdAt: json['created_at'] as String?,
  operatorId: (json['operator_id'] as num?)?.toInt(),
  packageName: json['package_name'] as String?,
  packageNo: json['package_no'] as String?,
  parts:
      (json['parts'] as List<dynamic>?)
          ?.map(
            (e) => HandlerUserLedgerPart.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
  relatedOrderNo: json['related_order_no'] as String?,
  remark: json['remark'] as String?,
  source: json['source'] as String?,
  type: json['type'] as String?,
);

Map<String, dynamic> _$HandlerUserAdminLedgerRecordToJson(
  HandlerUserAdminLedgerRecord instance,
) => <String, dynamic>{
  'amount_cents': instance.amountCents,
  'balance_cents': instance.balanceCents,
  'created_at': instance.createdAt,
  'operator_id': instance.operatorId,
  'package_name': instance.packageName,
  'package_no': instance.packageNo,
  'parts': instance.parts?.map((e) => e.toJson()).toList(),
  'related_order_no': instance.relatedOrderNo,
  'remark': instance.remark,
  'source': instance.source,
  'type': instance.type,
};

HandlerUserAdminListResponse _$HandlerUserAdminListResponseFromJson(
  Map<String, dynamic> json,
) => HandlerUserAdminListResponse(
  activeDays: (json['active_days'] as num?)?.toInt(),
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => HandlerUserAdminItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  recentDays: (json['recent_days'] as num?)?.toInt(),
  total: (json['total'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerUserAdminListResponseToJson(
  HandlerUserAdminListResponse instance,
) => <String, dynamic>{
  'active_days': instance.activeDays,
  'items': instance.items?.map((e) => e.toJson()).toList(),
  'recent_days': instance.recentDays,
  'total': instance.total,
};

HandlerUserAdminQuotaResponse _$HandlerUserAdminQuotaResponseFromJson(
  Map<String, dynamic> json,
) => HandlerUserAdminQuotaResponse(
  adminGiftedCents: (json['admin_gifted_cents'] as num?)?.toInt(),
  consumedCents: (json['consumed_cents'] as num?)?.toInt(),
  ledgerTotal: (json['ledger_total'] as num?)?.toInt(),
  ledgers:
      (json['ledgers'] as List<dynamic>?)
          ?.map(
            (e) => HandlerUserAdminLedgerRecord.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      [],
  packageGiftedCents: (json['package_gifted_cents'] as num?)?.toInt(),
  purchasedCents: (json['purchased_cents'] as num?)?.toInt(),
  totalCents: (json['total_cents'] as num?)?.toInt(),
  userId: json['user_id'] as String?,
);

Map<String, dynamic> _$HandlerUserAdminQuotaResponseToJson(
  HandlerUserAdminQuotaResponse instance,
) => <String, dynamic>{
  'admin_gifted_cents': instance.adminGiftedCents,
  'consumed_cents': instance.consumedCents,
  'ledger_total': instance.ledgerTotal,
  'ledgers': instance.ledgers?.map((e) => e.toJson()).toList(),
  'package_gifted_cents': instance.packageGiftedCents,
  'purchased_cents': instance.purchasedCents,
  'total_cents': instance.totalCents,
  'user_id': instance.userId,
};

HandlerUserAdminStatsResponse _$HandlerUserAdminStatsResponseFromJson(
  Map<String, dynamic> json,
) => HandlerUserAdminStatsResponse(
  active: (json['active'] as num?)?.toInt(),
  activeDays: (json['active_days'] as num?)?.toInt(),
  total: (json['total'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerUserAdminStatsResponseToJson(
  HandlerUserAdminStatsResponse instance,
) => <String, dynamic>{
  'active': instance.active,
  'active_days': instance.activeDays,
  'total': instance.total,
};

HandlerUserLedgerListResponse _$HandlerUserLedgerListResponseFromJson(
  Map<String, dynamic> json,
) => HandlerUserLedgerListResponse(
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) => HandlerUserLedgerRecord.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
  total: (json['total'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerUserLedgerListResponseToJson(
  HandlerUserLedgerListResponse instance,
) => <String, dynamic>{
  'items': instance.items?.map((e) => e.toJson()).toList(),
  'total': instance.total,
};

HandlerUserLedgerPart _$HandlerUserLedgerPartFromJson(
  Map<String, dynamic> json,
) => HandlerUserLedgerPart(
  amountCents: (json['amount_cents'] as num?)?.toInt(),
  source: json['source'] as String?,
);

Map<String, dynamic> _$HandlerUserLedgerPartToJson(
  HandlerUserLedgerPart instance,
) => <String, dynamic>{
  'amount_cents': instance.amountCents,
  'source': instance.source,
};

HandlerUserLedgerRecord _$HandlerUserLedgerRecordFromJson(
  Map<String, dynamic> json,
) => HandlerUserLedgerRecord(
  amountCents: (json['amount_cents'] as num?)?.toInt(),
  balanceCents: (json['balance_cents'] as num?)?.toInt(),
  createdAt: json['created_at'] as String?,
  parts:
      (json['parts'] as List<dynamic>?)
          ?.map(
            (e) => HandlerUserLedgerPart.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
  relatedOrderNo: json['related_order_no'] as String?,
  remark: json['remark'] as String?,
  source: json['source'] as String?,
  type: json['type'] as String?,
);

Map<String, dynamic> _$HandlerUserLedgerRecordToJson(
  HandlerUserLedgerRecord instance,
) => <String, dynamic>{
  'amount_cents': instance.amountCents,
  'balance_cents': instance.balanceCents,
  'created_at': instance.createdAt,
  'parts': instance.parts?.map((e) => e.toJson()).toList(),
  'related_order_no': instance.relatedOrderNo,
  'remark': instance.remark,
  'source': instance.source,
  'type': instance.type,
};

HandlerUserLiffConfigResponse _$HandlerUserLiffConfigResponseFromJson(
  Map<String, dynamic> json,
) => HandlerUserLiffConfigResponse(
  liffId: json['liff_id'] as String?,
  mock: json['mock'] as bool?,
);

Map<String, dynamic> _$HandlerUserLiffConfigResponseToJson(
  HandlerUserLiffConfigResponse instance,
) => <String, dynamic>{'liff_id': instance.liffId, 'mock': instance.mock};

HandlerUserLoginRequest _$HandlerUserLoginRequestFromJson(
  Map<String, dynamic> json,
) => HandlerUserLoginRequest(idToken: json['id_token'] as String);

Map<String, dynamic> _$HandlerUserLoginRequestToJson(
  HandlerUserLoginRequest instance,
) => <String, dynamic>{'id_token': instance.idToken};

HandlerUserLoginResponse _$HandlerUserLoginResponseFromJson(
  Map<String, dynamic> json,
) => HandlerUserLoginResponse(
  displayName: json['display_name'] as String?,
  pictureUrl: json['picture_url'] as String?,
  token: json['token'] as String?,
  userId: json['user_id'] as String?,
);

Map<String, dynamic> _$HandlerUserLoginResponseToJson(
  HandlerUserLoginResponse instance,
) => <String, dynamic>{
  'display_name': instance.displayName,
  'picture_url': instance.pictureUrl,
  'token': instance.token,
  'user_id': instance.userId,
};

HandlerUserProfileResponse _$HandlerUserProfileResponseFromJson(
  Map<String, dynamic> json,
) => HandlerUserProfileResponse(
  displayName: json['display_name'] as String?,
  monthVolumeMl: (json['month_volume_ml'] as num?)?.toInt(),
  pictureUrl: json['picture_url'] as String?,
  quotaBalanceCents: (json['quota_balance_cents'] as num?)?.toInt(),
  totalCount: (json['total_count'] as num?)?.toInt(),
  totalVolumeMl: (json['total_volume_ml'] as num?)?.toInt(),
  userId: json['user_id'] as String?,
);

Map<String, dynamic> _$HandlerUserProfileResponseToJson(
  HandlerUserProfileResponse instance,
) => <String, dynamic>{
  'display_name': instance.displayName,
  'month_volume_ml': instance.monthVolumeMl,
  'picture_url': instance.pictureUrl,
  'quota_balance_cents': instance.quotaBalanceCents,
  'total_count': instance.totalCount,
  'total_volume_ml': instance.totalVolumeMl,
  'user_id': instance.userId,
};

HandlerUserQuotaResponse _$HandlerUserQuotaResponseFromJson(
  Map<String, dynamic> json,
) => HandlerUserQuotaResponse(
  adminGiftedCents: (json['admin_gifted_cents'] as num?)?.toInt(),
  consumedCents: (json['consumed_cents'] as num?)?.toInt(),
  packageGiftedCents: (json['package_gifted_cents'] as num?)?.toInt(),
  purchasedCents: (json['purchased_cents'] as num?)?.toInt(),
  totalCents: (json['total_cents'] as num?)?.toInt(),
  usedCents: (json['used_cents'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerUserQuotaResponseToJson(
  HandlerUserQuotaResponse instance,
) => <String, dynamic>{
  'admin_gifted_cents': instance.adminGiftedCents,
  'consumed_cents': instance.consumedCents,
  'package_gifted_cents': instance.packageGiftedCents,
  'purchased_cents': instance.purchasedCents,
  'total_cents': instance.totalCents,
  'used_cents': instance.usedCents,
};

HandlerWarehouseAdminCandidate _$HandlerWarehouseAdminCandidateFromJson(
  Map<String, dynamic> json,
) => HandlerWarehouseAdminCandidate(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  phone: json['phone'] as String?,
  warehouseCodes:
      (json['warehouse_codes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      [],
);

Map<String, dynamic> _$HandlerWarehouseAdminCandidateToJson(
  HandlerWarehouseAdminCandidate instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'phone': instance.phone,
  'warehouse_codes': instance.warehouseCodes,
};

HandlerWarehouseAdminItem _$HandlerWarehouseAdminItemFromJson(
  Map<String, dynamic> json,
) => HandlerWarehouseAdminItem(
  addressDetail: json['address_detail'] as String?,
  code: json['code'] as String?,
  createdAt: json['created_at'] as String?,
  id: (json['id'] as num?)?.toInt(),
  managers:
      (json['managers'] as List<dynamic>?)
          ?.map(
            (e) =>
                HandlerWarehouseManagerItem.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
  name: json['name'] as String?,
  regionCode: json['region_code'] as String?,
  remark: json['remark'] as String?,
  status: handlerWarehouseAdminItemStatusNullableFromJson(json['status']),
);

Map<String, dynamic> _$HandlerWarehouseAdminItemToJson(
  HandlerWarehouseAdminItem instance,
) => <String, dynamic>{
  'address_detail': instance.addressDetail,
  'code': instance.code,
  'created_at': instance.createdAt,
  'id': instance.id,
  'managers': instance.managers?.map((e) => e.toJson()).toList(),
  'name': instance.name,
  'region_code': instance.regionCode,
  'remark': instance.remark,
  'status': handlerWarehouseAdminItemStatusNullableToJson(instance.status),
};

HandlerWarehouseAdminListResponse _$HandlerWarehouseAdminListResponseFromJson(
  Map<String, dynamic> json,
) => HandlerWarehouseAdminListResponse(
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) =>
                HandlerWarehouseAdminItem.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
  total: (json['total'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerWarehouseAdminListResponseToJson(
  HandlerWarehouseAdminListResponse instance,
) => <String, dynamic>{
  'items': instance.items?.map((e) => e.toJson()).toList(),
  'total': instance.total,
};

HandlerWarehouseAdminSaveRequest _$HandlerWarehouseAdminSaveRequestFromJson(
  Map<String, dynamic> json,
) => HandlerWarehouseAdminSaveRequest(
  addressDetail: json['address_detail'] as String,
  adminIds:
      (json['admin_ids'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      [],
  name: json['name'] as String,
  regionCode: json['region_code'] as String,
  remark: json['remark'] as String?,
);

Map<String, dynamic> _$HandlerWarehouseAdminSaveRequestToJson(
  HandlerWarehouseAdminSaveRequest instance,
) => <String, dynamic>{
  'address_detail': instance.addressDetail,
  'admin_ids': instance.adminIds,
  'name': instance.name,
  'region_code': instance.regionCode,
  'remark': instance.remark,
};

HandlerWarehouseAdminStatusRequest _$HandlerWarehouseAdminStatusRequestFromJson(
  Map<String, dynamic> json,
) => HandlerWarehouseAdminStatusRequest(
  status: handlerWarehouseAdminStatusRequestStatusFromJson(json['status']),
);

Map<String, dynamic> _$HandlerWarehouseAdminStatusRequestToJson(
  HandlerWarehouseAdminStatusRequest instance,
) => <String, dynamic>{
  'status': handlerWarehouseAdminStatusRequestStatusToJson(instance.status),
};

HandlerWarehouseAdminsResponse _$HandlerWarehouseAdminsResponseFromJson(
  Map<String, dynamic> json,
) => HandlerWarehouseAdminsResponse(
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) => HandlerWarehouseAdminCandidate.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      [],
);

Map<String, dynamic> _$HandlerWarehouseAdminsResponseToJson(
  HandlerWarehouseAdminsResponse instance,
) => <String, dynamic>{
  'items': instance.items?.map((e) => e.toJson()).toList(),
};

HandlerWarehouseManagerItem _$HandlerWarehouseManagerItemFromJson(
  Map<String, dynamic> json,
) => HandlerWarehouseManagerItem(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  phone: json['phone'] as String?,
);

Map<String, dynamic> _$HandlerWarehouseManagerItemToJson(
  HandlerWarehouseManagerItem instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'phone': instance.phone,
};

HandlerWasteWaterAdminDaily _$HandlerWasteWaterAdminDailyFromJson(
  Map<String, dynamic> json,
) => HandlerWasteWaterAdminDaily(
  date: json['date'] as String?,
  usageMilli: (json['usage_milli'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerWasteWaterAdminDailyToJson(
  HandlerWasteWaterAdminDaily instance,
) => <String, dynamic>{
  'date': instance.date,
  'usage_milli': instance.usageMilli,
};

HandlerWasteWaterAdminItem _$HandlerWasteWaterAdminItemFromJson(
  Map<String, dynamic> json,
) => HandlerWasteWaterAdminItem(
  cumulativeUsageMilli: (json['cumulative_usage_milli'] as num?)?.toInt(),
  deviceId: (json['device_id'] as num?)?.toInt(),
  deviceModel: json['device_model'] as String?,
  deviceName: json['device_name'] as String?,
  deviceRegion: json['device_region'] as String?,
  deviceRegionCode: json['device_region_code'] as String?,
  deviceSn: json['device_sn'] as String?,
  id: (json['id'] as num?)?.toInt(),
  lastReportAt: json['last_report_at'] as String?,
  latestUsageMilli: (json['latest_usage_milli'] as num?)?.toInt(),
  rangeUsageMilli: (json['range_usage_milli'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerWasteWaterAdminItemToJson(
  HandlerWasteWaterAdminItem instance,
) => <String, dynamic>{
  'cumulative_usage_milli': instance.cumulativeUsageMilli,
  'device_id': instance.deviceId,
  'device_model': instance.deviceModel,
  'device_name': instance.deviceName,
  'device_region': instance.deviceRegion,
  'device_region_code': instance.deviceRegionCode,
  'device_sn': instance.deviceSn,
  'id': instance.id,
  'last_report_at': instance.lastReportAt,
  'latest_usage_milli': instance.latestUsageMilli,
  'range_usage_milli': instance.rangeUsageMilli,
};

HandlerWasteWaterAdminListResponse _$HandlerWasteWaterAdminListResponseFromJson(
  Map<String, dynamic> json,
) => HandlerWasteWaterAdminListResponse(
  daily:
      (json['daily'] as List<dynamic>?)
          ?.map(
            (e) =>
                HandlerWasteWaterAdminDaily.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) =>
                HandlerWasteWaterAdminItem.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
  summary: json['summary'] == null
      ? null
      : HandlerWasteWaterAdminSummary.fromJson(
          json['summary'] as Map<String, dynamic>,
        ),
  total: (json['total'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerWasteWaterAdminListResponseToJson(
  HandlerWasteWaterAdminListResponse instance,
) => <String, dynamic>{
  'daily': instance.daily?.map((e) => e.toJson()).toList(),
  'items': instance.items?.map((e) => e.toJson()).toList(),
  'summary': instance.summary?.toJson(),
  'total': instance.total,
};

HandlerWasteWaterAdminReadingItem _$HandlerWasteWaterAdminReadingItemFromJson(
  Map<String, dynamic> json,
) => HandlerWasteWaterAdminReadingItem(
  id: (json['id'] as num?)?.toInt(),
  readAt: json['read_at'] as String?,
  reportId: json['report_id'] as String?,
  sessionGeneration: (json['session_generation'] as num?)?.toInt(),
  sessionId: (json['session_id'] as num?)?.toInt(),
  sessionPulses: (json['session_pulses'] as num?)?.toInt(),
  sessionPulsesPerLiter: (json['session_pulses_per_liter'] as num?)?.toInt(),
  sessionRawMilli: (json['session_raw_milli'] as num?)?.toInt(),
  sessionState: (json['session_state'] as num?)?.toInt(),
  sessionValid: json['session_valid'] as bool?,
  usageMilli: (json['usage_milli'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerWasteWaterAdminReadingItemToJson(
  HandlerWasteWaterAdminReadingItem instance,
) => <String, dynamic>{
  'id': instance.id,
  'read_at': instance.readAt,
  'report_id': instance.reportId,
  'session_generation': instance.sessionGeneration,
  'session_id': instance.sessionId,
  'session_pulses': instance.sessionPulses,
  'session_pulses_per_liter': instance.sessionPulsesPerLiter,
  'session_raw_milli': instance.sessionRawMilli,
  'session_state': instance.sessionState,
  'session_valid': instance.sessionValid,
  'usage_milli': instance.usageMilli,
};

HandlerWasteWaterAdminReadingListResponse
_$HandlerWasteWaterAdminReadingListResponseFromJson(
  Map<String, dynamic> json,
) => HandlerWasteWaterAdminReadingListResponse(
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) => HandlerWasteWaterAdminReadingItem.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      [],
  meter: json['meter'] == null
      ? null
      : HandlerWasteWaterAdminItem.fromJson(
          json['meter'] as Map<String, dynamic>,
        ),
  total: (json['total'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerWasteWaterAdminReadingListResponseToJson(
  HandlerWasteWaterAdminReadingListResponse instance,
) => <String, dynamic>{
  'items': instance.items?.map((e) => e.toJson()).toList(),
  'meter': instance.meter?.toJson(),
  'total': instance.total,
};

HandlerWasteWaterAdminSummary _$HandlerWasteWaterAdminSummaryFromJson(
  Map<String, dynamic> json,
) => HandlerWasteWaterAdminSummary(
  usageMilli: (json['usage_milli'] as num?)?.toInt(),
);

Map<String, dynamic> _$HandlerWasteWaterAdminSummaryToJson(
  HandlerWasteWaterAdminSummary instance,
) => <String, dynamic>{'usage_milli': instance.usageMilli};
