import 'package:flutter/material.dart';
import './custom_vaccination_notification.dart';
import './custom_feeding_notification.dart';
import './custom_stock_notification.dart';
import './custom_reproduction_notification.dart';
import './custom_veterinary_notification.dart';

class NotitcationTap extends StatelessWidget {
  NotitcationTap({Key? key}) : super(key: key);

  List<Map<String, String>> newItem = [
    {"type": "vaccination", "time": "Aujourd'hui à 10:30"},
    {"type": "nourriture", "time": "Aujourd'hui à 08:00"}
  ];
  
  List<Map<String, String>> todayItem = [
    {"type": "nourriture", "time": "Aujourd'hui à 08:00"},
    {"type": "vaccination", "time": "Aujourd'hui à 10:30"},
    {"type": "stock", "time": "Aujourd'hui à 15:00"}
  ];
  
  List<Map<String, String>> oldesItem = [
    {"type": "reproduction", "time": "Hier"},
    {"type": "veterinaire", "time": "Hier"},
    {"type": "vaccination", "time": "2 jours"},
    {"type": "nourriture", "time": "2 jours"}
  ];

  Widget _getNotificationWidget(String type, String time) {
    switch (type) {
      case "vaccination":
        return CustomVaccinationNotification();
      case "nourriture":
        return CustomFeedingNotification();
      case "stock":
        return CustomStockNotification();
      case "reproduction":
        return CustomReproductionNotification();
      case "veterinaire":
        return CustomVeterinaryNotification();
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(

          title: const Text(
            'Notifications',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: newItem.length,
                  itemBuilder: (context, index) {
                    return _getNotificationWidget(newItem[index]["type"]!, newItem[index]["time"]!);
                  },
                ),
                
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: todayItem.length,
                  itemBuilder: (context, index) {
                    return _getNotificationWidget(todayItem[index]["type"]!, todayItem[index]["time"]!);
                  },
                ),
                
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: oldesItem.length,
                  itemBuilder: (context, index) {
                    return _getNotificationWidget(oldesItem[index]["type"]!, oldesItem[index]["time"]!);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
