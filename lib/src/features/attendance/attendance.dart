import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class Presensi extends StatefulWidget {
  const Presensi({super.key});

  @override
  State<Presensi> createState() => _PresensiState();
}

class _PresensiState extends State<Presensi> {
  late List<CameraDescription> cameras;
  CameraController? cameraController;
  int direction = 0;

  @override
  void initState() {
    super.initState();
    startCamera(direction);
  }

  void startCamera(int direction) async {
    cameras = await availableCameras();

    if (cameras.isEmpty) {
      print("No cameras found on this device.");
      return;
    }

    cameraController = CameraController(
      cameras[direction],
      ResolutionPreset.high,
      enableAudio: false,
    );

    try {
      await cameraController?.initialize();
    } catch (e) {
      print("Camera initialization error: $e");
    }

    if (!mounted) return;

    setState(() {}); // Refresh the widget after initialization
  }

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (cameraController?.value.isInitialized ?? false) {
      return Scaffold(
        body: Stack(
          children: [
            CameraPreview(cameraController!),
            // Grey overlay with clear center square
            Container(
              decoration: ShapeDecoration(
                shape: QRScannerOverlayShape(
                  borderRadius: 10,
                  cutOutSize: 250,
                ),
                color: Colors.black.withOpacity(0.1),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Column(
                  children: [
                    Text(
                      "Absensi",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Arahkan kamera ke kode QR untuk melakukan absensi",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}

class QRScannerOverlayShape extends ShapeBorder {
  final double borderRadius;
  final double cutOutSize;
  final Color overlayColor;

  QRScannerOverlayShape({
    this.borderRadius = 0.0,
    this.cutOutSize = 250.0,
    this.overlayColor = Colors.black54, // Gray overlay color
  });

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(10.0);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) =>
      getOuterPath(rect, textDirection: textDirection);

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..addRRect(
        RRect.fromRectAndRadius(rect, Radius.circular(borderRadius)),
      )
      ..addRect(
        Rect.fromCenter(
          center: rect.center,
          width: cutOutSize,
          height: cutOutSize,
        ),
      )
      ..fillType = PathFillType.evenOdd;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    final paint = Paint()
      ..color = overlayColor
      ..style = PaintingStyle.fill;

    // Draw the gray overlay with the clear center square
    final overlayPath = Path()
      ..addRect(rect)
      ..addRect(
        Rect.fromCenter(
          center: rect.center,
          width: cutOutSize,
          height: cutOutSize,
        ),
      )
      ..fillType = PathFillType.evenOdd;

    canvas.drawPath(overlayPath, paint);
  }

  @override
  ShapeBorder scale(double t) => QRScannerOverlayShape(
    borderRadius: borderRadius * t,
    cutOutSize: cutOutSize * t,
    overlayColor: overlayColor,
  );
}
