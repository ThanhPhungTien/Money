import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:money/domain/transaction/i_transaction_repository.dart';
import 'package:money/domain/transaction/transaction_model.dart';
import 'package:money/model/group/group.dart';

part 'search_bloc.freezed.dart';

part 'search_event.dart';

part 'search_state.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(const SearchState.normal()) {
    on<SearchEvent>((event, emit) async {
      await event.map(
        search: (event) => _search(event, emit),
        updateMonth: (event) {},
        updateUseFor: (event) {},
        updateGroup: (event) {},
      );
    });
  }

  _search(SearchEventSearch event, Emitter<SearchState> emit) async {
    log('call Search ${event.query}');
    List<TransactionModel> data = await GetIt.I
        .get<ITransactionRepository>()
        .searchByWord(event.query.toLowerCase());

    log('size ${data.length}');
    emit(SearchState.normal(data: data));
  }
}
