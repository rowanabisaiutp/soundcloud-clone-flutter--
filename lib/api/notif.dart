import 'package:flutter/material.dart';
import 'package:music/api/repo.dart';

class NotificationListPage extends StatefulWidget {
  final NotificationRepository repository;

  NotificationListPage({required this.repository});

  @override
  _NotificationListPageState createState() => _NotificationListPageState();
}

class _NotificationListPageState extends State<NotificationListPage> {
  @override
  Widget build(BuildContext context) {
    final notifications = widget.repository.getAllNotifications();

    return Scaffold(
      appBar: AppBar(
        title: Text('Notificaciones'),
      ),
      body: notifications.isEmpty
          ? Center(child: Text('No hay notificaciones'))
          : ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(notifications[index]),
                );
              },
            ),
    );
  }
}
