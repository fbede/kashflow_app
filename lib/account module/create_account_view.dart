import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../shared/responsive.dart';

class CreateAccountView extends StatefulWidget {
  const CreateAccountView({super.key});

  @override
  State<CreateAccountView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  late final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            const SizedBox(height: 16),
            Row(
              children: [
                Visibility(
                  visible: context.isPhone(),
                  child: IconButton(
                    icon: Icon(PhosphorIcons.regular.x),
                    iconSize: 24,
                    onPressed: () => context.pop(),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Add an Account',
                    style: context.theme().textTheme.titleLarge,
                  ),
                ),
                Visibility(
                  visible: !context.isPhone(),
                  child: IconButton(
                    icon: Icon(PhosphorIcons.regular.check),
                    iconSize: 24,
                    onPressed: () {},
                  ),
                ),
                Visibility(
                  visible: !context.isPhone(),
                  child: IconButton(
                    icon: Icon(PhosphorIcons.regular.x),
                    iconSize: 24,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _nameController,
              keyboardType: TextInputType.name,
              validator: _notEmptyValidator,
              decoration: const InputDecoration(labelText: 'Account Name'),
            ),
          ],
        ),
      );

  String? _notEmptyValidator(String? input) {
    if (input == null || input.isEmpty) {
      return 'Cannot be empty';
    }
    return null;
  }
}
