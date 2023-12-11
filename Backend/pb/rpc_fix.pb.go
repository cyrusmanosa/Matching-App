// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.31.0
// 	protoc        v4.25.1
// source: rpc_fix.proto

package pb

import (
	protoreflect "google.golang.org/protobuf/reflect/protoreflect"
	protoimpl "google.golang.org/protobuf/runtime/protoimpl"
	timestamppb "google.golang.org/protobuf/types/known/timestamppb"
	reflect "reflect"
	sync "sync"
)

const (
	// Verify that this generated code is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(20 - protoimpl.MinVersion)
	// Verify that runtime/protoimpl is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(protoimpl.MaxVersion - 20)
)

type CreateFixRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	FirstName string `protobuf:"bytes,1,opt,name=FirstName,proto3" json:"FirstName,omitempty"`
	LastName  string `protobuf:"bytes,2,opt,name=LastName,proto3" json:"LastName,omitempty"`
	Birth     string `protobuf:"bytes,3,opt,name=Birth,proto3" json:"Birth,omitempty"`
	Country   string `protobuf:"bytes,4,opt,name=Country,proto3" json:"Country,omitempty"`
	Gender    string `protobuf:"bytes,5,opt,name=Gender,proto3" json:"Gender,omitempty"`
	Blood     string `protobuf:"bytes,6,opt,name=Blood,proto3" json:"Blood,omitempty"`
}

func (x *CreateFixRequest) Reset() {
	*x = CreateFixRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_rpc_fix_proto_msgTypes[0]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *CreateFixRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*CreateFixRequest) ProtoMessage() {}

func (x *CreateFixRequest) ProtoReflect() protoreflect.Message {
	mi := &file_rpc_fix_proto_msgTypes[0]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use CreateFixRequest.ProtoReflect.Descriptor instead.
func (*CreateFixRequest) Descriptor() ([]byte, []int) {
	return file_rpc_fix_proto_rawDescGZIP(), []int{0}
}

func (x *CreateFixRequest) GetFirstName() string {
	if x != nil {
		return x.FirstName
	}
	return ""
}

func (x *CreateFixRequest) GetLastName() string {
	if x != nil {
		return x.LastName
	}
	return ""
}

func (x *CreateFixRequest) GetBirth() string {
	if x != nil {
		return x.Birth
	}
	return ""
}

func (x *CreateFixRequest) GetCountry() string {
	if x != nil {
		return x.Country
	}
	return ""
}

func (x *CreateFixRequest) GetGender() string {
	if x != nil {
		return x.Gender
	}
	return ""
}

func (x *CreateFixRequest) GetBlood() string {
	if x != nil {
		return x.Blood
	}
	return ""
}

type CreateFixResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	SessionsID           string                 `protobuf:"bytes,1,opt,name=SessionsID,proto3" json:"SessionsID,omitempty"`
	UserID               int32                  `protobuf:"varint,2,opt,name=UserID,proto3" json:"UserID,omitempty"`
	Email                string                 `protobuf:"bytes,3,opt,name=Email,proto3" json:"Email,omitempty"`
	CreateAt             *timestamppb.Timestamp `protobuf:"bytes,4,opt,name=CreateAt,proto3" json:"CreateAt,omitempty"`
	AccessToken          string                 `protobuf:"bytes,5,opt,name=AccessToken,proto3" json:"AccessToken,omitempty"`
	AccessTokenExpiresAt *timestamppb.Timestamp `protobuf:"bytes,6,opt,name=AccessTokenExpiresAt,proto3" json:"AccessTokenExpiresAt,omitempty"`
}

func (x *CreateFixResponse) Reset() {
	*x = CreateFixResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_rpc_fix_proto_msgTypes[1]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *CreateFixResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*CreateFixResponse) ProtoMessage() {}

func (x *CreateFixResponse) ProtoReflect() protoreflect.Message {
	mi := &file_rpc_fix_proto_msgTypes[1]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use CreateFixResponse.ProtoReflect.Descriptor instead.
func (*CreateFixResponse) Descriptor() ([]byte, []int) {
	return file_rpc_fix_proto_rawDescGZIP(), []int{1}
}

func (x *CreateFixResponse) GetSessionsID() string {
	if x != nil {
		return x.SessionsID
	}
	return ""
}

func (x *CreateFixResponse) GetUserID() int32 {
	if x != nil {
		return x.UserID
	}
	return 0
}

func (x *CreateFixResponse) GetEmail() string {
	if x != nil {
		return x.Email
	}
	return ""
}

func (x *CreateFixResponse) GetCreateAt() *timestamppb.Timestamp {
	if x != nil {
		return x.CreateAt
	}
	return nil
}

func (x *CreateFixResponse) GetAccessToken() string {
	if x != nil {
		return x.AccessToken
	}
	return ""
}

func (x *CreateFixResponse) GetAccessTokenExpiresAt() *timestamppb.Timestamp {
	if x != nil {
		return x.AccessTokenExpiresAt
	}
	return nil
}

type DelFix struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	UserID int32 `protobuf:"varint,1,opt,name=UserID,proto3" json:"UserID,omitempty"`
}

