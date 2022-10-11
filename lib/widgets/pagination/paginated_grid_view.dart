import 'package:flutter/material.dart';

class PaginatedGridView<T> extends StatefulWidget {
  final List<T> items;
  final Future<bool> Function() loadMore;
  final bool hasMoreItems;
  final Widget progressWidget;
  final Widget endOfScrollWidget;
  final int debounceTimeInMillis;
  final Widget errorWidget;
  final Widget emptyWidget;
  final int itemCount;
  final SliverGridDelegate gridDelegate;
  final bool shrinkWrap;
  final ScrollController? scrollController;
  final Widget Function(T item, int index) child;
  const PaginatedGridView({
    required this.hasMoreItems,
    this.progressWidget = const Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(height: 50, width: 50, child: CircularProgressIndicator()),
    ),
    required this.items,
    this.endOfScrollWidget = const SizedBox(height: 20),
    Key? key,
    required this.child,
    this.errorWidget = const _ErrorWidget(),
    this.emptyWidget = const Text('Empty list'),
    this.debounceTimeInMillis = 250,
    required this.itemCount,
    this.shrinkWrap = false,
    this.scrollController,
    required this.gridDelegate,
    required this.loadMore,
  }) : super(key: key);

  @override
  State<PaginatedGridView<T>> createState() => _PaginatedGridViewState<T>();
}

class _PaginatedGridViewState<F> extends State<PaginatedGridView<F>> {
  late ScrollController controller;
  bool loadingMore = false;
  bool relaxing = false;
  bool isError = false;

  @override
  void initState() {
    widget.scrollController == null ? controller = ScrollController() : controller = widget.scrollController!;
    controller.addListener(listener);
    super.initState();
  }

  void listener() async {
    if (controller.position.pixels >= controller.position.maxScrollExtent - 50 &&
        !loadingMore &&
        widget.hasMoreItems &&
        !relaxing) {
      relaxing = true;
      if (relaxing) {
        Future.delayed(Duration(milliseconds: widget.debounceTimeInMillis), () => relaxing = false);
      }

      setState(() {
        if (mounted) loadingMore = true;
      });

      isError = await widget.loadMore();
      setState(() {
        if (mounted) loadingMore = false;
      });
    }
  }

  @override
  void dispose() {
    if (widget.scrollController == null) controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
          gridDelegate: widget.gridDelegate,
          itemCount: widget.itemCount,
          controller: widget.scrollController == null ? controller : null,
          shrinkWrap: widget.shrinkWrap,
          physics: widget.scrollController == null ? null : const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return widget.child(widget.items[index], index);
          },
        ),
        if (isError)
          widget.errorWidget
        else if (!widget.hasMoreItems)
          widget.endOfScrollWidget
        else if (widget.items.isEmpty)
          widget.emptyWidget
        else if (loadingMore)
          widget.progressWidget
        else
          const SizedBox(),
      ],
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(padding: EdgeInsets.symmetric(vertical: 8), child: Text('Failed to load more data.')),
    );
  }
}
