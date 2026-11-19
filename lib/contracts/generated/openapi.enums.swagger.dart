// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';

enum HandlerAftersaleAdminApplyRequestType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('partial_refund')
  partialRefund('partial_refund'),
  @JsonValue('quota_refund')
  quotaRefund('quota_refund'),
  @JsonValue('full_refund')
  fullRefund('full_refund');

  final String? value;

  const HandlerAftersaleAdminApplyRequestType(this.value);
}

enum HandlerAftersaleItemApplicantType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('staff')
  staff('staff'),
  @JsonValue('user')
  user('user'),
  @JsonValue('system')
  system('system'),
  @JsonValue('unknown')
  unknown('unknown');

  final String? value;

  const HandlerAftersaleItemApplicantType(this.value);
}

enum HandlerAftersaleItemOrderType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('water')
  water('water'),
  @JsonValue('package')
  package('package');

  final String? value;

  const HandlerAftersaleItemOrderType(this.value);
}

enum HandlerAftersaleItemStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('pending')
  pending('pending'),
  @JsonValue('rejected')
  rejected('rejected'),
  @JsonValue('refunding')
  refunding('refunding'),
  @JsonValue('completed')
  completed('completed'),
  @JsonValue('failed')
  failed('failed');

  final String? value;

  const HandlerAftersaleItemStatus(this.value);
}

enum HandlerAftersaleItemType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('partial_refund')
  partialRefund('partial_refund'),
  @JsonValue('quota_refund')
  quotaRefund('quota_refund'),
  @JsonValue('full_refund')
  fullRefund('full_refund');

  final String? value;

  const HandlerAftersaleItemType(this.value);
}

enum HandlerAftersaleOrderInfoDispenseResult {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('none')
  none('none'),
  @JsonValue('full')
  full('full'),
  @JsonValue('partial')
  partial('partial');

  final String? value;

  const HandlerAftersaleOrderInfoDispenseResult(this.value);
}

enum HandlerAftersaleOrderInfoPaymentMethod {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('line_pay')
  linePay('line_pay'),
  @JsonValue('alipay')
  alipay('alipay'),
  @JsonValue('wechat_pay')
  wechatPay('wechat_pay'),
  @JsonValue('iccard')
  iccard('iccard'),
  @JsonValue('free')
  free('free'),
  @JsonValue('quota')
  quota('quota');

  final String? value;

  const HandlerAftersaleOrderInfoPaymentMethod(this.value);
}

enum HandlerAftersaleOrderInfoStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('pending_payment')
  pendingPayment('pending_payment'),
  @JsonValue('paid_dispensing')
  paidDispensing('paid_dispensing'),
  @JsonValue('result_confirming')
  resultConfirming('result_confirming'),
  @JsonValue('completed')
  completed('completed'),
  @JsonValue('cancelled')
  cancelled('cancelled');

  final String? value;

  const HandlerAftersaleOrderInfoStatus(this.value);
}

enum HandlerAftersalePackageOrderInfoPaymentMethod {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('line_pay')
  linePay('line_pay'),
  @JsonValue('alipay')
  alipay('alipay'),
  @JsonValue('wechat_pay')
  wechatPay('wechat_pay');

  final String? value;

  const HandlerAftersalePackageOrderInfoPaymentMethod(this.value);
}

enum HandlerAftersalePackageOrderInfoRefundStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('none')
  none('none'),
  @JsonValue('pending')
  pending('pending'),
  @JsonValue('succeeded')
  succeeded('succeeded'),
  @JsonValue('failed')
  failed('failed');

  final String? value;

  const HandlerAftersalePackageOrderInfoRefundStatus(this.value);
}

enum HandlerAftersalePackageOrderInfoStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('pending_payment')
  pendingPayment('pending_payment'),
  @JsonValue('paid')
  paid('paid'),
  @JsonValue('refunding')
  refunding('refunding'),
  @JsonValue('refunded')
  refunded('refunded'),
  @JsonValue('cancelled')
  cancelled('cancelled');

  final String? value;

  const HandlerAftersalePackageOrderInfoStatus(this.value);
}

enum HandlerAlarmAdminHandleFilterStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('active')
  active('active'),
  @JsonValue('recovered')
  recovered('recovered'),
  @JsonValue('handled')
  handled('handled'),
  @JsonValue('ignored')
  ignored('ignored');

  final String? value;

  const HandlerAlarmAdminHandleFilterStatus(this.value);
}

enum HandlerAlarmAdminHandleFilterType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('offline')
  offline('offline'),
  @JsonValue('no_external_water')
  noExternalWater('no_external_water'),
  @JsonValue('flow_meter_fault')
  flowMeterFault('flow_meter_fault'),
  @JsonValue('board_offline')
  boardOffline('board_offline'),
  @JsonValue('tds_exceeds')
  tdsExceeds('tds_exceeds'),
  @JsonValue('tds_mineral_exceeds')
  tdsMineralExceeds('tds_mineral_exceeds'),
  @JsonValue('low_water_level')
  lowWaterLevel('low_water_level'),
  @JsonValue('water_level_abnormal')
  waterLevelAbnormal('water_level_abnormal'),
  @JsonValue('water_meter_read_failure')
  waterMeterReadFailure('water_meter_read_failure'),
  @JsonValue('electricity_meter_read_failure')
  electricityMeterReadFailure('electricity_meter_read_failure'),
  @JsonValue('iccard_sync_failure')
  iccardSyncFailure('iccard_sync_failure'),
  @JsonValue('filter_expiring')
  filterExpiring('filter_expiring'),
  @JsonValue('filter_expired')
  filterExpired('filter_expired');

  final String? value;

  const HandlerAlarmAdminHandleFilterType(this.value);
}

enum HandlerAlarmAdminHandleRequestStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('handled')
  handled('handled'),
  @JsonValue('ignored')
  ignored('ignored');

  final String? value;

  const HandlerAlarmAdminHandleRequestStatus(this.value);
}

enum HandlerAlarmAdminItemStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('active')
  active('active'),
  @JsonValue('recovered')
  recovered('recovered'),
  @JsonValue('handled')
  handled('handled'),
  @JsonValue('ignored')
  ignored('ignored');

  final String? value;

  const HandlerAlarmAdminItemStatus(this.value);
}

enum HandlerAlarmAdminRuleItemType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('offline')
  offline('offline'),
  @JsonValue('no_external_water')
  noExternalWater('no_external_water'),
  @JsonValue('flow_meter_fault')
  flowMeterFault('flow_meter_fault'),
  @JsonValue('board_offline')
  boardOffline('board_offline'),
  @JsonValue('tds_exceeds')
  tdsExceeds('tds_exceeds'),
  @JsonValue('tds_mineral_exceeds')
  tdsMineralExceeds('tds_mineral_exceeds'),
  @JsonValue('low_water_level')
  lowWaterLevel('low_water_level'),
  @JsonValue('water_level_abnormal')
  waterLevelAbnormal('water_level_abnormal'),
  @JsonValue('water_meter_read_failure')
  waterMeterReadFailure('water_meter_read_failure'),
  @JsonValue('electricity_meter_read_failure')
  electricityMeterReadFailure('electricity_meter_read_failure'),
  @JsonValue('iccard_sync_failure')
  iccardSyncFailure('iccard_sync_failure'),
  @JsonValue('filter_expiring')
  filterExpiring('filter_expiring'),
  @JsonValue('filter_expired')
  filterExpired('filter_expired');

  final String? value;

  const HandlerAlarmAdminRuleItemType(this.value);
}

enum HandlerAssetCodeAdminGenerateRequestAssetType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('cabinet')
  cabinet('cabinet'),
  @JsonValue('screen')
  screen('screen'),
  @JsonValue('filter')
  filter('filter'),
  @JsonValue('filter_box')
  filterBox('filter_box'),
  @JsonValue('water_board')
  waterBoard('water_board'),
  @JsonValue('android_board')
  androidBoard('android_board');

  final String? value;

  const HandlerAssetCodeAdminGenerateRequestAssetType(this.value);
}

enum HandlerAssetCodeAdminItemStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('unused')
  unused('unused'),
  @JsonValue('used')
  used('used');

  final String? value;

  const HandlerAssetCodeAdminItemStatus(this.value);
}

enum HandlerBoardAdminHealthItemName {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('postgres')
  postgres('postgres'),
  @JsonValue('redis')
  redis('redis'),
  @JsonValue('clickhouse')
  clickhouse('clickhouse'),
  @JsonValue('mqtt')
  mqtt('mqtt');

  final String? value;

  const HandlerBoardAdminHealthItemName(this.value);
}

enum HandlerBoardAdminHealthResponseStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('normal')
  normal('normal'),
  @JsonValue('degraded')
  degraded('degraded');

  final String? value;

  const HandlerBoardAdminHealthResponseStatus(this.value);
}

enum HandlerBoardAdminStatusItemStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('online')
  online('online'),
  @JsonValue('maintenance')
  maintenance('maintenance'),
  @JsonValue('offline')
  offline('offline');

  final String? value;

  const HandlerBoardAdminStatusItemStatus(this.value);
}

