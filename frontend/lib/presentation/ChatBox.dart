import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/client/session_auth.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/models/GlobalModel.dart';
import 'package:dating_your_date/pb/chatRecordNoID.pb.dart';
import 'package:dating_your_date/pb/rpc_chatRecord.pb.dart';
import 'package:dating_your_date/pb/rpc_socialmedia.pb.dart';
import 'package:dating_your_date/pb/rpc_targetList.pb.dart';
import 'package:dating_your_date/pb/socialmedia.pb.dart';
import 'package:dating_your_date/presentation/SideBar.dart';
import 'package:dating_your_date/widgets/Custom_WarningLogoBox.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:image/image.dart' as customImage;
import 'package:image_picker/image_picker.dart';

class ChatBox extends StatefulWidget {
  ChatBox({Key? key, this.name, this.imageUrl, this.time, this.targetid, this.tType}) : super(key: key);

  final String? name;
  final String? tType;
  final Uint8List? imageUrl;
  final String? time;
  final int? targetid;

  @override
  _ChatBoxState createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  String? purpose;
  Color headerColor = Colors.white;
  bool loading = true;
  bool sending = false;
  SocialMedia? mySocialMedia;
  SocialMedia? tarSocialMedia;
  List<ChatRecordNoID> records = [];
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final messageController = TextEditingController();
  final messageFocus = FocusNode();

  static const starters = ['こんにちは、よろしくお願いします', '最近ハマっていることはありますか？', '休日はどう過ごしていますか？'];

  @override
  void initState() {
    super.initState();
    purpose = widget.tType;
    headerColor = _typeColor(widget.tType);
    _loadPurpose();
    _loadSocialMedia();
    _loadRecords();
    _markRead();
  }

  @override
  void dispose() {
    scrollController.dispose();
    messageController.dispose();
    messageFocus.dispose();
    super.dispose();
  }

  Color _typeColor(String? type) {
    if (type == '趣味') return appTheme.grey800;
    if (type == '相伴') return appTheme.scallopSeashell;
    if (type == '恋人') return appTheme.pinkA100;
    return appTheme.test;
  }

  bool _both(bool Function(SocialMedia media) pick) {
    final mine = mySocialMedia;
    final theirs = tarSocialMedia;
    if (mine == null || theirs == null) return false;
    return pick(mine) && pick(theirs);
  }

  String _dayLabel(DateTime time) {
    const weeks = ['月', '火', '水', '木', '金', '土', '日'];
    return '${time.month}月${time.day}日（${weeks[time.weekday - 1]}）';
  }

