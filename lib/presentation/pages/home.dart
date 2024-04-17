import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inspirationapp/data/services/requests.dart';
import 'package:inspirationapp/models/publicacoesModel.dart';
import 'package:inspirationapp/presentation/widgets/promoCard.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<publicacoes> publicao = []; // Lista para armazenar as publicações

  @override
  void initState() {
    super.initState();
    // Carrega as publicações ao inicializar o componente
    carregarPublicacoes();
  }

// Método para buscar publicações
  void carregarPublicacoes() async {
    try {
      final result = await getPublications();
      print("Resultados: $result");
      setState(() {
        // publicao = result;
      });
    } catch (e) {
      // Trate erros aqui, se necessário
      print('Erro ao carregar publicações: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 243, 243, 1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.black87,
          ),
          onPressed: () {},
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(30))),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Encontre a tua",
                    style: TextStyle(color: Colors.black87, fontSize: 25),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Inspiracao",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(244, 243, 243, 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.black87,
                            ),
                            hintText: "Pesquise pelo que procura",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 13))),
                  ),
                  const SizedBox(height: 10)
                ],
              ),
            ),
            const SizedBox(height: 10),
            // Parte rolável verticalmente
            Expanded(
              child: ListView.builder(
                itemCount: (publicao.length + 3) ~/
                    4, // Calcula quantos grupos de 4 registros existem
                itemBuilder: (context, groupIndex) {
                  final startIndex = groupIndex * 4;
                  final endIndex = startIndex + 4;
                  final group = publicao.sublist(startIndex,
                      endIndex > publicao.length ? publicao.length : endIndex);

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // // Exibe 3 promoCards seguidos de um bigPromoCard
                      // if (group.isNotEmpty)
                      //     promoCard(group[0].data.imagem, group[0].data.name),
                      // if (group.length > 1)
                      //     promoCard(group[1].imagem, group[1].nome),
                      // if (group.length > 2)
                      //     promoCard(group[2].imagem, group[2].nome),
                      // if (group.length > 3)
                      //     bigPromoCard(group[3].imagem, group[3].nome),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
