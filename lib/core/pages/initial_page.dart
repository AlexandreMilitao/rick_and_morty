import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/core/constants/app_assets.dart';
import 'package:rick_and_morty/core/style/my_colors.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () async {
      goToCharactersListPage();
    });
  }

  void goToCharactersListPage() {
    GoRouter.of(context).go('/charactersList');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.color1,
      body: Center(
        child: Stack(
          children: [PortalAnimationWidgetState(), LogoAnimationWidget()],
        ),
      ),
    );
  }
}

class LogoAnimationWidget extends StatefulWidget {
  const LogoAnimationWidget({super.key});

  @override
  State<LogoAnimationWidget> createState() => _LogoAnimationWidgetState();
}

class _LogoAnimationWidgetState extends State<LogoAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _scaleAnimation = Tween<double>(
      begin: 0.1,
      end: 1.2,
    ).chain(CurveTween(curve: Curves.easeInOut)).animate(_controller);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.stop();
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: SvgPicture.asset(AppAssets.logo, height: 100),
      ),
    );
  }
}

class PortalAnimationWidgetState extends StatefulWidget {
  const PortalAnimationWidgetState({super.key});

  @override
  State<PortalAnimationWidgetState> createState() =>
      _PortalAnimationWidgetStateState();
}

class _PortalAnimationWidgetStateState extends State<PortalAnimationWidgetState>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.repeat();
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RotationTransition(
        turns: _scaleAnimation,
        child: Image.asset(AppAssets.portal, height: 350),
      ),
    );
  }
}
