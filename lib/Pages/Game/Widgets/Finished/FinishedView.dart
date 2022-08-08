import 'package:flutter/material.dart';
import 'package:truco_of_legends/Pages/Game/Providers/BoardController.dart';
import 'package:truco_of_legends/Pages/Game/Util/Constants.dart';
import 'package:provider/provider.dart';

class FinishedView extends StatelessWidget {
  const FinishedView(this.winner, {Key? key}) : super(key: key);

  final Team winner;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber[300]!.withOpacity(0.8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            winner.isPlayer ? "Você Ganhou!" : "Você perdeu!",
            style: TextStyle(
              fontSize: 36,
              foreground: Paint()..color = Colors.white,
            ),
          ),
          Text(
            "Jogador: " +
                Provider.of<BoardController>(context, listen: false)
                    .calculatePlayerScore()
                    .toString(),
            style: TextStyle(
              fontSize: 24,
              foreground: Paint()..color = Colors.blue,
            ),
          ),
          Text(
            "Inimigo: " +
                (20 -
                        Provider.of<BoardController>(context, listen: false)
                            .calculatePlayerScore())
                    .toString(),
            style: TextStyle(
              fontSize: 24,
              foreground: Paint()..color = Colors.red,
            ),
          ),
          ElevatedButton(
            onPressed: () => restartApp(context),
            child: Text(
              winner.isPlayer ? "Jogar novamente" : "Tentar Novamente",
              style: TextStyle(
                fontSize: 30,
                foreground: Paint()..color = Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  // TODO: Verificar porquê HandController não reinicia
  void restartApp(context) {}
}
