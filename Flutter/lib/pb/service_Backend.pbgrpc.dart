//
//  Generated code. Do not modify.
//  source: service_Backend.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/empty.pb.dart' as $4;
import 'rpc_accompany.pb.dart' as $6;
import 'rpc_canChange.pb.dart' as $5;
import 'rpc_changeTarget.pb.dart' as $11;
import 'rpc_chatRecord.pb.dart' as $15;
import 'rpc_checkEmail.pb.dart' as $1;
import 'rpc_complaint.pb.dart' as $9;
import 'rpc_fix.pb.dart' as $3;
import 'rpc_hobby.pb.dart' as $7;
import 'rpc_images.pb.dart' as $12;
import 'rpc_login.pb.dart' as $0;
import 'rpc_lover.pb.dart' as $8;
import 'rpc_password.pb.dart' as $2;
import 'rpc_payment.pb.dart' as $13;
import 'rpc_session.pb.dart' as $14;
import 'rpc_targetList.pb.dart' as $10;

export 'service_Backend.pb.dart';

@$pb.GrpcServiceName('pb.Information')
class InformationClient extends $grpc.Client {
  static final _$loginUser = $grpc.ClientMethod<$0.LoginUserRequest, $0.LoginUserResponse>(
      '/pb.Information/LoginUser',
      ($0.LoginUserRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.LoginUserResponse.fromBuffer(value));
  static final _$checkEmail = $grpc.ClientMethod<$1.CheckEmailRequest, $1.CheckEmailResponse>(
      '/pb.Information/CheckEmail',
      ($1.CheckEmailRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.CheckEmailResponse.fromBuffer(value));
  static final _$checkEmailCode = $grpc.ClientMethod<$1.SendEmailRequest, $1.CheckedEmailResponse>(
      '/pb.Information/CheckEmailCode',
      ($1.SendEmailRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.CheckedEmailResponse.fromBuffer(value));
  static final _$inputPassword = $grpc.ClientMethod<$2.InputPasswordRequest, $2.InputPasswordResponse>(
      '/pb.Information/InputPassword',
      ($2.InputPasswordRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.InputPasswordResponse.fromBuffer(value));
  static final _$resetPassword = $grpc.ClientMethod<$2.ResetPasswordRequest, $2.ResetPasswordResponse>(
      '/pb.Information/ResetPassword',
      ($2.ResetPasswordRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.ResetPasswordResponse.fromBuffer(value));
  static final _$createFix = $grpc.ClientMethod<$3.CreateFixRequest, $3.CreateFixResponse>(
      '/pb.Information/CreateFix',
      ($3.CreateFixRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.CreateFixResponse.fromBuffer(value));
  static final _$getFix = $grpc.ClientMethod<$3.GetFixRequest, $3.GetFixResponse>(
      '/pb.Information/GetFix',
      ($3.GetFixRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.GetFixResponse.fromBuffer(value));
  static final _$deleteFix = $grpc.ClientMethod<$3.DeleteFixRequest, $4.Empty>(
      '/pb.Information/DeleteFix',
      ($3.DeleteFixRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.Empty.fromBuffer(value));
  static final _$createCanChange = $grpc.ClientMethod<$5.CreateCanChangeRequest, $5.CreateCanChangeResponse>(
      '/pb.Information/CreateCanChange',
      ($5.CreateCanChangeRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $5.CreateCanChangeResponse.fromBuffer(value));
  static final _$getCanChange = $grpc.ClientMethod<$5.GetCanChangeRequest, $5.GetCanChangeResponse>(
      '/pb.Information/GetCanChange',
      ($5.GetCanChangeRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $5.GetCanChangeResponse.fromBuffer(value));
  static final _$updateCanChange = $grpc.ClientMethod<$5.UpdateCanChangeRequest, $5.UpdateCanChangeResponse>(
      '/pb.Information/UpdateCanChange',
      ($5.UpdateCanChangeRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $5.UpdateCanChangeResponse.fromBuffer(value));
  static final _$deleteCanChange = $grpc.ClientMethod<$5.DeleteCanChangeRequest, $4.Empty>(
      '/pb.Information/DeleteCanChange',
      ($5.DeleteCanChangeRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.Empty.fromBuffer(value));
  static final _$createAccompany = $grpc.ClientMethod<$6.CreateAccompanyRequest, $6.CreateAccompanyResponse>(
      '/pb.Information/CreateAccompany',
      ($6.CreateAccompanyRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $6.CreateAccompanyResponse.fromBuffer(value));
  static final _$getAccompany = $grpc.ClientMethod<$6.GetAccompanyRequest, $6.GetAccompanyResponse>(
      '/pb.Information/GetAccompany',
      ($6.GetAccompanyRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $6.GetAccompanyResponse.fromBuffer(value));
  static final _$updateAccompany = $grpc.ClientMethod<$6.UpdateAccompanyRequest, $6.UpdateAccompanyResponse>(
      '/pb.Information/UpdateAccompany',
      ($6.UpdateAccompanyRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $6.UpdateAccompanyResponse.fromBuffer(value));
  static final _$deleteAccompany = $grpc.ClientMethod<$6.DeleteAccompanyRequest, $4.Empty>(
      '/pb.Information/DeleteAccompany',
      ($6.DeleteAccompanyRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.Empty.fromBuffer(value));
  static final _$createHobby = $grpc.ClientMethod<$7.CreateHobbyRequest, $7.CreateHobbyResponse>(
      '/pb.Information/CreateHobby',
      ($7.CreateHobbyRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $7.CreateHobbyResponse.fromBuffer(value));
  static final _$getHobby = $grpc.ClientMethod<$7.GetHobbyRequest, $7.GetHobbyResponse>(
      '/pb.Information/GetHobby',
      ($7.GetHobbyRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $7.GetHobbyResponse.fromBuffer(value));
  static final _$updateHobby = $grpc.ClientMethod<$7.UpdateHobbyRequest, $7.UpdateHobbyResponse>(
      '/pb.Information/UpdateHobby',
      ($7.UpdateHobbyRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $7.UpdateHobbyResponse.fromBuffer(value));
  static final _$deleteHobby = $grpc.ClientMethod<$7.DeleteHobbyRequest, $4.Empty>(
      '/pb.Information/DeleteHobby',
      ($7.DeleteHobbyRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.Empty.fromBuffer(value));
  static final _$createLover = $grpc.ClientMethod<$8.CreateLoverRequest, $8.CreateLoverResponse>(
      '/pb.Information/CreateLover',
      ($8.CreateLoverRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $8.CreateLoverResponse.fromBuffer(value));
  static final _$getLover = $grpc.ClientMethod<$8.GetLoverRequest, $8.GetLoverResponse>(
      '/pb.Information/GetLover',
      ($8.GetLoverRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $8.GetLoverResponse.fromBuffer(value));
  static final _$updateLover = $grpc.ClientMethod<$8.UpdateLoverRequest, $8.UpdateLoverResponse>(
      '/pb.Information/UpdateLover',
      ($8.UpdateLoverRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $8.UpdateLoverResponse.fromBuffer(value));
  static final _$deleteLover = $grpc.ClientMethod<$8.DeleteLoverRequest, $4.Empty>(
      '/pb.Information/DeleteLover',
      ($8.DeleteLoverRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.Empty.fromBuffer(value));
  static final _$createComplaint = $grpc.ClientMethod<$9.CreateComplaintRequest, $9.CreateComplaintResponse>(
      '/pb.Information/CreateComplaint',
      ($9.CreateComplaintRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $9.CreateComplaintResponse.fromBuffer(value));
  static final _$getComplaint = $grpc.ClientMethod<$9.GetComplaintRequest, $9.GetComplaintResponse>(
      '/pb.Information/GetComplaint',
      ($9.GetComplaintRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $9.GetComplaintResponse.fromBuffer(value));
  static final _$updateComplaint = $grpc.ClientMethod<$9.UpdateComplaintRequest, $9.UpdateComplaintResponse>(
      '/pb.Information/UpdateComplaint',
      ($9.UpdateComplaintRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $9.UpdateComplaintResponse.fromBuffer(value));
  static final _$deleteComplaint = $grpc.ClientMethod<$9.DeleteComplaintRequest, $4.Empty>(
      '/pb.Information/DeleteComplaint',
      ($9.DeleteComplaintRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.Empty.fromBuffer(value));
  static final _$createTargetList = $grpc.ClientMethod<$10.CreateTargetListRequest, $10.CreateTargetListResponse>(
      '/pb.Information/CreateTargetList',
      ($10.CreateTargetListRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $10.CreateTargetListResponse.fromBuffer(value));
  static final _$getTargetList = $grpc.ClientMethod<$10.GetTargetListRequest, $10.GetTargetListResponse>(
      '/pb.Information/GetTargetList',
      ($10.GetTargetListRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $10.GetTargetListResponse.fromBuffer(value));
  static final _$updateTargetList = $grpc.ClientMethod<$10.UpdateTargetListRequest, $10.UpdateTargetListResponse>(
      '/pb.Information/UpdateTargetList',
      ($10.UpdateTargetListRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $10.UpdateTargetListResponse.fromBuffer(value));
  static final _$deleteTargetList = $grpc.ClientMethod<$10.DeleteTargetListRequest, $4.Empty>(
      '/pb.Information/DeleteTargetList',
      ($10.DeleteTargetListRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.Empty.fromBuffer(value));
  static final _$createChangeTarget = $grpc.ClientMethod<$11.CreateChangeTargetRequest, $11.CreateChangeTargetResponse>(
      '/pb.Information/CreateChangeTarget',
      ($11.CreateChangeTargetRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $11.CreateChangeTargetResponse.fromBuffer(value));
  static final _$getChangeTarget = $grpc.ClientMethod<$11.GetChangeTargetRequest, $11.GetChangeTargetResponse>(
      '/pb.Information/GetChangeTarget',
      ($11.GetChangeTargetRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $11.GetChangeTargetResponse.fromBuffer(value));
  static final _$deleteChangeTarget = $grpc.ClientMethod<$11.DeleteChangeTargetRequest, $4.Empty>(
      '/pb.Information/DeleteChangeTarget',
      ($11.DeleteChangeTargetRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.Empty.fromBuffer(value));
  static final _$createImages = $grpc.ClientMethod<$12.CreateImagesRequest, $12.CreateImagesResponse>(
      '/pb.Information/CreateImages',
      ($12.CreateImagesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $12.CreateImagesResponse.fromBuffer(value));
  static final _$getImages = $grpc.ClientMethod<$12.GetImagesRequest, $12.GetImagesResponse>(
      '/pb.Information/GetImages',
      ($12.GetImagesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $12.GetImagesResponse.fromBuffer(value));
  static final _$updateImages = $grpc.ClientMethod<$12.UpdateImagesRequest, $12.UpdateImagesResponse>(
      '/pb.Information/UpdateImages',
      ($12.UpdateImagesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $12.UpdateImagesResponse.fromBuffer(value));
  static final _$deleteImages = $grpc.ClientMethod<$12.DeleteImagesRequest, $4.Empty>(
      '/pb.Information/DeleteImages',
      ($12.DeleteImagesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.Empty.fromBuffer(value));
  static final _$createPayment = $grpc.ClientMethod<$13.CreatePaymentRequest, $13.CreatePaymentResponse>(
      '/pb.Information/CreatePayment',
      ($13.CreatePaymentRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $13.CreatePaymentResponse.fromBuffer(value));
  static final _$getPayment = $grpc.ClientMethod<$13.GetPaymentRequest, $13.GetPaymentResponse>(
      '/pb.Information/GetPayment',
      ($13.GetPaymentRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $13.GetPaymentResponse.fromBuffer(value));
  static final _$getUserID = $grpc.ClientMethod<$14.GetUserIDRequest, $14.GetUserIDResponse>(
      '/pb.Information/GetUserID',
      ($14.GetUserIDRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $14.GetUserIDResponse.fromBuffer(value));

  InformationClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.LoginUserResponse> loginUser($0.LoginUserRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$loginUser, request, options: options);
  }

  $grpc.ResponseFuture<$1.CheckEmailResponse> checkEmail($1.CheckEmailRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$checkEmail, request, options: options);
  }

  $grpc.ResponseFuture<$1.CheckedEmailResponse> checkEmailCode($1.SendEmailRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$checkEmailCode, request, options: options);
  }

  $grpc.ResponseFuture<$2.InputPasswordResponse> inputPassword($2.InputPasswordRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$inputPassword, request, options: options);
  }

  $grpc.ResponseFuture<$2.ResetPasswordResponse> resetPassword($2.ResetPasswordRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$resetPassword, request, options: options);
  }

  $grpc.ResponseFuture<$3.CreateFixResponse> createFix($3.CreateFixRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createFix, request, options: options);
  }

  $grpc.ResponseFuture<$3.GetFixResponse> getFix($3.GetFixRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getFix, request, options: options);
  }

  $grpc.ResponseFuture<$4.Empty> deleteFix($3.DeleteFixRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteFix, request, options: options);
  }

  $grpc.ResponseFuture<$5.CreateCanChangeResponse> createCanChange($5.CreateCanChangeRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createCanChange, request, options: options);
  }

  $grpc.ResponseFuture<$5.GetCanChangeResponse> getCanChange($5.GetCanChangeRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getCanChange, request, options: options);
  }

  $grpc.ResponseFuture<$5.UpdateCanChangeResponse> updateCanChange($5.UpdateCanChangeRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateCanChange, request, options: options);
  }

  $grpc.ResponseFuture<$4.Empty> deleteCanChange($5.DeleteCanChangeRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteCanChange, request, options: options);
  }

  $grpc.ResponseFuture<$6.CreateAccompanyResponse> createAccompany($6.CreateAccompanyRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createAccompany, request, options: options);
  }

  $grpc.ResponseFuture<$6.GetAccompanyResponse> getAccompany($6.GetAccompanyRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAccompany, request, options: options);
  }

  $grpc.ResponseFuture<$6.UpdateAccompanyResponse> updateAccompany($6.UpdateAccompanyRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateAccompany, request, options: options);
  }

  $grpc.ResponseFuture<$4.Empty> deleteAccompany($6.DeleteAccompanyRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteAccompany, request, options: options);
  }

  $grpc.ResponseFuture<$7.CreateHobbyResponse> createHobby($7.CreateHobbyRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createHobby, request, options: options);
  }

  $grpc.ResponseFuture<$7.GetHobbyResponse> getHobby($7.GetHobbyRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getHobby, request, options: options);
  }

  $grpc.ResponseFuture<$7.UpdateHobbyResponse> updateHobby($7.UpdateHobbyRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateHobby, request, options: options);
  }

  $grpc.ResponseFuture<$4.Empty> deleteHobby($7.DeleteHobbyRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteHobby, request, options: options);
  }

  $grpc.ResponseFuture<$8.CreateLoverResponse> createLover($8.CreateLoverRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createLover, request, options: options);
  }

  $grpc.ResponseFuture<$8.GetLoverResponse> getLover($8.GetLoverRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getLover, request, options: options);
  }

  $grpc.ResponseFuture<$8.UpdateLoverResponse> updateLover($8.UpdateLoverRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateLover, request, options: options);
  }

  $grpc.ResponseFuture<$4.Empty> deleteLover($8.DeleteLoverRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteLover, request, options: options);
  }

  $grpc.ResponseFuture<$9.CreateComplaintResponse> createComplaint($9.CreateComplaintRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createComplaint, request, options: options);
  }

  $grpc.ResponseFuture<$9.GetComplaintResponse> getComplaint($9.GetComplaintRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getComplaint, request, options: options);
  }

  $grpc.ResponseFuture<$9.UpdateComplaintResponse> updateComplaint($9.UpdateComplaintRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateComplaint, request, options: options);
  }

  $grpc.ResponseFuture<$4.Empty> deleteComplaint($9.DeleteComplaintRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteComplaint, request, options: options);
  }

  $grpc.ResponseFuture<$10.CreateTargetListResponse> createTargetList($10.CreateTargetListRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createTargetList, request, options: options);
  }

  $grpc.ResponseFuture<$10.GetTargetListResponse> getTargetList($10.GetTargetListRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTargetList, request, options: options);
  }

  $grpc.ResponseFuture<$10.UpdateTargetListResponse> updateTargetList($10.UpdateTargetListRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateTargetList, request, options: options);
  }

  $grpc.ResponseFuture<$4.Empty> deleteTargetList($10.DeleteTargetListRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteTargetList, request, options: options);
  }

  $grpc.ResponseFuture<$11.CreateChangeTargetResponse> createChangeTarget($11.CreateChangeTargetRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createChangeTarget, request, options: options);
  }

  $grpc.ResponseFuture<$11.GetChangeTargetResponse> getChangeTarget($11.GetChangeTargetRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getChangeTarget, request, options: options);
  }

  $grpc.ResponseFuture<$4.Empty> deleteChangeTarget($11.DeleteChangeTargetRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteChangeTarget, request, options: options);
  }

  $grpc.ResponseFuture<$12.CreateImagesResponse> createImages($12.CreateImagesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createImages, request, options: options);
  }

  $grpc.ResponseFuture<$12.GetImagesResponse> getImages($12.GetImagesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getImages, request, options: options);
  }

  $grpc.ResponseFuture<$12.UpdateImagesResponse> updateImages($12.UpdateImagesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateImages, request, options: options);
  }

  $grpc.ResponseFuture<$4.Empty> deleteImages($12.DeleteImagesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteImages, request, options: options);
  }

  $grpc.ResponseFuture<$13.CreatePaymentResponse> createPayment($13.CreatePaymentRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createPayment, request, options: options);
  }

  $grpc.ResponseFuture<$13.GetPaymentResponse> getPayment($13.GetPaymentRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getPayment, request, options: options);
  }

  $grpc.ResponseFuture<$14.GetUserIDResponse> getUserID($14.GetUserIDRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUserID, request, options: options);
  }
}

