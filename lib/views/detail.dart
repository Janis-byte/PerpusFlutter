import 'package:flutter/material.dart';
import 'package:navigasi_flutter/controllers/detailcontroller.dart';
import 'package:navigasi_flutter/models/detailmodels.dart';
import 'package:navigasi_flutter/widgets/modal.dart';
import 'package:navigasi_flutter/views/movie_view.dart';

class DetailView extends StatefulWidget {
  var perpus;
  DetailView({this.perpus});

  @override
  State<DetailView> createState() => _DetailState();
}

class _DetailState extends State<DetailView> {
  Detailcontroller detail = Detailcontroller();
  TextEditingController deskripsiInput = TextEditingController();
  final formKey = GlobalKey<FormState>();
  ModalWidget modal = ModalWidget();

  List<detailmodel>? detai;
  int? film_id;

  get index => null;
  getFilm() {
    setState(() {
      detai = detail.Detail;
    });
  }

  addFilm(data) {
    detai!.add(data);
    getFilm();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFilm();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Test"),
      ),
      body: Container(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    if (index != null) {
                      detai![index].deskripsi1 = deskripsiInput.text;

                      getFilm();
                    } else {
                      film_id = detai!.length + 1;
                      detailmodel data = detailmodel(
                        deskripsi1: deskripsiInput,
                      );
                      addFilm(data);
                    }
                    Navigator.pop(context);
                  }
                },
                child: Text("Simpan"))
          ],
        ),
      ),
    );
  }
}