  String _clockLabel(DateTime time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  DateTime? _timeOf(ChatRecordNoID record) {
    if (!record.hasCreatedAt() || record.createdAt.seconds.toInt() <= 0) return null;
    return DateTime.fromMillisecondsSinceEpoch(record.createdAt.seconds.toInt() * 1000, isUtc: true).toLocal();
  }

  void _scrollToLatest() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!scrollController.hasClients) return;
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
      );
    });
  }

  Future<void> _loadRecords() async {
    final apiKeyU = await globalUserId.read(key: 'UserID');
    final userid = int.tryParse(apiKeyU ?? '');
    if (userid == null || widget.targetid == null) {
      if (mounted) setState(() => loading = false);
      return;
    }
    try {
      final response = await GrpcChatService.client.getChatRecord(GetChatRecordRequest(userID: userid, targetID: widget.targetid));
      if (!mounted) return;
      setState(() {
        records = response.chatRecordNoID;
        loading = false;
      });
      _scrollToLatest();
    } on GrpcError catch (error) {
      if (!mounted || isUnauthenticated(error)) return;
      setState(() => loading = false);
    }
  }

  Future<void> _loadSocialMedia() async {
    final apiKeyU = await globalUserId.read(key: 'UserID');
    final userid = int.tryParse(apiKeyU ?? '');
    if (userid == null || widget.targetid == null) return;
    try {
      final mine = await GrpcChatService.client.getSocialMedia(GetSocialMediaRequest(userID: userid, targetID: widget.targetid));
      final theirs = await GrpcChatService.client.getSocialMedia(GetSocialMediaRequest(userID: widget.targetid, targetID: userid));
      if (!mounted) return;
      setState(() {
        mySocialMedia = mine.sm;
        tarSocialMedia = theirs.sm;
      });
    } on GrpcError catch (error) {
      if (isUnauthenticated(error)) return;
    }
  }

  Future<void> _loadPurpose() async {
    final apiKeyS = await globalSession.read(key: 'SessionId');
    final apiKeyU = await globalUserId.read(key: 'UserID');
    final userid = int.tryParse(apiKeyU ?? '');
    if (userid == null) return;
    try {
      final response = await GrpcInfoService.client.getTargetList(GetTargetListRequest(sessionID: apiKeyS, userID: userid));
      String? next;
      if (response.tl.target1ID == widget.targetid && response.tl.target1ID != 0) {
        next = response.tl.t1Type;
      } else if (response.tl.target2ID == widget.targetid && response.tl.target2ID != 0) {
        next = response.tl.t2Type;
      } else if (response.tl.target3ID == widget.targetid && response.tl.target3ID != 0) {
        next = response.tl.t3Type;
      }
      if (!mounted || next == null || next.isEmpty) return;
      setState(() {
        purpose = next;
        headerColor = _typeColor(next);
      });
    } on GrpcError catch (error) {
      if (isUnauthenticated(error) || !mounted) return;
    }
  }

  Future<void> _markRead() async {
    final apiKeyU = await globalUserId.read(key: 'UserID');
    final userid = int.tryParse(apiKeyU ?? '');
    if (userid == null || widget.targetid == null) return;
    try {
      await GrpcChatService.client.updateRead(UpdateReadRequest(userID: userid, targetID: widget.targetid));
    } on GrpcError {
      return;
    }
  }

  Future<void> _send({required List<int> media, required String mediaType}) async {
    if (sending) return;
    final apiKeyU = await globalUserId.read(key: 'UserID');
    final uid = int.tryParse(apiKeyU ?? '');
    if (uid == null || widget.targetid == null) return;
    setState(() => sending = true);
    try {
      await GrpcChatService.client.createChatRecord(CreateChatRecordRequest(
        userID: uid,
        targetID: widget.targetid,
        roleType: 'sender',
        mediaType: mediaType,
        media: media,
      ));
      await GrpcChatService.client.createChatRecord(CreateChatRecordRequest(
        userID: widget.targetid,
        targetID: uid,
        roleType: 'receiver',
        mediaType: mediaType,
        media: media,
      ));
      messageController.clear();
      await _loadRecords();
    } on GrpcError catch (error) {
      if (!mounted || isUnauthenticated(error)) return;
      await showErrorDialog(context, 'メッセージを送れませんでした。もう一度お試しください。');
    } finally {
      if (mounted) setState(() => sending = false);
    }
  }

  Future<void> _sendText([String? preset]) async {
    final text = (preset ?? messageController.text).trim();
    if (text.isEmpty) return;
    await _send(media: utf8.encode(text), mediaType: 'text');
  }

  Future<void> _pickPhoto() async {
    if (!_both((media) => media.image)) {
      await showErrorDialog(context, '写真は、お互いが設定で解放すると送れます。');
      return;
    }
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked == null) return;
    final bytes = await File(picked.path).readAsBytes();
    final image = customImage.decodeImage(bytes);
    if (image == null) return;
    final targetWidth = 1024;
    final targetHeight = (targetWidth / (image.width / image.height)).round();
    final resized = customImage.copyResize(image, width: targetWidth, height: targetHeight);
    await _send(media: customImage.encodeJpg(resized), mediaType: 'image');
  }

  Future<void> _shareNote(String title, String label, String hint) async {
    final controller = TextEditingController();
    final text = await showDialog<String>(
      context: context,
      builder: (dialogContext) {
        final size = MediaQuery.of(dialogContext).size;
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusStyle.r15),
          title: Text(title, style: TextStyle(fontSize: size.width * 0.045)),
          content: TextField(
            controller: controller,
            autofocus: true,
            decoration: InputDecoration(hintText: hint),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(dialogContext), child: const Text('キャンセル')),
            TextButton(
              onPressed: () => Navigator.pop(dialogContext, controller.text.trim()),
              child: const Text('送る'),
            ),
          ],
        );
      },
    );
    controller.dispose();
    if (text == null || text.isEmpty) return;
    await _send(media: utf8.encode('【$label】\n$text'), mediaType: 'text');
  }

  Future<void> _shareDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked == null) return;
    final label = _dayLabel(picked);
    await _send(media: utf8.encode('【デートの候補】\n$label はいかがですか？'), mediaType: 'text');
  }

  Future<void> _openShare(String kind) async {
    Navigator.pop(context);
    switch (kind) {
      case 'photo':
        await _pickPhoto();
        break;
      case 'contact':
        await _shareNote('連絡先を送る', '連絡先', 'LINE ID や電話番号');
        break;
      case 'location':
        await _shareNote('場所を共有', '場所', '駅名やお店の名前');
        break;
      case 'date':
        await _shareDate();
        break;
      case 'sns':
        await _shareNote('SNSを共有', 'SNS', 'アカウント名');
        break;
    }
  }

  void _showShareSheet(double mediaH, double mediaW) {
    showModalBottomSheet(
      context: context,
      backgroundColor: appTheme.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(mediaW * 0.05))),
      builder: (sheetContext) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: mediaW * 0.04, vertical: mediaH * 0.02),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: mediaW * 0.12,
                  height: mediaH * 0.006,
                  decoration: BoxDecoration(color: appTheme.grey500, borderRadius: BorderRadius.circular(mediaW * 0.02)),
                ),
                SizedBox(height: mediaH * 0.015),
                _shareTile(mediaW, Icons.photo_outlined, '写真', _both((media) => media.image), () => _openShare('photo')),
                _shareTile(mediaW, Icons.contacts_outlined, '連絡先', _both((media) => media.contact), () => _openShare('contact')),
                _shareTile(mediaW, Icons.place_outlined, '場所', _both((media) => media.location), () => _openShare('location')),
                _shareTile(mediaW, Icons.event_outlined, 'デート', _both((media) => media.appointment), () => _openShare('date')),
                _shareTile(mediaW, Icons.share_outlined, 'SNS', _both((media) => media.sns), () => _openShare('sns')),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _shareTile(double mediaW, IconData icon, String title, bool unlocked, VoidCallback onTap) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: mediaW * 0.02),
      leading: Icon(icon, size: mediaW * 0.06, color: unlocked ? appTheme.black : appTheme.grey500),
      title: Text(title, style: TextStyle(fontSize: mediaW * 0.04, color: unlocked ? appTheme.black : appTheme.grey500)),
      subtitle: Text(
        unlocked ? '送れます' : 'お互いの解放が必要です',
        style: TextStyle(fontSize: mediaW * 0.03),
      ),
      onTap: unlocked
          ? onTap
          : () async {
              Navigator.pop(context);
              await showErrorDialog(context, '$titleは、右上の設定でお互いが解放すると使えます。');
            },
    );
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final mediaH = media.size.height;
    final mediaW = media.size.width;
    return GestureDetector(
      onTap: () => messageFocus.unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: true,
        backgroundColor: appTheme.bgColor,
        appBar: _buildHeader(mediaH, mediaW),
        drawer: Drawer(width: mediaW * 0.72, child: SideBar(sm: mySocialMedia, targetId: widget.targetid)),
        body: Column(
          children: [
            Expanded(child: _buildMessages(mediaH, mediaW)),
            _buildComposer(mediaH, mediaW, media.padding.bottom),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildHeader(double mediaH, double mediaW) {
    final avatar = widget.imageUrl;
    return AppBar(
      elevation: 0,
      toolbarHeight: mediaH * 0.08,
      automaticallyImplyLeading: false,
      backgroundColor: headerColor,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: appTheme.black, size: mediaW * 0.06),
        onPressed: () => Navigator.of(context).pop(),
      ),
      titleSpacing: 0,
      title: Row(
        children: [
          CircleAvatar(
            backgroundImage: avatar == null || avatar.isEmpty ? null : MemoryImage(avatar),
            backgroundColor: appTheme.grey100,
            radius: mediaW * 0.05,
            child: avatar == null || avatar.isEmpty ? Icon(Icons.person, size: mediaW * 0.05) : null,
          ),
          SizedBox(width: mediaW * 0.03),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.name ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: appTheme.black, fontSize: mediaW * 0.042, fontWeight: FontWeight.w800),
                ),
                Text(
                  purpose == null || purpose!.isEmpty ? 'マッチ' : purpose!,
                  style: TextStyle(color: appTheme.black, fontSize: mediaW * 0.03),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.tune, color: appTheme.black, size: mediaW * 0.06),
          onPressed: () {
            if (mySocialMedia == null) {
              showErrorDialog(context, '共有設定を読み込めませんでした。');
              return;
            }
            scaffoldKey.currentState?.openDrawer();
          },
        ),
      ],
    );
  }

  Widget _buildMessages(double mediaH, double mediaW) {
    if (loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (records.isEmpty) {
      return _buildEmpty(mediaH, mediaW);
    }
    return ListView.builder(
      controller: scrollController,
      padding: EdgeInsets.symmetric(horizontal: mediaW * 0.04, vertical: mediaH * 0.015),
      itemCount: records.length,
      itemBuilder: (context, index) {
        final record = records[index];
        final time = _timeOf(record);
        final previous = index == 0 ? null : _timeOf(records[index - 1]);
        final showDate = time != null && (previous == null || previous.year != time.year || previous.month != time.month || previous.day != time.day);
        final mine = record.roleType != 'receiver';
        return Column(
          children: [
            if (showDate) _dateChip(mediaH, mediaW, time),
            Align(
              alignment: mine ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                constraints: BoxConstraints(maxWidth: mediaW * 0.72),
                margin: EdgeInsets.only(top: mediaH * 0.008),
                child: Column(
                  crossAxisAlignment: mine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: mine ? appTheme.blue200 : appTheme.grey100,
                        borderRadius: BorderRadius.circular(mediaW * 0.045),
                      ),
                      padding: EdgeInsets.symmetric(vertical: mediaH * 0.01, horizontal: mediaW * 0.03),
                      child: _messageBody(record, mediaH, mediaW),
                    ),
                    SizedBox(height: mediaH * 0.004),
                    Text(
                      _statusLabel(record, time, mine),
                      style: TextStyle(fontSize: mediaW * 0.028, color: appTheme.grey800),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _dateChip(double mediaH, double mediaW, DateTime time) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: mediaH * 0.012),
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: mediaW * 0.03, vertical: mediaH * 0.006),
          decoration: BoxDecoration(color: appTheme.grey100, borderRadius: BorderRadius.circular(mediaW * 0.04)),
          child: Text(_dayLabel(time), style: TextStyle(fontSize: mediaW * 0.03, color: appTheme.grey800)),
        ),
      ),
    );
  }

  String _statusLabel(ChatRecordNoID record, DateTime? time, bool mine) {
    final clock = time == null ? '' : _clockLabel(time);
    if (mine && record.isRead) {
      return clock.isEmpty ? '既読' : '既読  $clock';
    }
    return clock;
  }

  Widget _messageBody(ChatRecordNoID record, double mediaH, double mediaW) {
    if (record.mediaType == 'image') {
      final img = Uint8List.fromList(record.media);
      return GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (dialogContext) {
              return Dialog(
                insetPadding: EdgeInsets.all(mediaW * 0.04),
                child: InteractiveViewer(child: Image.memory(img, fit: BoxFit.contain)),
              );
            },
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(mediaW * 0.03),
          child: Image.memory(img, width: mediaW * 0.55, fit: BoxFit.cover),
        ),
      );
    }
    final text = utf8.decode(record.media, allowMalformed: true);
    return Text(text, style: TextStyle(fontSize: mediaW * 0.038, height: 1.35, color: appTheme.black));
  }

  Widget _buildEmpty(double mediaH, double mediaW) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: mediaW * 0.08, vertical: mediaH * 0.04),
      children: [
        Icon(Icons.chat_bubble_outline, size: mediaW * 0.14, color: appTheme.pinkA100),
        SizedBox(height: mediaH * 0.02),
        Text(
          '最初のメッセージを送ってみましょう',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: mediaW * 0.045, fontWeight: FontWeight.w700),
        ),
        SizedBox(height: mediaH * 0.01),
        Text(
          'あいさつから始めると、相手も返事しやすくなります。',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: mediaW * 0.034, color: appTheme.grey800),
        ),
        SizedBox(height: mediaH * 0.03),
        for (final starter in starters)
          Padding(
            padding: EdgeInsets.only(bottom: mediaH * 0.012),
            child: OutlinedButton(
              onPressed: sending ? null : () => _sendText(starter),
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: mediaH * 0.014, horizontal: mediaW * 0.04),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(mediaW * 0.06)),
              ),
              child: Text(starter, style: TextStyle(fontSize: mediaW * 0.035, color: appTheme.black)),
            ),
          ),
      ],
    );
  }

  Widget _buildComposer(double mediaH, double mediaW, double safeBottom) {
    final canSend = messageController.text.trim().isNotEmpty && !sending;
    return Container(
      color: const Color.fromARGB(255, 226, 226, 226),
      padding: EdgeInsets.fromLTRB(mediaW * 0.03, mediaH * 0.012, mediaW * 0.03, mediaH * 0.012 + safeBottom),
      child: Row(
        children: [
          _roundButton(
            mediaW,
            Icons.add,
            () => _showShareSheet(mediaH, mediaW),
          ),
          SizedBox(width: mediaW * 0.02),
          Expanded(
            child: Container(
              constraints: BoxConstraints(minHeight: mediaH * 0.055),
              padding: EdgeInsets.symmetric(horizontal: mediaW * 0.03),
              decoration: BoxDecoration(color: appTheme.white, borderRadius: BorderRadius.circular(mediaW * 0.06)),
              child: TextField(
                controller: messageController,
                focusNode: messageFocus,
                minLines: 1,
                maxLines: 4,
                textInputAction: TextInputAction.send,
                onChanged: (_) => setState(() {}),
                onSubmitted: (_) => _sendText(),
                style: TextStyle(fontSize: mediaW * 0.038),
                decoration: InputDecoration(
                  hintText: 'メッセージを入力',
                  hintStyle: TextStyle(fontSize: mediaW * 0.035, color: appTheme.grey500),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: mediaH * 0.014),
                ),
              ),
            ),
          ),
          SizedBox(width: mediaW * 0.02),
          _roundButton(mediaW, Icons.send, canSend ? () => _sendText() : null, filled: canSend),
        ],
      ),
    );
  }

  Widget _roundButton(double mediaW, IconData icon, VoidCallback? onTap, {bool filled = true}) {
    final size = mediaW * 0.1;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: filled && onTap != null ? appTheme.black : appTheme.grey500,
          borderRadius: BorderRadius.circular(size),
        ),
        child: Icon(icon, color: appTheme.white, size: mediaW * 0.05),
      ),
    );
  }
}
