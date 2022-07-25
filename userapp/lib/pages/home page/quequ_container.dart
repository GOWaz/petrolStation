import 'package:flutter/material.dart';

class QueueContainer extends StatelessWidget {
  const QueueContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
            constraints: const BoxConstraints.expand(),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Text(
                        'Your turn',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Your turn in the queue\n to fill your car is 20 \n there are 20 vehicles\n left in front of you',
                            maxLines: 5,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                      
                       SizedBox(
                         width: size.width/6,
                        ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                            '20',
                            style: TextStyle(
                                fontSize: 45,
                                backgroundColor: Colors.teal,
                                color: Colors.white),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: size.width /1.5,
                        height: size.height / 8.5,
                        child: const Image(
                            image: AssetImage(
                          'images/queue.jpg',
                        )),
                      ),
                    ],
                  )
                ],
              ),
            )),
      ),
    ));
  }
}
