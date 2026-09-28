List<String> hobbyMatchReasons({
  required String theirHobby,
  required String theirGender,
  required String theirCity,
  required List<String> theirLanguages,
  required int theirAge,
  required int theirExperience,
  required String findType,
  required String wantGender,
  required List<String> wantCities,
  required List<String> wantLanguages,
  required int wantEra,
  required int wantExperience,
}) {
  final reasons = <String>[];
  if (findType.isNotEmpty && theirHobby == findType) reasons.add('同じ趣味');
  if (_shares(wantLanguages, theirLanguages)) reasons.add('同じ言語');
  if (theirCity.isNotEmpty && wantCities.contains(theirCity)) reasons.add('同じ都市');
  if (_ageNear(theirAge, wantEra)) reasons.add('年齢が近い');
  if (wantGender.isNotEmpty && theirGender == wantGender) reasons.add('希望の性別');
  if (wantExperience > 0 && theirExperience >= wantExperience) {
    reasons.add('経験が希望以上');
  } else if (wantExperience > 0 && theirExperience * 2 >= wantExperience) {
    reasons.add('経験が近い');
  }
  return _cap(reasons);
}

List<String> loverMatchReasons({
  required String theirGender,
  required String theirSexual,
  required String theirCity,
  required List<String> theirLanguages,
  required int theirAge,
  required String wantGender,
  required String wantSexual,
  required List<String> wantCities,
  required List<String> wantLanguages,
  required int minAge,
  required int maxAge,
}) {
  final reasons = <String>[];
  if (wantGender.isNotEmpty && theirGender == wantGender) reasons.add('希望の性別');
  if (_ageInRange(theirAge, minAge, maxAge)) {
    reasons.add('希望の年齢');
  } else if (_ageNearRange(theirAge, minAge, maxAge)) {
    reasons.add('年齢が近い');
  }
  if (wantSexual.isNotEmpty && theirSexual == wantSexual) reasons.add('性的指向が合う');
  if (_shares(wantLanguages, theirLanguages)) reasons.add('同じ言語');
  if (theirCity.isNotEmpty && wantCities.contains(theirCity)) reasons.add('同じ都市');
  return _cap(reasons);
}

List<String> accompanyMatchReasons({
  required String theirAccompany,
  required String theirSociability,
  required List<String> theirLanguages,
  required int theirAge,
  required String findType,
  required String wantSociability,
  required List<String> wantLanguages,
  required int wantEra,
}) {
  final reasons = <String>[];
  if (findType.isNotEmpty && theirAccompany == findType) reasons.add('同じ相伴');
  if (wantSociability.isNotEmpty && theirSociability == wantSociability) reasons.add('社交力が合う');
  if (_shares(wantLanguages, theirLanguages)) reasons.add('同じ言語');
  if (_ageNear(theirAge, wantEra)) reasons.add('年齢が近い');
  return _cap(reasons);
}

List<String> _cap(List<String> reasons) {
  if (reasons.length <= 4) return reasons;
  return reasons.sublist(0, 4);
}

bool _shares(List<String> want, List<String> got) {
  final right = got.where((value) => value.isNotEmpty).toSet();
  return want.any((value) => value.isNotEmpty && right.contains(value));
}

bool _ageNear(int age, int era) {
  if (era <= 0 || age <= 0) return false;
  if (age >= era && age < era + 10) return true;
  final distance = age < era ? era - age : age - (era + 9);
  return distance <= 5;
}

bool _ageInRange(int age, int minAge, int maxAge) {
  if (minAge <= 0 && maxAge <= 0) return false;
  if (minAge > 0 && age < minAge) return false;
  if (maxAge > 0 && age > maxAge) return false;
  return true;
}

bool _ageNearRange(int age, int minAge, int maxAge) {
  if (minAge <= 0 && maxAge <= 0) return false;
  if (minAge > 0 && age < minAge) return minAge - age <= 5;
  if (maxAge > 0 && age > maxAge) return age - maxAge <= 5;
  return false;
}
