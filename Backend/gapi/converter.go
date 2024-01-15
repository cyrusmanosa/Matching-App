package gapi

import (
	ch "Backend/db/sqlc/chat"
	info "Backend/db/sqlc/info"

	"Backend/pb"

	"google.golang.org/protobuf/types/known/timestamppb"
)

func convertFix(fix info.Fixinformation) *pb.Fix {
	return &pb.Fix{
		FirstName:     fix.FirstName,
		LastName:      fix.LastName,
		Birth:         fix.Birth,
		Country:       fix.Country,
		Gender:        fix.Gender,
		Blood:         fix.Blood,
		Age:           fix.Age,
		Constellation: fix.Constellation,
		Certification: fix.Certification,
		CreateAt:      timestamppb.New(fix.CreatedAt.Time),
	}
}

func convertHobby(Hobby info.Hobby) *pb.Hobby {
	return &pb.Hobby{
		UserID:        Hobby.UserID,
		Era:           Hobby.Era,
		City:          Hobby.City,
		Gender:        Hobby.Gender,
		Speaklanguage: Hobby.Speaklanguage,
		FindType:      Hobby.FindType,
		Experience:    Hobby.Experience,
		InfoChangedAt: timestamppb.New(Hobby.InfoChangedAt.Time),
	}
}

func convertLover(Lover info.Lover) *pb.Lover {
	return &pb.Lover{
		UserID:        Lover.UserID,
		MinAge:        Lover.MinAge,
		MaxAge:        Lover.MaxAge,
		City:          Lover.City,
		Gender:        Lover.Gender,
		Sexual:        Lover.Sexual,
		Speaklanguage: Lover.Speaklanguage,
		InfoChangedAt: timestamppb.New(Lover.InfoChangedAt.Time),
	}
}

func convertAccompany(Accompany info.Accompany) *pb.Accompany {
	return &pb.Accompany{
		UserID:        Accompany.UserID,
		Era:           Accompany.Era,
		Speaklanguage: Accompany.Speaklanguage,
		FindType:      Accompany.FindType,
		Sociability:   Accompany.Sociability,
		InfoChangedAt: timestamppb.New(Accompany.InfoChangedAt.Time),
	}
}

func convertCanChange(cc info.Canchangeinformation) *pb.CanChange {
	return &pb.CanChange{
		UserID:        cc.UserID,
		NickName:      cc.Nickname,
		City:          cc.City,
		Sexual:        cc.Sexual,
		Height:        cc.Height,
		Weight:        cc.Weight,
		Speaklanguage: cc.Speaklanguage,
		Education:     cc.Education,
		Job:           cc.Job,
		AnnualSalary:  cc.AnnualSalary,
		Sociability:   cc.Sociability,
		Religious:     cc.Religious,
		Introduce:     cc.Introduce,
		InfoChangedAt: timestamppb.New(cc.InfoChangedAt.Time),
	}
}

func convertChangeTarget(ct info.Changetargetuser) *pb.ChangeTarget {
	return &pb.ChangeTarget{
		UserID:       ct.UserID,
		ChangeUserID: ct.ChangeUserID,
		Reason:       ct.Reason,
		Frequency:    ct.Frequency,
		ChangeTime:   timestamppb.New(ct.ChangeTime.Time),
	}
}

func convertContact(c info.Contact) *pb.Contact {
	return &pb.Contact{
		ContactID:   c.ContactID,
		UserID:      c.UserID,
		ContactType: c.ContactType,
		Message:     c.Message,
		Status:      c.Status,
		ContactAt:   timestamppb.New(c.ContactAt.Time),
	}
}

func convertImages(img info.Image) *pb.Images {
	return &pb.Images{
		UserID: img.UserID,
		Img1:   img.Img1,
		Img2:   img.Img2,
		Img3:   img.Img3,
		Img4:   img.Img4,
		Img5:   img.Img5,
	}
}

func convertTargetList(tl info.Targetlist) *pb.Targetlist {
	return &pb.Targetlist{
		UserID:    tl.UserID,
		Target1ID: tl.Target1ID,
		T1Type:    tl.T1Type,
		Target2ID: tl.Target2ID,
		T2Type:    tl.T2Type,
		Target3ID: tl.Target3ID,
		T3Type:    tl.T3Type,
		UpdatedAt: timestamppb.New(tl.UpdatedAt.Time),
	}
}

func convertPay(p info.Payment) *pb.Payment {
	return &pb.Payment{
		PayID:       p.PayID.String(),
		FullName:    p.Fullname,
		PaymentType: p.PaymentType,
		Amount:      p.Amount,
		Product:     p.Product,
		PayAt:       timestamppb.New(p.PayAt.Time),
	}
}

func convertChat(chat ch.Record) *pb.ChatRecord {
	return &pb.ChatRecord{
		TargetID:  chat.TargetID,
		RoleType:  chat.RoleType,
		MediaType: chat.MediaType,
		Media:     chat.Media,
		Isread:    chat.Isread,
		CreatedAt: timestamppb.New(chat.CreatedAt),
	}
}

func convertChatList(chats []ch.Record) []*pb.ChatRecordNoID {
	pbChats := make([]*pb.ChatRecordNoID, len(chats))

	for i, chat := range chats {
		pbChats[i] = &pb.ChatRecordNoID{
			RoleType:  chat.RoleType,
			MediaType: chat.MediaType,
			Media:     chat.Media,
			Isread:    chat.Isread,
			CreatedAt: timestamppb.New(chat.CreatedAt),
		}
	}
	return pbChats
}
