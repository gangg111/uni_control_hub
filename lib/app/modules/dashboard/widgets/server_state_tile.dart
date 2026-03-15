import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:uni_control_hub/app/data/app_strings.dart';
import 'package:uni_control_hub/app/data/info_data.dart';
import 'package:uni_control_hub/app/data/dialog_handler.dart';
import 'package:uni_control_hub/app/services/synergy_service.dart';

class ServerStateTile extends StatelessWidget {
  const ServerStateTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Watch((_) => Card(
          child: ListTile(
            title: Row(
              children: [
                Text(AppStrings.get('startServer')),
                const SizedBox(width: 5),
                InkWell(
                  onTap: () {
                    DialogHandler.showInfoDialog(
                      context: context,
                      title: AppStrings.get('startServer'),
                      text: serverInfoText,
                    );
                  },
                  child: const Icon(
                    Icons.info_outline,
                    size: 18,
                  ),
                )
              ],
            ),
            subtitle: Text(
              AppStrings.get('startServerSubtitle'),
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Colors.grey,
                  ),
            ),
            trailing: Switch.adaptive(
              value: SynergyService.to.isSynergyServerRunning.value,
              onChanged: (_) {
                SynergyService.to.toggleServer(context);
              },
            ),
          ),
        ));
  }
}
