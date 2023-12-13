// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.31.0
// 	protoc        v4.25.1
// source: complaint.proto

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

type Complaint struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	CpID          int32                  `protobuf:"varint,1,opt,name=CpID,proto3" json:"CpID,omitempty"`
	UserID        int32                  `protobuf:"varint,2,opt,name=UserID,proto3" json:"UserID,omitempty"`
	CpTargetID    int32                  `protobuf:"varint,3,opt,name=CpTargetID,proto3" json:"CpTargetID,omitempty"`
	CpType        string                 `protobuf:"bytes,4,opt,name=CpType,proto3" json:"CpType,omitempty"`
	CpMessage     string                 `protobuf:"bytes,5,opt,name=CpMessage,proto3" json:"CpMessage,omitempty"`
	Status        string                 `protobuf:"bytes,6,opt,name=Status,proto3" json:"Status,omitempty"`
	ComplaintTime *timestamppb.Timestamp `protobuf:"bytes,7,opt,name=ComplaintTime,proto3" json:"ComplaintTime,omitempty"`
}

func (x *Complaint) Reset() {
	*x = Complaint{}
	if protoimpl.UnsafeEnabled {
		mi := &file_complaint_proto_msgTypes[0]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *Complaint) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*Complaint) ProtoMessage() {}

