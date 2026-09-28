import 'package:dating_your_date/models/GlobalModel.dart';

const _blockedKey = 'BlockedUserIds';

Future<Set<int>> readBlockedUsers() async {
  final raw = await globalSession.read(key: _blockedKey);
  if (raw == null || raw.isEmpty) {
    return {};
  }
  return raw.split(',').map(int.tryParse).whereType<int>().toSet();
}

Future<void> rememberBlockedUser(int userID) async {
  final blocked = await readBlockedUsers();
  blocked.add(userID);
  await globalSession.write(key: _blockedKey, value: blocked.join(','));
}

Future<void> clearBlockedUsers() async {
  await globalSession.delete(key: _blockedKey);
}
