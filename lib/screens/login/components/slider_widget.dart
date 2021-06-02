import 'package:flutter/material.dart';
import 'package:smart_dashboard_admin_ui/models/slider_model.dart';

class SliderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: PageView(
      children: List.generate(
        slides.length,
        (int index) => GestureDetector(
          onTap: () {},
          child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(slides[index].kBackgroundColor!),
                boxShadow: [],
              ),
              child: Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height / 2 - 50,
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: AssetImage(slides[index].image!),
                          ),
                        ),
                      )
                    ],
                  ),
                  Positioned(
                      child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Image.asset(slides[index].productImage!),
                      Container(
                        alignment: Alignment.center,
                        child: Text(slides[index].text!,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline5),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(slides[index].altText!,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline5),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(slides[index].bAltText!,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyText1),
                      ),
                    ],
                  ))
                ],
              )),
        ),
      ),
    ));
  }
}
