import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money/application/search/search_bloc.dart';
import 'package:money/domain/transaction/transaction_model.dart';
import 'package:money/presentation/create_transaction/create_transaction_page.dart';
import 'package:money/presentation/tool/diacritics.dart';
import 'package:money/presentation/tool/palatte.dart';
import 'package:money/presentation/tool/tool.dart';

class TransactionSearchDelegate extends SearchDelegate<TransactionModel> {
  final SearchBloc bloc;

  TransactionSearchDelegate(this.bloc);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(
          Icons.clear,
          color: context.theme.colorScheme.onSurface,
        ),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return BackButton(
      onPressed: () {
        close(context, const TransactionModel());
      },
      color: context.theme.colorScheme.onSurface,
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length > 2) {
      bloc.add(SearchEvent.search(
        query: query.trim().toLowerCase().withoutDiacritics,
      ));
    }
    return BlocBuilder<SearchBloc, SearchState>(
      bloc: bloc,
      builder: (context, state) {
        List<TransactionModel> data = state.data;
        return ListView.separated(
          itemCount: data.length,
          itemBuilder: (context, index) {
            TransactionModel transaction = data[index];
            return ListTile(
              onTap: () => CreateTransactionPage.show(
                context: context,
                transaction: transaction,
              ),
              minVerticalPadding: 0,
              leading: SizedBox(
                height: double.infinity,
                child: iconByGoal(transaction.transactionFor),
              ),
              minLeadingWidth: 0,
              title: Text(
                transaction.groupName,
                style: context.textTheme.labelMedium,
              ),
              subtitle: transaction.description.isNotEmpty
                  ? Text(transaction.description)
                  : null,
              trailing: Text(
                moneyFormat(transaction.value * transaction.mode),
                style: context.textTheme.labelMedium?.copyWith(
                  color: transaction.mode == -1
                      ? Palette.decrease
                      : Palette.increase,
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(thickness: 0.5, height: 1);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