enum HandlerBoardAdminTickerItemType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('device_added')
  deviceAdded('device_added'),
  @JsonValue('device_growth')
  deviceGrowth('device_growth'),
  @JsonValue('order_milestone')
  orderMilestone('order_milestone');

  final String? value;

  const HandlerBoardAdminTickerItemType(this.value);
}

enum HandlerConfigAdminFilterItemModule {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('pure')
  pure('pure'),
  @JsonValue('mineral')
  mineral('mineral');

  final String? value;

  const HandlerConfigAdminFilterItemModule(this.value);
}

enum HandlerConfigAdminFilterLifespanModule {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('pure')
  pure('pure'),
  @JsonValue('mineral')
  mineral('mineral');

  final String? value;

  const HandlerConfigAdminFilterLifespanModule(this.value);
}

enum HandlerConfigAdminStorageRequestDriver {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('local')
  local('local');

  final String? value;

  const HandlerConfigAdminStorageRequestDriver(this.value);
}

enum HandlerConfigAdminStorageResponseDriver {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('local')
  local('local');

  final String? value;

  const HandlerConfigAdminStorageResponseDriver(this.value);
}

enum HandlerConfigAdminTankStatusRequestStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('enabled')
  enabled('enabled'),
  @JsonValue('disabled')
  disabled('disabled');

  final String? value;

  const HandlerConfigAdminTankStatusRequestStatus(this.value);
}

enum HandlerDeviceAdminCreateRequestOwnership {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('self')
  self('self'),
  @JsonValue('rental')
  rental('rental');

  final String? value;

  const HandlerDeviceAdminCreateRequestOwnership(this.value);
}

enum HandlerDeviceAdminFilterModule {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('pure')
  pure('pure'),
  @JsonValue('mineral')
  mineral('mineral');

  final String? value;

  const HandlerDeviceAdminFilterModule(this.value);
}

enum HandlerDeviceAdminFilterPositionModule {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('pure')
  pure('pure'),
  @JsonValue('mineral')
  mineral('mineral');

  final String? value;

  const HandlerDeviceAdminFilterPositionModule(this.value);
}

enum HandlerDeviceAdminRelayCode {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('inlet_valve')
  inletValve('inlet_valve'),
  @JsonValue('flush_valve')
  flushValve('flush_valve'),
  @JsonValue('waste_valve')
  wasteValve('waste_valve'),
  @JsonValue('mineral_uv')
  mineralUv('mineral_uv'),
  @JsonValue('ozone')
  ozone('ozone'),
  @JsonValue('pure_valve')
  pureValve('pure_valve'),
  @JsonValue('mineral_valve')
  mineralValve('mineral_valve'),
  @JsonValue('fill_light')
  fillLight('fill_light'),
  @JsonValue('pure_uv')
  pureUv('pure_uv'),
  @JsonValue('booster_pump')
  boosterPump('booster_pump'),
  @JsonValue('filling_pump')
  fillingPump('filling_pump'),
  @JsonValue('mineral_pump')
  mineralPump('mineral_pump');

  final String? value;

  const HandlerDeviceAdminRelayCode(this.value);
}

enum HandlerDeviceAdminResponseNetworkStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('online')
  online('online'),
  @JsonValue('offline')
  offline('offline');

  final String? value;

  const HandlerDeviceAdminResponseNetworkStatus(this.value);
}

enum HandlerDeviceAdminResponseRunStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('standby')
  standby('standby'),
  @JsonValue('dispensing')
  dispensing('dispensing'),
  @JsonValue('maintenance')
  maintenance('maintenance'),
  @JsonValue('powered_off')
  poweredOff('powered_off');

  final String? value;

  const HandlerDeviceAdminResponseRunStatus(this.value);
}

enum HandlerDeviceAdminResponseTankState {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('empty')
  empty('empty'),
  @JsonValue('normal')
  normal('normal'),
  @JsonValue('full')
  full('full');

  final String? value;

  const HandlerDeviceAdminResponseTankState(this.value);
}

enum HandlerDeviceAdminResponseWaterLevel {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('high')
  high('high'),
  @JsonValue('medium')
  medium('medium'),
  @JsonValue('low')
  low('low');

  final String? value;

  const HandlerDeviceAdminResponseWaterLevel(this.value);
}

enum HandlerDeviceAdminSaveRequestOwnership {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('self')
  self('self'),
  @JsonValue('rental')
  rental('rental');

  final String? value;

  const HandlerDeviceAdminSaveRequestOwnership(this.value);
}

enum HandlerDeviceCommandAdminControlItemBlocker {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('offline')
  offline('offline'),
  @JsonValue('busy')
  busy('busy'),
  @JsonValue('powered_off')
  poweredOff('powered_off'),
  @JsonValue('not_powered_off')
  notPoweredOff('not_powered_off'),
  @JsonValue('maintenance')
  maintenance('maintenance'),
  @JsonValue('not_sellable')
  notSellable('not_sellable');

  final String? value;

  const HandlerDeviceCommandAdminControlItemBlocker(this.value);
}

enum HandlerDeviceCommandAdminControlItemKey {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('power_off')
  powerOff('power_off'),
  @JsonValue('power_on')
  powerOn('power_on'),
  @JsonValue('reboot')
  reboot('reboot'),
  @JsonValue('dispense')
  dispense('dispense'),
  @JsonValue('maintenance')
  maintenance('maintenance'),
  @JsonValue('sale')
  sale('sale'),
  @JsonValue('water_making')
  waterMaking('water_making'),
  @JsonValue('free_dispense')
  freeDispense('free_dispense'),
  @JsonValue('factory_reset')
  factoryReset('factory_reset');

  final String? value;

  const HandlerDeviceCommandAdminControlItemKey(this.value);
}

enum HandlerDeviceCommandAdminControlsResponseRunStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('standby')
  standby('standby'),
  @JsonValue('dispensing')
  dispensing('dispensing'),
  @JsonValue('maintenance')
  maintenance('maintenance'),
  @JsonValue('powered_off')
  poweredOff('powered_off');

  final String? value;

  const HandlerDeviceCommandAdminControlsResponseRunStatus(this.value);
}

enum HandlerDeviceCommandAdminDispenseReportRequestEvent {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('paused')
  paused('paused'),
  @JsonValue('resumed')
  resumed('resumed'),
  @JsonValue('finished')
  finished('finished');

  final String? value;

  const HandlerDeviceCommandAdminDispenseReportRequestEvent(this.value);
}

enum HandlerDeviceCommandAdminDispenseRequestWaterType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('pure')
  pure('pure'),
  @JsonValue('mineral')
  mineral('mineral');

  final String? value;

  const HandlerDeviceCommandAdminDispenseRequestWaterType(this.value);
}

enum HandlerDeviceCommandAdminFilterResetModule {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('pure')
  pure('pure'),
  @JsonValue('mineral')
  mineral('mineral');

  final String? value;

  const HandlerDeviceCommandAdminFilterResetModule(this.value);
}

enum HandlerDeviceCommandAdminItemStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('pending')
  pending('pending'),
  @JsonValue('executing')
  executing('executing'),
  @JsonValue('paused')
  paused('paused'),
  @JsonValue('success')
  success('success'),
  @JsonValue('failed')
  failed('failed');

  final String? value;

  const HandlerDeviceCommandAdminItemStatus(this.value);
}

enum HandlerDeviceCommandAdminParamsFirmwareType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('mcu')
  mcu('mcu'),
  @JsonValue('modem')
  modem('modem');

  final String? value;

  const HandlerDeviceCommandAdminParamsFirmwareType(this.value);
}

enum HandlerDeviceCommandAdminParamsSection {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('server')
  server('server'),
  @JsonValue('light_lock')
  lightLock('light_lock'),
  @JsonValue('wash')
  wash('wash'),
  @JsonValue('voice')
  voice('voice'),
  @JsonValue('runtime')
  runtime('runtime'),
  @JsonValue('price')
  price('price'),
  @JsonValue('tank')
  tank('tank'),
  @JsonValue('slots')
  slots('slots'),
  @JsonValue('brightness')
  brightness('brightness'),
  @JsonValue('storage')
  storage('storage');

  final String? value;

  const HandlerDeviceCommandAdminParamsSection(this.value);
}

enum HandlerDeviceCommandAdminParamsUpgradeType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('mcu_online')
  mcuOnline('mcu_online'),
  @JsonValue('mcu_rollback')
  mcuRollback('mcu_rollback'),
  @JsonValue('modem')
  modem('modem');

  final String? value;

  const HandlerDeviceCommandAdminParamsUpgradeType(this.value);
}

enum HandlerDeviceCommandAdminParamsWaterType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('pure')
  pure('pure'),
  @JsonValue('mineral')
  mineral('mineral');

  final String? value;

  const HandlerDeviceCommandAdminParamsWaterType(this.value);
}

enum HandlerFirmwareAdminItemType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('mcu')
  mcu('mcu'),
  @JsonValue('modem')
  modem('modem');

  final String? value;

  const HandlerFirmwareAdminItemType(this.value);
}

