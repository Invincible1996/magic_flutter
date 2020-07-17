/*
 * @author kevin
 * @date 2020/6/23 1:37 PM
 * @Description: flutter
*/

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magic_flutter/application.dart';
import 'package:magic_flutter/components/list_item.dart';
import 'package:magic_flutter/pages/download_pdf_page.dart';
import 'package:magic_flutter/pages/draggable_grid_view_page.dart';
import 'package:magic_flutter/pages/draggable_scrollable_sheet_page.dart';
import 'package:magic_flutter/pages/get_test_page.dart';
import 'package:magic_flutter/pages/pdf_view_page.dart';
import 'package:magic_flutter/pages/provider_page.dart';
import 'package:magic_flutter/pages/redux_page.dart';
import 'package:magic_flutter/pages/shop_cart_page.dart';
import 'package:magic_flutter/pages/stepper_page.dart';
import 'package:magic_flutter/pages/tab_bar_page.dart';
import 'package:magic_flutter/pages/void_callback_page.dart';
import 'package:magic_flutter/pages/webview_flutter_page.dart';
import 'package:magic_flutter/pages/wrap_widget_page.dart';
import 'package:magic_flutter/util/route_util.dart';

import 'animated/animated_list_page.dart';
import 'call_native_page.dart';
import 'container_page.dart';
import 'custom_drop_down_menu_page.dart';
import 'custom_paint_page.dart';
import 'custom_regex_page.dart';
import 'custom_tips_page.dart';
import 'exception_page.dart';
import 'extension_method_page.dart';
import 'future_builder_page.dart';
import 'gesture_detector_page.dart';
import 'list_view_page.dart';
import 'login_ui_page.dart';
import 'multiple_choice_page.dart';
import 'multiple_text_field_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Magic Flutter'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.share),
              onPressed: () {
                Get.bottomSheet(Container(
//                  height: 120,
                  width: Application.screenWidth,
                  color: Colors.white,
                ));
//                Get.defaultDialog(
//                    title: 'text',
//                    radius: 5,
//                    onConfirm: () {},
//                    onCancel: () {},
//                    textConfirm: '确认',
//                    textCancel: '取消',
//                    buttonColor: Colors.red,
//                  middleText: '等了好久睡'
//                );
              })
        ],
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            ListItem(
              title: 'download pdf',
              onPress: () => RouteUtil.push(context, page: DownloadPdfPage()),
            ),
            ListItem(
              title: 'ShopCartPage',
              onPress: () => RouteUtil.push(context, page: ShopCartPage()),
            ),
            ListItem(
              title: 'Exception',
              onPress: () => RouteUtil.push(context, page: ExceptionPage()),
            ),
            ListItem(
              title: 'FutureBuilder',
              onPress: () => RouteUtil.push(context, page: FutureBuilderPage()),
            ),
            ListItem(
              title: 'StepperPage',
              onPress: () => RouteUtil.push(context, page: StepperPage()),
            ),
            ListItem(
              title: 'WebView',
              onPress: () =>
                  RouteUtil.push(context, page: WebviewFlutterPage()),
            ),
            ListItem(
              title: 'AnimatedPage',
              onPress: () => RouteUtil.push(context, page: AnimatedListPage()),
            ),
            ListItem(
              title: 'ExtensionMethod',
              onPress: () =>
                  RouteUtil.push(context, page: ExtensionMethodPage()),
            ),
            ListItem(
              title: 'LoginUI',
              onPress: () => RouteUtil.push(context, page: LoginUIPage()),
            ),
            ListItem(
              title: 'ContainerExample',
              onPress: () => RouteUtil.push(context, page: ContainerPage()),
            ),
            ListItem(
              title: 'PDFViewPage',
              onPress: () => RouteUtil.push(context, page: PdfViewPage()),
            ),
            ListItem(
              title: 'CustomPaint',
              onPress: () => RouteUtil.push(context, page: CustomPaintPage()),
            ),
            ListItem(
              title: 'ListViewPage',
              onPress: () => RouteUtil.push(context, page: ListViewPage()),
            ),
            ListItem(
              title: 'CallNative',
              onPress: () => RouteUtil.push(context, page: CallNativePage()),
            ),
            ListItem(
              title: 'TabBar',
              onPress: () => RouteUtil.push(context, page: TabBarPage()),
            ),
            ListItem(
              title: 'Provider',
              onPress: () => RouteUtil.push(context, page: ProviderPage()),
            ),
            ListItem(
              title: 'Paint',
              onPress: () => RouteUtil.push(context, page: CustomPaintPage()),
            ),
            ListItem(
              title: 'GestureDetector',
              onPress: () =>
                  RouteUtil.push(context, page: GestureDetectorPage()),
            ),
            ListItem(
              title: 'CustomDropDownMenu',
              onPress: () =>
                  RouteUtil.push(context, page: CustomDropDownMenuPage()),
            ),
            ListItem(
              title: 'CustomTipsPage',
              onPress: () => RouteUtil.push(context, page: CustomTipsPage()),
            ),
            ListItem(
              title: 'MultipleChoicePage',
              onPress: () =>
                  RouteUtil.push(context, page: MultipleChoicePage()),
            ),
            ListItem(
              title: 'MultipleTextFieldPage',
              onPress: () =>
                  RouteUtil.push(context, page: MultipleTextFieldPage()),
            ),
            ListItem(
              title: 'CustomRegexPage',
              onPress: () => RouteUtil.push(context, page: CustomRegexPage()),
            ),
            ListItem(
              title: 'DownloadPdfPage',
              onPress: () => RouteUtil.push(context, page: DownloadPdfPage()),
            ),
            ListItem(
              title: 'WrapWidget',
              onPress: () => RouteUtil.push(context, page: WrapWidgetPage()),
            ),
            ListItem(
              title: 'Flutter Redux',
              onPress: () => RouteUtil.push(context, page: ReduxPage()),
            ),
            ListItem(
              title: 'VoidCallback',
//              onPress: () => RouteUtil.push(context, page: VoidCallbackPage()),
              onPress: () => Get.to(VoidCallbackPage()),
            ),
            ListItem(
              title: 'DraggableGridViewPage',
              onPress: () =>
                  RouteUtil.push(context, page: DraggableGridViewPage()),
            ),
            ListItem(
                title: 'GetTestPage', onPress: () => Get.to(GetTestPage())),
            ListItem(
                title: 'DraggableScrollableSheet', onPress: () => Get.to(DraggableScrollableSheetPage())),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
