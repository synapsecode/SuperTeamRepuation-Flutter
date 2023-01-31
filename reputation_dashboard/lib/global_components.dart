import 'package:flutter/material.dart';

class ScrollableTabbedView extends StatefulWidget {
  final List<String> tabNames;
  final List<Widget> tabPages;
  final Widget child;
  final Color selectedTabLabelColor;
  final Color unselectedTabLabelColor;
  const ScrollableTabbedView({
    Key? key,
    required this.tabNames,
    required this.tabPages,
    required this.child,
    this.selectedTabLabelColor = Colors.white,
    this.unselectedTabLabelColor = Colors.white30,
  }) : super(key: key);

  @override
  State<ScrollableTabbedView> createState() => _ScrollableTabbedViewState();
}

class _ScrollableTabbedViewState extends State<ScrollableTabbedView>
    with TickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    if (widget.tabPages.length != widget.tabNames.length) {
      throw Exception('Unequal Lengths of TabNames & TabPages');
    }
    _controller = TabController(
      length: widget.tabNames.length,
      vsync: this,
      initialIndex: 0,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      key: widget.key,
      headerSliverBuilder: (context, value) {
        return [
          SliverToBoxAdapter(
            child: widget.child,
          ),
          SliverToBoxAdapter(
            child: TabBar(
              isScrollable: true,
              unselectedLabelColor: widget.unselectedTabLabelColor,
              labelColor: widget.selectedTabLabelColor,
              controller: _controller,
              tabs: widget.tabNames.map((x) => Tab(text: x)).toList(),
            ),
          ),
        ];
      },
      body: TabBarView(
        controller: _controller,
        children: widget.tabPages
            .map((x) => SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: x,
                ))
            .toList(),
      ),
    );
  }
}

class SimpleBorderlessTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool centeredText;
  final bool obscureText;
  final int maxLines;

  final Function(String)? onChanged;
  const SimpleBorderlessTextfield({
    Key? key,
    this.controller,
    this.obscureText = false,
    this.hintText,
    this.maxLines = 1,
    this.centeredText = false,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      onChanged: onChanged,
      maxLines: obscureText ? 1 : maxLines,
      textAlign: centeredText ? TextAlign.center : TextAlign.start,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white30),
        filled: true,
        fillColor: Colors.white30,
        focusColor: Colors.red,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
}
