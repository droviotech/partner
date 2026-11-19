import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:partner/app/di/get_it.dart';
import 'package:partner/core/native/scan_gateway.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({super.key, this.onDetected});

  final void Function(Barcode barcode)? onDetected;

  @override
  Widget build(BuildContext context) {
    final gateway = getIt<ScanGateway>();
    return Scaffold(
      appBar: AppBar(title: const Text('扫码')),
      body: MobileScanner(
        controller: gateway.controller,
        onDetect: (capture) {
          gateway.handleCapture(capture);
          for (final barcode in capture.barcodes) {
            if (barcode.rawValue != null && barcode.rawValue!.isNotEmpty) {
              onDetected?.call(barcode);
            }
          }
        },
      ),
    );
  }
}
