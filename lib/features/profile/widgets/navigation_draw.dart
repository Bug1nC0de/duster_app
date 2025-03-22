import 'package:dusterapp/features/auth/controllers/auth_controller.dart';
import 'package:dusterapp/models/duster_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationDrawWidget extends ConsumerStatefulWidget {
  final DusterModel duster;
  final String lng;
  final String country;
  final Function changeLang;
  const NavigationDrawWidget({
    super.key,
    required this.duster,
    required this.lng,
    required this.country,
    required this.changeLang,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NavigationDrawState();
}

class _NavigationDrawState extends ConsumerState<NavigationDrawWidget> {
  @override
  Widget build(BuildContext context) {
    final duster = widget.duster;
    final email = duster.email;
    final name = duster.name;
    final avatar = name[0];
    return Drawer(
      child: Material(
        color: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 80, 24, 0),
          child: Column(
            children: [
              headerWidget(name, email, avatar),
              const SizedBox(height: 20),
              const Divider(thickness: 1, color: Colors.white),
              ListTile(
                leading: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.home, color: Colors.white, size: 30),
                ),
                title: Text(
                  "Home",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              ListTile(
                leading: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.auto_graph_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                title: Text(
                  "Payslip",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              ListTile(
                leading: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                title: Text(
                  "Notifications",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: GestureDetector(
                    onTap: () {
                      ref
                          .read(authControllerProvider.notifier)
                          .signOut(
                            lng: widget.lng,
                            context: context,
                            country: widget.country,
                            changeLang: widget.changeLang,
                          );
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.logout,
                        size: 30,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Logout",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget headerWidget(name, email, avatar) {
    return Row(
      children: [
        CircleAvatar(
          radius: 40,
          child: Text(
            avatar,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(fontSize: 14, color: Colors.white),
            ),
            const SizedBox(height: 10),
            Text(
              email.length > 15 ? email.substring(0, 15) + '...' : email,
              style: const TextStyle(fontSize: 14, color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}