enum HandlerFirmwareTaskAdminCreateRequestUpgradeType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('mcu_online')
  mcuOnline('mcu_online'),
  @JsonValue('mcu_rollback')
  mcuRollback('mcu_rollback'),
  @JsonValue('modem')
  modem('modem');

  final String? value;

  const HandlerFirmwareTaskAdminCreateRequestUpgradeType(this.value);
}

enum HandlerFirmwareTaskAdminItemFirmwareType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('mcu')
  mcu('mcu'),
  @JsonValue('modem')
  modem('modem');

  final String? value;

  const HandlerFirmwareTaskAdminItemFirmwareType(this.value);
}

enum HandlerFirmwareTaskAdminItemStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('pending')
  pending('pending'),
  @JsonValue('upgrading')
  upgrading('upgrading'),
  @JsonValue('success')
  success('success'),
  @JsonValue('failed')
  failed('failed'),
  @JsonValue('cancelled')
  cancelled('cancelled');

  final String? value;

  const HandlerFirmwareTaskAdminItemStatus(this.value);
}

enum HandlerFirmwareTaskAdminItemUpgradeType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('mcu_online')
  mcuOnline('mcu_online'),
  @JsonValue('mcu_rollback')
  mcuRollback('mcu_rollback'),
  @JsonValue('modem')
  modem('modem');

  final String? value;

  const HandlerFirmwareTaskAdminItemUpgradeType(this.value);
}

enum HandlerFirmwareTaskAdminResultRequestResult {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('success')
  success('success'),
  @JsonValue('failed')
  failed('failed');

  final String? value;

  const HandlerFirmwareTaskAdminResultRequestResult(this.value);
}

enum HandlerICCardAdminDetailResponseStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('enabled')
  enabled('enabled'),
  @JsonValue('disabled')
  disabled('disabled'),
  @JsonValue('pending_match')
  pendingMatch('pending_match');

  final String? value;

  const HandlerICCardAdminDetailResponseStatus(this.value);
}

enum HandlerICCardAdminItemStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('enabled')
  enabled('enabled'),
  @JsonValue('disabled')
  disabled('disabled'),
  @JsonValue('pending_match')
  pendingMatch('pending_match');

  final String? value;

  const HandlerICCardAdminItemStatus(this.value);
}

enum HandlerICCardAdminStatusRequestStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('enabled')
  enabled('enabled'),
  @JsonValue('disabled')
  disabled('disabled');

  final String? value;

  const HandlerICCardAdminStatusRequestStatus(this.value);
}

enum HandlerICCardBatchDetailResponseType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('generate')
  generate('generate'),
  @JsonValue('match')
  match('match'),
  @JsonValue('import')
  $import('import'),
  @JsonValue('issue')
  issue('issue'),
  @JsonValue('recharge')
  recharge('recharge'),
  @JsonValue('deduct')
  deduct('deduct'),
  @JsonValue('disable')
  disable('disable'),
  @JsonValue('enable')
  enable('enable');

  final String? value;

  const HandlerICCardBatchDetailResponseType(this.value);
}

enum HandlerICCardBatchItemRecordStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('pending')
  pending('pending'),
  @JsonValue('success')
  success('success'),
  @JsonValue('failed')
  failed('failed');

  final String? value;

  const HandlerICCardBatchItemRecordStatus(this.value);
}

enum HandlerICCardBatchResponseType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('generate')
  generate('generate'),
  @JsonValue('match')
  match('match'),
  @JsonValue('import')
  $import('import'),
  @JsonValue('issue')
  issue('issue'),
  @JsonValue('recharge')
  recharge('recharge'),
  @JsonValue('deduct')
  deduct('deduct'),
  @JsonValue('disable')
  disable('disable'),
  @JsonValue('enable')
  enable('enable');

  final String? value;

  const HandlerICCardBatchResponseType(this.value);
}

enum HandlerICCardBatchResultResponseType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('generate')
  generate('generate'),
  @JsonValue('match')
  match('match'),
  @JsonValue('import')
  $import('import'),
  @JsonValue('issue')
  issue('issue'),
  @JsonValue('recharge')
  recharge('recharge'),
  @JsonValue('deduct')
  deduct('deduct'),
  @JsonValue('disable')
  disable('disable'),
  @JsonValue('enable')
  enable('enable');

  final String? value;

  const HandlerICCardBatchResultResponseType(this.value);
}

enum HandlerICCardBatchStatusRequestStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('enabled')
  enabled('enabled'),
  @JsonValue('disabled')
  disabled('disabled');

  final String? value;

  const HandlerICCardBatchStatusRequestStatus(this.value);
}

enum HandlerICCardOfflineItemRequestWaterType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('pure')
  pure('pure'),
  @JsonValue('mineral')
  mineral('mineral');

  final String? value;

  const HandlerICCardOfflineItemRequestWaterType(this.value);
}

enum HandlerICCardOfflineResponseStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('applied')
  applied('applied'),
  @JsonValue('reversed')
  reversed('reversed'),
  @JsonValue('rejected')
  rejected('rejected');

  final String? value;

  const HandlerICCardOfflineResponseStatus(this.value);
}

enum HandlerICCardOfflineResultResponseStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('applied')
  applied('applied'),
  @JsonValue('reversed')
  reversed('reversed'),
  @JsonValue('rejected')
  rejected('rejected'),
  @JsonValue('duplicated')
  duplicated('duplicated');

  final String? value;

  const HandlerICCardOfflineResultResponseStatus(this.value);
}

enum HandlerICCardRechargeOrderRequestMethod {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('line_pay')
  linePay('line_pay'),
  @JsonValue('alipay')
  alipay('alipay'),
  @JsonValue('wechat_pay')
  wechatPay('wechat_pay');

  final String? value;

  const HandlerICCardRechargeOrderRequestMethod(this.value);
}

enum HandlerICCardRechargeOrderResponsePaymentMethod {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('line_pay')
  linePay('line_pay'),
  @JsonValue('alipay')
  alipay('alipay'),
  @JsonValue('wechat_pay')
  wechatPay('wechat_pay');

  final String? value;

  const HandlerICCardRechargeOrderResponsePaymentMethod(this.value);
}

enum HandlerICCardRechargeOrderResponseRefundStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('none')
  none('none'),
  @JsonValue('pending')
  pending('pending'),
  @JsonValue('succeeded')
  succeeded('succeeded'),
  @JsonValue('failed')
  failed('failed');

  final String? value;

  const HandlerICCardRechargeOrderResponseRefundStatus(this.value);
}

enum HandlerICCardRechargeOrderResponseStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('pending_payment')
  pendingPayment('pending_payment'),
  @JsonValue('paid')
  paid('paid'),
  @JsonValue('cancelled')
  cancelled('cancelled');

  final String? value;

  const HandlerICCardRechargeOrderResponseStatus(this.value);
}

enum HandlerICCardSyncResponseStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('pending')
  pending('pending'),
  @JsonValue('delivered')
  delivered('delivered'),
  @JsonValue('failed')
  failed('failed'),
  @JsonValue('skipped')
  skipped('skipped');

  final String? value;

  const HandlerICCardSyncResponseStatus(this.value);
}

enum HandlerICCardSyncResultRequestStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('delivered')
  delivered('delivered'),
  @JsonValue('failed')
  failed('failed');

  final String? value;

  const HandlerICCardSyncResultRequestStatus(this.value);
}

enum HandlerICCardSyncResultResponseStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('pending')
  pending('pending'),
  @JsonValue('delivered')
  delivered('delivered'),
  @JsonValue('failed')
  failed('failed'),
  @JsonValue('skipped')
  skipped('skipped');

  final String? value;

  const HandlerICCardSyncResultResponseStatus(this.value);
}

enum HandlerKioskRecordingSegmentState {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('ready')
  ready('ready'),
  @JsonValue('deleted')
  deleted('deleted');

  final String? value;

  const HandlerKioskRecordingSegmentState(this.value);
}

enum HandlerMeterAdminItemReadStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('normal')
  normal('normal'),
  @JsonValue('abnormal')
  abnormal('abnormal');

  final String? value;

  const HandlerMeterAdminItemReadStatus(this.value);
}

enum HandlerMeterAdminItemValveStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('open')
  open('open'),
  @JsonValue('closed')
  closed('closed'),
  @JsonValue('unknown')
  unknown('unknown');

  final String? value;

  const HandlerMeterAdminItemValveStatus(this.value);
}

enum HandlerMeterAdminReadingCreateRequestType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('water')
  water('water'),
  @JsonValue('electricity')
  electricity('electricity');

  final String? value;

  const HandlerMeterAdminReadingCreateRequestType(this.value);
}

enum HandlerMeterAdminReadingCreateRequestValveStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('open')
  open('open'),
  @JsonValue('closed')
  closed('closed'),
  @JsonValue('unknown')
  unknown('unknown');

  final String? value;

  const HandlerMeterAdminReadingCreateRequestValveStatus(this.value);
}

enum HandlerMeterAdminRebaseRequestReason {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('meter_replaced')
  meterReplaced('meter_replaced'),
  @JsonValue('manual_calibration')
  manualCalibration('manual_calibration');

  final String? value;

  const HandlerMeterAdminRebaseRequestReason(this.value);
}

