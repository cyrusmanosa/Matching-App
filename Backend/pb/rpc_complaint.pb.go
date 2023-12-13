// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.31.0
// 	protoc        v4.25.1
// source: rpc_complaint.proto

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

type CreateComplaintRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	UserID     int32  `protobuf:"varint,1,opt,name=UserID,proto3" json:"UserID,omitempty"`
	CpTargetID int32  `protobuf:"varint,2,opt,name=CpTargetID,proto3" json:"CpTargetID,omitempty"`
	CpType     string `protobuf:"bytes,3,opt,name=CpType,proto3" json:"CpType,omitempty"`
	CpMessage  string `protobuf:"bytes,4,opt,name=CpMessage,proto3" json:"CpMessage,omitempty"`
}

func (x *CreateComplaintRequest) Reset() {
	*x = CreateComplaintRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_rpc_complaint_proto_msgTypes[0]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *CreateComplaintRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*CreateComplaintRequest) ProtoMessage() {}

func (x *CreateComplaintRequest) ProtoReflect() protoreflect.Message {
	mi := &file_rpc_complaint_proto_msgTypes[0]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use CreateComplaintRequest.ProtoReflect.Descriptor instead.
func (*CreateComplaintRequest) Descriptor() ([]byte, []int) {
	return file_rpc_complaint_proto_rawDescGZIP(), []int{0}
}

func (x *CreateComplaintRequest) GetUserID() int32 {
	if x != nil {
		return x.UserID
	}
	return 0
}

func (x *CreateComplaintRequest) GetCpTargetID() int32 {
	if x != nil {
		return x.CpTargetID
	}
	return 0
}

func (x *CreateComplaintRequest) GetCpType() string {
	if x != nil {
		return x.CpType
	}
	return ""
}

func (x *CreateComplaintRequest) GetCpMessage() string {
	if x != nil {
		return x.CpMessage
	}
	return ""
}

type CreateComplaintResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Cp *Complaint `protobuf:"bytes,1,opt,name=cp,proto3" json:"cp,omitempty"`
}

func (x *CreateComplaintResponse) Reset() {
	*x = CreateComplaintResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_rpc_complaint_proto_msgTypes[1]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *CreateComplaintResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*CreateComplaintResponse) ProtoMessage() {}

func (x *CreateComplaintResponse) ProtoReflect() protoreflect.Message {
	mi := &file_rpc_complaint_proto_msgTypes[1]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use CreateComplaintResponse.ProtoReflect.Descriptor instead.
func (*CreateComplaintResponse) Descriptor() ([]byte, []int) {
	return file_rpc_complaint_proto_rawDescGZIP(), []int{1}
}

func (x *CreateComplaintResponse) GetCp() *Complaint {
	if x != nil {
		return x.Cp
	}
	return nil
}

type GetComplaintRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	CpID int32 `protobuf:"varint,1,opt,name=CpID,proto3" json:"CpID,omitempty"`
}

func (x *GetComplaintRequest) Reset() {
	*x = GetComplaintRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_rpc_complaint_proto_msgTypes[2]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *GetComplaintRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*GetComplaintRequest) ProtoMessage() {}

func (x *GetComplaintRequest) ProtoReflect() protoreflect.Message {
	mi := &file_rpc_complaint_proto_msgTypes[2]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use GetComplaintRequest.ProtoReflect.Descriptor instead.
func (*GetComplaintRequest) Descriptor() ([]byte, []int) {
	return file_rpc_complaint_proto_rawDescGZIP(), []int{2}
}

func (x *GetComplaintRequest) GetCpID() int32 {
	if x != nil {
		return x.CpID
	}
	return 0
}

type GetComplaintResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Cp *Complaint `protobuf:"bytes,1,opt,name=cp,proto3" json:"cp,omitempty"`
}

func (x *GetComplaintResponse) Reset() {
	*x = GetComplaintResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_rpc_complaint_proto_msgTypes[3]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *GetComplaintResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*GetComplaintResponse) ProtoMessage() {}

