// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:money/application/create_group/create_group_bloc.dart' as _i559;
import 'package:money/application/search/search_bloc.dart' as _i788;
import 'package:money/domain/transaction/i_group_repository.dart' as _i728;
import 'package:money/domain/transaction/i_transaction_repository.dart'
    as _i938;
import 'package:money/infrastructure/remote/group_repository.dart' as _i1061;
import 'package:money/infrastructure/remote/transaction_repository.dart'
    as _i1043;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt configDI({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i788.SearchBloc>(() => _i788.SearchBloc());
    gh.factory<_i559.CreateGroupBloc>(() => _i559.CreateGroupBloc());
    gh.factory<_i938.ITransactionRepository>(
        () => _i1043.TransactionRepository());
    gh.factory<_i728.IGroupRepository>(() => _i1061.GroupRepository());
    return this;
  }
}
