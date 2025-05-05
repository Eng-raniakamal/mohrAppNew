import 'package:essmohr/data/mapper/mapper.dart';
import 'package:essmohr/presentation/resources/assets_manager.dart';
import 'package:essmohr/presentation/resources/colors.dart';
import 'package:essmohr/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:easy_localization/easy_localization.dart';

enum StateRendererType {
  // POPUP STATES
  POPUP_LOADING_STATE,
  POPUP_ERROR_STATE,
  POPUP_SUCCESS,
  // FULL SCREEN STATES
  FULL_SCREEN_LOADING_STATE,
  FULL_SCREEN_ERROR_STATE,
  CONTENT_SCREEN_STATE, // THE UI OF THE SCREEN
  EMPTY_SCREEN_STATE // EMPTY VIEW WHEN WE RECEIVE NO DATA FROM API SIDE FOR LIST SCREEN
}

class StateRenderer extends StatefulWidget {
  StateRendererType? stateRendererType;
  String message;
  String title;
  Function? retryActionFunction;
  Function onPopupClick;

  StateRenderer(
      {Key? key,
      required this.stateRendererType,
      required this.onPopupClick,
      String? message,
      String? title,
      required this.retryActionFunction})
      : message = message ?? AppStrings.loading.tr(),
        title = title ?? EMPTY,
        super(key: key);

  @override
  State<StateRenderer> createState() => _StateRendererState();
}

class _StateRendererState extends State<StateRenderer> {
  @override
  Widget build(BuildContext context) {
    return _getStateWidget(context, widget.onPopupClick);
  }

  Widget _getStateWidget(BuildContext context, Function onPopupClick) {
    switch (widget.stateRendererType) {
      case StateRendererType.POPUP_LOADING_STATE:
        return _getPopUpDialog(
            context, [_getAnimatedImage(JsonAssets.loading)]);
      case StateRendererType.POPUP_ERROR_STATE:
        return _getPopUpDialog(context, [
          _getAnimatedImage(JsonAssets.error),
          _getMessage(widget.message),
          _getRetryButton(AppStrings.ok.tr(), context, onPopupClick)
        ]);
      case StateRendererType.POPUP_SUCCESS:
        return _getPopUpDialog(context, [
          _getAnimatedImage(JsonAssets.success),
          _getMessage(widget.title),
          _getMessage(widget.message),
          _getRetryButton(AppStrings.ok.tr(), context, onPopupClick)
        ]);
      case StateRendererType.FULL_SCREEN_LOADING_STATE:
        return _getItemsInColumn(
            [_getAnimatedImage(JsonAssets.loading), _getMessage(widget.message)]);
      case StateRendererType.FULL_SCREEN_ERROR_STATE:
        return _getItemsInColumn([
          _getAnimatedImage(JsonAssets.error),
          _getMessage(widget.message),
          _getRetryButton(AppStrings.retry_again.tr(), context, onPopupClick)
        ]);
      case StateRendererType.CONTENT_SCREEN_STATE:
        return Container();
      case StateRendererType.EMPTY_SCREEN_STATE:
        return _getItemsInColumn(
            [_getAnimatedImage(JsonAssets.empty), _getMessage(widget.message)]);
      default:
        return Container();
    }
  }

  Widget _getPopUpDialog(BuildContext context, List<Widget> children) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14)),
      elevation: 15,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            color: colorManager.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(14),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 12,
                  offset: Offset(0, 12))
            ]),
        child: _getDialogContent(context, children),
      ),
    );
  }

  Widget _getDialogContent(BuildContext context, List<Widget> children) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _getAnimatedImage(String animationName) {
    return SizedBox(
      height: 100,
      width: 100,
      child: Lottie.asset(animationName),
    );
  }

  Widget _getMessage(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Text(
          message,
          // style:
            // style(color: colorManager.black, fontSize: 16),
        ),
      ),
    );
  }

  Widget _getRetryButton(String buttonTitle, BuildContext context, Function onClick) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: SizedBox(
          width: 180,
          child: ElevatedButton(
              onPressed: () {
                if (widget.stateRendererType ==
                    StateRendererType.FULL_SCREEN_ERROR_STATE) {
                  widget.retryActionFunction
                      ?.call(); // to call the API function again to retry
                } else {
                  Navigator.of(context)
                      .pop(); // popup state error so we need to dismiss the dialog
                  onClick();
                }
              },
              child: Text(buttonTitle)),
        ),
      ),
    );
  }

  Widget _getItemsInColumn(List<Widget> children) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    );
  }
}
