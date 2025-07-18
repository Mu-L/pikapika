import 'package:pikapika/i18.dart';
import 'package:flutter/material.dart';
import '../Method.dart';

const _propertyName = "volumeNextChapter";

late bool _volumeNextChapter;

Future initVolumeNextChapter() async {
  _volumeNextChapter =
      (await method.loadProperty(_propertyName, "true")) == "true";
}

bool volumeNextChapter() {
  return _volumeNextChapter;
}

Widget volumeNextChapterSetting() {
  return StatefulBuilder(
    builder: (BuildContext context, void Function(void Function()) setState) {
      return SwitchListTile(
        title: Text(tr("settings.volume_next_chapter.title")),
        value: _volumeNextChapter,
        onChanged: (value) async {
          await method.saveProperty(_propertyName, "$value");
          _volumeNextChapter = value;
          setState(() {});
        },
      );
    },
  );
}
