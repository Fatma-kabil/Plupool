
import 'package:flutter/material.dart';

class CustumSearchTextField extends StatelessWidget {
  const CustumSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
     onChanged: (value) async {
    //    await BlocProvider.of<SearchviewCubit>(context)
      //      .searhBooks(searchKeyWord: value);
      
      },
        decoration: InputDecoration(
            enabledBorder: buildOutlineInputBorder(),
            focusedBorder: buildOutlineInputBorder(),
            hintText: 'Search',
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const Opacity(
                  opacity: 0.8, child: Icon(Icons.search)),
              iconSize: 20,
            )));
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white70),
        borderRadius: BorderRadius.circular(12));
  }
}
