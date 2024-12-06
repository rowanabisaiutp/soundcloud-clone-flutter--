class NotificationRepository {
  List<String> _notifications = [];

  /// Agrega una notificación a la lista
  void addNotification(String notification) {
    _notifications.add(notification);
  }

  /// Devuelve todas las notificaciones
  List<String> getAllNotifications() {
    return _notifications;
  }
}