func (x *DelFix) Reset() {
	*x = DelFix{}
	if protoimpl.UnsafeEnabled {
		mi := &file_rpc_fix_proto_msgTypes[2]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *DelFix) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*DelFix) ProtoMessage() {}

func (x *DelFix) ProtoReflect() protoreflect.Message {
	mi := &file_rpc_fix_proto_msgTypes[2]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use DelFix.ProtoReflect.Descriptor instead.
func (*DelFix) Descriptor() ([]byte, []int) {
	return file_rpc_fix_proto_rawDescGZIP(), []int{2}
}

func (x *DelFix) GetUserID() int32 {
	if x != nil {
		return x.UserID
	}
	return 0
}

var File_rpc_fix_proto protoreflect.FileDescriptor

var file_rpc_fix_proto_rawDesc = []byte{
	0x0a, 0x0d, 0x72, 0x70, 0x63, 0x5f, 0x66, 0x69, 0x78, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x12,
	0x02, 0x70, 0x62, 0x1a, 0x1f, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2f, 0x70, 0x72, 0x6f, 0x74,
	0x6f, 0x62, 0x75, 0x66, 0x2f, 0x74, 0x69, 0x6d, 0x65, 0x73, 0x74, 0x61, 0x6d, 0x70, 0x2e, 0x70,
	0x72, 0x6f, 0x74, 0x6f, 0x22, 0xaa, 0x01, 0x0a, 0x10, 0x63, 0x72, 0x65, 0x61, 0x74, 0x65, 0x46,
	0x69, 0x78, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x1c, 0x0a, 0x09, 0x46, 0x69, 0x72,
	0x73, 0x74, 0x4e, 0x61, 0x6d, 0x65, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x09, 0x46, 0x69,
	0x72, 0x73, 0x74, 0x4e, 0x61, 0x6d, 0x65, 0x12, 0x1a, 0x0a, 0x08, 0x4c, 0x61, 0x73, 0x74, 0x4e,
	0x61, 0x6d, 0x65, 0x18, 0x02, 0x20, 0x01, 0x28, 0x09, 0x52, 0x08, 0x4c, 0x61, 0x73, 0x74, 0x4e,
	0x61, 0x6d, 0x65, 0x12, 0x14, 0x0a, 0x05, 0x42, 0x69, 0x72, 0x74, 0x68, 0x18, 0x03, 0x20, 0x01,
	0x28, 0x09, 0x52, 0x05, 0x42, 0x69, 0x72, 0x74, 0x68, 0x12, 0x18, 0x0a, 0x07, 0x43, 0x6f, 0x75,
	0x6e, 0x74, 0x72, 0x79, 0x18, 0x04, 0x20, 0x01, 0x28, 0x09, 0x52, 0x07, 0x43, 0x6f, 0x75, 0x6e,
	0x74, 0x72, 0x79, 0x12, 0x16, 0x0a, 0x06, 0x47, 0x65, 0x6e, 0x64, 0x65, 0x72, 0x18, 0x05, 0x20,
	0x01, 0x28, 0x09, 0x52, 0x06, 0x47, 0x65, 0x6e, 0x64, 0x65, 0x72, 0x12, 0x14, 0x0a, 0x05, 0x42,
	0x6c, 0x6f, 0x6f, 0x64, 0x18, 0x06, 0x20, 0x01, 0x28, 0x09, 0x52, 0x05, 0x42, 0x6c, 0x6f, 0x6f,
	0x64, 0x22, 0x8b, 0x02, 0x0a, 0x11, 0x63, 0x72, 0x65, 0x61, 0x74, 0x65, 0x46, 0x69, 0x78, 0x52,
	0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x1e, 0x0a, 0x0a, 0x53, 0x65, 0x73, 0x73, 0x69,
	0x6f, 0x6e, 0x73, 0x49, 0x44, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x0a, 0x53, 0x65, 0x73,
	0x73, 0x69, 0x6f, 0x6e, 0x73, 0x49, 0x44, 0x12, 0x16, 0x0a, 0x06, 0x55, 0x73, 0x65, 0x72, 0x49,
	0x44, 0x18, 0x02, 0x20, 0x01, 0x28, 0x05, 0x52, 0x06, 0x55, 0x73, 0x65, 0x72, 0x49, 0x44, 0x12,
	0x14, 0x0a, 0x05, 0x45, 0x6d, 0x61, 0x69, 0x6c, 0x18, 0x03, 0x20, 0x01, 0x28, 0x09, 0x52, 0x05,
	0x45, 0x6d, 0x61, 0x69, 0x6c, 0x12, 0x36, 0x0a, 0x08, 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x41,
	0x74, 0x18, 0x04, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x1a, 0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65,
	0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x54, 0x69, 0x6d, 0x65, 0x73, 0x74,
	0x61, 0x6d, 0x70, 0x52, 0x08, 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x41, 0x74, 0x12, 0x20, 0x0a,
	0x0b, 0x41, 0x63, 0x63, 0x65, 0x73, 0x73, 0x54, 0x6f, 0x6b, 0x65, 0x6e, 0x18, 0x05, 0x20, 0x01,
	0x28, 0x09, 0x52, 0x0b, 0x41, 0x63, 0x63, 0x65, 0x73, 0x73, 0x54, 0x6f, 0x6b, 0x65, 0x6e, 0x12,
	0x4e, 0x0a, 0x14, 0x41, 0x63, 0x63, 0x65, 0x73, 0x73, 0x54, 0x6f, 0x6b, 0x65, 0x6e, 0x45, 0x78,
	0x70, 0x69, 0x72, 0x65, 0x73, 0x41, 0x74, 0x18, 0x06, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x1a, 0x2e,
	0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e,
	0x54, 0x69, 0x6d, 0x65, 0x73, 0x74, 0x61, 0x6d, 0x70, 0x52, 0x14, 0x41, 0x63, 0x63, 0x65, 0x73,
	0x73, 0x54, 0x6f, 0x6b, 0x65, 0x6e, 0x45, 0x78, 0x70, 0x69, 0x72, 0x65, 0x73, 0x41, 0x74, 0x22,
	0x20, 0x0a, 0x06, 0x64, 0x65, 0x6c, 0x46, 0x69, 0x78, 0x12, 0x16, 0x0a, 0x06, 0x55, 0x73, 0x65,
	0x72, 0x49, 0x44, 0x18, 0x01, 0x20, 0x01, 0x28, 0x05, 0x52, 0x06, 0x55, 0x73, 0x65, 0x72, 0x49,
	0x44, 0x42, 0x0c, 0x5a, 0x0a, 0x42, 0x61, 0x63, 0x6b, 0x65, 0x6e, 0x64, 0x2f, 0x70, 0x62, 0x62,
	0x06, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x33,
}

var (
	file_rpc_fix_proto_rawDescOnce sync.Once
	file_rpc_fix_proto_rawDescData = file_rpc_fix_proto_rawDesc
)

func file_rpc_fix_proto_rawDescGZIP() []byte {
	file_rpc_fix_proto_rawDescOnce.Do(func() {
		file_rpc_fix_proto_rawDescData = protoimpl.X.CompressGZIP(file_rpc_fix_proto_rawDescData)
	})
	return file_rpc_fix_proto_rawDescData
}

var file_rpc_fix_proto_msgTypes = make([]protoimpl.MessageInfo, 3)
var file_rpc_fix_proto_goTypes = []interface{}{
	(*CreateFixRequest)(nil),      // 0: pb.createFixRequest
	(*CreateFixResponse)(nil),     // 1: pb.createFixResponse
	(*DelFix)(nil),                // 2: pb.delFix
	(*timestamppb.Timestamp)(nil), // 3: google.protobuf.Timestamp
}
var file_rpc_fix_proto_depIdxs = []int32{
	3, // 0: pb.createFixResponse.CreateAt:type_name -> google.protobuf.Timestamp
	3, // 1: pb.createFixResponse.AccessTokenExpiresAt:type_name -> google.protobuf.Timestamp
	2, // [2:2] is the sub-list for method output_type
	2, // [2:2] is the sub-list for method input_type
	2, // [2:2] is the sub-list for extension type_name
	2, // [2:2] is the sub-list for extension extendee
	0, // [0:2] is the sub-list for field type_name
}

func init() { file_rpc_fix_proto_init() }
func file_rpc_fix_proto_init() {
	if File_rpc_fix_proto != nil {
		return
	}
	if !protoimpl.UnsafeEnabled {
		file_rpc_fix_proto_msgTypes[0].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*CreateFixRequest); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_rpc_fix_proto_msgTypes[1].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*CreateFixResponse); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_rpc_fix_proto_msgTypes[2].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*DelFix); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
	}
	type x struct{}
	out := protoimpl.TypeBuilder{
		File: protoimpl.DescBuilder{
			GoPackagePath: reflect.TypeOf(x{}).PkgPath(),
			RawDescriptor: file_rpc_fix_proto_rawDesc,
			NumEnums:      0,
			NumMessages:   3,
			NumExtensions: 0,
			NumServices:   0,
		},
		GoTypes:           file_rpc_fix_proto_goTypes,
		DependencyIndexes: file_rpc_fix_proto_depIdxs,
		MessageInfos:      file_rpc_fix_proto_msgTypes,
	}.Build()
	File_rpc_fix_proto = out.File
	file_rpc_fix_proto_rawDesc = nil
	file_rpc_fix_proto_goTypes = nil
	file_rpc_fix_proto_depIdxs = nil
}
