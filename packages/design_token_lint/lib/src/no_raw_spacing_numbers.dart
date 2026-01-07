import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/error/error.dart' hide LintCode;
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

class NoRawSpacingNumbers extends DartLintRule {
  const NoRawSpacingNumbers() : super(code: _code);

  static const _code = LintCode(
    name: 'no_raw_spacing_numbers',
    problemMessage:
    'Avoid raw numeric layout values. Use design tokens / semantic variants instead.',
    errorSeverity: DiagnosticSeverity.ERROR,
  );

  static const _watchedTypes = {
    'EdgeInsets',
    'SizedBox',
    'BorderRadius',
    'Radius',
  };

  @override
  void run(
      CustomLintResolver resolver,
      DiagnosticReporter reporter,
      CustomLintContext context,
      ) {
    context.registry.addInstanceCreationExpression((node) {
      final typeName = _createdTypeName(node);
      if (typeName == null || !_watchedTypes.contains(typeName)) return;

      // Allow token-ish constructors without args
      // e.g. EdgeInsets.zero, SizedBox.shrink(), etc.
      final args = node.argumentList.arguments;
      if (args.isEmpty) return;

      // If any argument is a raw numeric literal, flag it.
      final hasRawNumber = args.any(_containsNumericLiteralDeep);
      if (!hasRawNumber) return;

      reporter.atNode(node, code);
    });
  }

  String? _createdTypeName(InstanceCreationExpression node) {
    final type = node.constructorName.type;
    return type.name.lexeme; // e.g. EdgeInsets / SizedBox
  }

  bool _containsNumericLiteralDeep(AstNode n) {
    // Handle literals: 12, 12.0
    if (n is IntegerLiteral || n is DoubleLiteral) return true;

    // Handle negative numbers: -12, -12.0
    if (n is PrefixExpression && n.operator.lexeme == '-') {
      final operand = n.operand;
      return operand is IntegerLiteral || operand is DoubleLiteral;
    }

    // Recurse into children to catch named args etc.
    return n.childEntities.any((e) => e is AstNode && _containsNumericLiteralDeep(e));
  }
}