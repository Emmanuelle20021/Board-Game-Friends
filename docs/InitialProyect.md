# Configuración Inicial de Proyecto usando Firebase para un Proyecto en Flutter

A continuación, se detallan como levantar un proyecto.

## Instrucciones
1. **Clonar el Repositorio de [Board-Game-Friends](https://github.com/Emmanuelle20021/Board-Game-Friends.git)**

2. **Instala las dependencias de tu proyecto Flutter:**
   ```bash
   flutter pub get
   ```

3. **Inicia sesión en Firebase CLI**: Si no tienes Firebase CLI instalado,Luego, inicia sesión usando las credenciales proporcionadas en `discord` en el canal de `links-info-util`:

    ```bash
    firebase login
    ```
4. **Instala la CLI de FlutterFire:**

    ```bash
    dart pub global activate flutterfire_cli
    ```
5. **Instala Firebase CLI globalmente (si aún no lo tienes):**

    ```bash
    npm install -g firebase-tools
    ```
6. **Agrega el paquete firebase_core al proyecto de Flutter:**

    ```bash
    flutter pub add firebase_core
    ```
7. **Configura Firebase en tu proyecto Flutter:** Este comando es para vincular el proyecto de Flutter con Firebase y crear los archivos de configuración necesarios.

    ```bash
    flutterfire configure --out=lib/keys/firebase_options.dart
    ```
    Durante este paso:

    Selecciona el proyecto de Firebase.
    Especifica las plataformas a configurar `(Android, iOS, Web)`.
    Define el `Application ID` o Package Name (ejemplo: `com.TechSolutions.board_game_friends`). o tambien puedes revisar la carpeta `android/app/build.gradle` para ver el nombre del paquete por ejemplo: `applicationId = "com.TechSolutions.board_game_friends"`.

8. **Finalmente**:, ejecuta el proyecto para confirmar que Firebase esté correctamente configurado:
    ```bash
    flutter run
    ```

### Referencias Adicionales

Consulta la [documentación oficial de Firebase](https://firebase.google.com/docs/flutter/setup?hl=es&platform=ios) para Flutter para detalles sobre la configuración en cada plataforma y la integración de servicios adicionales.