func (x *Complaint) ProtoReflect() protoreflect.Message {
	mi := &file_complaint_proto_msgTypes[0]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use Complaint.ProtoReflect.Descriptor instead.
func (*Complaint) Descriptor() ([]byte, []int) {
	return file_complaint_proto_rawDescGZIP(), []int{0}
}

func (x *Complaint) GetCpID() int32 {
	if x != nil {
		return x.CpID
	}
	return 0
}

func (x *Complaint) GetUserID() int32 {
	if x != nil {
		return x.UserID
	}
	return 0
}

func (x *Complaint) GetCpTargetID() int32 {
	if x != nil {
		return x.CpTargetID
	}
	return 0
}

func (x *Complaint) GetCpType() string {
	if x != nil {
		return x.CpType
	}
	return ""
}

func (x *Complaint) GetCpMessage() string {
	if x != nil {
		return x.CpMessage
	}
	return ""
}

func (x *Complaint) GetStatus() string {
	if x != nil {
		return x.Status
	}
	return ""
}

func (x *Complaint) GetComplaintTime() *timestamppb.Timestamp {
	if x != nil {
		return x.ComplaintTime
	}
	return nil
}

var File_complaint_proto protoreflect.FileDescriptor

var file_complaint_proto_rawDesc = []byte{
	0x0a, 0x0f, 0x63, 0x6f, 0x6d, 0x70, 0x6c, 0x61, 0x69, 0x6e, 0x74, 0x2e, 0x70, 0x72, 0x6f, 0x74,
	0x6f, 0x12, 0x02, 0x70, 0x62, 0x1a, 0x1f, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2f, 0x70, 0x72,
	0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2f, 0x74, 0x69, 0x6d, 0x65, 0x73, 0x74, 0x61, 0x6d, 0x70,
	0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x22, 0xe7, 0x01, 0x0a, 0x09, 0x43, 0x6f, 0x6d, 0x70, 0x6c,
	0x61, 0x69, 0x6e, 0x74, 0x12, 0x12, 0x0a, 0x04, 0x43, 0x70, 0x49, 0x44, 0x18, 0x01, 0x20, 0x01,
	0x28, 0x05, 0x52, 0x04, 0x43, 0x70, 0x49, 0x44, 0x12, 0x16, 0x0a, 0x06, 0x55, 0x73, 0x65, 0x72,
	0x49, 0x44, 0x18, 0x02, 0x20, 0x01, 0x28, 0x05, 0x52, 0x06, 0x55, 0x73, 0x65, 0x72, 0x49, 0x44,
	0x12, 0x1e, 0x0a, 0x0a, 0x43, 0x70, 0x54, 0x61, 0x72, 0x67, 0x65, 0x74, 0x49, 0x44, 0x18, 0x03,
	0x20, 0x01, 0x28, 0x05, 0x52, 0x0a, 0x43, 0x70, 0x54, 0x61, 0x72, 0x67, 0x65, 0x74, 0x49, 0x44,
	0x12, 0x16, 0x0a, 0x06, 0x43, 0x70, 0x54, 0x79, 0x70, 0x65, 0x18, 0x04, 0x20, 0x01, 0x28, 0x09,
	0x52, 0x06, 0x43, 0x70, 0x54, 0x79, 0x70, 0x65, 0x12, 0x1c, 0x0a, 0x09, 0x43, 0x70, 0x4d, 0x65,
	0x73, 0x73, 0x61, 0x67, 0x65, 0x18, 0x05, 0x20, 0x01, 0x28, 0x09, 0x52, 0x09, 0x43, 0x70, 0x4d,
	0x65, 0x73, 0x73, 0x61, 0x67, 0x65, 0x12, 0x16, 0x0a, 0x06, 0x53, 0x74, 0x61, 0x74, 0x75, 0x73,
	0x18, 0x06, 0x20, 0x01, 0x28, 0x09, 0x52, 0x06, 0x53, 0x74, 0x61, 0x74, 0x75, 0x73, 0x12, 0x40,
	0x0a, 0x0d, 0x43, 0x6f, 0x6d, 0x70, 0x6c, 0x61, 0x69, 0x6e, 0x74, 0x54, 0x69, 0x6d, 0x65, 0x18,
	0x07, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x1a, 0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70,
	0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x54, 0x69, 0x6d, 0x65, 0x73, 0x74, 0x61, 0x6d,
	0x70, 0x52, 0x0d, 0x43, 0x6f, 0x6d, 0x70, 0x6c, 0x61, 0x69, 0x6e, 0x74, 0x54, 0x69, 0x6d, 0x65,
	0x42, 0x0c, 0x5a, 0x0a, 0x42, 0x61, 0x63, 0x6b, 0x65, 0x6e, 0x64, 0x2f, 0x70, 0x62, 0x62, 0x06,
	0x70, 0x72, 0x6f, 0x74, 0x6f, 0x33,
}

var (
	file_complaint_proto_rawDescOnce sync.Once
	file_complaint_proto_rawDescData = file_complaint_proto_rawDesc
)

func file_complaint_proto_rawDescGZIP() []byte {
	file_complaint_proto_rawDescOnce.Do(func() {
		file_complaint_proto_rawDescData = protoimpl.X.CompressGZIP(file_complaint_proto_rawDescData)
	})
	return file_complaint_proto_rawDescData
}

var file_complaint_proto_msgTypes = make([]protoimpl.MessageInfo, 1)
var file_complaint_proto_goTypes = []interface{}{
	(*Complaint)(nil),             // 0: pb.Complaint
	(*timestamppb.Timestamp)(nil), // 1: google.protobuf.Timestamp
}
var file_complaint_proto_depIdxs = []int32{
	1, // 0: pb.Complaint.ComplaintTime:type_name -> google.protobuf.Timestamp
	1, // [1:1] is the sub-list for method output_type
	1, // [1:1] is the sub-list for method input_type
	1, // [1:1] is the sub-list for extension type_name
	1, // [1:1] is the sub-list for extension extendee
	0, // [0:1] is the sub-list for field type_name
}

func init() { file_complaint_proto_init() }
func file_complaint_proto_init() {
	if File_complaint_proto != nil {
		return
	}
	if !protoimpl.UnsafeEnabled {
		file_complaint_proto_msgTypes[0].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*Complaint); i {
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
			RawDescriptor: file_complaint_proto_rawDesc,
			NumEnums:      0,
			NumMessages:   1,
			NumExtensions: 0,
			NumServices:   0,
		},
		GoTypes:           file_complaint_proto_goTypes,
		DependencyIndexes: file_complaint_proto_depIdxs,
		MessageInfos:      file_complaint_proto_msgTypes,
	}.Build()
	File_complaint_proto = out.File
	file_complaint_proto_rawDesc = nil
	file_complaint_proto_goTypes = nil
	file_complaint_proto_depIdxs = nil
}
