// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.31.0
// 	protoc        v4.25.1
// source: rpc_checkEmail.proto

package pb

import (
	protoreflect "google.golang.org/protobuf/reflect/protoreflect"
	protoimpl "google.golang.org/protobuf/runtime/protoimpl"
	reflect "reflect"
	sync "sync"
)

const (
	// Verify that this generated code is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(20 - protoimpl.MinVersion)
	// Verify that runtime/protoimpl is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(protoimpl.MaxVersion - 20)
)

type CheckEmailRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Email string `protobuf:"bytes,1,opt,name=Email,proto3" json:"Email,omitempty"`
}

func (x *CheckEmailRequest) Reset() {
	*x = CheckEmailRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_rpc_checkEmail_proto_msgTypes[0]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *CheckEmailRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*CheckEmailRequest) ProtoMessage() {}

func (x *CheckEmailRequest) ProtoReflect() protoreflect.Message {
	mi := &file_rpc_checkEmail_proto_msgTypes[0]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use CheckEmailRequest.ProtoReflect.Descriptor instead.
func (*CheckEmailRequest) Descriptor() ([]byte, []int) {
	return file_rpc_checkEmail_proto_rawDescGZIP(), []int{0}
}

func (x *CheckEmailRequest) GetEmail() string {
	if x != nil {
		return x.Email
	}
	return ""
}

type CheckEmailResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Email     string `protobuf:"bytes,1,opt,name=Email,proto3" json:"Email,omitempty"`
	CheckCode string `protobuf:"bytes,2,opt,name=CheckCode,proto3" json:"CheckCode,omitempty"`
}

func (x *CheckEmailResponse) Reset() {
	*x = CheckEmailResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_rpc_checkEmail_proto_msgTypes[1]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *CheckEmailResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*CheckEmailResponse) ProtoMessage() {}

func (x *CheckEmailResponse) ProtoReflect() protoreflect.Message {
	mi := &file_rpc_checkEmail_proto_msgTypes[1]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use CheckEmailResponse.ProtoReflect.Descriptor instead.
func (*CheckEmailResponse) Descriptor() ([]byte, []int) {
	return file_rpc_checkEmail_proto_rawDescGZIP(), []int{1}
}

func (x *CheckEmailResponse) GetEmail() string {
	if x != nil {
		return x.Email
	}
	return ""
}

func (x *CheckEmailResponse) GetCheckCode() string {
	if x != nil {
		return x.CheckCode
	}
	return ""
}

type SendEmailRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	CheckCode string `protobuf:"bytes,1,opt,name=CheckCode,proto3" json:"CheckCode,omitempty"`
}

func (x *SendEmailRequest) Reset() {
	*x = SendEmailRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_rpc_checkEmail_proto_msgTypes[2]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *SendEmailRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*SendEmailRequest) ProtoMessage() {}

func (x *SendEmailRequest) ProtoReflect() protoreflect.Message {
	mi := &file_rpc_checkEmail_proto_msgTypes[2]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use SendEmailRequest.ProtoReflect.Descriptor instead.
func (*SendEmailRequest) Descriptor() ([]byte, []int) {
	return file_rpc_checkEmail_proto_rawDescGZIP(), []int{2}
}

func (x *SendEmailRequest) GetCheckCode() string {
	if x != nil {
		return x.CheckCode
	}
	return ""
}

type CheckedEmailResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Email  string `protobuf:"bytes,1,opt,name=Email,proto3" json:"Email,omitempty"`
	Status string `protobuf:"bytes,2,opt,name=Status,proto3" json:"Status,omitempty"`
}

func (x *CheckedEmailResponse) Reset() {
	*x = CheckedEmailResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_rpc_checkEmail_proto_msgTypes[3]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *CheckedEmailResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*CheckedEmailResponse) ProtoMessage() {}