enum HandlerMockPayCreateRequestChannel {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('line_pay')
  linePay('line_pay'),
  @JsonValue('alipay')
  alipay('alipay'),
  @JsonValue('wechat_pay')
  wechatPay('wechat_pay');

  final String? value;

  const HandlerMockPayCreateRequestChannel(this.value);
}

enum HandlerMockPayRefundRecordState {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('pending')
  pending('pending'),
  @JsonValue('succeeded')
  succeeded('succeeded'),
  @JsonValue('failed')
  failed('failed');

  final String? value;

  const HandlerMockPayRefundRecordState(this.value);
}

enum HandlerMockPayTradeResponseState {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('pending')
  pending('pending'),
  @JsonValue('succeeded')
  succeeded('succeeded'),
  @JsonValue('failed')
  failed('failed'),
  @JsonValue('closed')
  closed('closed');

  final String? value;

  const HandlerMockPayTradeResponseState(this.value);
}

enum HandlerOrderAdminDetailResponseChannelPaymentMethod {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('line_pay')
  linePay('line_pay'),
  @JsonValue('alipay')
  alipay('alipay'),
  @JsonValue('wechat_pay')
  wechatPay('wechat_pay');

  final String? value;

  const HandlerOrderAdminDetailResponseChannelPaymentMethod(this.value);
}

enum HandlerOrderAdminDetailResponseDispenseEndReason {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('none')
  none('none'),
  @JsonValue('user_stop')
  userStop('user_stop'),
  @JsonValue('kiosk_finish')
  kioskFinish('kiosk_finish'),
  @JsonValue('pause_timeout')
  pauseTimeout('pause_timeout'),
  @JsonValue('device_fault')
  deviceFault('device_fault'),
  @JsonValue('manual_confirm')
  manualConfirm('manual_confirm'),
  @JsonValue('user_cancel')
  userCancel('user_cancel'),
  @JsonValue('bucket_timeout')
  bucketTimeout('bucket_timeout'),
  @JsonValue('no_flow')
  noFlow('no_flow');

  final String? value;

  const HandlerOrderAdminDetailResponseDispenseEndReason(this.value);
}

enum HandlerOrderAdminDetailResponseDispenseResult {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('none')
  none('none'),
  @JsonValue('full')
  full('full'),
  @JsonValue('partial')
  partial('partial');

  final String? value;

  const HandlerOrderAdminDetailResponseDispenseResult(this.value);
}

enum HandlerOrderAdminDetailResponseDisplayStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('completed')
  completed('completed'),
  @JsonValue('processing')
  processing('processing'),
  @JsonValue('cancelled')
  cancelled('cancelled');

  final String? value;

  const HandlerOrderAdminDetailResponseDisplayStatus(this.value);
}

enum HandlerOrderAdminDetailResponsePaymentMethod {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('line_pay')
  linePay('line_pay'),
  @JsonValue('alipay')
  alipay('alipay'),
  @JsonValue('wechat_pay')
  wechatPay('wechat_pay'),
  @JsonValue('iccard')
  iccard('iccard'),
  @JsonValue('free')
  free('free'),
  @JsonValue('quota')
  quota('quota');

  final String? value;

  const HandlerOrderAdminDetailResponsePaymentMethod(this.value);
}

enum HandlerOrderAdminDetailResponseRefundProgress {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('none')
  none('none'),
  @JsonValue('pending')
  pending('pending'),
  @JsonValue('failed')
  failed('failed'),
  @JsonValue('succeeded')
  succeeded('succeeded');

  final String? value;

  const HandlerOrderAdminDetailResponseRefundProgress(this.value);
}

enum HandlerOrderAdminDetailResponseRefundStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('none')
  none('none'),
  @JsonValue('pending')
  pending('pending'),
  @JsonValue('succeeded')
  succeeded('succeeded'),
  @JsonValue('failed')
  failed('failed');

  final String? value;

  const HandlerOrderAdminDetailResponseRefundStatus(this.value);
}

enum HandlerOrderAdminDetailResponseStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('pending_payment')
  pendingPayment('pending_payment'),
  @JsonValue('paid_dispensing')
  paidDispensing('paid_dispensing'),
  @JsonValue('result_confirming')
  resultConfirming('result_confirming'),
  @JsonValue('completed')
  completed('completed'),
  @JsonValue('cancelled')
  cancelled('cancelled');

  final String? value;

  const HandlerOrderAdminDetailResponseStatus(this.value);
}

enum HandlerOrderAdminDetailResponseTopupKind {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('')
  $null(''),
  @JsonValue('iccard')
  iccard('iccard'),
  @JsonValue('quota')
  quota('quota');

  final String? value;

  const HandlerOrderAdminDetailResponseTopupKind(this.value);
}

enum HandlerOrderAdminItemDispenseEndReason {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('none')
  none('none'),
  @JsonValue('user_stop')
  userStop('user_stop'),
  @JsonValue('kiosk_finish')
  kioskFinish('kiosk_finish'),
  @JsonValue('pause_timeout')
  pauseTimeout('pause_timeout'),
  @JsonValue('device_fault')
  deviceFault('device_fault'),
  @JsonValue('manual_confirm')
  manualConfirm('manual_confirm'),
  @JsonValue('user_cancel')
  userCancel('user_cancel'),
  @JsonValue('bucket_timeout')
  bucketTimeout('bucket_timeout'),
  @JsonValue('no_flow')
  noFlow('no_flow');

  final String? value;

  const HandlerOrderAdminItemDispenseEndReason(this.value);
}

enum HandlerOrderAdminItemDispenseResult {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('none')
  none('none'),
  @JsonValue('full')
  full('full'),
  @JsonValue('partial')
  partial('partial');

  final String? value;

  const HandlerOrderAdminItemDispenseResult(this.value);
}

enum HandlerOrderAdminItemDisplayStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('completed')
  completed('completed'),
  @JsonValue('processing')
  processing('processing'),
  @JsonValue('cancelled')
  cancelled('cancelled');

  final String? value;

  const HandlerOrderAdminItemDisplayStatus(this.value);
}

enum HandlerOrderAdminItemOriginPaymentMethod {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('')
  $null(''),
  @JsonValue('iccard')
  iccard('iccard'),
  @JsonValue('quota')
  quota('quota');

  final String? value;

  const HandlerOrderAdminItemOriginPaymentMethod(this.value);
}

enum HandlerOrderAdminItemPaymentMethod {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('line_pay')
  linePay('line_pay'),
  @JsonValue('alipay')
  alipay('alipay'),
  @JsonValue('wechat_pay')
  wechatPay('wechat_pay'),
  @JsonValue('iccard')
  iccard('iccard'),
  @JsonValue('free')
  free('free'),
  @JsonValue('quota')
  quota('quota');

  final String? value;

  const HandlerOrderAdminItemPaymentMethod(this.value);
}

enum HandlerOrderAdminItemRefundProgress {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('none')
  none('none'),
  @JsonValue('pending')
  pending('pending'),
  @JsonValue('failed')
  failed('failed'),
  @JsonValue('succeeded')
  succeeded('succeeded');

  final String? value;

  const HandlerOrderAdminItemRefundProgress(this.value);
}

enum HandlerOrderAdminItemRefundStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('none')
  none('none'),
  @JsonValue('pending')
  pending('pending'),
  @JsonValue('succeeded')
  succeeded('succeeded'),
  @JsonValue('failed')
  failed('failed');

  final String? value;

  const HandlerOrderAdminItemRefundStatus(this.value);
}

enum HandlerOrderAdminItemStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('pending_payment')
  pendingPayment('pending_payment'),
  @JsonValue('paid_dispensing')
  paidDispensing('paid_dispensing'),
  @JsonValue('result_confirming')
  resultConfirming('result_confirming'),
  @JsonValue('completed')
  completed('completed'),
  @JsonValue('cancelled')
  cancelled('cancelled');

  final String? value;

  const HandlerOrderAdminItemStatus(this.value);
}

enum HandlerOrderAdminItemTopupPaymentMethod {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('')
  $null(''),
  @JsonValue('line_pay')
  linePay('line_pay'),
  @JsonValue('alipay')
  alipay('alipay'),
  @JsonValue('wechat_pay')
  wechatPay('wechat_pay');

  final String? value;

  const HandlerOrderAdminItemTopupPaymentMethod(this.value);
}

enum HandlerOrderAftersaleReviewItemResult {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('pending')
  pending('pending'),
  @JsonValue('approved')
  approved('approved'),
  @JsonValue('rejected')
  rejected('rejected'),
  @JsonValue('superseded')
  superseded('superseded');

  final String? value;

  const HandlerOrderAftersaleReviewItemResult(this.value);
}

enum HandlerOrderAftersaleReviewItemType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('partial_refund')
  partialRefund('partial_refund'),
  @JsonValue('quota_refund')
  quotaRefund('quota_refund'),
  @JsonValue('full_refund')
  fullRefund('full_refund');

  final String? value;

  const HandlerOrderAftersaleReviewItemType(this.value);
}

enum HandlerOrderCardTopupPayRequestMethod {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('line_pay')
  linePay('line_pay'),
  @JsonValue('alipay')
  alipay('alipay'),
  @JsonValue('wechat_pay')
  wechatPay('wechat_pay');

