import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pureair_v2/config/config.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class CachedNetworkImage extends StatefulWidget {
  final String imageUrl;
  final BoxFit fit;
  final Widget? placeholder;

  const CachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.placeholder,
  });

  @override
  State<CachedNetworkImage> createState() => _CachedNetworkImageState();
}

class _CachedNetworkImageState extends State<CachedNetworkImage> {
  final MemoryCache _imageCache = MemoryCache();
  Uint8List? _imageData;
  final Dio _dio = Dio(BaseOptions(responseType: ResponseType.bytes));

  @override
  Widget build(BuildContext context) {
    if (_imageData != null) {
      return _buildImage();
    } else {
      return widget.placeholder ?? _buildDefaultPlaceholder();
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadImage();
    });
  }

  Widget _buildDefaultPlaceholder() {
    return Shimmer(child: Container(color: Colors.grey));
  }

  Widget _buildImage() {
    return Image.memory(_imageData!, fit: widget.fit);
  }

  Future<void> _loadImage() async {
    final cachedImage = _imageCache.get(widget.imageUrl);
    if (cachedImage != null) {
      setState(() {
        _imageData = cachedImage;
      });
    } else {
      try {
        final response = await _dio.get<List<int>>(widget.imageUrl);
        final imageData = Uint8List.fromList(response.data!);
        _imageCache.set(widget.imageUrl, imageData);
        if (mounted) {
          setState(() {
            _imageData = imageData;
          });
        }
      } catch (e) {
        print('Error loading image: $e');
      }
    }
  }
}
