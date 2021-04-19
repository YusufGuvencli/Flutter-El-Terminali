class SevkiyatYukleDto {
  
  String _sevkEmriNo;
  String _cariKodu;
  int _subeKodu;
  int _userId;

  SevkiyatYukleDto(this._sevkEmriNo, this._cariKodu, this._subeKodu, this._userId);

  Map<String, dynamic> jsonParse() => {
        'sevkEmriNo': _sevkEmriNo,
        'cariKodu': _cariKodu,
        'userId': _userId,
        'subeKodu': _subeKodu
      };
}