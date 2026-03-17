import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:clone_guidepass/config/app_theme.dart';
import 'package:clone_guidepass/models/tour_spot.dart';

class PoiDetailScreen extends StatefulWidget {
  final TourSpot spot;

  const PoiDetailScreen({super.key, required this.spot});

  @override
  State<PoiDetailScreen> createState() => _PoiDetailScreenState();
}

class _PoiDetailScreenState extends State<PoiDetailScreen> {
  late final AudioPlayer _player;
  Duration _position = Duration.zero;
  Duration _duration = Duration.zero;
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _initAudio();
  }

  Future<void> _initAudio() async {
    if (widget.spot.audioPath == null) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Không có audio cho điểm này';
      });
      return;
    }

    try {
      final duration = await _player.setAsset(widget.spot.audioPath!);
      if (duration != null && mounted) {
        setState(() {
          _duration = duration;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _errorMessage = 'Không thể tải audio';
        });
      }
    }

    _player.positionStream.listen((pos) {
      if (mounted) {
        setState(() {
          _position = pos;
        });
      }
    });

    _player.durationStream.listen((dur) {
      if (dur != null && mounted) {
        setState(() {
          _duration = dur;
        });
      }
    });

    _player.playerStateStream.listen((state) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  String _formatDuration(Duration d) {
    final mins = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final secs = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$mins:$secs';
  }

  Future<void> _togglePlay() async {
    if (_player.playing) {
      await _player.pause();
    } else {
      await _player.play();
    }
  }

  Future<void> _seek(double value) async {
    await _player.seek(Duration(milliseconds: value.toInt()));
  }

  @override
  Widget build(BuildContext context) {
    final isPlaying = _player.playing;
    final posMs = _position.inMilliseconds.toDouble();
    final durMs = _duration.inMilliseconds.toDouble();

    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        backgroundColor: AppTheme.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppTheme.textDark),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          '${widget.spot.id}-${widget.spot.name}',
          style: const TextStyle(
            color: AppTheme.textDark,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // ── Image ──
          Expanded(
            child: Container(
              width: double.infinity,
              color: const Color(0xFFF9F9F9),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(AppTheme.spacingMD),
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(AppTheme.radiusSmall),
                    child: Image.asset(
                      widget.spot.imagePath,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: double.infinity,
                          height: 250,
                          color: const Color(0xFFE8E8E8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.image_outlined,
                                  size: 64, color: Colors.grey[400]),
                              const SizedBox(height: 12),
                              Text(
                                widget.spot.name,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),

          // ── Audio Player ──
          Container(
            decoration: const BoxDecoration(
              color: AppTheme.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, -2),
                ),
              ],
            ),
            padding: const EdgeInsets.fromLTRB(
              AppTheme.spacingMD,
              AppTheme.spacingLG,
              AppTheme.spacingMD,
              AppTheme.spacingXL,
            ),
            child: SafeArea(
              top: false,
              child: _buildAudioControls(isPlaying, posMs, durMs),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAudioControls(bool isPlaying, double posMs, double durMs) {
    if (_isLoading) {
      return const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
          SizedBox(width: 12),
          Text('Đang tải audio...'),
        ],
      );
    }

    if (_errorMessage != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.info_outline, color: Colors.grey[400], size: 20),
          const SizedBox(width: 8),
          Text(
            _errorMessage!,
            style: TextStyle(color: Colors.grey[500], fontSize: 14),
          ),
        ],
      );
    }

    return Row(
      children: [
        // Play/Pause
        GestureDetector(
          onTap: _togglePlay,
          child: Container(
            width: 44,
            height: 44,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppTheme.textDark,
            ),
            child: Icon(
              isPlaying ? Icons.pause : Icons.play_arrow,
              color: AppTheme.white,
              size: 24,
            ),
          ),
        ),
        const SizedBox(width: 12),
        // Time
        Text(
          _formatDuration(_position),
          style: const TextStyle(
            fontSize: 13,
            color: AppTheme.textBody,
            fontFamily: 'monospace',
          ),
        ),
        Text(
          '/${_formatDuration(_duration)}',
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey[400],
            fontFamily: 'monospace',
          ),
        ),
        const SizedBox(width: 12),
        // Slider
        Expanded(
          child: SliderTheme(
            data: SliderThemeData(
              activeTrackColor: AppTheme.textDark,
              inactiveTrackColor: Colors.grey[300],
              thumbColor: AppTheme.textDark,
              thumbShape: const RoundSliderThumbShape(
                enabledThumbRadius: 6,
              ),
              trackHeight: 2,
              overlayShape: const RoundSliderOverlayShape(
                overlayRadius: 14,
              ),
            ),
            child: Slider(
              value: posMs.clamp(0, durMs > 0 ? durMs : 1),
              min: 0,
              max: durMs > 0 ? durMs : 1,
              onChanged: _seek,
            ),
          ),
        ),
      ],
    );
  }
}
