import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:plantapp/camera/camera_page.dart';
import 'package:plantapp/camera/storage_helper.dart';
import 'package:plantapp/constants.dart';

class FullPage extends StatefulWidget {
  const FullPage({super.key});

  @override
  State<FullPage> createState() => _FullPageState();
}

class _FullPageState extends State<FullPage> {
  File? _imageFile;

  Future<void> _requestPermissions() async {
    await Permission.camera.request();
    await Permission.storage.request();
    await Permission.manageExternalStorage.request();
  }

  Future<void> _takePicture() async {
    await _requestPermissions();
    final File? result = await Navigator.push<File?>(
      context,
      MaterialPageRoute(builder: (_) => const CameraPage()),
    );
    if (result !=null) {
      final saved = await StorageHelper.saveImage(result, 'camera');
      setState(() => _imageFile = saved);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Disimpan: ${saved.path}'))); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color.fromARGB(255, 12, 152, 105)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Camera', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
      centerTitle: true,),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            if (_imageFile != null)
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.file(
                      _imageFile!,
                      width: double.infinity, 
                    ),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    label: const Text(
                      'Hapus Gambar',
                      style: TextStyle(color: Colors.white, fontSize: 14 ,fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      
                      backgroundColor: kPrimaryColor,
                    ),
                    onPressed: () async {
                      await _imageFile?.delete();
                      setState(() => _imageFile = null);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Gambar dihapus')));
                    },
                  ),
                  const SizedBox(height: 16),
                ],
              )
            else
               const Expanded(
                  child: Center(
                    child: Text(
                      'Belum ada gambar diambil/dipilih.',
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            const Spacer(),
            Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.camera , color: Colors.white),
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                label: const Text('Ambil Foto',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: _takePicture,
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}