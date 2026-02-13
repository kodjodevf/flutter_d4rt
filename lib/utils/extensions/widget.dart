import 'package:d4rt/d4rt.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_d4rt/src/widgets/framework.dart';

extension Widgets on InterpreterVisitor {
  dynamic toWidgets(Object? object) {
    if (object is List) {
      List<Widget> children = [];
      for (final child in object) {
        if (child is Widget) {
          children.add(child);
        } else if (child is BridgedInstance) {
          if (child.nativeObject is Widget) {
            children.add(child.nativeObject as Widget);
          }
        } else {
          if (child is InterpretedInstance) {
            if (child.klass.bridgedSuperclass?.name == 'StatelessWidget') {
              if (child.bridgedSuperObject is StatelessWidgetBridge) {
                children.add(child.bridgedSuperObject as StatelessWidgetBridge);
              } else {
                final stateless = StatelessWidgetBridge(
                  visitor: this,
                  instance: child,
                );
                children.add(stateless);
              }
            } else if (child.klass.bridgedSuperclass?.name ==
                'StatefulWidget') {
              if (child.bridgedSuperObject is StatefulWidgetBridge) {
                children.add(child.bridgedSuperObject as StatefulWidgetBridge);
              } else {
                final stateful = StatefulWidgetBridge(
                  visitor: this,
                  instance: child,
                );
                children.add(stateful);
              }
            } else {
              // If the class is not recognized, we can return a placeholder or throw an error.
              throw Exception('Unsupported widget type: ${child.klass.name}');
            }
          }
        }
      }
      return children;
    } else {
      if (object is Widget) {
        return object;
      } else if (object is BridgedInstance) {
        if (object.nativeObject is Widget) {
          return object.nativeObject as Widget;
        }
      } else {
        if (object is InterpretedInstance) {
          if (object.klass.bridgedSuperclass?.name == 'StatelessWidget') {
            return StatelessWidgetBridge(visitor: this, instance: object);
          } else if (object.klass.bridgedSuperclass?.name == 'StatefulWidget') {
            return StatefulWidgetBridge(visitor: this, instance: object);
          } else {
            throw Exception('Unsupported widget type: ${object.klass.name}');
          }
        }
      }
    }
  }

  dynamic toElements(Object? object) {
    if (object is List) {
      List<dynamic> children = [];
      for (final child in object) {
        if (child is BridgedInstance) {
          children.add(child.nativeObject);
        } else {
          children.add(child);
        }
      }
      return children;
    } else {
      if (object is BridgedInstance) {
        return object.nativeObject;
      } else {
        return object;
      }
    }
  }
}
