import 'package:flutter/material.dart';

import '../api/Mediafile.dart';

class PoiDetails extends StatefulWidget {
  final String title;
  final String description;
  final List<int> audioDescription;
  final List<Mediafile> mediafiles;

  const PoiDetails(
      {super.key,
      required this.title,
      required this.description,
      required this.audioDescription,
      required this.mediafiles});

  @override
  State<StatefulWidget> createState() {
    return _PoiDetailsState();
  }
}

class _PoiDetailsState extends State<PoiDetails> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < widget.mediafiles.length - 1) {
      _currentPage++;
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _currentPage--;
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: widget.mediafiles.length,
                      itemBuilder: (context, index) {
                        return Image.memory(widget.mediafiles[index].data);
                      },
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: MediaQuery.of(context).size.height * 0.15 - 24,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: _previousPage,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: MediaQuery.of(context).size.height * 0.15 - 24,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_forward_ios),
                      onPressed: _nextPage,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Logic to navigate to the previous PoiDetails
                    },
                    child: const Text('Previous POI'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Logic to navigate to the next PoiDetails
                    },
                    child: const Text('Next POI'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Card(
                child: Text(
                  widget.description,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//TODO finisci di implementare con bloc

/*import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../api/Mediafile.dart';
import '../bloc/poi_details_bloc/poi_details_bloc.dart';

class PoiDetails extends StatelessWidget {
  final String title;
  final String description;
  final List<int> audioDescription;
  final List<Mediafile> mediafiles;

  const PoiDetails(
      {super.key,
        required this.title,
        required this.description,
        required this.audioDescription,
        required this.mediafiles});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PoiDetailsBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: BlocBuilder<PoiDetailsBloc, PoiDetailsState>(
                        builder: (context, state) {
                          return PageView.builder(
                            controller: PageController(initialPage: state.currentPage),
                            itemCount: mediafiles.length,
                            itemBuilder: (context, index) {
                              return Image.memory(mediafiles[index].data);
                            },
                          );
                        },
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: MediaQuery.of(context).size.height * 0.15 - 24,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          context.read<PoiDetailsBloc>().add(PreviousPageEvent());
                        },
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: MediaQuery.of(context).size.height * 0.15 - 24,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_forward_ios),
                        onPressed: () {
                          context.read<PoiDetailsBloc>().add(NextPageEvent());
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Card(
                  child: Text(
                    description,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}*/