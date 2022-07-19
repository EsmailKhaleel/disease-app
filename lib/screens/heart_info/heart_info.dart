// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class HeartInfoScreen extends StatefulWidget {
  @override
  State<HeartInfoScreen> createState() => _HeartInfoScreenState();
}

class _HeartInfoScreenState extends State<HeartInfoScreen> {
  List<Item> data = heartData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About heart Disease"),
      ),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (index, isExpanded) {
            setState(() {
              data[index].isExpanded = !isExpanded;
            });
          },
          children: data.map<ExpansionPanel>((Item item) {
            return ExpansionPanel(
              backgroundColor: Colors.grey[200],
              canTapOnHeader: true,
              headerBuilder: (context, isExpanded) {
                return ListTile(
                  title: Text(item.header),
                );
              },
              body: ListTile(
                title: Text(item.expandBody),
                // subtitle: Text('To delete this panel, tap the trash can icon'),
                // trailing: IconButton(
                //   onPressed: () {
                //     data.removeWhere((currentItem) => item == currentItem);
                //     setState(() {});
                //   },
                //   icon: Icon(Icons.delete),
                // ),
              ),
              isExpanded: item.isExpanded,
            );
          }).toList(),
        ),
      ),
    );
  }
}

class Item {
  bool isExpanded;
  String header;
  String expandBody;
  Item({
    required this.expandBody,
    required this.header,
    this.isExpanded = false,
  });
}

List<Item> generateData(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (index) {
    return Item(
      expandBody: "This is body number $index",
      header: "Header $index",
    );
  }, growable: true);
}

List<Item> heartData() {
  return [
    Item(
      expandBody:
          'Heart disease describes a range of conditions that affect your heart. Heart diseases include: Blood vessel disease, such as coronary artery disease ,Heart rhythm problems (arrhythmias),Heart defects you\'re born with (congenital heart defects),Heart valve disease,Disease of the heart muscle,Heart infection',
      header: 'What is Heart Disease ?',
    ),
    Item(
      expandBody:
          'About 30% of deaths from heart disease in the U.S. are directly related to cigarette smoking. Smoking is a major cause of atherosclerosis.Among other things, the nicotine in smoke causes:Less oxygen to the heart Higher blood pressure and heart rate More blood clotting Damage to cells that line coronary arteries and other blood vessels',
      header: 'What\'s the Link Between Smoking and Heart Disease?',
    ),
    Item(
      expandBody:
          'About 30% of deaths from heart disease in the U.S. are directly related to cigarette smoking. Smoking is a major cause of atherosclerosis.Among other things, the nicotine in smoke causes:Less oxygen to the heart Higher blood pressure and heart rate More blood clotting Damage to cells that line coronary arteries and other blood vessels',
      header:
          'What Should I Do If I Have Risk Factors for Coronary Artery Disease?',
    ),
    Item(
      expandBody:
          'About 30% of deaths from heart disease in the U.S. are directly related to cigarette smoking. Smoking is a major cause of atherosclerosis.Among other things, the nicotine in smoke causes:Less oxygen to the heart Higher blood pressure and heart rate More blood clotting Damage to cells that line coronary arteries and other blood vessels',
      header:
          'What Dietary Changes Can I Make to Reduce My Heart Disease Risk?',
    ),
    Item(
      expandBody:
          'About 30% of deaths from heart disease in the U.S. are directly related to cigarette smoking. Smoking is a major cause of atherosclerosis.Among other things, the nicotine in smoke causes:Less oxygen to the heart Higher blood pressure and heart rate More blood clotting Damage to cells that line coronary arteries and other blood vessels',
      header:
          'What Dietary Changes Can I Make to Reduce My Heart Disease Risk?',
    ),
    Item(
      expandBody:
          'About 30% of deaths from heart disease in the U.S. are directly related to cigarette smoking. Smoking is a major cause of atherosclerosis.Among other things, the nicotine in smoke causes:Less oxygen to the heart Higher blood pressure and heart rate More blood clotting Damage to cells that line coronary arteries and other blood vessels',
      header: 'What Is Cholesterol?',
    ),
    Item(
      expandBody:
          'About 30% of deaths from heart disease in the U.S. are directly related to cigarette smoking. Smoking is a major cause of atherosclerosis.Among other things, the nicotine in smoke causes:Less oxygen to the heart Higher blood pressure and heart rate More blood clotting Damage to cells that line coronary arteries and other blood vessels',
      header:
          'What Dietary Changes Can I Make to Reduce My Heart Disease Risk?',
    ),
    Item(
      expandBody:
          'About 30% of deaths from heart disease in the U.S. are directly related to cigarette smoking. Smoking is a major cause of atherosclerosis.Among other things, the nicotine in smoke causes:Less oxygen to the heart Higher blood pressure and heart rate More blood clotting Damage to cells that line coronary arteries and other blood vessels',
      header: 'How Common Is Heart Disease Among Women?',
    ),
    Item(
      expandBody:
          'About 30% of deaths from heart disease in the U.S. are directly related to cigarette smoking. Smoking is a major cause of atherosclerosis.Among other things, the nicotine in smoke causes:Less oxygen to the heart Higher blood pressure and heart rate More blood clotting Damage to cells that line coronary arteries and other blood vessels',
      header: 'How Common Is Heart Disease Among Women?',
    ),
    Item(
      expandBody:
          'About 30% of deaths from heart disease in the U.S. are directly related to cigarette smoking. Smoking is a major cause of atherosclerosis.Among other things, the nicotine in smoke causes:Less oxygen to the heart Higher blood pressure and heart rate More blood clotting Damage to cells that line coronary arteries and other blood vessels',
      header: 'How Common Is Heart Disease Among Women?',
    ),
  ];
}