  final String? value;

  const HandlerOrderCardTopupPayRequestMethod(this.value);
}

enum HandlerOrderCardTopupRequestMethod {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('line_pay')
  linePay('line_pay'),
  @JsonValue('alipay')
  alipay('alipay'),
  @JsonValue('wechat_pay')
  wechatPay('wechat_pay');

  final String? value;

  const HandlerOrderCardTopupRequestMethod(this.value);
}

enum HandlerOrderClientDetailResponseAftersaleStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('')
  $null(''),
  @JsonValue('pending')
  pending('pending'),
  @JsonValue('rejected')
  rejected('rejected'),
  @JsonValue('refunding')
  refunding('refunding'),
  @JsonValue('completed')
  completed('completed'),
  @JsonValue('failed')
  failed('failed');

  final String? value;

  const HandlerOrderClientDetailResponseAftersaleStatus(this.value);
}

enum HandlerOrderClientDetailResponseAftersaleType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('')
  $null(''),
  @JsonValue('partial_refund')
  partialRefund('partial_refund'),
  @JsonValue('quota_refund')
  quotaRefund('quota_refund'),
  @JsonValue('full_refund')
  fullRefund('full_refund');

  final String? value;

  const HandlerOrderClientDetailResponseAftersaleType(this.value);
}

enum HandlerOrderClientDetailResponseChannelPaymentMethod {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('')
  $null(''),
  @JsonValue('line_pay')
  linePay('line_pay'),
  @JsonValue('alipay')
  alipay('alipay'),
  @JsonValue('wechat_pay')
  wechatPay('wechat_pay');

  final String? value;

  const HandlerOrderClientDetailResponseChannelPaymentMethod(this.value);
}

enum HandlerOrderClientDetailResponseDispenseEndReason {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('none')
  none('none'),
  @JsonValue('user_stop')
  userStop('user_stop'),
  @JsonValue('kiosk_finish')
  kioskFinish('kiosk_finish'),
  @JsonValue('pause_timeout')
  pauseTimeout('pause_timeout'),
  @JsonValue('device_fault')
  deviceFault('device_fault'),
  @JsonValue('manual_confirm')
  manualConfirm('manual_confirm'),
  @JsonValue('user_cancel')
  userCancel('user_cancel'),
  @JsonValue('bucket_timeout')
  bucketTimeout('bucket_timeout'),
  @JsonValue('no_flow')
  noFlow('no_flow');

  final String? value;

  const HandlerOrderClientDetailResponseDispenseEndReason(this.value);
}

enum HandlerOrderClientDetailResponseDispenseResult {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('none')
  none('none'),
  @JsonValue('full')
  full('full'),
  @JsonValue('partial')
  partial('partial');

  final String? value;

  const HandlerOrderClientDetailResponseDispenseResult(this.value);
}

enum HandlerOrderClientDetailResponseDisplayStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('completed')
  completed('completed'),
  @JsonValue('processing')
  processing('processing'),
  @JsonValue('cancelled')
  cancelled('cancelled');

  final String? value;

  const HandlerOrderClientDetailResponseDisplayStatus(this.value);
}

enum HandlerOrderClientDetailResponsePaymentMethod {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('line_pay')
  linePay('line_pay'),
  @JsonValue('alipay')
  alipay('alipay'),
  @JsonValue('wechat_pay')
  wechatPay('wechat_pay'),
  @JsonValue('iccard')
  iccard('iccard'),
  @JsonValue('free')
  free('free'),
  @JsonValue('quota')
  quota('quota');

  final String? value;

  const HandlerOrderClientDetailResponsePaymentMethod(this.value);
}

enum HandlerOrderClientDetailResponseRefundProgress {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('none')
  none('none'),
  @JsonValue('pending')
  pending('pending'),
  @JsonValue('failed')
  failed('failed'),
  @JsonValue('succeeded')
  succeeded('succeeded');

  final String? value;

  const HandlerOrderClientDetailResponseRefundProgress(this.value);
}

enum HandlerOrderClientDetailResponseRefundStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('none')
  none('none'),
  @JsonValue('pending')
  pending('pending'),
  @JsonValue('succeeded')
  succeeded('succeeded'),
  @JsonValue('failed')
  failed('failed');

  final String? value;

  const HandlerOrderClientDetailResponseRefundStatus(this.value);
}

enum HandlerOrderClientDetailResponseStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('pending_payment')
  pendingPayment('pending_payment'),
  @JsonValue('paid_dispensing')
  paidDispensing('paid_dispensing'),
  @JsonValue('result_confirming')
  resultConfirming('result_confirming'),
  @JsonValue('completed')
  completed('completed'),
  @JsonValue('cancelled')
  cancelled('cancelled');

  final String? value;

  const HandlerOrderClientDetailResponseStatus(this.value);
}

enum HandlerOrderClientDetailResponseTopupKind {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('')
  $null(''),
  @JsonValue('iccard')
  iccard('iccard'),
  @JsonValue('quota')
  quota('quota');

  final String? value;

  const HandlerOrderClientDetailResponseTopupKind(this.value);
}

enum HandlerOrderClientRefundItemChannel {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('line_pay')
  linePay('line_pay'),
  @JsonValue('alipay')
  alipay('alipay'),
  @JsonValue('wechat_pay')
  wechatPay('wechat_pay'),
  @JsonValue('iccard')
  iccard('iccard'),
  @JsonValue('quota')
  quota('quota');

  final String? value;

  const HandlerOrderClientRefundItemChannel(this.value);
}

enum HandlerOrderClientRefundItemStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('pending')
  pending('pending'),
  @JsonValue('succeeded')
  succeeded('succeeded'),
  @JsonValue('failed')
  failed('failed');

  final String? value;

  const HandlerOrderClientRefundItemStatus(this.value);
}

enum HandlerOrderPayItemChannel {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('quota')
  quota('quota'),
  @JsonValue('iccard')
  iccard('iccard'),
  @JsonValue('line_pay')
  linePay('line_pay'),
  @JsonValue('alipay')
  alipay('alipay'),
  @JsonValue('wechat_pay')
  wechatPay('wechat_pay');

  final String? value;

  const HandlerOrderPayItemChannel(this.value);
}

enum HandlerOrderQuoteRequestMethod {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('line_pay')
  linePay('line_pay'),
  @JsonValue('alipay')
  alipay('alipay'),
  @JsonValue('wechat_pay')
  wechatPay('wechat_pay'),
  @JsonValue('iccard')
  iccard('iccard');

  final String? value;

  const HandlerOrderQuoteRequestMethod(this.value);
}

enum HandlerOrderQuoteRequestWaterType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('pure')
  pure('pure'),
  @JsonValue('mineral')
  mineral('mineral');

  final String? value;

  const HandlerOrderQuoteRequestWaterType(this.value);
}

enum HandlerOrderRefundItemChannel {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('line_pay')
  linePay('line_pay'),
  @JsonValue('alipay')
  alipay('alipay'),
  @JsonValue('wechat_pay')
  wechatPay('wechat_pay'),
  @JsonValue('iccard')
  iccard('iccard'),
  @JsonValue('quota')
  quota('quota');

  final String? value;

  const HandlerOrderRefundItemChannel(this.value);
}

enum HandlerOrderRefundItemStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('pending')
  pending('pending'),
  @JsonValue('succeeded')
  succeeded('succeeded'),
  @JsonValue('failed')
  failed('failed');

  final String? value;

  const HandlerOrderRefundItemStatus(this.value);
}

enum HandlerOrderRefundedResponseDispenseEndReason {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('none')
  none('none'),
  @JsonValue('user_stop')
  userStop('user_stop'),
  @JsonValue('kiosk_finish')
  kioskFinish('kiosk_finish'),
  @JsonValue('pause_timeout')
  pauseTimeout('pause_timeout'),
  @JsonValue('device_fault')
  deviceFault('device_fault'),
  @JsonValue('manual_confirm')
  manualConfirm('manual_confirm'),
  @JsonValue('user_cancel')
  userCancel('user_cancel'),
  @JsonValue('bucket_timeout')
  bucketTimeout('bucket_timeout'),
  @JsonValue('no_flow')
  noFlow('no_flow');

  final String? value;

  const HandlerOrderRefundedResponseDispenseEndReason(this.value);
}

enum HandlerOrderRefundedResponseDispenseResult {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('none')
  none('none'),
  @JsonValue('full')
  full('full'),
  @JsonValue('partial')
  partial('partial');

  final String? value;

  const HandlerOrderRefundedResponseDispenseResult(this.value);
}

enum HandlerOrderRefundedResponseDisplayStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('completed')
  completed('completed'),
  @JsonValue('processing')
  processing('processing'),
  @JsonValue('cancelled')
  cancelled('cancelled');

  final String? value;

  const HandlerOrderRefundedResponseDisplayStatus(this.value);
}

enum HandlerOrderRefundedResponsePaymentMethod {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('line_pay')
  linePay('line_pay'),
  @JsonValue('alipay')
  alipay('alipay'),
  @JsonValue('wechat_pay')
  wechatPay('wechat_pay'),
  @JsonValue('iccard')
  iccard('iccard'),
  @JsonValue('free')
  free('free'),
  @JsonValue('quota')
  quota('quota');

