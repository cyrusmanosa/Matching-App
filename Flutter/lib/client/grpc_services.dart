import 'package:dating_your_date/pb/service_Backend.pbgrpc.dart';
// ignore: implementation_imports
import 'package:grpc/src/client/Http2_channel.dart' as grpc_channel;
import 'package:grpc/grpc.dart';

class GrpcInfoService {
  static var channel = grpc_channel.ClientChannel(
    "localhost",
    port: 9090,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
  );

  static var client = InformationClient(channel);

  static Future<void> shutdown() async {
    await channel.shutdown();
  }
}

class GrpcChatService {
  static var channel = grpc_channel.ClientChannel(
    "localhost",
    port: 9090,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
  );

  static var client = ChatClient(channel);

  static Future<void> shutdown() async {
    await channel.shutdown();
  }
}
