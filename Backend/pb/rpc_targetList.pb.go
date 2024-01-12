// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.31.0
// 	protoc        v4.25.1
// source: rpc_targetList.proto

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

// Create
type CreateTargetListRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	SessionID string `protobuf:"bytes,1,opt,name=SessionID,proto3" json:"SessionID,omitempty"`
	Target1ID int32  `protobuf:"varint,2,opt,name=Target1ID,proto3" json:"Target1ID,omitempty"`
	T1Type    string `protobuf:"bytes,3,opt,name=T1Type,proto3" json:"T1Type,omitempty"`
	Target2ID int32  `protobuf:"varint,4,opt,name=Target2ID,proto3" json:"Target2ID,omitempty"`
	T2Type    string `protobuf:"bytes,5,opt,name=T2Type,proto3" json:"T2Type,omitempty"`
	Target3ID int32  `protobuf:"varint,6,opt,name=Target3ID,proto3" json:"Target3ID,omitempty"`
	T3Type    string `protobuf:"bytes,7,opt,name=T3Type,proto3" json:"T3Type,omitempty"`
}

func (x *CreateTargetListRequest) Reset() {
	*x = CreateTargetListRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_rpc_targetList_proto_msgTypes[0]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *CreateTargetListRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*CreateTargetListRequest) ProtoMessage() {}

func (x *CreateTargetListRequest) ProtoReflect() protoreflect.Message {
	mi := &file_rpc_targetList_proto_msgTypes[0]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use CreateTargetListRequest.ProtoReflect.Descriptor instead.
func (*CreateTargetListRequest) Descriptor() ([]byte, []int) {
	return file_rpc_targetList_proto_rawDescGZIP(), []int{0}
}

func (x *CreateTargetListRequest) GetSessionID() string {
	if x != nil {
		return x.SessionID
	}
	return ""
}

func (x *CreateTargetListRequest) GetTarget1ID() int32 {
	if x != nil {
		return x.Target1ID
	}
	return 0
}

func (x *CreateTargetListRequest) GetT1Type() string {
	if x != nil {
		return x.T1Type
	}
	return ""
}

func (x *CreateTargetListRequest) GetTarget2ID() int32 {
	if x != nil {
		return x.Target2ID
	}
	return 0
}

func (x *CreateTargetListRequest) GetT2Type() string {
	if x != nil {
		return x.T2Type
	}
	return ""
}

func (x *CreateTargetListRequest) GetTarget3ID() int32 {
	if x != nil {
		return x.Target3ID
	}
	return 0
}

func (x *CreateTargetListRequest) GetT3Type() string {
	if x != nil {
		return x.T3Type
	}
	return ""
}

type CreateTargetListResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Tl *Targetlist `protobuf:"bytes,1,opt,name=tl,proto3" json:"tl,omitempty"`
}

func (x *CreateTargetListResponse) Reset() {
	*x = CreateTargetListResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_rpc_targetList_proto_msgTypes[1]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *CreateTargetListResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*CreateTargetListResponse) ProtoMessage() {}

func (x *CreateTargetListResponse) ProtoReflect() protoreflect.Message {
	mi := &file_rpc_targetList_proto_msgTypes[1]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use CreateTargetListResponse.ProtoReflect.Descriptor instead.
func (*CreateTargetListResponse) Descriptor() ([]byte, []int) {
	return file_rpc_targetList_proto_rawDescGZIP(), []int{1}
}

func (x *CreateTargetListResponse) GetTl() *Targetlist {
	if x != nil {
		return x.Tl
	}
	return nil
}

// Get
type GetTargetListRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	SessionID string `protobuf:"bytes,1,opt,name=SessionID,proto3" json:"SessionID,omitempty"`
}

func (x *GetTargetListRequest) Reset() {
	*x = GetTargetListRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_rpc_targetList_proto_msgTypes[2]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *GetTargetListRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*GetTargetListRequest) ProtoMessage() {}

func (x *GetTargetListRequest) ProtoReflect() protoreflect.Message {
	mi := &file_rpc_targetList_proto_msgTypes[2]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use GetTargetListRequest.ProtoReflect.Descriptor instead.
func (*GetTargetListRequest) Descriptor() ([]byte, []int) {
	return file_rpc_targetList_proto_rawDescGZIP(), []int{2}
}

func (x *GetTargetListRequest) GetSessionID() string {
	if x != nil {
		return x.SessionID
	}
	return ""
}

type GetTargetListResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Tl *Targetlist `protobuf:"bytes,1,opt,name=tl,proto3" json:"tl,omitempty"`
}

