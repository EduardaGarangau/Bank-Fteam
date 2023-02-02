import 'package:bank_challenge/value_objects/address_vo/cep_VO.dart';
import 'package:bank_challenge/value_objects/address_vo/city_vo.dart';
import 'package:bank_challenge/value_objects/address_vo/state_vo.dart';
import '../value_objects/address_vo/complement_vo.dart';
import '../value_objects/address_vo/district_vo.dart';
import '../value_objects/address_vo/number_vo.dart';
import '../value_objects/address_vo/street_vo.dart';

class Address {
  StreetVO _street;
  NumberVO _number;
  DistrictVO _district;
  CityVO _city;
  StateVO _state;
  CepVO _cep;
  ComplementVO _complement;

  StreetVO get street => _street;
  void setStreet(String value) => _street = StreetVO(value);

  NumberVO get number => _number;
  void setNumber(String value) => _number = NumberVO(value);

  DistrictVO get district => _district;
  void setDistrict(String value) => _district = DistrictVO(value);

  CityVO get city => _city;
  void setCity(String value) => _city = CityVO(value);

  StateVO get state => _state;
  void setState(String value) => _state = StateVO(value);

  CepVO get cep => _cep;
  void setCep(String value) => _cep = CepVO(value);

  ComplementVO get complement => _complement;
  void setComplement(String value) {
    value.isEmpty
        ? _complement = ComplementVO(null)
        : _complement = ComplementVO(value);
  }

  Address(
      {required street,
      required number,
      required district,
      required city,
      required state,
      required cep,
      required complement})
      : _street = StreetVO(street),
        _number = NumberVO(number),
        _district = DistrictVO(district),
        _city = CityVO(city),
        _state = StateVO(state),
        _cep = CepVO(cep),
        _complement = ComplementVO(complement);
}