func (x *CheckedEmailResponse) ProtoReflect() protoreflect.Message {
	mi := &file_rpc_checkEmail_proto_msgTypes[3]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use CheckedEmailResponse.ProtoReflect.Descriptor instead.
func (*CheckedEmailResponse) Descriptor() ([]byte, []int) {
	return file_rpc_checkEmail_proto_rawDescGZIP(), []int{3}
}

func (x *CheckedEmailResponse) GetEmail() string {
	if x != nil {
		return x.Email
	}
	return ""
}

func (x *CheckedEmailResponse) GetStatus() string {
	if x != nil {
		return x.Status
	}
	return ""
}

var File_rpc_checkEmail_proto protoreflect.FileDescriptor

var file_rpc_checkEmail_proto_rawDesc = []byte{
	0x0a, 0x14, 0x72, 0x70, 0x63, 0x5f, 0x63, 0x68, 0x65, 0x63, 0x6b, 0x45, 0x6d, 0x61, 0x69, 0x6c,
	0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x12, 0x02, 0x70, 0x62, 0x22, 0x29, 0x0a, 0x11, 0x43, 0x68,
	0x65, 0x63, 0x6b, 0x45, 0x6d, 0x61, 0x69, 0x6c, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12,
	0x14, 0x0a, 0x05, 0x45, 0x6d, 0x61, 0x69, 0x6c, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x05,
	0x45, 0x6d, 0x61, 0x69, 0x6c, 0x22, 0x48, 0x0a, 0x12, 0x43, 0x68, 0x65, 0x63, 0x6b, 0x45, 0x6d,
	0x61, 0x69, 0x6c, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x14, 0x0a, 0x05, 0x45,
	0x6d, 0x61, 0x69, 0x6c, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x05, 0x45, 0x6d, 0x61, 0x69,
	0x6c, 0x12, 0x1c, 0x0a, 0x09, 0x43, 0x68, 0x65, 0x63, 0x6b, 0x43, 0x6f, 0x64, 0x65, 0x18, 0x02,
	0x20, 0x01, 0x28, 0x09, 0x52, 0x09, 0x43, 0x68, 0x65, 0x63, 0x6b, 0x43, 0x6f, 0x64, 0x65, 0x22,
	0x30, 0x0a, 0x10, 0x53, 0x65, 0x6e, 0x64, 0x45, 0x6d, 0x61, 0x69, 0x6c, 0x52, 0x65, 0x71, 0x75,
	0x65, 0x73, 0x74, 0x12, 0x1c, 0x0a, 0x09, 0x43, 0x68, 0x65, 0x63, 0x6b, 0x43, 0x6f, 0x64, 0x65,
	0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x09, 0x43, 0x68, 0x65, 0x63, 0x6b, 0x43, 0x6f, 0x64,
	0x65, 0x22, 0x44, 0x0a, 0x14, 0x43, 0x68, 0x65, 0x63, 0x6b, 0x65, 0x64, 0x45, 0x6d, 0x61, 0x69,
	0x6c, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x14, 0x0a, 0x05, 0x45, 0x6d, 0x61,
	0x69, 0x6c, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x05, 0x45, 0x6d, 0x61, 0x69, 0x6c, 0x12,
	0x16, 0x0a, 0x06, 0x53, 0x74, 0x61, 0x74, 0x75, 0x73, 0x18, 0x02, 0x20, 0x01, 0x28, 0x09, 0x52,
	0x06, 0x53, 0x74, 0x61, 0x74, 0x75, 0x73, 0x42, 0x0c, 0x5a, 0x0a, 0x42, 0x61, 0x63, 0x6b, 0x65,
	0x6e, 0x64, 0x2f, 0x70, 0x62, 0x62, 0x06, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x33,
}

var (
	file_rpc_checkEmail_proto_rawDescOnce sync.Once
	file_rpc_checkEmail_proto_rawDescData = file_rpc_checkEmail_proto_rawDesc
)

func file_rpc_checkEmail_proto_rawDescGZIP() []byte {
	file_rpc_checkEmail_proto_rawDescOnce.Do(func() {
		file_rpc_checkEmail_proto_rawDescData = protoimpl.X.CompressGZIP(file_rpc_checkEmail_proto_rawDescData)
	})
	return file_rpc_checkEmail_proto_rawDescData
}

var file_rpc_checkEmail_proto_msgTypes = make([]protoimpl.MessageInfo, 4)
var file_rpc_checkEmail_proto_goTypes = []interface{}{
	(*CheckEmailRequest)(nil),    // 0: pb.CheckEmailRequest
	(*CheckEmailResponse)(nil),   // 1: pb.CheckEmailResponse
	(*SendEmailRequest)(nil),     // 2: pb.SendEmailRequest
	(*CheckedEmailResponse)(nil), // 3: pb.CheckedEmailResponse
}
var file_rpc_checkEmail_proto_depIdxs = []int32{
	0, // [0:0] is the sub-list for method output_type
	0, // [0:0] is the sub-list for method input_type
	0, // [0:0] is the sub-list for extension type_name
	0, // [0:0] is the sub-list for extension extendee
	0, // [0:0] is the sub-list for field type_name
}

func init() { file_rpc_checkEmail_proto_init() }
func file_rpc_checkEmail_proto_init() {
	if File_rpc_checkEmail_proto != nil {
		return
	}
	if !protoimpl.UnsafeEnabled {
		file_rpc_checkEmail_proto_msgTypes[0].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*CheckEmailRequest); i {
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
		file_rpc_checkEmail_proto_msgTypes[1].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*CheckEmailResponse); i {
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
		file_rpc_checkEmail_proto_msgTypes[2].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*SendEmailRequest); i {
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
		file_rpc_checkEmail_proto_msgTypes[3].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*CheckedEmailResponse); i {
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
			RawDescriptor: file_rpc_checkEmail_proto_rawDesc,
			NumEnums:      0,
			NumMessages:   4,
			NumExtensions: 0,
			NumServices:   0,
		},
		GoTypes:           file_rpc_checkEmail_proto_goTypes,
		DependencyIndexes: file_rpc_checkEmail_proto_depIdxs,
		MessageInfos:      file_rpc_checkEmail_proto_msgTypes,
	}.Build()
	File_rpc_checkEmail_proto = out.File
	file_rpc_checkEmail_proto_rawDesc = nil
	file_rpc_checkEmail_proto_goTypes = nil
	file_rpc_checkEmail_proto_depIdxs = nil
}