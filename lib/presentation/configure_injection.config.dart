// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:money/application/create_group/create_group_bloc.dart' as _i3;
import 'package:money/application/search/search_bloc.dart' as _i8;
import 'package:money/domain/transaction/i_group_repository.dart' as _i4;
import 'package:money/domain/transaction/i_transaction_repository.dart' as _i6;
import 'package:money/infrastructure/remote/group_repository.dart' as _i5;
import 'package:money/infrastructure/remote/transaction_repository.dart' as _i7;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt configDI({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.CreateGroupBloc>(() => _i3.CreateGroupBloc());
    gh.factory<_i4.IGroupRepository>(() => _i5.GroupRepository());
    gh.factory<_i6.ITransactionRepository>(() => _i7.TransactionRepository());
    gh.factory<_i8.SearchBloc>(() => _i8.SearchBloc());
    return this;
  }
}
