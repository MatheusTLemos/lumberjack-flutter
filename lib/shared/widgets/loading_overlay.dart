import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoadingOverlay extends StatefulWidget {
  const LoadingOverlay({super.key});

  @override
  State<LoadingOverlay> createState() => _LoadingOverlayState();
}

class _LoadingOverlayState extends State<LoadingOverlay>
    with SingleTickerProviderStateMixin {
  late int index;
  late final Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
        const Duration(
          seconds: 3,
        ), (timer) {
      setState(() {
        index++;
      });
    });
    index = 0;
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  _getImageFromIndex(int index) {
    String imageSource = '';
    switch (index % 3) {
      case 0:
        imageSource = 'assets/images/space-invader.svg';
        break;
      case 1:
        imageSource = 'assets/images/ghost.svg';
        break;
      case 2:
        imageSource = 'assets/images/triforce.svg';
        break;
    }
    return SvgPicture.asset(
      imageSource,
      width: 100,
      height: 100,
      colorFilter: ColorFilter.mode(
        Theme.of(context).primaryColor,
        BlendMode.srcIn,
      ),
      semanticsLabel: AppLocalizations.of(context)!.loadingIconDescription,
      key: UniqueKey(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedSwitcher(
            duration: const Duration(seconds: 1),
            child: _getImageFromIndex(index),
          ),
          Text(
            AppLocalizations.of(context)!.loading,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
