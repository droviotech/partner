import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

abstract class ScanGateway {
  MobileScannerController get controller;
  Stream<Barcode> get barcodes;
  void handleCapture(BarcodeCapture capture);
  void dispose();
}

@LazySingleton(as: ScanGateway)
class MobileScanGateway implements ScanGateway {
  MobileScanGateway({MobileScannerController? controller})
    : _controller = controller ?? MobileScannerController();

  final MobileScannerController _controller;
  final _barcodes = StreamController<Barcode>.broadcast();

  @override
  MobileScannerController get controller => _controller;

  @override
  Stream<Barcode> get barcodes => _barcodes.stream;

  @override
  void handleCapture(BarcodeCapture capture) {
    for (final barcode in capture.barcodes) {
      if (barcode.rawValue != null && barcode.rawValue!.isNotEmpty) {
        _barcodes.add(barcode);
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _barcodes.close();
  }
}
