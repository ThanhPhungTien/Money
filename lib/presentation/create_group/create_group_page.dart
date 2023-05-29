import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money/application/create_group/create_group_bloc.dart';
import 'package:money/model/group/group.dart';
import 'package:money/presentation/loading/loading_view.dart';

class CreateGroupPage extends StatefulWidget {
  const CreateGroupPage({Key? key}) : super(key: key);

  @override
  State<CreateGroupPage> createState() => _CreateGroupPageState();
}

class _CreateGroupPageState extends State<CreateGroupPage> {
  CreateGroupBloc bloc = CreateGroupBloc()..add(const CreateGroupEventInit());

  GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  TextEditingController nameTEC = TextEditingController();
  TextEditingController descriptionTEC = TextEditingController();

  FocusNode descriptionNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tạo nhóm'),
      ),
      body: BlocConsumer<CreateGroupBloc, CreateGroupState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is CreateGroupStateDone) {
            Navigator.pop(context);
          }
        },
        buildWhen: (prev, state) {
          return state is! CreateGroupStateDone;
        },
        builder: (context, state) {
          if (state is CreateGroupStateNormal) {
            return Form(
              key: keyForm,
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Tên nhóm',
                    ),
                    controller: nameTEC,
                    onEditingComplete: () =>
                        FocusScope.of(context).requestFocus(descriptionNode),
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Không được để trống tên nhóm';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: descriptionTEC,
                    focusNode: descriptionNode,
                    decoration: const InputDecoration(
                      labelText: 'Mô tả',
                    ),
                  ),
                  const SizedBox(height: 16),
                  SwitchListTile(
                    value: state.paid,
                    title: Text(state.paid ? 'Giao dịch chi' : 'Giao dịch thu'),
                    onChanged: (check) =>
                        bloc.add(CreateGroupEventUpdateCheck(check)),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () => onPressedSave(state.paid),
                    child: const Text('Lưu'),
                  )
                ],
              ),
            );
          }
          return const LoadingView();
        },
      ),
    );
  }

  void onPressedSave(bool paid) {
    if (keyForm.currentState?.validate() ?? false) {
      bloc.add(CreateGroupEventSave(Group(
        name: nameTEC.text,
        description: descriptionTEC.text,
        mode: paid ? -1 : 1,
      )));
    }
  }
}