func (x *GetTargetListResponse) Reset() {
	*x = GetTargetListResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_rpc_targetList_proto_msgTypes[3]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *GetTargetListResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*GetTargetListResponse) ProtoMessage() {}

func (x *GetTargetListResponse) ProtoReflect() protoreflect.Message {
	mi := &file_rpc_targetList_proto_msgTypes[3]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use GetTargetListResponse.ProtoReflect.Descriptor instead.
func (*GetTargetListResponse) Descriptor() ([]byte, []int) {
	return file_rpc_targetList_proto_rawDescGZIP(), []int{3}
}

func (x *GetTargetListResponse) GetTl() *Targetlist {
	if x != nil {
		return x.Tl
	}
	return nil
}

// Update
type UpdateTargetListRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	SessionID string `protobuf:"bytes,1,opt,name=SessionID,proto3" json:"SessionID,omitempty"`
	Target1ID int32  `protobuf:"varint,2,opt,name=Target1ID,proto3" json:"Target1ID,omitempty"`
	T1Type    string `protobuf:"bytes,3,opt,name=T1Type,proto3" json:"T1Type,omitempty"`
	Target2ID int32  `protobuf:"varint,4,opt,name=Target2ID,proto3" json:"Target2ID,omitempty"`
	T2Type    string `protobuf:"bytes,5,opt,name=T2Type,proto3" json:"T2Type,omitempty"`
	Target3ID int32  `protobuf:"varint,6,opt,name=Target3ID,proto3" json:"Target3ID,omitempty"`
	T3Type    string `protobuf:"bytes,7,opt,name=T3Type,proto3" json:"T3Type,omitempty"`
}

func (x *UpdateTargetListRequest) Reset() {
	*x = UpdateTargetListRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_rpc_targetList_proto_msgTypes[4]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *UpdateTargetListRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*UpdateTargetListRequest) ProtoMessage() {}

func (x *UpdateTargetListRequest) ProtoReflect() protoreflect.Message {
	mi := &file_rpc_targetList_proto_msgTypes[4]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use UpdateTargetListRequest.ProtoReflect.Descriptor instead.
func (*UpdateTargetListRequest) Descriptor() ([]byte, []int) {
	return file_rpc_targetList_proto_rawDescGZIP(), []int{4}
}

func (x *UpdateTargetListRequest) GetSessionID() string {
	if x != nil {
		return x.SessionID
	}
	return ""
}

func (x *UpdateTargetListRequest) GetTarget1ID() int32 {
	if x != nil {
		return x.Target1ID
	}
	return 0
}

func (x *UpdateTargetListRequest) GetT1Type() string {
	if x != nil {
		return x.T1Type
	}
	return ""
}

func (x *UpdateTargetListRequest) GetTarget2ID() int32 {
	if x != nil {
		return x.Target2ID
	}
	return 0
}

func (x *UpdateTargetListRequest) GetT2Type() string {
	if x != nil {
		return x.T2Type
	}
	return ""
}

func (x *UpdateTargetListRequest) GetTarget3ID() int32 {
	if x != nil {
		return x.Target3ID
	}
	return 0
}

func (x *UpdateTargetListRequest) GetT3Type() string {
	if x != nil {
		return x.T3Type
	}
	return ""
}

type UpdateTargetListResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Tl *Targetlist `protobuf:"bytes,1,opt,name=tl,proto3" json:"tl,omitempty"`
}

func (x *UpdateTargetListResponse) Reset() {
	*x = UpdateTargetListResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_rpc_targetList_proto_msgTypes[5]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *UpdateTargetListResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*UpdateTargetListResponse) ProtoMessage() {}

func (x *UpdateTargetListResponse) ProtoReflect() protoreflect.Message {
	mi := &file_rpc_targetList_proto_msgTypes[5]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use UpdateTargetListResponse.ProtoReflect.Descriptor instead.
func (*UpdateTargetListResponse) Descriptor() ([]byte, []int) {
	return file_rpc_targetList_proto_rawDescGZIP(), []int{5}
}

func (x *UpdateTargetListResponse) GetTl() *Targetlist {
	if x != nil {
		return x.Tl
	}
	return nil
}

// Delete
type DeleteTargetListRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	SessionID string `protobuf:"bytes,1,opt,name=SessionID,proto3" json:"SessionID,omitempty"`
}

func (x *DeleteTargetListRequest) Reset() {
	*x = DeleteTargetListRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_rpc_targetList_proto_msgTypes[6]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *DeleteTargetListRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*DeleteTargetListRequest) ProtoMessage() {}

