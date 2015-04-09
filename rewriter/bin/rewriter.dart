import "dart:io";

import "package:analyzer/analyzer.dart";
import "package:analyzer/src/generated/java_core.dart";
import "package:analyzer/src/generated/scanner.dart";

void main(List<String> args) {
  if (args.isEmpty) {
    print("Usage: rewriter <files>");
    exit(1);
  }

  for (var path in args) {
    var file = new File(path);
    var cu = parseCompilationUnit(file.readAsStringSync());
    var writer = new PrintStringWriter();
    cu.accept(new SpaceshipVisitor(writer));
    new File("${file.parent.path}/compiled_${new Uri.file(file.path).pathSegments.last}")
    .writeAsStringSync(writer.toString());
  }
}

class SpaceshipVisitor extends ToSourceVisitor {
  PrintWriter writer;

  SpaceshipVisitor(PrintWriter w) : super(w) {
    writer = w;
  }

  @override
  visitBinaryExpression(BinaryExpression node) {
    if (node.operator.type == TokenType.LT_EQ_GT) {
      node.leftOperand.accept(this);
      writer.print(".compareTo(");
      node.rightOperand.accept(this);
      writer.print(")");
    } else {
      super.visitBinaryExpression(node);
    }
  }
}
