
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MusicPortfolioApp());
}

const Color backgroundColor = Color(0xFF070910);
const Color navyColor = Color(0xFF101A30);
const Color blueColor = Color(0xFF527BFF);
const Color goldColor = Color(0xFFD8B477);
const Color mutedColor = Color(0xFFADB4C5);

class MusicPortfolioApp extends StatelessWidget {
  const MusicPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Live Music Portfolio', 
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: backgroundColor,
        fontFamily: 'Arial',
        colorScheme: ColorScheme.fromSeed(
          seedColor: blueColor,
          brightness: Brightness.dark,
        ),
      ),
      home: const PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatelessWidget {
  const PortfolioHomePage({super.key});

  static const List<String> sectionIds = [
    'cafe-crowd',
    'bhajan',
    'college',
    'others',
    'images',
    'contact',
  ];

  final List<VideoItem> cafeCrowdVideos = const [
    VideoItem(title: 'Cafe 01', video: 'assets/videos/Cafe_01.MOV', cover: 'assets/images/Cafeimg_01.PNG'),
    VideoItem(title: 'Cafe 02', video: 'assets/videos/Cafe_02.MOV', cover: 'assets/images/Cafeimg_02.PNG'),
    VideoItem(title: 'Cafe 03', video: 'assets/videos/Cafe_03.MOV', cover: 'assets/images/Cafeimg_03.PNG'),
    VideoItem(title: 'Cafe 04', video: 'assets/videos/Cafe_04.MOV', cover: 'assets/images/Cafeimg_04.PNG'),
    VideoItem(title: 'Cafe 05', video: 'assets/videos/Cafe_05.MOV', cover: 'assets/images/Cafeimg_05.PNG'),
    VideoItem(title: 'Cafe 06', video: 'assets/videos/Cafe_06.MOV', cover: 'assets/images/Cafeimg_06.PNG'),
  ];

  
  final List<VideoItem> bhajanVideos = const [
    VideoItem(
      title: 'Bhajan Jamming 01',
      video: 'assets/videos/Bhajan_01.MOV',
      cover: 'assets/images/Bhajanimg_01.PNG',
    ),
    VideoItem(
      title: 'Bhajan Jamming 02',
      video: 'assets/videos/Bhajan_02.MOV',
      cover: 'assets/images/Bhajanimg_02.PNG',
    ),
    VideoItem(
      title: 'Bhajan Jamming 03',
      video: 'assets/videos/Bhajan_03.MOV',
      cover: 'assets/images/Bhajanimg_03.PNG',
    ),
    VideoItem(
      title: 'Bhajan Jamming 04',
      video: 'assets/videos/Bhajan_04.MOV',
      cover: 'assets/images/Bhajanimg_04.PNG',
    ),
    VideoItem(
      title: 'Bhajan Jamming 05',
      video: 'assets/videos/Bhajan_05.MOV',
      cover: 'assets/images/Bhajanimg_05.PNG',
    ),
    VideoItem(
      title: 'Bhajan Jamming 06',
      video: 'assets/videos/Bhajan_06.MOV',
      cover: 'assets/images/Bhajanimg_06.PNG',
    ),
  ];


  final List<VideoItem> collegeEventVideos = const [
    VideoItem(title: 'College 01', video: 'assets/videos/College_01.MOV', cover: 'assets/images/Collegeimg_01.PNG'),
    VideoItem(title: 'College 02', video: 'assets/videos/College_02.MOV', cover: 'assets/images/Collegeimh_02.PNG'),
    VideoItem(title: 'College 03', video: 'assets/videos/College_03.MOV', cover: 'assets/images/Collegeimg_03.PNG'),
    VideoItem(title: 'College 04', video: 'assets/videos/College_04.MOV', cover: 'assets/images/Collegeimg_04.PNG'),
  ];

  final List<VideoItem> otherVideos = const [
    VideoItem(title: 'Others 01', video: 'assets/videos/Others_01.MOV', cover: 'assets/images/Othersimg_01.PNG'),
    VideoItem(title: 'Others 02', video: 'assets/videos/Others_02.MOV', cover: 'assets/images/Othersimg_03.PNG'),
    VideoItem(title: 'Others 03', video: 'assets/videos/Others_03.MOV', cover: 'assets/images/Othersimg_02.PNG'),
  ];

  // Existing cover images are also used as the photo gallery until you add separate photos.
  
final List<String> galleryImages = const [
  'assets/Gallery/Gallery_01.PNG',
  'assets/Gallery/Gallery_02.PNG',
  'assets/Gallery/Gallery_03.PNG',
  'assets/Gallery/Gallery_04.PNG',
  'assets/Gallery/Gallery_05.PNG',
  'assets/Gallery/Gallery_06.PNG',
  'assets/Gallery/Gallery_07.PNG',
  'assets/Gallery/Gallery_08.PNG',
  'assets/Gallery/Gallery_09.PNG',
  'assets/Gallery/Gallery_10.PNG',
];


  void scrollToSection(BuildContext context, String id) {
    final sectionContext = sectionKeys[id]?.currentContext;
    if (sectionContext != null) {
      Scrollable.ensureVisible(
        sectionContext,
        duration: const Duration(milliseconds: 650),
        curve: Curves.easeInOut,
      );
    }
  }

  static final Map<String, GlobalKey> sectionKeys = {
    for (final id in sectionIds) id: GlobalKey(),
    'home': GlobalKey(),
  };

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 700;

        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                floating: false,
                backgroundColor: backgroundColor,
                surfaceTintColor: backgroundColor,
                toolbarHeight: 72,
                title: GestureDetector(
                  onTap: () => scrollToSection(context, 'home'),
                  child: const Text(
                    'Misthaa',
                    style: TextStyle(
                      fontSize: 13,
                      letterSpacing: 2.5,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                
              ),
              SliverToBoxAdapter(
                child: Container(
                  key: sectionKeys['home'],
                  child: _buildHero(context, isMobile),
                ),
              ),
              SliverToBoxAdapter(
                child: _buildMusicSection(
                  context,
                  id: 'cafe-crowd',
                  eyebrow: 'LIVE. CLOSE. PERSONAL.',
                  title: 'Cafes & Crowd Walk',
                  description:
                      'Cafe performances, crowd walks, and candid moments '
                      'connecting music with the audience.',
                  items: cafeCrowdVideos,
                  accent: blueColor,
                ),
              ),
              SliverToBoxAdapter(
                child: _buildMusicSection(
                  context,
                  id: 'bhajan',
                  eyebrow: 'MUSIC THAT TOUCHES THE SOUL',
                  title: 'Bhajan Jamming',
                  description:
                      'Soulful devotional music, heartfelt bhajans, '
                      'and moments of collective devotion.',
                  items: bhajanVideos,
                  accent: goldColor,
                ),
              ),
              SliverToBoxAdapter(
                child: _buildMusicSection(
                  context,
                  id: 'college',
                  eyebrow: 'CAMPUS. CROWD. LIVE MUSIC.',
                  title: 'College Events',
                  description:
                      'College festivals, campus performances, and '
                      'high-energy live event moments.',
                  items: collegeEventVideos,
                  accent: blueColor,
                ),
              ),
              SliverToBoxAdapter(
                child: _buildMusicSection(
                  context,
                  id: 'others',
                  eyebrow: 'MORE MOMENTS ON STAGE',
                  title: 'Others',
                  description:
                      'More live performances and special musical moments '
                      'that do not fit into the other categories.',
                  items: otherVideos,
                  accent: goldColor,
                ),
              ),
              SliverToBoxAdapter(
                child: _buildImagesSection(context, isMobile),
              ),
              SliverToBoxAdapter(
                child: _buildContactSection(context),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _openVideo(BuildContext context, VideoItem item) async {
    final controller = VideoPlayerController.asset(item.video);
    try {
      await controller.initialize();
      controller.setLooping(true);
      if (!context.mounted) {
        await controller.dispose();
        return;
      }
      await showDialog<void>(
        context: context,
        barrierColor: Colors.black87,
        builder: (dialogContext) => Dialog(
          backgroundColor: const Color(0xFF090B12),
          insetPadding: const EdgeInsets.all(18),
          child: StatefulBuilder(
            builder: (dialogContext, setDialogState) {
              return ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900, maxHeight: 650),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Expanded(child: Text(item.title, style: const TextStyle(fontWeight: FontWeight.bold))),
                          IconButton(
                            tooltip: 'Close',
                            onPressed: () => Navigator.of(dialogContext).pop(),
                            icon: const Icon(Icons.close),
                          ),
                        ],
                      ),
                      Flexible(
                        child: AspectRatio(
                          aspectRatio: controller.value.aspectRatio,
                          child: VideoPlayer(controller),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            tooltip: controller.value.isPlaying ? 'Pause' : 'Play',
                            onPressed: () {
                              setDialogState(() {
                                controller.value.isPlaying ? controller.pause() : controller.play();
                              });
                            },
                            iconSize: 32,
                            icon: Icon(controller.value.isPlaying ? Icons.pause_circle_filled : Icons.play_circle_fill),
                          ),
                          IconButton(
                            tooltip: controller.value.volume > 0 ? 'Sound off' : 'Sound on',
                            onPressed: () {
                              setDialogState(() {
                                controller.setVolume(controller.value.volume > 0 ? 0 : 1);
                              });
                            },
                            iconSize: 28,
                            icon: Icon(controller.value.volume > 0 ? Icons.volume_up : Icons.volume_off),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      );
    } catch (error) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not play this video. Try converting it to MP4 (H.264).')),
        );
      }
    } finally {
      await controller.dispose();
    }
  }



  Widget _buildHero(BuildContext context, bool isMobile) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        isMobile ? 24 : 70,
        isMobile ? 30 : 50,
        isMobile ? 24 : 70,
        35,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF111B35),
            backgroundColor,
          ],
        ),
      ),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Image.asset(
                      'assets/logo.png',
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                _buildHeroContent(context, isMobile),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Profile image on the LEFT
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/logo.png',
                    width: 220,
                    height: 260,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 45),

                // Hero text and buttons on the RIGHT
                Expanded(
                  child: _buildHeroContent(context, isMobile),
                ),
              ],
            ),
    );
  }

  Widget _buildHeroContent(BuildContext context, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Misthaa',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 14),
        Text(
          'Singer & Live Performer',
          style: TextStyle(
            fontSize: isMobile ? 28 : 38,
            fontWeight: FontWeight.w700,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Surat-based artist · Available for shows across India',
          style: TextStyle(
            color: mutedColor,
            fontSize: 13,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 12,
          runSpacing: 10,
          children: [
            FilledButton.icon(
              onPressed: () =>
                  scrollToSection(context, 'cafe-crowd'),
              style: FilledButton.styleFrom(
                backgroundColor: blueColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 14,
                ),
              ),
              icon: const Icon(Icons.play_arrow_rounded),
              label: const Text('Explore Performances'),
            ),
            OutlinedButton(
              onPressed: () =>
                  scrollToSection(context, 'contact'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: Colors.white38),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 14,
                ),
              ),
              child: const Text('Contact'),
            ),
          ],
        ),
        const SizedBox(height: 18),
        const Text(
          'I bring people together through music, from soulful '
          'melodies to lively live performances.',
          style: TextStyle(
            color: mutedColor,
            fontSize: 13,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 22),
        Center(
          child: Column(
            children: [
              const Text(
                'SCROLL DOWN TO EXPLORE MORE',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 10,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 5),
              Icon(
                Icons.keyboard_arrow_down_rounded,
                color: blueColor,
                size: 23,
              ),
              const SizedBox(height: 3),
              const Text(
                'Discover more performances and music genres',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: mutedColor,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }


  Widget _buildMusicSection(
    BuildContext context, {
    required String id,
    required String eyebrow,
    required String title,
    required String description,
    required List<VideoItem> items,
    required Color accent,
  }) {
    return Container(
      key: sectionKeys[id],
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 65,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                eyebrow,
                style: TextStyle(
                  color: accent,
                  fontSize: 10,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 13),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.7,
                ),
              ),
              const SizedBox(height: 12),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 520),
                child: Text(
                  description,
                  style: const TextStyle(
                    color: mutedColor,
                    height: 1.7,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              
              LayoutBuilder(
                builder: (context, constraints) {
                  final isMobile = constraints.maxWidth < 700;
                  final cardWidth = isMobile ? 260.0 : 310.0;

                  return SizedBox(
                    height: isMobile ? 375 : 440,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: items.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 16),
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: cardWidth,
                          child: _PerformanceCard(
                            item: items[index],
                            number: '${index + 1}'.padLeft(2, '0'),
                            accent: accent,
                            onTap: () => _openVideo(context, items[index]),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImagesSection(BuildContext context, bool isMobile) {
    return Container(
      key: sectionKeys['images'],
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 48,
        vertical: 65,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'BEHIND THE MUSIC',
                style: TextStyle(
                  color: goldColor,
                  fontSize: 10,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 13),
              const Text(
                'Photo Gallery',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.7,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'A few moments, memories, and stories from the stage.',
                style: TextStyle(
                  color: mutedColor,
                  height: 1.7,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 28),
              SizedBox(
                height: isMobile ? 245 : 330,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: galleryImages.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 16),
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: isMobile ? 180 : 245,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.asset(
                              galleryImages[index],
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        navyColor,
                                        blueColor.withValues(alpha: 0.25),
                                        const Color(0xFF090B12),
                                      ],
                                    ),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.photo_camera_outlined,
                                      color: Colors.white38,
                                      size: 36,
                                    ),
                                  ),
                                );
                              },
                            ),
                            DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Colors.black.withValues(alpha: 0.55),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 14,
                              right: 14,
                              bottom: 14,
                              child: Text(
                                'Misthaa  ·  ${(index + 1).toString().padLeft(2, '0')}',
                                style: const TextStyle(
                                  fontSize: 10,
                                  letterSpacing: 1.4,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactSection(BuildContext context) {
    return Container(
      key: sectionKeys['contact'],
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 70,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF152344), backgroundColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          const Icon(
            Icons.graphic_eq,
            size: 42,
            color: blueColor,
          ),
          const SizedBox(height: 22),
          const Text(
            'LET THE MUSIC BRING US TOGETHER.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF9BB7FF),
              fontSize: 10,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 18),
          const Text(
            "Let's Make Your\nEvent Memorable.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 35,
              height: 1.15,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 18),
          const Text(
            'Live music for celebrations, cafes, devotional events, '
            'and special occasions.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: mutedColor,
              height: 1.7,
            ),
          ),
          const SizedBox(height: 28),
          FilledButton.icon(
            onPressed: () async {
              final Uri url = Uri.parse(
                'https://wa.me/917220030016?text=Hi%2C%20I%20just%20got%20an%20inquiry%20about%20bookings.',
              );

              await launchUrl(
                url,
                mode: LaunchMode.platformDefault,
              );
            },
            style: FilledButton.styleFrom(
              backgroundColor: blueColor,
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 18,
              ),
            ),
            icon: const Icon(Icons.mail_outline),
            label: const Text('Enquire About Bookings'),
          ),
          const SizedBox(height: 45),
          const Divider(color: Colors.white12),
          const SizedBox(height: 20),
          const Text(
            'Misthaa',
            style: TextStyle(
              letterSpacing: 3,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 12),
          

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () async {
                  final Uri url = Uri.parse(
                    'https://wa.me/917220030016?text=Hi%2C%20I%20just%20got%20an%20inquiry%20about%20bookings.',
                  );
                  await launchUrl(url);
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.whatsapp,
                      color: mutedColor,
                      size: 16,
                    ),
                    SizedBox(width: 6),
                    Text(
                      'Contact',
                      style: TextStyle(
                        color: mutedColor,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 14),
              const Text(
                '·',
                style: TextStyle(color: mutedColor, fontSize: 12),
              ),
              const SizedBox(width: 14),
              InkWell(
                onTap: () async {
                  final Uri url = Uri.parse(
                    'https://www.instagram.com/misthaa.live/',
                  );
                  await launchUrl(url);
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.instagram,
                      color: mutedColor,
                      size: 16,
                    ),
                    SizedBox(width: 6),
                    Text(
                      'Instagram',
                      style: TextStyle(
                        color: mutedColor,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}

class VideoItem {
  final String title;
  final String video;
  final String cover;

  const VideoItem({required this.title, required this.video, required this.cover});
}

class _PerformanceCard extends StatelessWidget {
  final VideoItem item;
  final String number;
  final Color accent;
  final VoidCallback onTap;

  const _PerformanceCard({
    required this.item,
    required this.number,
    required this.accent,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.72,
      child: Material(
        color: const Color(0xFF101522),
        borderRadius: BorderRadius.circular(12),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                item.cover,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [accent.withValues(alpha: 0.3), navyColor, backgroundColor],
                    ),
                  ),
                  child: const Center(child: Icon(Icons.image_not_supported_outlined, size: 36, color: Colors.white38)),
                ),
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black.withValues(alpha: 0.05), Colors.transparent, Colors.black.withValues(alpha: 0.85)],
                    stops: const [0, 0.35, 1],
                  ),
                ),
              ),
              Positioned(
                top: 18,
                left: 18,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Colors.black.withValues(alpha: 0.55), shape: BoxShape.circle),
                  child: const Icon(Icons.play_arrow_rounded, size: 30, color: Colors.white),
                ),
              ),
              Positioned(
                left: 18,
                right: 18,
                bottom: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.title, style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 7),
                    const Text('Tap to watch', style: TextStyle(color: Color.fromARGB(179, 231, 152, 47), fontSize: 11)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
