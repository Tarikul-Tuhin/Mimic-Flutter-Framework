// Widget tree -> Element tree -> Render tree (Objects that draw on screen)

abstract class Widget {
  const Widget();
  // Every widget must create an Element
  Element createElement();
}

/// Elements are the one that manage the lifecycle of widgets
/// Elements are the one that flutter compares to see if a widget needs to be rebuilt or not
/// the compare is done using canUpdate method
/// the compare happens so that flutter can optimize rebuilds and avoid unnecessary rebuilds
/// only the related parts of the widget tree are rebuilt - that's the main goal of the element tree and widget tree separation (comparison)
abstract class Element {
  Widget widget;
  Element(this.widget);

  /// called when the element is inserted into the tree
  void mount();

  /// called when the element is state changes
  void rebuild();

  /// compares two widgets to see if they can be updated/reused
  bool canUpdate(Widget oldWidget, Widget newWidget) {
    return oldWidget.runtimeType == newWidget.runtimeType;
    // && oldWidget.key == newWidget.key;
  }
}

/// StatelessWidgets are immutable and do not have state
abstract class StatelessWidget extends Widget {
  const StatelessWidget();
  Widget build(BuildContext context);

  @override
  Element createElement() => StatelessElement(this);
}

class StatelessElement extends Element {
  StatelessElement(StatelessWidget widget) : super(widget);

  @override
  void mount() {
    rebuild();
  }

  @override
  void rebuild() {
    final w = (widget as StatelessWidget).build(BuildContext());
    print("StatelessElement rebuilt: $w");
  }
}

/// BuildContext is used to know the location of a widget in the widget tree
/// BuildContext is just a reference to an Element. In real Flutter, context is actually the Element itself.
/// Examples of using BuildContext:
/// Theme.of(context);
/// Navigator.of(context);
/// These are element lookups, they traverse the Element tree upward using the context to find inherited widgets or ancestors.
/// Every time we use context, we are navigating the Element tree, not the widget tree.
class BuildContext {}

/// StatefulWidgets are immutable but have mutable state
abstract class StatefulWidget extends Widget {
  const StatefulWidget();
  State createState();

  @override
  Element createElement() => StatefulElement(this);
}

/// State fields are mutable/changeable
/// State contains a reference of [StatefulElement] so that flutter can reuse it when [StatefulWidget] is rebuilt. Why reuse? To preserve state
/// and trigger rebuilds when setState is called
abstract class State<T extends StatefulWidget> {
  T? widget;
  late StatefulElement _element;

  void initState() {}
  void setState(VoidCallback fn) {
    fn();
    _element.rebuild(); // trigger rebuild
  }

  Widget build(BuildContext context);
}

class StatefulElement extends Element {
  late State state;

  StatefulElement(StatefulWidget widget) : super(widget) {
    state = widget.createState();
    state.widget = widget;
    state._element = this;
    state.initState();
  }

  @override
  void mount() {
    rebuild();
  }

  @override
  void rebuild() {
    final builtWidget = state.build(BuildContext());
    print("StatefulElement rebuilt: $builtWidget");
  }
}

typedef VoidCallback = void Function();