  final String? value;

  const HandlerOrderRefundedResponsePaymentMethod(this.value);
}

enum HandlerOrderRefundedResponseRefundProgress {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('none')
  none('none'),
  @JsonValue('pending')
  pending('pending'),
  @JsonValue('failed')
  failed('failed'),
  @JsonValue('succeeded')
  succeeded('succeeded');

  final String? value;

  const HandlerOrderRefundedResponseRefundProgress(this.value);
}

enum HandlerOrderRefundedResponseRefundStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('none')
  none('none'),
  @JsonValue('pending')
  pending('pending'),
  @JsonValue('succeeded')
  succeeded('succeeded'),
  @JsonValue('failed')
  failed('failed');

  final String? value;

  const HandlerOrderRefundedResponseRefundStatus(this.value);
}

enum HandlerOrderRefundedResponseStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('pending_payment')
  pendingPayment('pending_payment'),
  @JsonValue('paid_dispensing')
  paidDispensing('paid_dispensing'),
  @JsonValue('result_confirming')
  resultConfirming('result_confirming'),
  @JsonValue('completed')
  completed('completed'),
  @JsonValue('cancelled')
  cancelled('cancelled');

  final String? value;

  const HandlerOrderRefundedResponseStatus(this.value);
}

enum HandlerOrderResponseDispenseEndReason {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('none')
  none('none'),
  @JsonValue('user_stop')
  userStop('user_stop'),
  @JsonValue('kiosk_finish')
  kioskFinish('kiosk_finish'),
  @JsonValue('pause_timeout')
  pauseTimeout('pause_timeout'),
  @JsonValue('device_fault')
  deviceFault('device_fault'),
  @JsonValue('manual_confirm')
  manualConfirm('manual_confirm'),
  @JsonValue('user_cancel')
  userCancel('user_cancel'),
  @JsonValue('bucket_timeout')
  bucketTimeout('bucket_timeout'),
  @JsonValue('no_flow')
  noFlow('no_flow');

  final String? value;

  const HandlerOrderResponseDispenseEndReason(this.value);
}

enum HandlerOrderResponseDispenseResult {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('none')
  none('none'),
  @JsonValue('full')
  full('full'),
  @JsonValue('partial')
  partial('partial');

  final String? value;

  const HandlerOrderResponseDispenseResult(this.value);
}

enum HandlerOrderResponseDisplayStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('completed')
  completed('completed'),
  @JsonValue('processing')
  processing('processing'),
  @JsonValue('cancelled')
  cancelled('cancelled');

  final String? value;

  const HandlerOrderResponseDisplayStatus(this.value);
}

enum HandlerOrderResponsePaymentMethod {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('line_pay')
  linePay('line_pay'),
  @JsonValue('alipay')
  alipay('alipay'),
  @JsonValue('wechat_pay')
  wechatPay('wechat_pay'),
  @JsonValue('iccard')
  iccard('iccard'),
  @JsonValue('free')
  free('free'),
  @JsonValue('quota')
  quota('quota');

  final String? value;

  const HandlerOrderResponsePaymentMethod(this.value);
}

enum HandlerOrderResponseRefundStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('none')
  none('none'),
  @JsonValue('pending')
  pending('pending'),
  @JsonValue('succeeded')
  succeeded('succeeded'),
  @JsonValue('failed')
  failed('failed');

  final String? value;

  const HandlerOrderResponseRefundStatus(this.value);
}

enum HandlerOrderResponseStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('pending_payment')
  pendingPayment('pending_payment'),
  @JsonValue('paid_dispensing')
  paidDispensing('paid_dispensing'),
  @JsonValue('result_confirming')
  resultConfirming('result_confirming'),
  @JsonValue('completed')
  completed('completed'),
  @JsonValue('cancelled')
  cancelled('cancelled');

  final String? value;

  const HandlerOrderResponseStatus(this.value);
}

enum HandlerPackageAdminResponseStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('draft')
  draft('draft'),
  @JsonValue('pending')
  pending('pending'),
  @JsonValue('on_sale')
  onSale('on_sale'),
  @JsonValue('ended')
  ended('ended'),
  @JsonValue('off_shelf')
  offShelf('off_shelf');

  final String? value;

  const HandlerPackageAdminResponseStatus(this.value);
}

enum HandlerPackageBuyRequestMethod {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('line_pay')
  linePay('line_pay'),
  @JsonValue('alipay')
  alipay('alipay'),
  @JsonValue('wechat_pay')
  wechatPay('wechat_pay');

  final String? value;

  const HandlerPackageBuyRequestMethod(this.value);
}

enum HandlerPackageOrderAdminResponsePaymentMethod {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('line_pay')
  linePay('line_pay'),
  @JsonValue('alipay')
  alipay('alipay'),
  @JsonValue('wechat_pay')
  wechatPay('wechat_pay');

  final String? value;

  const HandlerPackageOrderAdminResponsePaymentMethod(this.value);
}

enum HandlerPackageOrderAdminResponseRefundStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('none')
  none('none'),
  @JsonValue('pending')
  pending('pending'),
  @JsonValue('succeeded')
  succeeded('succeeded'),
  @JsonValue('failed')
  failed('failed');

  final String? value;

  const HandlerPackageOrderAdminResponseRefundStatus(this.value);
}

enum HandlerPackageOrderAdminResponseStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('pending_payment')
  pendingPayment('pending_payment'),
  @JsonValue('paid')
  paid('paid'),
  @JsonValue('refunding')
  refunding('refunding'),
  @JsonValue('refunded')
  refunded('refunded'),
  @JsonValue('cancelled')
  cancelled('cancelled'),
  @JsonValue('refund_failed')
  refundFailed('refund_failed');

  final String? value;

  const HandlerPackageOrderAdminResponseStatus(this.value);
}

enum HandlerPackageOrderDetailResponseDisplayStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('completed')
  completed('completed'),
  @JsonValue('refund_processing')
  refundProcessing('refund_processing'),
  @JsonValue('refunded')
  refunded('refunded'),
  @JsonValue('refund_failed')
  refundFailed('refund_failed');

  final String? value;

  const HandlerPackageOrderDetailResponseDisplayStatus(this.value);
}

enum HandlerPackageOrderDetailResponsePaymentMethod {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('line_pay')
  linePay('line_pay'),
  @JsonValue('alipay')
  alipay('alipay'),
  @JsonValue('wechat_pay')
  wechatPay('wechat_pay');

  final String? value;

  const HandlerPackageOrderDetailResponsePaymentMethod(this.value);
}

enum HandlerPackageOrderDetailResponseRefundStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('none')
  none('none'),
  @JsonValue('pending')
  pending('pending'),
  @JsonValue('succeeded')
  succeeded('succeeded'),
  @JsonValue('failed')
  failed('failed');

  final String? value;

  const HandlerPackageOrderDetailResponseRefundStatus(this.value);
}

enum HandlerPackageOrderDetailResponseStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('pending_payment')
  pendingPayment('pending_payment'),
  @JsonValue('paid')
  paid('paid'),
  @JsonValue('refunding')
  refunding('refunding'),
  @JsonValue('refunded')
  refunded('refunded'),
  @JsonValue('cancelled')
  cancelled('cancelled');

  final String? value;

  const HandlerPackageOrderDetailResponseStatus(this.value);
}

enum HandlerPackageOrderResponseDisplayStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('completed')
  completed('completed'),
  @JsonValue('refund_processing')
  refundProcessing('refund_processing'),
  @JsonValue('refunded')
  refunded('refunded'),
  @JsonValue('refund_failed')
  refundFailed('refund_failed');

  final String? value;

  const HandlerPackageOrderResponseDisplayStatus(this.value);
}

enum HandlerPackageOrderResponsePaymentMethod {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('line_pay')
  linePay('line_pay'),
  @JsonValue('alipay')
  alipay('alipay'),
  @JsonValue('wechat_pay')
  wechatPay('wechat_pay');

  final String? value;

  const HandlerPackageOrderResponsePaymentMethod(this.value);
}

enum HandlerPackageOrderResponseRefundStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('none')
  none('none'),
  @JsonValue('pending')
  pending('pending'),
  @JsonValue('succeeded')
  succeeded('succeeded'),
  @JsonValue('failed')
  failed('failed');

  final String? value;

  const HandlerPackageOrderResponseRefundStatus(this.value);
}

enum HandlerPackageOrderResponseStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('pending_payment')
  pendingPayment('pending_payment'),
  @JsonValue('paid')
  paid('paid'),
  @JsonValue('refunding')
  refunding('refunding'),
  @JsonValue('refunded')
  refunded('refunded'),
  @JsonValue('cancelled')
  cancelled('cancelled');

  final String? value;

  const HandlerPackageOrderResponseStatus(this.value);
}

enum HandlerRecordingAdminCameraStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('online')
  online('online'),
  @JsonValue('offline')
  offline('offline'),
  @JsonValue('error')
  error('error'),
  @JsonValue('unavailable')
  unavailable('unavailable');

  final String? value;

  const HandlerRecordingAdminCameraStatus(this.value);
}

