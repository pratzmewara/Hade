// import 'package:json_annotation/json_annotation.dart';

// part 'create_attendee.g.dart';


// class bulk{
//   String eventName;
//   String organisation;
//   List<CreateAttendee> attendee;
// }

// class CreateAttendee{
//   String name;
//   String registrationNumber;
//   String email;
//   String phoneNumber;
//   String gender;
//   CreateAttendee({
//     this.name,
//     this.registrationNumber,
//     this.email,
//     this.phoneNumber,
//     this.gender,
//   });

//     factory CreateAttendee.toJson(Map<String,dynamic> json) => _$CreateAttendeeFromJson<T>(json);

//   Map<String, dynamic> fromJson() => _$CreateAttendeeToJson(this);
// }

// class _Converter<T> implements JsonConverter<T, Object> {
//   const _Converter();

//   @override
//   T fromJson(Object json) {
//     // TODO: implement fromJson
//     return CreateAttendee.fromJson(json) as T;
//   }

//   @override
//   Object toJson(T object) {
//     // TODO: implement toJson
//     return object;
//   }

// }
