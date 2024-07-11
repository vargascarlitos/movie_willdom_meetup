import 'package:flutter/material.dart';

/// Pagina que muestra la información del dispositivo.
/// Quiero que sea una pagina de ejemplo, no hace falta que se importe paquetes
/// de flutter, solo que muestre la información del dispositivo y
/// que se pueda navegar a ella desde la pagina de utilidades.
/// los datos pueden ser fakes.
/// Quiero que se pueda copiar la información y que se despliegue un SnackBar
/// Que cada item tenga un icono
/// Diseño futurista, colores oscuros y neones

class DeviceInfoPage extends StatelessWidget {
  const DeviceInfoPage({super.key});

  static const routeName = '/device_info';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Device Info'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Modelo'),
            subtitle: const Text('iPhone 12 Pro Max'),
            trailing: IconButton(
              icon: const Icon(Icons.copy),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Copiado'),
                  ),
                );
              },
            ),
          ),
          ListTile(
            title: const Text('Versión de iOS'),
            subtitle: const Text('14.5.1'),
            trailing: IconButton(
              icon: const Icon(Icons.copy),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Copiado'),
                  ),
                );
              },
            ),
          ),
          ListTile(
            title: const Text('Espacio disponible'),
            subtitle: const Text('128 GB'),
            trailing: IconButton(
              icon: const Icon(Icons.copy),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Copiado'),
                  ),
                );
              },
            ),
          ),
          ListTile(
            title: const Text('Espacio usado'),
            subtitle: const Text('64 GB'),
            trailing: IconButton(
              icon: const Icon(Icons.copy),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Copiado'),
                  ),
                );
              },
            ),
          ),
          // Tile de token fcm
          ListTile(
            title: const Text('Token FCM'),
            subtitle: const Text('1234567890'),
            trailing: IconButton(
              icon: const Icon(Icons.copy),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Copiado'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}