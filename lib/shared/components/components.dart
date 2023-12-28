// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, non_constant_identifier_names, avoid_types_as_parameter_names, avoid_print, unused_element, unused_local_variable

import 'package:flutter/material.dart';
import 'package:news_app/modules/web_view_screen.dart';
import 'package:webview_universal/webview_controller/webview_controller.dart';

Widget newsListBuild(context, articles) {
  WebViewController webViewController = WebViewController();
  Future<void> webView() async {
    await webViewController.init(
      context: context,
      uri: Uri.parse(articles['url']),
      setState: (void Function() fn) {},
    );
  }

  return InkWell(
    onTap: () {
      try {
        navigateTo(context, WebViewScreen(webViewController));
      } catch (e) {
        print(e);
      }
    },
    child: Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        children: [
          Container(
            width: 120.0,
            height: 120.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: NetworkImage(
                    "${articles['image']}",
                  ),
                  fit: BoxFit.cover,
                )),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Container(
              height: 120.0,
              width: 120.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "${articles['title']}",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis,
                        wordSpacing: 0.15,
                      ),
                      maxLines: 3,
                    ),
                  ),
                  Text(
                    "${articles['publishedAt']}",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget mySperator() {
  return Container(
    height: 2.0,
    width: double.infinity,
    color: Colors.grey,
  );
}

void navigateTo(context, Widget) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Widget,
    ),
  );
}
