import 'package:appflowy/workspace/application/settings/ai/local_ai_setting_panel_bloc.dart';
import 'package:appflowy/workspace/presentation/settings/pages/setting_ai_view/ollma_setting.dart';
import 'package:flowy_infra_ui/widget/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'plugin_state.dart';

class LocalAISettingPanel extends StatelessWidget {
  const LocalAISettingPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocalAISettingPanelBloc(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: BlocBuilder<LocalAISettingPanelBloc, LocalAISettingPanelState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OllamaSettingPage(),
                VSpace(6),
                PluginStateIndicator(),
              ],
            );
          },
        ),
      ),
    );
  }
}
