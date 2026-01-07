import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:design_tokens_lints/src/no_raw_spacing_numbers.dart';

PluginBase createPlugin() => _DesignTokensLintsPlugin();

class _DesignTokensLintsPlugin extends PluginBase {
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) => [
    NoRawSpacingNumbers(),
  ];
}