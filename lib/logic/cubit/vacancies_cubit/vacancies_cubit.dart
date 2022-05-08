import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:slbfe_client/data/repositories/repository.dart';

import '../../../data/models/vacancy.dart';

part 'vacancies_state.dart';

class VacanciesCubit extends Cubit<VacanciesState> {
  VacanciesCubit() : super(VacanciesInitial());

  Future loadVacancies() async {
    try {
      emit(VacanciesLoading());
      List<Vacancy> vacancies = await Repository.getVacancies();
      emit(VacanciesLoaded(vacancies: vacancies));
    } catch (e) {
      emit(VacanciesFailed(errorMsg: e.toString()));
    }
  }
}
