import 'package:flutter/foundation.dart';

final chatUnreadCount = ValueNotifier<int>(0);

void publishChatUnread(Iterable<bool> readFlags) {
  chatUnreadCount.value = readFlags.where((read) => !read).length;
}
