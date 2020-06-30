part of flutter_loading_button;

enum LoadingButtonState {
  Default,
  Processing,
}

enum LoadingButtonType {
  Raised,
  Flat,
  Outline,
}

class LoadingButton extends StatefulWidget {
  final Widget defaultWidget;
  final Widget loadingWidget;
  final Function onPressed;
  final LoadingButtonType type;
  final Color color;
  final double width;
  final double height;
  final double elevation;
  final double focusElevation;
  final double borderRadius;
  final bool animate;

  LoadingButton({
    Key key,
    this.defaultWidget,
    this.loadingWidget,
    this.onPressed,
    this.type = LoadingButtonType.Raised,
    this.color,
    this.width = double.infinity,
    this.height = 40.0,
    this.elevation = 0.0,
    this.focusElevation = 0.0,
    this.borderRadius = 2.0,
    this.animate = true,
  }) : super(key: key);

  static _LoadingButtonState of(BuildContext context) =>
      context.findAncestorStateOfType();

  @override
  _LoadingButtonState createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton>
    with TickerProviderStateMixin {
  GlobalKey _globalKey = GlobalKey();
  Animation _anim;
  AnimationController _animController;
  Duration _duration = const Duration(milliseconds: 250);
  LoadingButtonState _state;
  double _width;
  double _height;
  double _borderRadius;

  @override
  dispose() {
    _animController?.dispose();
    super.dispose();
  }

  @override
  void deactivate() {
    _reset();
    super.deactivate();
  }

  @override
  void initState() {
    _reset();
    super.initState();
  }

  void _reset() {
    _state = LoadingButtonState.Default;
    _width = widget.width;
    _height = widget.height;
    _borderRadius = widget.borderRadius;
  }

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(_borderRadius),
      child: SizedBox(
        key: _globalKey,
        height: _height,
        width: _width,
        child: _buildChild(context),
      ),
    );
  }

  Widget _buildChild(BuildContext context) {
    EdgeInsets padding = const EdgeInsets.all(0.0);
    Color color = widget.color;
    double elevation = widget.elevation;
    double focusElevation = widget.focusElevation;
    RoundedRectangleBorder shape = RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_borderRadius));

    switch (widget.type) {
      case LoadingButtonType.Raised:
        return RaisedButton(
          padding: padding,
          color: color,
          elevation: elevation,
          focusElevation: focusElevation,
          shape: shape,
          child: _buildChildren(context),
          onPressed: _onButtonPressed(),
        );
      case LoadingButtonType.Flat:
        return FlatButton(
          padding: padding,
          color: color,
          shape: shape,
          child: _buildChildren(context),
          onPressed: _onButtonPressed(),
        );
      case LoadingButtonType.Outline:
        return OutlineButton(
          padding: padding,
          color: color,
          shape: shape,
          child: _buildChildren(context),
          onPressed: _onButtonPressed(),
        );
    }

    return RaisedButton(
      padding: padding,
      color: color,
      elevation: elevation,
      shape: shape,
      child: _buildChildren(context),
      onPressed: _onButtonPressed(),
    );
  }

  Widget _buildChildren(BuildContext context) {
    Widget ret;
    switch (_state) {
      case LoadingButtonState.Default:
        ret = widget.defaultWidget;
        break;
      case LoadingButtonState.Processing:
        ret = widget.loadingWidget ?? widget.defaultWidget;
        break;
    }
    return ret;
  }

  VoidCallback _onButtonPressed() {
    if (widget.onPressed == null) {
      return null;
    }

    return _manageLoadingState;
  }

  Future _manageLoadingState() async {
    if (_state != LoadingButtonState.Default) {
      return;
    }

    // The result of widget.onPressed() will be called as VoidCallback after button status is back to default.
    dynamic onDefault;
    if (widget.animate) {
      _toProcessing();
      _forward((status) {
        if (status == AnimationStatus.dismissed) {
          _toDefault();
          if (onDefault != null &&
              (onDefault is VoidCallback || onDefault is FormFieldValidator)) {
            onDefault();
          }
        }
      });
      onDefault = await widget.onPressed();
      _reverse();
    } else {
      _toProcessing();
      onDefault = await widget.onPressed();
      _toDefault();
      if (onDefault != null &&
          (onDefault is VoidCallback || onDefault is FormFieldValidator)) {
        onDefault();
      }
    }
  }

  void _toProcessing() {
    setState(() {
      _state = LoadingButtonState.Processing;
    });
  }

  void _toDefault() {
    if (mounted) {
      setState(() {
        _state = LoadingButtonState.Default;
      });
    } else {
      _state = LoadingButtonState.Default;
    }
  }

  void _forward(AnimationStatusListener stateListener) {
    double initialWidth = _globalKey.currentContext.size.width;
    double initialBorderRadius = widget.borderRadius;
    double targetWidth = _height;
    double targetBorderRadius = _height / 2;

    _animController = AnimationController(duration: _duration, vsync: this);
    _anim = Tween(begin: 0.0, end: 1.0).animate(_animController)
      ..addListener(() {
        setState(() {
          _width = initialWidth - ((initialWidth - targetWidth) * _anim.value);
          _borderRadius = initialBorderRadius -
              ((initialBorderRadius - targetBorderRadius) * _anim.value);
        });
      })
      ..addStatusListener(stateListener);

    _animController.forward();
  }

  void _reverse() {
    _animController.reverse();
  }
}