enum HandlerRecordingAdminIntervalKind {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('water_order')
  waterOrder('water_order'),
  @JsonValue('control')
  control('control');

  final String? value;

  const HandlerRecordingAdminIntervalKind(this.value);
}

enum HandlerRecordingAdminIntervalRecordingState {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('available')
  available('available'),
  @JsonValue('partial')
  partial('partial'),
  @JsonValue('missing')
  missing('missing');

  final String? value;

  const HandlerRecordingAdminIntervalRecordingState(this.value);
}

enum HandlerRecordingAdminPlaybackFileStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('pending')
  pending('pending'),
  @JsonValue('uploading')
  uploading('uploading'),
  @JsonValue('ready')
  ready('ready'),
  @JsonValue('failed')
  failed('failed');

  final String? value;

  const HandlerRecordingAdminPlaybackFileStatus(this.value);
}

enum HandlerRecordingAdminPlaybackResponseStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('pending')
  pending('pending'),
  @JsonValue('uploading')
  uploading('uploading'),
  @JsonValue('ready')
  ready('ready'),
  @JsonValue('failed')
  failed('failed'),
  @JsonValue('expired')
  expired('expired');

  final String? value;

  const HandlerRecordingAdminPlaybackResponseStatus(this.value);
}

enum HandlerRoleAdminResponseStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('enabled')
  enabled('enabled'),
  @JsonValue('disabled')
  disabled('disabled');

  final String? value;

  const HandlerRoleAdminResponseStatus(this.value);
}

enum HandlerRoleAdminSaveRequestPlatform {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('web')
  web('web'),
  @JsonValue('ops')
  ops('ops'),
  @JsonValue('wh')
  wh('wh');

  final String? value;

  const HandlerRoleAdminSaveRequestPlatform(this.value);
}

enum HandlerRoleAdminStatusRequestStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('enabled')
  enabled('enabled'),
  @JsonValue('disabled')
  disabled('disabled');

  final String? value;

  const HandlerRoleAdminStatusRequestStatus(this.value);
}

enum HandlerSessionClientMethodRequestPaymentMethod {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('line_pay')
  linePay('line_pay'),
  @JsonValue('alipay')
  alipay('alipay'),
  @JsonValue('wechat_pay')
  wechatPay('wechat_pay'),
  @JsonValue('iccard')
  iccard('iccard'),
  @JsonValue('quota')
  quota('quota'),
  @JsonValue('topup')
  topup('topup');

  final String? value;

  const HandlerSessionClientMethodRequestPaymentMethod(this.value);
}

enum HandlerSessionEventDataCause {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('kiosk_restart')
  kioskRestart('kiosk_restart'),
  @JsonValue('user_leave')
  userLeave('user_leave'),
  @JsonValue('select_timeout')
  selectTimeout('select_timeout'),
  @JsonValue('order_ended')
  orderEnded('order_ended');

  final String? value;

  const HandlerSessionEventDataCause(this.value);
}

enum HandlerSessionEventFrameEvent {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('session_joined')
  sessionJoined('session_joined'),
  @JsonValue('slot_selected')
  slotSelected('slot_selected'),
  @JsonValue('slot_confirmed')
  slotConfirmed('slot_confirmed'),
  @JsonValue('payment_method_selected')
  paymentMethodSelected('payment_method_selected'),
  @JsonValue('order_created')
  orderCreated('order_created'),
  @JsonValue('payment_succeeded')
  paymentSucceeded('payment_succeeded'),
  @JsonValue('iccard_topup_required')
  iccardTopupRequired('iccard_topup_required'),
  @JsonValue('bucket_countdown')
  bucketCountdown('bucket_countdown'),
  @JsonValue('dispense_start_failed')
  dispenseStartFailed('dispense_start_failed'),
  @JsonValue('dispense_progress')
  dispenseProgress('dispense_progress'),
  @JsonValue('dispense_paused')
  dispensePaused('dispense_paused'),
  @JsonValue('dispense_resumed')
  dispenseResumed('dispense_resumed'),
  @JsonValue('dispense_finished')
  dispenseFinished('dispense_finished'),
  @JsonValue('order_cancelled')
  orderCancelled('order_cancelled'),
  @JsonValue('session_ended')
  sessionEnded('session_ended');

  final String? value;

  const HandlerSessionEventFrameEvent(this.value);
}

enum HandlerSessionFilterType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('pp')
  pp('pp'),
  @JsonValue('gac')
  gac('gac'),
  @JsonValue('ro')
  ro('ro');

  final String? value;

  const HandlerSessionFilterType(this.value);
}

enum HandlerSessionMethodRequestPaymentMethod {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('line_pay')
  linePay('line_pay'),
  @JsonValue('alipay')
  alipay('alipay'),
  @JsonValue('wechat_pay')
  wechatPay('wechat_pay'),
  @JsonValue('iccard')
  iccard('iccard');

  final String? value;

  const HandlerSessionMethodRequestPaymentMethod(this.value);
}

enum HandlerSessionOrderResponseDispenseEndReason {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('none')
  none('none'),
  @JsonValue('user_stop')
  userStop('user_stop'),
  @JsonValue('kiosk_finish')
  kioskFinish('kiosk_finish'),
  @JsonValue('pause_timeout')
  pauseTimeout('pause_timeout'),
  @JsonValue('device_fault')
  deviceFault('device_fault'),
  @JsonValue('manual_confirm')
  manualConfirm('manual_confirm'),
  @JsonValue('user_cancel')
  userCancel('user_cancel'),
  @JsonValue('bucket_timeout')
  bucketTimeout('bucket_timeout'),
  @JsonValue('no_flow')
  noFlow('no_flow');

  final String? value;

  const HandlerSessionOrderResponseDispenseEndReason(this.value);
}

enum HandlerSessionOrderResponseDispenseResult {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('none')
  none('none'),
  @JsonValue('full')
  full('full'),
  @JsonValue('partial')
  partial('partial');

  final String? value;

  const HandlerSessionOrderResponseDispenseResult(this.value);
}

enum HandlerSessionOrderResponseDisplayStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('completed')
  completed('completed'),
  @JsonValue('processing')
  processing('processing'),
  @JsonValue('cancelled')
  cancelled('cancelled');

  final String? value;

  const HandlerSessionOrderResponseDisplayStatus(this.value);
}

enum HandlerSessionOrderResponsePaymentMethod {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('line_pay')
  linePay('line_pay'),
  @JsonValue('alipay')
  alipay('alipay'),
  @JsonValue('wechat_pay')
  wechatPay('wechat_pay'),
  @JsonValue('iccard')
  iccard('iccard'),
  @JsonValue('free')
  free('free'),
  @JsonValue('quota')
  quota('quota');

  final String? value;

  const HandlerSessionOrderResponsePaymentMethod(this.value);
}

enum HandlerSessionOrderResponseRefundProgress {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('none')
  none('none'),
  @JsonValue('pending')
  pending('pending'),
  @JsonValue('failed')
  failed('failed'),
  @JsonValue('succeeded')
  succeeded('succeeded');

  final String? value;

  const HandlerSessionOrderResponseRefundProgress(this.value);
}

enum HandlerSessionOrderResponseRefundStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('none')
  none('none'),
  @JsonValue('pending')
  pending('pending'),
  @JsonValue('succeeded')
  succeeded('succeeded'),
  @JsonValue('failed')
  failed('failed');

  final String? value;

  const HandlerSessionOrderResponseRefundStatus(this.value);
}

enum HandlerSessionOrderResponseStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('pending_payment')
  pendingPayment('pending_payment'),
  @JsonValue('paid_dispensing')
  paidDispensing('paid_dispensing'),
  @JsonValue('result_confirming')
  resultConfirming('result_confirming'),
  @JsonValue('completed')
  completed('completed'),
  @JsonValue('cancelled')
  cancelled('cancelled');

  final String? value;

  const HandlerSessionOrderResponseStatus(this.value);
}

enum HandlerSessionResponseCode {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('ORDER_DEVICE_BUSY')
  orderDeviceBusy('ORDER_DEVICE_BUSY'),
  @JsonValue('DEVICE_OFFLINE')
  deviceOffline('DEVICE_OFFLINE'),
  @JsonValue('DEVICE_POWERED_OFF')
  devicePoweredOff('DEVICE_POWERED_OFF'),
  @JsonValue('DEVICE_MAINTENANCE')
  deviceMaintenance('DEVICE_MAINTENANCE'),
  @JsonValue('DEVICE_UPGRADING')
  deviceUpgrading('DEVICE_UPGRADING'),
  @JsonValue('DEVICE_FLOW_METER_FAULT')
  deviceFlowMeterFault('DEVICE_FLOW_METER_FAULT'),
  @JsonValue('DEVICE_LOW_WATER')
  deviceLowWater('DEVICE_LOW_WATER'),
  @JsonValue('DEVICE_BOARD_OFFLINE')
  deviceBoardOffline('DEVICE_BOARD_OFFLINE'),
  @JsonValue('DEVICE_SALE_DISABLED')
  deviceSaleDisabled('DEVICE_SALE_DISABLED'),
  @JsonValue('DEVICE_SLOT_NOT_SET')
  deviceSlotNotSet('DEVICE_SLOT_NOT_SET'),
  @JsonValue('DEVICE_PRICE_NOT_SET')
  devicePriceNotSet('DEVICE_PRICE_NOT_SET');

