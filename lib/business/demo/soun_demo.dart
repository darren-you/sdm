import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../services/app_init_service.dart';

class SoundRecorderPage extends StatefulWidget {
  const SoundRecorderPage({super.key});

  @override
  State<SoundRecorderPage> createState() => _SoundRecorderPageState();
}

class _SoundRecorderPageState extends State<SoundRecorderPage> {
  final FlutterSoundRecorder _soundRecorder = FlutterSoundRecorder();
  bool _isRecording = false;

  @override
  void initState() {
    super.initState();
    _initRecorder();
  }

  Future<void> _initRecorder() async {
    // 请求录音权限
    PermissionStatus status = await Permission.microphone.request();
    // 根据权限状态执行相应操作
    if (status.isGranted) {
      SmartDialog.showToast('授予录音权限');
      await _soundRecorder.openRecorder();
    } else {
      // 如果权限被拒绝，你可以向用户解释为什么应用需要这个权限
      // 以及如何手动授予权限。
      SmartDialog.showToast('拒绝录音权限');
    }
  }

  void _startRecording() async {
    try {
      await _soundRecorder.startRecorder(toFile: 'example_recording.aac');
      setState(() {
        _isRecording = true;
      });
    } catch (e) {
      logger.d('Error starting recording: $e');
    }
  }

  void _stopRecording() async {
    try {
      String? path = await _soundRecorder.stopRecorder();
      logger.d('Recording stopped, saved at: $path');
      setState(() {
        _isRecording = false;
      });
    } catch (e) {
      logger.d('Error stopping recording: $e');
    }
  }

  @override
  void dispose() {
    _soundRecorder.closeRecorder();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sound Recorder'),
      ),
      body: Center(
        child: GestureDetector(
          onTapDown: (details) {
            _startRecording();
          },
          onTapUp: (details) {
            _stopRecording();
          },
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: _isRecording ? Colors.red : Colors.blue,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text(
                _isRecording ? 'Recording...' : 'Press and hold to record',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