func (x *GetComplaintResponse) ProtoReflect() protoreflect.Message {
	mi := &file_rpc_complaint_proto_msgTypes[3]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use GetComplaintResponse.ProtoReflect.Descriptor instead.
func (*GetComplaintResponse) Descriptor() ([]byte, []int) {
	return file_rpc_complaint_proto_rawDescGZIP(), []int{3}
}

func (x *GetComplaintResponse) GetCp() *Complaint {
	if x != nil {
		return x.Cp
	}
	return nil
}

type UpdateComplaintRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	CpID   int32  `protobuf:"varint,1,opt,name=CpID,proto3" json:"CpID,omitempty"`
	Status string `protobuf:"bytes,2,opt,name=Status,proto3" json:"Status,omitempty"`
}

func (x *UpdateComplaintRequest) Reset() {
	*x = UpdateComplaintRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_rpc_complaint_proto_msgTypes[4]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *UpdateComplaintRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*UpdateComplaintRequest) ProtoMessage() {}

func (x *UpdateComplaintRequest) ProtoReflect() protoreflect.Message {
	mi := &file_rpc_complaint_proto_msgTypes[4]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use UpdateComplaintRequest.ProtoReflect.Descriptor instead.
func (*UpdateComplaintRequest) Descriptor() ([]byte, []int) {
	return file_rpc_complaint_proto_rawDescGZIP(), []int{4}
}

func (x *UpdateComplaintRequest) GetCpID() int32 {
	if x != nil {
		return x.CpID
	}
	return 0
}

func (x *UpdateComplaintRequest) GetStatus() string {
	if x != nil {
		return x.Status
	}
	return ""
}

type UpdateComplaintResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Cp *Complaint `protobuf:"bytes,1,opt,name=cp,proto3" json:"cp,omitempty"`
}

func (x *UpdateComplaintResponse) Reset() {
	*x = UpdateComplaintResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_rpc_complaint_proto_msgTypes[5]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *UpdateComplaintResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*UpdateComplaintResponse) ProtoMessage() {}

