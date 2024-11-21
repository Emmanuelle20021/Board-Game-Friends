import 'package:board_game_friends/modules/auth/login/screens/email_validations_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  group('Pruebas de EmailValidationScreen', () {
    testWidgets('Muestra SnackBar de éxito para correo válido', (tester) async {
      await tester.pumpWidget(MaterialApp(home: EmailValidationScreen()));

      // Act: Ingresar correo válido y presionar el botón
      await tester.enterText(find.byType(TextField), 'usuario@dominio.com');
      await tester.tap(find.text('Validar correo'));
      await tester.pumpAndSettle();

      // Assert: SnackBar de éxito aparece
      expect(find.widgetWithText(SnackBar, 'Correo electrónico válido.'),
          findsOneWidget);

      // El campo de texto no debe mostrar errores
      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.decoration?.errorText, isNull);
    });

    testWidgets('Muestra SnackBar de error para correo inválido',
        (tester) async {
      await tester.pumpWidget(MaterialApp(home: EmailValidationScreen()));

      // Act: Ingresar correo inválido y presionar el botón
      await tester.enterText(find.byType(TextField), 'usuario@dominio');
      await tester.tap(find.text('Validar correo'));
      await tester.pumpAndSettle();

      // Assert: SnackBar de error aparece
      expect(
        find.widgetWithText(SnackBar,
            "Correo electrónico inválido. Incluye un '@' y un dominio como '.com'."),
        findsOneWidget,
      );

      // El campo de texto muestra un mensaje de error
      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(
        textField.decoration?.errorText,
        "Correo electrónico inválido. Incluye un '@' y un dominio como '.com'.",
      );
    });

    testWidgets('Error se refleja en el campo de texto', (tester) async {
      await tester.pumpWidget(MaterialApp(home: EmailValidationScreen()));

      // Act: Ingresar correo inválido y presionar el botón
      await tester.enterText(find.byType(TextField), 'usuario@dominio');
      await tester.tap(find.text('Validar correo'));
      await tester.pumpAndSettle();

      // Assert: El mensaje de error aparece en el campo de texto
      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(
        textField.decoration?.errorText,
        "Correo electrónico inválido. Incluye un '@' y un dominio como '.com'.",
      );
    });

    testWidgets('Hint text aparece correctamente', (tester) async {
      await tester.pumpWidget(MaterialApp(home: EmailValidationScreen()));

      // Assert: Hint text aparece en el campo de texto
      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.decoration?.hintText, "Ejemplo: usuario@dominio.com");

      // El campo no tiene un mensaje de error por defecto
      expect(textField.decoration?.errorText, isNull);
    });
  });
}
