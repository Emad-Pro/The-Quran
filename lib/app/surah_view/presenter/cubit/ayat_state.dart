// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'ayat_cubit.dart';

@freezed
class AyatState extends Equatable {
  final AyatModel? ayatModel;
  final RequestState ayatSurahState;

  AyatState({this.ayatModel, this.ayatSurahState = RequestState.loading});

  @override
  List<Object?> get props => [ayatModel, ayatSurahState];

  AyatState copyWith({
    AyatModel? ayatModel,
    RequestState? ayatSurahState,
  }) {
    return AyatState(
      ayatModel: ayatModel ?? this.ayatModel,
      ayatSurahState: ayatSurahState ?? this.ayatSurahState,
    );
  }
}