func (x *UpdateComplaintResponse) ProtoReflect() protoreflect.Message {
	mi := &file_rpc_complaint_proto_msgTypes[5]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use UpdateComplaintResponse.ProtoReflect.Descriptor instead.
func (*UpdateComplaintResponse) Descriptor() ([]byte, []int) {
	return file_rpc_complaint_proto_rawDescGZIP(), []int{5}
}

func (x *UpdateComplaintResponse) GetCp() *Complaint {
	if x != nil {
		return x.Cp
	}
	return nil
}

var File_rpc_complaint_proto protoreflect.FileDescriptor

var file_rpc_complaint_proto_rawDesc = []byte{
	0x0a, 0x13, 0x72, 0x70, 0x63, 0x5f, 0x63, 0x6f, 0x6d, 0x70, 0x6c, 0x61, 0x69, 0x6e, 0x74, 0x2e,
	0x70, 0x72, 0x6f, 0x74, 0x6f, 0x12, 0x02, 0x70, 0x62, 0x1a, 0x0f, 0x63, 0x6f, 0x6d, 0x70, 0x6c,
	0x61, 0x69, 0x6e, 0x74, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x22, 0x86, 0x01, 0x0a, 0x16, 0x43,
	0x72, 0x65, 0x61, 0x74, 0x65, 0x43, 0x6f, 0x6d, 0x70, 0x6c, 0x61, 0x69, 0x6e, 0x74, 0x52, 0x65,
	0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x16, 0x0a, 0x06, 0x55, 0x73, 0x65, 0x72, 0x49, 0x44, 0x18,
	0x01, 0x20, 0x01, 0x28, 0x05, 0x52, 0x06, 0x55, 0x73, 0x65, 0x72, 0x49, 0x44, 0x12, 0x1e, 0x0a,
	0x0a, 0x43, 0x70, 0x54, 0x61, 0x72, 0x67, 0x65, 0x74, 0x49, 0x44, 0x18, 0x02, 0x20, 0x01, 0x28,
	0x05, 0x52, 0x0a, 0x43, 0x70, 0x54, 0x61, 0x72, 0x67, 0x65, 0x74, 0x49, 0x44, 0x12, 0x16, 0x0a,
	0x06, 0x43, 0x70, 0x54, 0x79, 0x70, 0x65, 0x18, 0x03, 0x20, 0x01, 0x28, 0x09, 0x52, 0x06, 0x43,
	0x70, 0x54, 0x79, 0x70, 0x65, 0x12, 0x1c, 0x0a, 0x09, 0x43, 0x70, 0x4d, 0x65, 0x73, 0x73, 0x61,
	0x67, 0x65, 0x18, 0x04, 0x20, 0x01, 0x28, 0x09, 0x52, 0x09, 0x43, 0x70, 0x4d, 0x65, 0x73, 0x73,
	0x61, 0x67, 0x65, 0x22, 0x38, 0x0a, 0x17, 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x43, 0x6f, 0x6d,
	0x70, 0x6c, 0x61, 0x69, 0x6e, 0x74, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x1d,
	0x0a, 0x02, 0x63, 0x70, 0x18, 0x01, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x0d, 0x2e, 0x70, 0x62, 0x2e,
	0x43, 0x6f, 0x6d, 0x70, 0x6c, 0x61, 0x69, 0x6e, 0x74, 0x52, 0x02, 0x63, 0x70, 0x22, 0x29, 0x0a,
	0x13, 0x47, 0x65, 0x74, 0x43, 0x6f, 0x6d, 0x70, 0x6c, 0x61, 0x69, 0x6e, 0x74, 0x52, 0x65, 0x71,
	0x75, 0x65, 0x73, 0x74, 0x12, 0x12, 0x0a, 0x04, 0x43, 0x70, 0x49, 0x44, 0x18, 0x01, 0x20, 0x01,
	0x28, 0x05, 0x52, 0x04, 0x43, 0x70, 0x49, 0x44, 0x22, 0x35, 0x0a, 0x14, 0x47, 0x65, 0x74, 0x43,
	0x6f, 0x6d, 0x70, 0x6c, 0x61, 0x69, 0x6e, 0x74, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65,
	0x12, 0x1d, 0x0a, 0x02, 0x63, 0x70, 0x18, 0x01, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x0d, 0x2e, 0x70,
	0x62, 0x2e, 0x43, 0x6f, 0x6d, 0x70, 0x6c, 0x61, 0x69, 0x6e, 0x74, 0x52, 0x02, 0x63, 0x70, 0x22,
	0x44, 0x0a, 0x16, 0x55, 0x70, 0x64, 0x61, 0x74, 0x65, 0x43, 0x6f, 0x6d, 0x70, 0x6c, 0x61, 0x69,
	0x6e, 0x74, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x12, 0x0a, 0x04, 0x43, 0x70, 0x49,
	0x44, 0x18, 0x01, 0x20, 0x01, 0x28, 0x05, 0x52, 0x04, 0x43, 0x70, 0x49, 0x44, 0x12, 0x16, 0x0a,
	0x06, 0x53, 0x74, 0x61, 0x74, 0x75, 0x73, 0x18, 0x02, 0x20, 0x01, 0x28, 0x09, 0x52, 0x06, 0x53,
	0x74, 0x61, 0x74, 0x75, 0x73, 0x22, 0x38, 0x0a, 0x17, 0x55, 0x70, 0x64, 0x61, 0x74, 0x65, 0x43,
	0x6f, 0x6d, 0x70, 0x6c, 0x61, 0x69, 0x6e, 0x74, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65,
	0x12, 0x1d, 0x0a, 0x02, 0x63, 0x70, 0x18, 0x01, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x0d, 0x2e, 0x70,
	0x62, 0x2e, 0x43, 0x6f, 0x6d, 0x70, 0x6c, 0x61, 0x69, 0x6e, 0x74, 0x52, 0x02, 0x63, 0x70, 0x42,
	0x0c, 0x5a, 0x0a, 0x42, 0x61, 0x63, 0x6b, 0x65, 0x6e, 0x64, 0x2f, 0x70, 0x62, 0x62, 0x06, 0x70,
	0x72, 0x6f, 0x74, 0x6f, 0x33,
}

var (
	file_rpc_complaint_proto_rawDescOnce sync.Once
	file_rpc_complaint_proto_rawDescData = file_rpc_complaint_proto_rawDesc
)

func file_rpc_complaint_proto_rawDescGZIP() []byte {
	file_rpc_complaint_proto_rawDescOnce.Do(func() {
		file_rpc_complaint_proto_rawDescData = protoimpl.X.CompressGZIP(file_rpc_complaint_proto_rawDescData)
	})
	return file_rpc_complaint_proto_rawDescData
}

var file_rpc_complaint_proto_msgTypes = make([]protoimpl.MessageInfo, 6)
var file_rpc_complaint_proto_goTypes = []interface{}{
	(*CreateComplaintRequest)(nil),  // 0: pb.CreateComplaintRequest
	(*CreateComplaintResponse)(nil), // 1: pb.CreateComplaintResponse
	(*GetComplaintRequest)(nil),     // 2: pb.GetComplaintRequest
	(*GetComplaintResponse)(nil),    // 3: pb.GetComplaintResponse
	(*UpdateComplaintRequest)(nil),  // 4: pb.UpdateComplaintRequest
	(*UpdateComplaintResponse)(nil), // 5: pb.UpdateComplaintResponse
	(*Complaint)(nil),               // 6: pb.Complaint
}
var file_rpc_complaint_proto_depIdxs = []int32{
	6, // 0: pb.CreateComplaintResponse.cp:type_name -> pb.Complaint
	6, // 1: pb.GetComplaintResponse.cp:type_name -> pb.Complaint
	6, // 2: pb.UpdateComplaintResponse.cp:type_name -> pb.Complaint
	3, // [3:3] is the sub-list for method output_type
	3, // [3:3] is the sub-list for method input_type
	3, // [3:3] is the sub-list for extension type_name
	3, // [3:3] is the sub-list for extension extendee
	0, // [0:3] is the sub-list for field type_name
}

func init() { file_rpc_complaint_proto_init() }
func file_rpc_complaint_proto_init() {
	if File_rpc_complaint_proto != nil {
		return
	}
	file_complaint_proto_init()
	if !protoimpl.UnsafeEnabled {
		file_rpc_complaint_proto_msgTypes[0].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*CreateComplaintRequest); i {
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
		file_rpc_complaint_proto_msgTypes[1].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*CreateComplaintResponse); i {
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
		file_rpc_complaint_proto_msgTypes[2].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*GetComplaintRequest); i {
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
		file_rpc_complaint_proto_msgTypes[3].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*GetComplaintResponse); i {
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
		file_rpc_complaint_proto_msgTypes[4].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*UpdateComplaintRequest); i {
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
		file_rpc_complaint_proto_msgTypes[5].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*UpdateComplaintResponse); i {
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
			RawDescriptor: file_rpc_complaint_proto_rawDesc,
			NumEnums:      0,
			NumMessages:   6,
			NumExtensions: 0,
			NumServices:   0,
		},
		GoTypes:           file_rpc_complaint_proto_goTypes,
		DependencyIndexes: file_rpc_complaint_proto_depIdxs,
		MessageInfos:      file_rpc_complaint_proto_msgTypes,
	}.Build()
	File_rpc_complaint_proto = out.File
	file_rpc_complaint_proto_rawDesc = nil
	file_rpc_complaint_proto_goTypes = nil
	file_rpc_complaint_proto_depIdxs = nil
}