  final String? value;

  const HandlerSessionResponseCode(this.value);
}

enum HandlerSessionResponseEndCause {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('')
  $null(''),
  @JsonValue('kiosk_restart')
  kioskRestart('kiosk_restart'),
  @JsonValue('user_leave')
  userLeave('user_leave'),
  @JsonValue('select_timeout')
  selectTimeout('select_timeout'),
  @JsonValue('order_ended')
  orderEnded('order_ended');

  final String? value;

  const HandlerSessionResponseEndCause(this.value);
}

enum HandlerSessionResponseOnlinePaymentMethods {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('line_pay')
  linePay('line_pay'),
  @JsonValue('alipay')
  alipay('alipay'),
  @JsonValue('wechat_pay')
  wechatPay('wechat_pay');

  final String? value;

  const HandlerSessionResponseOnlinePaymentMethods(this.value);
}

enum HandlerSessionResponseReason {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('busy')
  busy('busy'),
  @JsonValue('offline')
  offline('offline'),
  @JsonValue('offline_too_long')
  offlineTooLong('offline_too_long'),
  @JsonValue('powered_off')
  poweredOff('powered_off'),
  @JsonValue('maintenance')
  maintenance('maintenance'),
  @JsonValue('firmware_upgrading')
  firmwareUpgrading('firmware_upgrading'),
  @JsonValue('flow_meter_fault')
  flowMeterFault('flow_meter_fault'),
  @JsonValue('low_water_level')
  lowWaterLevel('low_water_level'),
  @JsonValue('board_offline')
  boardOffline('board_offline'),
  @JsonValue('water_level_abnormal')
  waterLevelAbnormal('water_level_abnormal'),
  @JsonValue('sale_disabled')
  saleDisabled('sale_disabled'),
  @JsonValue('slot_not_set')
  slotNotSet('slot_not_set'),
  @JsonValue('price_not_set')
  priceNotSet('price_not_set');

  final String? value;

  const HandlerSessionResponseReason(this.value);
}

enum HandlerSessionResponseStage {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('idle')
  idle('idle'),
  @JsonValue('select')
  select('select'),
  @JsonValue('method')
  method('method'),
  @JsonValue('pay')
  pay('pay'),
  @JsonValue('bucket')
  bucket('bucket'),
  @JsonValue('dispense')
  dispense('dispense'),
  @JsonValue('ended')
  ended('ended');

  final String? value;

  const HandlerSessionResponseStage(this.value);
}

enum HandlerSessionResponseWaterLevel {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('high')
  high('high'),
  @JsonValue('medium')
  medium('medium'),
  @JsonValue('low')
  low('low');

  final String? value;

  const HandlerSessionResponseWaterLevel(this.value);
}

enum HandlerSessionScanDeviceRunStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('standby')
  standby('standby'),
  @JsonValue('dispensing')
  dispensing('dispensing'),
  @JsonValue('maintenance')
  maintenance('maintenance'),
  @JsonValue('powered_off')
  poweredOff('powered_off');

  final String? value;

  const HandlerSessionScanDeviceRunStatus(this.value);
}

enum HandlerSessionScanDeviceWaterLevel {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('high')
  high('high'),
  @JsonValue('medium')
  medium('medium'),
  @JsonValue('low')
  low('low');

  final String? value;

  const HandlerSessionScanDeviceWaterLevel(this.value);
}

enum HandlerSessionScanResponseCode {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('ORDER_DEVICE_BUSY')
  orderDeviceBusy('ORDER_DEVICE_BUSY'),
  @JsonValue('DEVICE_OFFLINE')
  deviceOffline('DEVICE_OFFLINE'),
  @JsonValue('DEVICE_POWERED_OFF')
  devicePoweredOff('DEVICE_POWERED_OFF'),
  @JsonValue('DEVICE_MAINTENANCE')
  deviceMaintenance('DEVICE_MAINTENANCE'),
  @JsonValue('DEVICE_UPGRADING')
  deviceUpgrading('DEVICE_UPGRADING'),
  @JsonValue('DEVICE_FLOW_METER_FAULT')
  deviceFlowMeterFault('DEVICE_FLOW_METER_FAULT'),
  @JsonValue('DEVICE_LOW_WATER')
  deviceLowWater('DEVICE_LOW_WATER'),
  @JsonValue('DEVICE_BOARD_OFFLINE')
  deviceBoardOffline('DEVICE_BOARD_OFFLINE'),
  @JsonValue('DEVICE_SALE_DISABLED')
  deviceSaleDisabled('DEVICE_SALE_DISABLED'),
  @JsonValue('DEVICE_SLOT_NOT_SET')
  deviceSlotNotSet('DEVICE_SLOT_NOT_SET'),
  @JsonValue('DEVICE_PRICE_NOT_SET')
  devicePriceNotSet('DEVICE_PRICE_NOT_SET');

  final String? value;

  const HandlerSessionScanResponseCode(this.value);
}

enum HandlerSessionScanResponseEndCause {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('')
  $null(''),
  @JsonValue('kiosk_restart')
  kioskRestart('kiosk_restart'),
  @JsonValue('user_leave')
  userLeave('user_leave'),
  @JsonValue('select_timeout')
  selectTimeout('select_timeout'),
  @JsonValue('order_ended')
  orderEnded('order_ended');

  final String? value;

  const HandlerSessionScanResponseEndCause(this.value);
}

enum HandlerSessionScanResponseOnlinePaymentMethods {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('line_pay')
  linePay('line_pay'),
  @JsonValue('alipay')
  alipay('alipay'),
  @JsonValue('wechat_pay')
  wechatPay('wechat_pay');

  final String? value;

  const HandlerSessionScanResponseOnlinePaymentMethods(this.value);
}

enum HandlerSessionScanResponseReason {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('busy')
  busy('busy'),
  @JsonValue('offline')
  offline('offline'),
  @JsonValue('offline_too_long')
  offlineTooLong('offline_too_long'),
  @JsonValue('powered_off')
  poweredOff('powered_off'),
  @JsonValue('maintenance')
  maintenance('maintenance'),
  @JsonValue('firmware_upgrading')
  firmwareUpgrading('firmware_upgrading'),
  @JsonValue('flow_meter_fault')
  flowMeterFault('flow_meter_fault'),
  @JsonValue('low_water_level')
  lowWaterLevel('low_water_level'),
  @JsonValue('board_offline')
  boardOffline('board_offline'),
  @JsonValue('water_level_abnormal')
  waterLevelAbnormal('water_level_abnormal'),
  @JsonValue('sale_disabled')
  saleDisabled('sale_disabled'),
  @JsonValue('slot_not_set')
  slotNotSet('slot_not_set'),
  @JsonValue('price_not_set')
  priceNotSet('price_not_set');

  final String? value;

  const HandlerSessionScanResponseReason(this.value);
}

enum HandlerSessionScanResponseStage {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('idle')
  idle('idle'),
  @JsonValue('select')
  select('select'),
  @JsonValue('method')
  method('method'),
  @JsonValue('pay')
  pay('pay'),
  @JsonValue('bucket')
  bucket('bucket'),
  @JsonValue('dispense')
  dispense('dispense'),
  @JsonValue('ended')
  ended('ended');

  final String? value;

  const HandlerSessionScanResponseStage(this.value);
}

enum HandlerSessionScanResponseWaterLevel {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('high')
  high('high'),
  @JsonValue('medium')
  medium('medium'),
  @JsonValue('low')
  low('low');

  final String? value;

  const HandlerSessionScanResponseWaterLevel(this.value);
}

enum HandlerSessionSlotRequestWaterType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('pure')
  pure('pure'),
  @JsonValue('mineral')
  mineral('mineral');

  final String? value;

  const HandlerSessionSlotRequestWaterType(this.value);
}

enum HandlerStaffAdminResponseStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('enabled')
  enabled('enabled'),
  @JsonValue('disabled')
  disabled('disabled');

  final String? value;

  const HandlerStaffAdminResponseStatus(this.value);
}

enum HandlerStaffAdminStatusRequestStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('enabled')
  enabled('enabled'),
  @JsonValue('disabled')
  disabled('disabled');

  final String? value;

  const HandlerStaffAdminStatusRequestStatus(this.value);
}

enum HandlerTestkitKioskSignRequestMethod {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('GET')
  $get('GET'),
  @JsonValue('POST')
  post('POST');

  final String? value;

  const HandlerTestkitKioskSignRequestMethod(this.value);
}

enum HandlerWarehouseAdminItemStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('enabled')
  enabled('enabled'),
  @JsonValue('disabled')
  disabled('disabled');

  final String? value;

  const HandlerWarehouseAdminItemStatus(this.value);
}

enum HandlerWarehouseAdminStatusRequestStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('enabled')
  enabled('enabled'),
  @JsonValue('disabled')
  disabled('disabled');

  final String? value;

  const HandlerWarehouseAdminStatusRequestStatus(this.value);
}