func (x *DeleteTargetListRequest) ProtoReflect() protoreflect.Message {
	mi := &file_rpc_targetList_proto_msgTypes[6]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use DeleteTargetListRequest.ProtoReflect.Descriptor instead.
func (*DeleteTargetListRequest) Descriptor() ([]byte, []int) {
	return file_rpc_targetList_proto_rawDescGZIP(), []int{6}
}

func (x *DeleteTargetListRequest) GetSessionID() string {
	if x != nil {
		return x.SessionID
	}
	return ""
}

var File_rpc_targetList_proto protoreflect.FileDescriptor

var file_rpc_targetList_proto_rawDesc = []byte{
	0x0a, 0x14, 0x72, 0x70, 0x63, 0x5f, 0x74, 0x61, 0x72, 0x67, 0x65, 0x74, 0x4c, 0x69, 0x73, 0x74,
	0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x12, 0x02, 0x70, 0x62, 0x1a, 0x10, 0x74, 0x61, 0x72, 0x67,
	0x65, 0x74, 0x4c, 0x69, 0x73, 0x74, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x22, 0xd9, 0x01, 0x0a,
	0x17, 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x54, 0x61, 0x72, 0x67, 0x65, 0x74, 0x4c, 0x69, 0x73,
	0x74, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x1c, 0x0a, 0x09, 0x53, 0x65, 0x73, 0x73,
	0x69, 0x6f, 0x6e, 0x49, 0x44, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x09, 0x53, 0x65, 0x73,
	0x73, 0x69, 0x6f, 0x6e, 0x49, 0x44, 0x12, 0x1c, 0x0a, 0x09, 0x54, 0x61, 0x72, 0x67, 0x65, 0x74,
	0x31, 0x49, 0x44, 0x18, 0x02, 0x20, 0x01, 0x28, 0x05, 0x52, 0x09, 0x54, 0x61, 0x72, 0x67, 0x65,
	0x74, 0x31, 0x49, 0x44, 0x12, 0x16, 0x0a, 0x06, 0x54, 0x31, 0x54, 0x79, 0x70, 0x65, 0x18, 0x03,
	0x20, 0x01, 0x28, 0x09, 0x52, 0x06, 0x54, 0x31, 0x54, 0x79, 0x70, 0x65, 0x12, 0x1c, 0x0a, 0x09,
	0x54, 0x61, 0x72, 0x67, 0x65, 0x74, 0x32, 0x49, 0x44, 0x18, 0x04, 0x20, 0x01, 0x28, 0x05, 0x52,
	0x09, 0x54, 0x61, 0x72, 0x67, 0x65, 0x74, 0x32, 0x49, 0x44, 0x12, 0x16, 0x0a, 0x06, 0x54, 0x32,
	0x54, 0x79, 0x70, 0x65, 0x18, 0x05, 0x20, 0x01, 0x28, 0x09, 0x52, 0x06, 0x54, 0x32, 0x54, 0x79,
	0x70, 0x65, 0x12, 0x1c, 0x0a, 0x09, 0x54, 0x61, 0x72, 0x67, 0x65, 0x74, 0x33, 0x49, 0x44, 0x18,
	0x06, 0x20, 0x01, 0x28, 0x05, 0x52, 0x09, 0x54, 0x61, 0x72, 0x67, 0x65, 0x74, 0x33, 0x49, 0x44,
	0x12, 0x16, 0x0a, 0x06, 0x54, 0x33, 0x54, 0x79, 0x70, 0x65, 0x18, 0x07, 0x20, 0x01, 0x28, 0x09,
	0x52, 0x06, 0x54, 0x33, 0x54, 0x79, 0x70, 0x65, 0x22, 0x3a, 0x0a, 0x18, 0x43, 0x72, 0x65, 0x61,
	0x74, 0x65, 0x54, 0x61, 0x72, 0x67, 0x65, 0x74, 0x4c, 0x69, 0x73, 0x74, 0x52, 0x65, 0x73, 0x70,
	0x6f, 0x6e, 0x73, 0x65, 0x12, 0x1e, 0x0a, 0x02, 0x74, 0x6c, 0x18, 0x01, 0x20, 0x01, 0x28, 0x0b,
	0x32, 0x0e, 0x2e, 0x70, 0x62, 0x2e, 0x54, 0x61, 0x72, 0x67, 0x65, 0x74, 0x6c, 0x69, 0x73, 0x74,
	0x52, 0x02, 0x74, 0x6c, 0x22, 0x34, 0x0a, 0x14, 0x47, 0x65, 0x74, 0x54, 0x61, 0x72, 0x67, 0x65,
	0x74, 0x4c, 0x69, 0x73, 0x74, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x1c, 0x0a, 0x09,
	0x53, 0x65, 0x73, 0x73, 0x69, 0x6f, 0x6e, 0x49, 0x44, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52,
	0x09, 0x53, 0x65, 0x73, 0x73, 0x69, 0x6f, 0x6e, 0x49, 0x44, 0x22, 0x37, 0x0a, 0x15, 0x47, 0x65,
	0x74, 0x54, 0x61, 0x72, 0x67, 0x65, 0x74, 0x4c, 0x69, 0x73, 0x74, 0x52, 0x65, 0x73, 0x70, 0x6f,
	0x6e, 0x73, 0x65, 0x12, 0x1e, 0x0a, 0x02, 0x74, 0x6c, 0x18, 0x01, 0x20, 0x01, 0x28, 0x0b, 0x32,
	0x0e, 0x2e, 0x70, 0x62, 0x2e, 0x54, 0x61, 0x72, 0x67, 0x65, 0x74, 0x6c, 0x69, 0x73, 0x74, 0x52,
	0x02, 0x74, 0x6c, 0x22, 0xd9, 0x01, 0x0a, 0x17, 0x55, 0x70, 0x64, 0x61, 0x74, 0x65, 0x54, 0x61,
	0x72, 0x67, 0x65, 0x74, 0x4c, 0x69, 0x73, 0x74, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12,
	0x1c, 0x0a, 0x09, 0x53, 0x65, 0x73, 0x73, 0x69, 0x6f, 0x6e, 0x49, 0x44, 0x18, 0x01, 0x20, 0x01,
	0x28, 0x09, 0x52, 0x09, 0x53, 0x65, 0x73, 0x73, 0x69, 0x6f, 0x6e, 0x49, 0x44, 0x12, 0x1c, 0x0a,
	0x09, 0x54, 0x61, 0x72, 0x67, 0x65, 0x74, 0x31, 0x49, 0x44, 0x18, 0x02, 0x20, 0x01, 0x28, 0x05,
	0x52, 0x09, 0x54, 0x61, 0x72, 0x67, 0x65, 0x74, 0x31, 0x49, 0x44, 0x12, 0x16, 0x0a, 0x06, 0x54,
	0x31, 0x54, 0x79, 0x70, 0x65, 0x18, 0x03, 0x20, 0x01, 0x28, 0x09, 0x52, 0x06, 0x54, 0x31, 0x54,
	0x79, 0x70, 0x65, 0x12, 0x1c, 0x0a, 0x09, 0x54, 0x61, 0x72, 0x67, 0x65, 0x74, 0x32, 0x49, 0x44,
	0x18, 0x04, 0x20, 0x01, 0x28, 0x05, 0x52, 0x09, 0x54, 0x61, 0x72, 0x67, 0x65, 0x74, 0x32, 0x49,
	0x44, 0x12, 0x16, 0x0a, 0x06, 0x54, 0x32, 0x54, 0x79, 0x70, 0x65, 0x18, 0x05, 0x20, 0x01, 0x28,
	0x09, 0x52, 0x06, 0x54, 0x32, 0x54, 0x79, 0x70, 0x65, 0x12, 0x1c, 0x0a, 0x09, 0x54, 0x61, 0x72,
	0x67, 0x65, 0x74, 0x33, 0x49, 0x44, 0x18, 0x06, 0x20, 0x01, 0x28, 0x05, 0x52, 0x09, 0x54, 0x61,
	0x72, 0x67, 0x65, 0x74, 0x33, 0x49, 0x44, 0x12, 0x16, 0x0a, 0x06, 0x54, 0x33, 0x54, 0x79, 0x70,
	0x65, 0x18, 0x07, 0x20, 0x01, 0x28, 0x09, 0x52, 0x06, 0x54, 0x33, 0x54, 0x79, 0x70, 0x65, 0x22,
	0x3a, 0x0a, 0x18, 0x55, 0x70, 0x64, 0x61, 0x74, 0x65, 0x54, 0x61, 0x72, 0x67, 0x65, 0x74, 0x4c,
	0x69, 0x73, 0x74, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x1e, 0x0a, 0x02, 0x74,
	0x6c, 0x18, 0x01, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x0e, 0x2e, 0x70, 0x62, 0x2e, 0x54, 0x61, 0x72,
	0x67, 0x65, 0x74, 0x6c, 0x69, 0x73, 0x74, 0x52, 0x02, 0x74, 0x6c, 0x22, 0x37, 0x0a, 0x17, 0x44,
	0x65, 0x6c, 0x65, 0x74, 0x65, 0x54, 0x61, 0x72, 0x67, 0x65, 0x74, 0x4c, 0x69, 0x73, 0x74, 0x52,
	0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x1c, 0x0a, 0x09, 0x53, 0x65, 0x73, 0x73, 0x69, 0x6f,
	0x6e, 0x49, 0x44, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x09, 0x53, 0x65, 0x73, 0x73, 0x69,
	0x6f, 0x6e, 0x49, 0x44, 0x42, 0x0c, 0x5a, 0x0a, 0x42, 0x61, 0x63, 0x6b, 0x65, 0x6e, 0x64, 0x2f,
	0x70, 0x62, 0x62, 0x06, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x33,
}

var (
	file_rpc_targetList_proto_rawDescOnce sync.Once
	file_rpc_targetList_proto_rawDescData = file_rpc_targetList_proto_rawDesc
)

func file_rpc_targetList_proto_rawDescGZIP() []byte {
	file_rpc_targetList_proto_rawDescOnce.Do(func() {
		file_rpc_targetList_proto_rawDescData = protoimpl.X.CompressGZIP(file_rpc_targetList_proto_rawDescData)
	})
	return file_rpc_targetList_proto_rawDescData
}

var file_rpc_targetList_proto_msgTypes = make([]protoimpl.MessageInfo, 7)
var file_rpc_targetList_proto_goTypes = []interface{}{
	(*CreateTargetListRequest)(nil),  // 0: pb.CreateTargetListRequest
	(*CreateTargetListResponse)(nil), // 1: pb.CreateTargetListResponse
	(*GetTargetListRequest)(nil),     // 2: pb.GetTargetListRequest
	(*GetTargetListResponse)(nil),    // 3: pb.GetTargetListResponse
	(*UpdateTargetListRequest)(nil),  // 4: pb.UpdateTargetListRequest
	(*UpdateTargetListResponse)(nil), // 5: pb.UpdateTargetListResponse
	(*DeleteTargetListRequest)(nil),  // 6: pb.DeleteTargetListRequest
	(*Targetlist)(nil),               // 7: pb.Targetlist
}
var file_rpc_targetList_proto_depIdxs = []int32{
	7, // 0: pb.CreateTargetListResponse.tl:type_name -> pb.Targetlist
	7, // 1: pb.GetTargetListResponse.tl:type_name -> pb.Targetlist
	7, // 2: pb.UpdateTargetListResponse.tl:type_name -> pb.Targetlist
	3, // [3:3] is the sub-list for method output_type
	3, // [3:3] is the sub-list for method input_type
	3, // [3:3] is the sub-list for extension type_name
	3, // [3:3] is the sub-list for extension extendee
	0, // [0:3] is the sub-list for field type_name
}

func init() { file_rpc_targetList_proto_init() }
func file_rpc_targetList_proto_init() {
	if File_rpc_targetList_proto != nil {
		return
	}
	file_targetList_proto_init()
	if !protoimpl.UnsafeEnabled {
		file_rpc_targetList_proto_msgTypes[0].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*CreateTargetListRequest); i {
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
		file_rpc_targetList_proto_msgTypes[1].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*CreateTargetListResponse); i {
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
		file_rpc_targetList_proto_msgTypes[2].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*GetTargetListRequest); i {
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
		file_rpc_targetList_proto_msgTypes[3].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*GetTargetListResponse); i {
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
		file_rpc_targetList_proto_msgTypes[4].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*UpdateTargetListRequest); i {
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
		file_rpc_targetList_proto_msgTypes[5].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*UpdateTargetListResponse); i {
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
		file_rpc_targetList_proto_msgTypes[6].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*DeleteTargetListRequest); i {
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
			RawDescriptor: file_rpc_targetList_proto_rawDesc,
			NumEnums:      0,
			NumMessages:   7,
			NumExtensions: 0,
			NumServices:   0,
		},
		GoTypes:           file_rpc_targetList_proto_goTypes,
		DependencyIndexes: file_rpc_targetList_proto_depIdxs,
		MessageInfos:      file_rpc_targetList_proto_msgTypes,
	}.Build()
	File_rpc_targetList_proto = out.File
	file_rpc_targetList_proto_rawDesc = nil
	file_rpc_targetList_proto_goTypes = nil
	file_rpc_targetList_proto_depIdxs = nil
}
