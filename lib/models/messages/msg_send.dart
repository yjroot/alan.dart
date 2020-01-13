import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:sacco/models/export.dart';

part 'msg_send.g.dart';

/// [MsgSend] extends [StdMsg] and represents the message that should be
/// used when sending tokens from one user to another one.
/// It requires to specify the address from which to send the tokens,
/// the one that should receive the tokens and the amount of tokens
/// to send.
@JsonSerializable(explicitToJson: true)
class MsgSend implements StdMsg {
  /// Bech32 address of the sender.
  @JsonKey(name: "from_address")
  final String fromAddress;

  /// Bech32 address of the recipient.
  @JsonKey(name: "to_address")
  final String toAddress;

  /// Coins that will be sent.
  @JsonKey(name: "amount")
  final List<StdCoin> amount;

  /// Public constructor.
  MsgSend({
    @required this.fromAddress,
    @required this.toAddress,
    @required this.amount,
  })  : assert(fromAddress != null),
        assert(toAddress != null),
        assert(amount != null);

  @override
  Map<String, dynamic> toJson() => _$MsgSendToJson(this);

  @override
  factory MsgSend.fromJson(Map<String, dynamic> json) => _$MsgSendFromJson(json);
}