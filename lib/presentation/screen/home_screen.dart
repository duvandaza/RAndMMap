part of 'screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const name = '/';

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: size.height * -0.1,
            right: size.width * -0.2,
            child: ContainerRotate(
              size: size,
              rotate: -2.8,
            ),
          ),
          Positioned(
            bottom: size.height * -0.1,
            left: size.width * -0.2,
            child: ContainerRotate(
              size: size,
              rotate: -2.9,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonGeneral(
                title: 'Rick and Morty',
                action: () async {
                  context.push('/characters');
                },
              ),
              SizedBox(height: size.height * 0.04),
              ButtonGeneral(
                title: 'Map',
                action: (){},
              ),
            ],
          )
        ],
      ),
    );
  }
}

