/*
 * @author kevin
 * @date 2020/7/16 1:34 下午
 * @Description: flutter
*/

import 'package:drag_select_grid_view/drag_select_grid_view.dart';
import 'package:flutter/material.dart';

class DraggableGridViewPage extends StatefulWidget {
  @override
  _DraggableGridViewPageState createState() => _DraggableGridViewPageState();
}

class _DraggableGridViewPageState extends State<DraggableGridViewPage> {
  final controller = DragSelectGridViewController();

  @override
  void initState() {
    super.initState();
    controller.addListener(scheduleRebuild);
  }

  @override
  void dispose() {
    controller.removeListener(scheduleRebuild);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SelectionAppBar(
        selection: controller.selection,
      ),
      body: DragSelectGridView(
        gridController: controller,
        itemCount: 20,
        itemBuilder: (context, index, selected) {
          return SelectableItem(
            color: Colors.blue,
            index: index,
            selected: selected,
          );
        },
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 80,
        ),
      ),
    );
  }

  void scheduleRebuild() => setState(() {});
}

class SelectableItem extends StatefulWidget {
  const SelectableItem({
    Key key,
    @required this.index,
    @required this.color,
    @required this.selected,
  }) : super(key: key);

  final int index;
  final MaterialColor color;
  final bool selected;

  @override
  _SelectableItemState createState() => _SelectableItemState();
}

class _SelectableItemState extends State<SelectableItem>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      value: widget.selected ? 1 : 0,
      duration: kThemeChangeDuration,
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
      ),
    );
  }

  @override
  void didUpdateWidget(SelectableItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selected != widget.selected) {
      if (widget.selected) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Container(
          child: Transform.scale(
            scale: _scaleAnimation.value,
            child: DecoratedBox(
              child: child,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: calculateColor(),
              ),
            ),
          ),
        );
      },
      child: Container(
        alignment: Alignment.center,
        child: Text(
          'Item\n#${widget.index}',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }

  Color calculateColor() {
    return Color.lerp(
      widget.color.shade500,
      widget.color.shade900,
      _controller.value,
    );
  }
}

class SelectionAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SelectionAppBar({
    Key key,
    this.title,
    this.selection = Selection.empty,
  })  : assert(selection != null),
        super(key: key);

  final Widget title;
  final Selection selection;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: kThemeAnimationDuration,
      child: selection.isSelecting
          ? AppBar(
              key: const Key('selecting'),
              titleSpacing: 0,
              leading: const CloseButton(),
              title: Text('${selection.amount} item(s) selected…'),
            )
          : AppBar(
              key: const Key('not-selecting'),
              title: title,
            ),
    );
  }
}
