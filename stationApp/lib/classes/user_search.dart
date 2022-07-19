import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stationapp/pages/user_details_page.dart';
import 'package:stationapp/providers/user_provider/user.dart';
import 'package:stationapp/providers/user_provider/user_provider.dart';

class UserSearch extends SearchDelegate {
  List<User> getUser(BuildContext context) {
    return Provider.of<UsersProvider>(context).users;
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    List<User> user = getUser(context);
    for (var item in user) {
      if (item.fullName.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item.fullName);
      }
    }
    return ListView.builder(
      itemBuilder: (context, i) {
        var result = matchQuery[i];
        return ListTile(
          title: Text(result),
        );
      },
      itemCount: matchQuery.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    List<User> prod = getUser(context);
    for (var item in prod) {
      if (item.fullName.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item.fullName);
      }
    }
    return ListView.builder(
      itemBuilder: (context, i) {
        var result = matchQuery[i];
        return GestureDetector(
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserDetails(
                      viewBy: SelectionView.byName, pointer: result),
                ),
              );
            },
            title: Text(result),
          ),
        );
      },
      itemCount: matchQuery.length,
    );
  }
}
