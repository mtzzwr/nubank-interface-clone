import 'package:flutter/material.dart';
import 'package:nubank/pages/home/widgets/bottom_menu/item_menu_bottom.dart';

class BottomMenu extends StatefulWidget {
  final bool showMenu;

  const BottomMenu({Key key, this.showMenu}) : super(key: key);

  @override
  _BottomMenuState createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  Tween<double> _tween;

  @override
  void initState() {
    super.initState();
    _tween = Tween<double>(begin: 150.0, end: 150.0);
    delayAnimation();
  }

  Future<void> delayAnimation() async {
    await Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        _tween = Tween<double>(begin: 150.0, end: 0.0);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
        tween: _tween,
        duration: Duration(milliseconds: 250),
        curve: Curves.easeInCubic,
        builder: (context, value, child) {
          return AnimatedPositioned(
            duration: Duration(milliseconds: 200),
            bottom: widget.showMenu ? 0 : 0,
            left: value,
            right: value * -1,
            height: MediaQuery.of(context).size.height * 0.16,
            child: IgnorePointer(
              ignoring: widget.showMenu,
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 200),
                opacity: widget.showMenu ? 0 : 1,
                child: Container(
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      ItemMenuBottom(
                        icon: Icons.person_add,
                        text: 'indicar amigos',
                      ),
                      ItemMenuBottom(
                        icon: Icons.phone_android,
                        text: 'recarga de celular',
                      ),
                      ItemMenuBottom(
                        icon: Icons.chat,
                        text: 'cobrar',
                      ),
                      ItemMenuBottom(
                        icon: Icons.monetization_on,
                        text: 'empréstimos',
                      ),
                      ItemMenuBottom(
                        icon: Icons.move_to_inbox,
                        text: 'depositar',
                      ),
                      ItemMenuBottom(
                        icon: Icons.mobile_screen_share,
                        text: 'transferir',
                      ),
                      ItemMenuBottom(
                        icon: Icons.format_align_center,
                        text: 'ajustar limite',
                      ),
                      ItemMenuBottom(
                        icon: Icons.chrome_reader_mode,
                        text: 'pagar',
                      ),
                      ItemMenuBottom(
                        icon: Icons.lock_open,
                        text: 'bloquear cartão',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
