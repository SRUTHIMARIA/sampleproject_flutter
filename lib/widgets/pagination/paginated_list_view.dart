import 'package:flutter/material.dart';

class PaginatedListView<T> extends StatefulWidget {
  final List<T> items;
  final Future<bool> Function() loadMore;
  final bool hasMoreItems;
  final Widget progressWidget;
  final Widget endOfScrollWidget;
  final int debounceTimeInMillis;
  final Widget errorWidget;
  final Widget emptyWidget;
  final int itemCount;
  final bool shrinkWrap;
  final ScrollController? scrollController;
  final Widget Function(T item, int index) child;
  const PaginatedListView({
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
    required this.loadMore,
  }) : super(key: key);

  @override
  State<PaginatedListView<T>> createState() => _PaginatedListVIewState<T>();
}

class _PaginatedListVIewState<F> extends State<PaginatedListView<F>> {
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
    return ListView.builder(
      itemCount: widget.itemCount + 1,
      controller: widget.scrollController == null ? controller : null,
      shrinkWrap: widget.shrinkWrap,
      physics: widget.scrollController == null ? null : const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        if (index == widget.items.length) {
          if (isError) {
            return widget.errorWidget;
          } else if (!widget.hasMoreItems) {
            return widget.endOfScrollWidget;
          } else if (widget.items.isEmpty) {
            return widget.emptyWidget;
          } else if (loadingMore) {
            return widget.progressWidget;
          } else {
            return const SizedBox();
          }
        }

        return widget.child(widget.items[index], index);
      },
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