@$pb.GrpcServiceName('pb.Information')
abstract class InformationServiceBase extends $grpc.Service {
  $core.String get $name => 'pb.Information';

  InformationServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.LoginUserRequest, $0.LoginUserResponse>(
        'LoginUser',
        loginUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LoginUserRequest.fromBuffer(value),
        ($0.LoginUserResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.CheckEmailRequest, $1.CheckEmailResponse>(
        'CheckEmail',
        checkEmail_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.CheckEmailRequest.fromBuffer(value),
        ($1.CheckEmailResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.SendEmailRequest, $1.CheckedEmailResponse>(
        'CheckEmailCode',
        checkEmailCode_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.SendEmailRequest.fromBuffer(value),
        ($1.CheckedEmailResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.InputPasswordRequest, $2.InputPasswordResponse>(
        'InputPassword',
        inputPassword_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.InputPasswordRequest.fromBuffer(value),
        ($2.InputPasswordResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.ResetPasswordRequest, $2.ResetPasswordResponse>(
        'ResetPassword',
        resetPassword_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.ResetPasswordRequest.fromBuffer(value),
        ($2.ResetPasswordResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.CreateFixRequest, $3.CreateFixResponse>(
        'CreateFix',
        createFix_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.CreateFixRequest.fromBuffer(value),
        ($3.CreateFixResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.GetFixRequest, $3.GetFixResponse>(
        'GetFix',
        getFix_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.GetFixRequest.fromBuffer(value),
        ($3.GetFixResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.DeleteFixRequest, $4.Empty>(
        'DeleteFix',
        deleteFix_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.DeleteFixRequest.fromBuffer(value),
        ($4.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.CreateCanChangeRequest, $5.CreateCanChangeResponse>(
        'CreateCanChange',
        createCanChange_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.CreateCanChangeRequest.fromBuffer(value),
        ($5.CreateCanChangeResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.GetCanChangeRequest, $5.GetCanChangeResponse>(
        'GetCanChange',
        getCanChange_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.GetCanChangeRequest.fromBuffer(value),
        ($5.GetCanChangeResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.UpdateCanChangeRequest, $5.UpdateCanChangeResponse>(
        'UpdateCanChange',
        updateCanChange_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.UpdateCanChangeRequest.fromBuffer(value),
        ($5.UpdateCanChangeResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.DeleteCanChangeRequest, $4.Empty>(
        'DeleteCanChange',
        deleteCanChange_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.DeleteCanChangeRequest.fromBuffer(value),
        ($4.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.CreateAccompanyRequest, $6.CreateAccompanyResponse>(
        'CreateAccompany',
        createAccompany_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.CreateAccompanyRequest.fromBuffer(value),
        ($6.CreateAccompanyResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.GetAccompanyRequest, $6.GetAccompanyResponse>(
        'GetAccompany',
        getAccompany_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.GetAccompanyRequest.fromBuffer(value),
        ($6.GetAccompanyResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.UpdateAccompanyRequest, $6.UpdateAccompanyResponse>(
        'UpdateAccompany',
        updateAccompany_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.UpdateAccompanyRequest.fromBuffer(value),
        ($6.UpdateAccompanyResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.DeleteAccompanyRequest, $4.Empty>(
        'DeleteAccompany',
        deleteAccompany_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.DeleteAccompanyRequest.fromBuffer(value),
        ($4.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.CreateHobbyRequest, $7.CreateHobbyResponse>(
        'CreateHobby',
        createHobby_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $7.CreateHobbyRequest.fromBuffer(value),
        ($7.CreateHobbyResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.GetHobbyRequest, $7.GetHobbyResponse>(
        'GetHobby',
        getHobby_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $7.GetHobbyRequest.fromBuffer(value),
        ($7.GetHobbyResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.UpdateHobbyRequest, $7.UpdateHobbyResponse>(
        'UpdateHobby',
        updateHobby_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $7.UpdateHobbyRequest.fromBuffer(value),
        ($7.UpdateHobbyResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.DeleteHobbyRequest, $4.Empty>(
        'DeleteHobby',
        deleteHobby_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $7.DeleteHobbyRequest.fromBuffer(value),
        ($4.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.CreateLoverRequest, $8.CreateLoverResponse>(
        'CreateLover',
        createLover_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.CreateLoverRequest.fromBuffer(value),
        ($8.CreateLoverResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.GetLoverRequest, $8.GetLoverResponse>(
        'GetLover',
        getLover_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.GetLoverRequest.fromBuffer(value),
        ($8.GetLoverResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.UpdateLoverRequest, $8.UpdateLoverResponse>(
        'UpdateLover',
        updateLover_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.UpdateLoverRequest.fromBuffer(value),
        ($8.UpdateLoverResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.DeleteLoverRequest, $4.Empty>(
        'DeleteLover',
        deleteLover_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.DeleteLoverRequest.fromBuffer(value),
        ($4.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.CreateComplaintRequest, $9.CreateComplaintResponse>(
        'CreateComplaint',
        createComplaint_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $9.CreateComplaintRequest.fromBuffer(value),
        ($9.CreateComplaintResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.GetComplaintRequest, $9.GetComplaintResponse>(
        'GetComplaint',
        getComplaint_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $9.GetComplaintRequest.fromBuffer(value),
        ($9.GetComplaintResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.UpdateComplaintRequest, $9.UpdateComplaintResponse>(
        'UpdateComplaint',
        updateComplaint_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $9.UpdateComplaintRequest.fromBuffer(value),
        ($9.UpdateComplaintResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.DeleteComplaintRequest, $4.Empty>(
        'DeleteComplaint',
        deleteComplaint_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $9.DeleteComplaintRequest.fromBuffer(value),
        ($4.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$10.CreateTargetListRequest, $10.CreateTargetListResponse>(
        'CreateTargetList',
        createTargetList_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $10.CreateTargetListRequest.fromBuffer(value),
        ($10.CreateTargetListResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$10.GetTargetListRequest, $10.GetTargetListResponse>(
        'GetTargetList',
        getTargetList_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $10.GetTargetListRequest.fromBuffer(value),
        ($10.GetTargetListResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$10.UpdateTargetListRequest, $10.UpdateTargetListResponse>(
        'UpdateTargetList',
        updateTargetList_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $10.UpdateTargetListRequest.fromBuffer(value),
        ($10.UpdateTargetListResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$10.DeleteTargetListRequest, $4.Empty>(
        'DeleteTargetList',
        deleteTargetList_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $10.DeleteTargetListRequest.fromBuffer(value),
        ($4.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$11.CreateChangeTargetRequest, $11.CreateChangeTargetResponse>(
        'CreateChangeTarget',
        createChangeTarget_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $11.CreateChangeTargetRequest.fromBuffer(value),
        ($11.CreateChangeTargetResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$11.GetChangeTargetRequest, $11.GetChangeTargetResponse>(
        'GetChangeTarget',
        getChangeTarget_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $11.GetChangeTargetRequest.fromBuffer(value),
        ($11.GetChangeTargetResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$11.DeleteChangeTargetRequest, $4.Empty>(
        'DeleteChangeTarget',
        deleteChangeTarget_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $11.DeleteChangeTargetRequest.fromBuffer(value),
        ($4.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$12.CreateImagesRequest, $12.CreateImagesResponse>(
        'CreateImages',
        createImages_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $12.CreateImagesRequest.fromBuffer(value),
        ($12.CreateImagesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$12.GetImagesRequest, $12.GetImagesResponse>(
        'GetImages',
        getImages_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $12.GetImagesRequest.fromBuffer(value),
        ($12.GetImagesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$12.UpdateImagesRequest, $12.UpdateImagesResponse>(
        'UpdateImages',
        updateImages_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $12.UpdateImagesRequest.fromBuffer(value),
        ($12.UpdateImagesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$12.DeleteImagesRequest, $4.Empty>(
        'DeleteImages',
        deleteImages_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $12.DeleteImagesRequest.fromBuffer(value),
        ($4.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$13.CreatePaymentRequest, $13.CreatePaymentResponse>(
        'CreatePayment',
        createPayment_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $13.CreatePaymentRequest.fromBuffer(value),
        ($13.CreatePaymentResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$13.GetPaymentRequest, $13.GetPaymentResponse>(
        'GetPayment',
        getPayment_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $13.GetPaymentRequest.fromBuffer(value),
        ($13.GetPaymentResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$14.GetUserIDRequest, $14.GetUserIDResponse>(
        'GetUserID',
        getUserID_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $14.GetUserIDRequest.fromBuffer(value),
        ($14.GetUserIDResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.LoginUserResponse> loginUser_Pre($grpc.ServiceCall call, $async.Future<$0.LoginUserRequest> request) async {
    return loginUser(call, await request);
  }

  $async.Future<$1.CheckEmailResponse> checkEmail_Pre($grpc.ServiceCall call, $async.Future<$1.CheckEmailRequest> request) async {
    return checkEmail(call, await request);
  }

  $async.Future<$1.CheckedEmailResponse> checkEmailCode_Pre($grpc.ServiceCall call, $async.Future<$1.SendEmailRequest> request) async {
    return checkEmailCode(call, await request);
  }

  $async.Future<$2.InputPasswordResponse> inputPassword_Pre($grpc.ServiceCall call, $async.Future<$2.InputPasswordRequest> request) async {
    return inputPassword(call, await request);
  }

  $async.Future<$2.ResetPasswordResponse> resetPassword_Pre($grpc.ServiceCall call, $async.Future<$2.ResetPasswordRequest> request) async {
    return resetPassword(call, await request);
  }

  $async.Future<$3.CreateFixResponse> createFix_Pre($grpc.ServiceCall call, $async.Future<$3.CreateFixRequest> request) async {
    return createFix(call, await request);
  }

  $async.Future<$3.GetFixResponse> getFix_Pre($grpc.ServiceCall call, $async.Future<$3.GetFixRequest> request) async {
    return getFix(call, await request);
  }

  $async.Future<$4.Empty> deleteFix_Pre($grpc.ServiceCall call, $async.Future<$3.DeleteFixRequest> request) async {
    return deleteFix(call, await request);
  }

  $async.Future<$5.CreateCanChangeResponse> createCanChange_Pre($grpc.ServiceCall call, $async.Future<$5.CreateCanChangeRequest> request) async {
    return createCanChange(call, await request);
  }

  $async.Future<$5.GetCanChangeResponse> getCanChange_Pre($grpc.ServiceCall call, $async.Future<$5.GetCanChangeRequest> request) async {
    return getCanChange(call, await request);
  }

  $async.Future<$5.UpdateCanChangeResponse> updateCanChange_Pre($grpc.ServiceCall call, $async.Future<$5.UpdateCanChangeRequest> request) async {
    return updateCanChange(call, await request);
  }

  $async.Future<$4.Empty> deleteCanChange_Pre($grpc.ServiceCall call, $async.Future<$5.DeleteCanChangeRequest> request) async {
    return deleteCanChange(call, await request);
  }

  $async.Future<$6.CreateAccompanyResponse> createAccompany_Pre($grpc.ServiceCall call, $async.Future<$6.CreateAccompanyRequest> request) async {
    return createAccompany(call, await request);
  }

  $async.Future<$6.GetAccompanyResponse> getAccompany_Pre($grpc.ServiceCall call, $async.Future<$6.GetAccompanyRequest> request) async {
    return getAccompany(call, await request);
  }

  $async.Future<$6.UpdateAccompanyResponse> updateAccompany_Pre($grpc.ServiceCall call, $async.Future<$6.UpdateAccompanyRequest> request) async {
    return updateAccompany(call, await request);
  }

  $async.Future<$4.Empty> deleteAccompany_Pre($grpc.ServiceCall call, $async.Future<$6.DeleteAccompanyRequest> request) async {
    return deleteAccompany(call, await request);
  }

  $async.Future<$7.CreateHobbyResponse> createHobby_Pre($grpc.ServiceCall call, $async.Future<$7.CreateHobbyRequest> request) async {
    return createHobby(call, await request);
  }

  $async.Future<$7.GetHobbyResponse> getHobby_Pre($grpc.ServiceCall call, $async.Future<$7.GetHobbyRequest> request) async {
    return getHobby(call, await request);
  }

  $async.Future<$7.UpdateHobbyResponse> updateHobby_Pre($grpc.ServiceCall call, $async.Future<$7.UpdateHobbyRequest> request) async {
    return updateHobby(call, await request);
  }

  $async.Future<$4.Empty> deleteHobby_Pre($grpc.ServiceCall call, $async.Future<$7.DeleteHobbyRequest> request) async {
    return deleteHobby(call, await request);
  }

  $async.Future<$8.CreateLoverResponse> createLover_Pre($grpc.ServiceCall call, $async.Future<$8.CreateLoverRequest> request) async {
    return createLover(call, await request);
  }

  $async.Future<$8.GetLoverResponse> getLover_Pre($grpc.ServiceCall call, $async.Future<$8.GetLoverRequest> request) async {
    return getLover(call, await request);
  }

  $async.Future<$8.UpdateLoverResponse> updateLover_Pre($grpc.ServiceCall call, $async.Future<$8.UpdateLoverRequest> request) async {
    return updateLover(call, await request);
  }

  $async.Future<$4.Empty> deleteLover_Pre($grpc.ServiceCall call, $async.Future<$8.DeleteLoverRequest> request) async {
    return deleteLover(call, await request);
  }

  $async.Future<$9.CreateComplaintResponse> createComplaint_Pre($grpc.ServiceCall call, $async.Future<$9.CreateComplaintRequest> request) async {
    return createComplaint(call, await request);
  }

  $async.Future<$9.GetComplaintResponse> getComplaint_Pre($grpc.ServiceCall call, $async.Future<$9.GetComplaintRequest> request) async {
    return getComplaint(call, await request);
  }

  $async.Future<$9.UpdateComplaintResponse> updateComplaint_Pre($grpc.ServiceCall call, $async.Future<$9.UpdateComplaintRequest> request) async {
    return updateComplaint(call, await request);
  }

  $async.Future<$4.Empty> deleteComplaint_Pre($grpc.ServiceCall call, $async.Future<$9.DeleteComplaintRequest> request) async {
    return deleteComplaint(call, await request);
  }

  $async.Future<$10.CreateTargetListResponse> createTargetList_Pre($grpc.ServiceCall call, $async.Future<$10.CreateTargetListRequest> request) async {
    return createTargetList(call, await request);
  }

  $async.Future<$10.GetTargetListResponse> getTargetList_Pre($grpc.ServiceCall call, $async.Future<$10.GetTargetListRequest> request) async {
    return getTargetList(call, await request);
  }

  $async.Future<$10.UpdateTargetListResponse> updateTargetList_Pre($grpc.ServiceCall call, $async.Future<$10.UpdateTargetListRequest> request) async {
    return updateTargetList(call, await request);
  }

  $async.Future<$4.Empty> deleteTargetList_Pre($grpc.ServiceCall call, $async.Future<$10.DeleteTargetListRequest> request) async {
    return deleteTargetList(call, await request);
  }

  $async.Future<$11.CreateChangeTargetResponse> createChangeTarget_Pre($grpc.ServiceCall call, $async.Future<$11.CreateChangeTargetRequest> request) async {
    return createChangeTarget(call, await request);
  }

  $async.Future<$11.GetChangeTargetResponse> getChangeTarget_Pre($grpc.ServiceCall call, $async.Future<$11.GetChangeTargetRequest> request) async {
    return getChangeTarget(call, await request);
  }

  $async.Future<$4.Empty> deleteChangeTarget_Pre($grpc.ServiceCall call, $async.Future<$11.DeleteChangeTargetRequest> request) async {
    return deleteChangeTarget(call, await request);
  }

  $async.Future<$12.CreateImagesResponse> createImages_Pre($grpc.ServiceCall call, $async.Future<$12.CreateImagesRequest> request) async {
    return createImages(call, await request);
  }

  $async.Future<$12.GetImagesResponse> getImages_Pre($grpc.ServiceCall call, $async.Future<$12.GetImagesRequest> request) async {
    return getImages(call, await request);
  }

  $async.Future<$12.UpdateImagesResponse> updateImages_Pre($grpc.ServiceCall call, $async.Future<$12.UpdateImagesRequest> request) async {
    return updateImages(call, await request);
  }

  $async.Future<$4.Empty> deleteImages_Pre($grpc.ServiceCall call, $async.Future<$12.DeleteImagesRequest> request) async {
    return deleteImages(call, await request);
  }

  $async.Future<$13.CreatePaymentResponse> createPayment_Pre($grpc.ServiceCall call, $async.Future<$13.CreatePaymentRequest> request) async {
    return createPayment(call, await request);
  }

  $async.Future<$13.GetPaymentResponse> getPayment_Pre($grpc.ServiceCall call, $async.Future<$13.GetPaymentRequest> request) async {
    return getPayment(call, await request);
  }

  $async.Future<$14.GetUserIDResponse> getUserID_Pre($grpc.ServiceCall call, $async.Future<$14.GetUserIDRequest> request) async {
    return getUserID(call, await request);
  }

  $async.Future<$0.LoginUserResponse> loginUser($grpc.ServiceCall call, $0.LoginUserRequest request);
  $async.Future<$1.CheckEmailResponse> checkEmail($grpc.ServiceCall call, $1.CheckEmailRequest request);
  $async.Future<$1.CheckedEmailResponse> checkEmailCode($grpc.ServiceCall call, $1.SendEmailRequest request);
  $async.Future<$2.InputPasswordResponse> inputPassword($grpc.ServiceCall call, $2.InputPasswordRequest request);
  $async.Future<$2.ResetPasswordResponse> resetPassword($grpc.ServiceCall call, $2.ResetPasswordRequest request);
  $async.Future<$3.CreateFixResponse> createFix($grpc.ServiceCall call, $3.CreateFixRequest request);
  $async.Future<$3.GetFixResponse> getFix($grpc.ServiceCall call, $3.GetFixRequest request);
  $async.Future<$4.Empty> deleteFix($grpc.ServiceCall call, $3.DeleteFixRequest request);
  $async.Future<$5.CreateCanChangeResponse> createCanChange($grpc.ServiceCall call, $5.CreateCanChangeRequest request);
  $async.Future<$5.GetCanChangeResponse> getCanChange($grpc.ServiceCall call, $5.GetCanChangeRequest request);
  $async.Future<$5.UpdateCanChangeResponse> updateCanChange($grpc.ServiceCall call, $5.UpdateCanChangeRequest request);
  $async.Future<$4.Empty> deleteCanChange($grpc.ServiceCall call, $5.DeleteCanChangeRequest request);
  $async.Future<$6.CreateAccompanyResponse> createAccompany($grpc.ServiceCall call, $6.CreateAccompanyRequest request);
  $async.Future<$6.GetAccompanyResponse> getAccompany($grpc.ServiceCall call, $6.GetAccompanyRequest request);
  $async.Future<$6.UpdateAccompanyResponse> updateAccompany($grpc.ServiceCall call, $6.UpdateAccompanyRequest request);
  $async.Future<$4.Empty> deleteAccompany($grpc.ServiceCall call, $6.DeleteAccompanyRequest request);
  $async.Future<$7.CreateHobbyResponse> createHobby($grpc.ServiceCall call, $7.CreateHobbyRequest request);
  $async.Future<$7.GetHobbyResponse> getHobby($grpc.ServiceCall call, $7.GetHobbyRequest request);
  $async.Future<$7.UpdateHobbyResponse> updateHobby($grpc.ServiceCall call, $7.UpdateHobbyRequest request);
  $async.Future<$4.Empty> deleteHobby($grpc.ServiceCall call, $7.DeleteHobbyRequest request);
  $async.Future<$8.CreateLoverResponse> createLover($grpc.ServiceCall call, $8.CreateLoverRequest request);
  $async.Future<$8.GetLoverResponse> getLover($grpc.ServiceCall call, $8.GetLoverRequest request);
  $async.Future<$8.UpdateLoverResponse> updateLover($grpc.ServiceCall call, $8.UpdateLoverRequest request);
  $async.Future<$4.Empty> deleteLover($grpc.ServiceCall call, $8.DeleteLoverRequest request);
  $async.Future<$9.CreateComplaintResponse> createComplaint($grpc.ServiceCall call, $9.CreateComplaintRequest request);
  $async.Future<$9.GetComplaintResponse> getComplaint($grpc.ServiceCall call, $9.GetComplaintRequest request);
  $async.Future<$9.UpdateComplaintResponse> updateComplaint($grpc.ServiceCall call, $9.UpdateComplaintRequest request);
  $async.Future<$4.Empty> deleteComplaint($grpc.ServiceCall call, $9.DeleteComplaintRequest request);
  $async.Future<$10.CreateTargetListResponse> createTargetList($grpc.ServiceCall call, $10.CreateTargetListRequest request);
  $async.Future<$10.GetTargetListResponse> getTargetList($grpc.ServiceCall call, $10.GetTargetListRequest request);
  $async.Future<$10.UpdateTargetListResponse> updateTargetList($grpc.ServiceCall call, $10.UpdateTargetListRequest request);
  $async.Future<$4.Empty> deleteTargetList($grpc.ServiceCall call, $10.DeleteTargetListRequest request);
  $async.Future<$11.CreateChangeTargetResponse> createChangeTarget($grpc.ServiceCall call, $11.CreateChangeTargetRequest request);
  $async.Future<$11.GetChangeTargetResponse> getChangeTarget($grpc.ServiceCall call, $11.GetChangeTargetRequest request);
  $async.Future<$4.Empty> deleteChangeTarget($grpc.ServiceCall call, $11.DeleteChangeTargetRequest request);
  $async.Future<$12.CreateImagesResponse> createImages($grpc.ServiceCall call, $12.CreateImagesRequest request);
  $async.Future<$12.GetImagesResponse> getImages($grpc.ServiceCall call, $12.GetImagesRequest request);
  $async.Future<$12.UpdateImagesResponse> updateImages($grpc.ServiceCall call, $12.UpdateImagesRequest request);
  $async.Future<$4.Empty> deleteImages($grpc.ServiceCall call, $12.DeleteImagesRequest request);
  $async.Future<$13.CreatePaymentResponse> createPayment($grpc.ServiceCall call, $13.CreatePaymentRequest request);
  $async.Future<$13.GetPaymentResponse> getPayment($grpc.ServiceCall call, $13.GetPaymentRequest request);
  $async.Future<$14.GetUserIDResponse> getUserID($grpc.ServiceCall call, $14.GetUserIDRequest request);
}
@$pb.GrpcServiceName('pb.Chat')
class ChatClient extends $grpc.Client {
  static final _$createChatTable = $grpc.ClientMethod<$15.CreateChatTableRequest, $4.Empty>(
      '/pb.Chat/CreateChatTable',
      ($15.CreateChatTableRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.Empty.fromBuffer(value));
  static final _$createChatRecord = $grpc.ClientMethod<$15.CreateChatRecordRequest, $15.CreateChatRecordResponse>(
      '/pb.Chat/CreateChatRecord',
      ($15.CreateChatRecordRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $15.CreateChatRecordResponse.fromBuffer(value));
  static final _$getChatRecord = $grpc.ClientMethod<$15.GetChatRecordRequest, $15.GetChatRecordResponse>(
      '/pb.Chat/GetChatRecord',
      ($15.GetChatRecordRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $15.GetChatRecordResponse.fromBuffer(value));
  static final _$updateChatRecord = $grpc.ClientMethod<$15.UpdateChatRecordRequest, $15.UpdateChatRecordResponse>(
      '/pb.Chat/UpdateChatRecord',
      ($15.UpdateChatRecordRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $15.UpdateChatRecordResponse.fromBuffer(value));
  static final _$deleteChatRecord = $grpc.ClientMethod<$15.DeleteChatRecordRequest, $4.Empty>(
      '/pb.Chat/DeleteChatRecord',
      ($15.DeleteChatRecordRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.Empty.fromBuffer(value));
  static final _$getTargetID = $grpc.ClientMethod<$15.GetTargetIDRequest, $15.GetTargetIDResponse>(
      '/pb.Chat/GetTargetID',
      ($15.GetTargetIDRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $15.GetTargetIDResponse.fromBuffer(value));
  static final _$getLastMsg = $grpc.ClientMethod<$15.GetLastMsgRequest, $15.GetLastMsgResponse>(
      '/pb.Chat/GetLastMsg',
      ($15.GetLastMsgRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $15.GetLastMsgResponse.fromBuffer(value));

  ChatClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$4.Empty> createChatTable($15.CreateChatTableRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createChatTable, request, options: options);
  }

  $grpc.ResponseFuture<$15.CreateChatRecordResponse> createChatRecord($15.CreateChatRecordRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createChatRecord, request, options: options);
  }

  $grpc.ResponseFuture<$15.GetChatRecordResponse> getChatRecord($15.GetChatRecordRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getChatRecord, request, options: options);
  }

  $grpc.ResponseFuture<$15.UpdateChatRecordResponse> updateChatRecord($15.UpdateChatRecordRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateChatRecord, request, options: options);
  }

  $grpc.ResponseFuture<$4.Empty> deleteChatRecord($15.DeleteChatRecordRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteChatRecord, request, options: options);
  }

  $grpc.ResponseFuture<$15.GetTargetIDResponse> getTargetID($15.GetTargetIDRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTargetID, request, options: options);
  }

  $grpc.ResponseFuture<$15.GetLastMsgResponse> getLastMsg($15.GetLastMsgRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getLastMsg, request, options: options);
  }
}

@$pb.GrpcServiceName('pb.Chat')
abstract class ChatServiceBase extends $grpc.Service {
  $core.String get $name => 'pb.Chat';

  ChatServiceBase() {
    $addMethod($grpc.ServiceMethod<$15.CreateChatTableRequest, $4.Empty>(
        'CreateChatTable',
        createChatTable_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $15.CreateChatTableRequest.fromBuffer(value),
        ($4.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$15.CreateChatRecordRequest, $15.CreateChatRecordResponse>(
        'CreateChatRecord',
        createChatRecord_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $15.CreateChatRecordRequest.fromBuffer(value),
        ($15.CreateChatRecordResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$15.GetChatRecordRequest, $15.GetChatRecordResponse>(
        'GetChatRecord',
        getChatRecord_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $15.GetChatRecordRequest.fromBuffer(value),
        ($15.GetChatRecordResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$15.UpdateChatRecordRequest, $15.UpdateChatRecordResponse>(
        'UpdateChatRecord',
        updateChatRecord_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $15.UpdateChatRecordRequest.fromBuffer(value),
        ($15.UpdateChatRecordResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$15.DeleteChatRecordRequest, $4.Empty>(
        'DeleteChatRecord',
        deleteChatRecord_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $15.DeleteChatRecordRequest.fromBuffer(value),
        ($4.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$15.GetTargetIDRequest, $15.GetTargetIDResponse>(
        'GetTargetID',
        getTargetID_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $15.GetTargetIDRequest.fromBuffer(value),
        ($15.GetTargetIDResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$15.GetLastMsgRequest, $15.GetLastMsgResponse>(
        'GetLastMsg',
        getLastMsg_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $15.GetLastMsgRequest.fromBuffer(value),
        ($15.GetLastMsgResponse value) => value.writeToBuffer()));
  }

  $async.Future<$4.Empty> createChatTable_Pre($grpc.ServiceCall call, $async.Future<$15.CreateChatTableRequest> request) async {
    return createChatTable(call, await request);
  }

  $async.Future<$15.CreateChatRecordResponse> createChatRecord_Pre($grpc.ServiceCall call, $async.Future<$15.CreateChatRecordRequest> request) async {
    return createChatRecord(call, await request);
  }

  $async.Future<$15.GetChatRecordResponse> getChatRecord_Pre($grpc.ServiceCall call, $async.Future<$15.GetChatRecordRequest> request) async {
    return getChatRecord(call, await request);
  }

  $async.Future<$15.UpdateChatRecordResponse> updateChatRecord_Pre($grpc.ServiceCall call, $async.Future<$15.UpdateChatRecordRequest> request) async {
    return updateChatRecord(call, await request);
  }

  $async.Future<$4.Empty> deleteChatRecord_Pre($grpc.ServiceCall call, $async.Future<$15.DeleteChatRecordRequest> request) async {
    return deleteChatRecord(call, await request);
  }

  $async.Future<$15.GetTargetIDResponse> getTargetID_Pre($grpc.ServiceCall call, $async.Future<$15.GetTargetIDRequest> request) async {
    return getTargetID(call, await request);
  }

  $async.Future<$15.GetLastMsgResponse> getLastMsg_Pre($grpc.ServiceCall call, $async.Future<$15.GetLastMsgRequest> request) async {
    return getLastMsg(call, await request);
  }

  $async.Future<$4.Empty> createChatTable($grpc.ServiceCall call, $15.CreateChatTableRequest request);
  $async.Future<$15.CreateChatRecordResponse> createChatRecord($grpc.ServiceCall call, $15.CreateChatRecordRequest request);
  $async.Future<$15.GetChatRecordResponse> getChatRecord($grpc.ServiceCall call, $15.GetChatRecordRequest request);
  $async.Future<$15.UpdateChatRecordResponse> updateChatRecord($grpc.ServiceCall call, $15.UpdateChatRecordRequest request);
  $async.Future<$4.Empty> deleteChatRecord($grpc.ServiceCall call, $15.DeleteChatRecordRequest request);
  $async.Future<$15.GetTargetIDResponse> getTargetID($grpc.ServiceCall call, $15.GetTargetIDRequest request);
  $async.Future<$15.GetLastMsgResponse> getLastMsg($grpc.ServiceCall call, $15.GetLastMsgRequest request);
}
