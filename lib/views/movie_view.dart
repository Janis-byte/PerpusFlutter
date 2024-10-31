import 'package:flutter/material.dart';
import 'package:navigasi_flutter/controllers/detailcontroller.dart';
import 'package:navigasi_flutter/controllers/movie_controller.dart';
import 'package:navigasi_flutter/models/detailmodels.dart';

import 'package:navigasi_flutter/models/movie.dart';
import 'package:navigasi_flutter/views/detail.dart';
import 'package:navigasi_flutter/widgets/bottom_nav.dart';
import 'package:navigasi_flutter/widgets/modal.dart';

class MovieView extends StatefulWidget {
  MovieView({super.key});

  @override
  State<MovieView> createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {
  MovieController movie = MovieController();
  Detailcontroller detail = Detailcontroller();
  TextEditingController titleInput = TextEditingController();
  TextEditingController gambarInput = TextEditingController();
  TextEditingController penulisInput = TextEditingController();
  TextEditingController voteAverage = TextEditingController();
  TextEditingController deskripsiInput = TextEditingController();
  final formKey = GlobalKey<FormState>();
  ModalWidget modal = ModalWidget();

  List<String> listAct = ["Ubah", "Hapus"];
  List<Movie>? film;
  List<detailmodel>? detai;
  int? film_id;
  getFilm() {
    setState(() {
      film = movie.movie;
      detai = detail.Detail;
    });
  }

  addFilm(data) {
    film!.add(data);
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
        title: Text("Movie"),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  film_id = null;
                });
                titleInput.text = '';
                gambarInput.text = '';
                voteAverage.text = '';
                penulisInput.text = '';
                deskripsiInput.text = '';
                modal.showFullModal(context, fromTambah(null));
              },
              icon: Icon(Icons.add_sharp))
        ],
      ),
      body: film != null
          ? ListView.builder(
              padding: EdgeInsets.all(12),
              itemCount: film!.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Card(
                        child: ListTile(
                      title: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return DetailView(
                                  perpus: film![index],
                                );
                              }));
                            },
                            child: Image(
                              image: AssetImage(film![index].posterPath),
                              width: 500,
                            ),
                          ),
                          Text("Judul Buku : " + film![index].title + " "),
                          Text("Penulis : " + film![index].penulis),
                          Text(
                            "Rating : " + film![index].vote.toString(),
                          ),
                        ],
                      ),
                      trailing: PopupMenuButton<String>(
                        icon: const Icon(
                          Icons.more_vert,
                          color: Color.fromARGB(255, 0, 0, 0),
                          size: 30.0,
                        ),
                        // onSelected: choiceAction,
                        itemBuilder: (BuildContext context) {
                          return listAct.map((String choice) {
                            return PopupMenuItem<String>(
                              value: choice,
                              child: Text(choice),
                              onTap: () {
                                if (choice == "Ubah") {
                                  setState(() {
                                    film_id = film![index].id;
                                  });

                                  titleInput.text = film![index].title;
                                  gambarInput.text = film![index].posterPath;
                                  penulisInput.text = film![index].penulis;
                                  voteAverage.text =
                                      film![index].vote.toString();
                                  modal.showFullModal(
                                      context, fromTambah(index));
                                  deskripsiInput.text =
                                      detai![index].deskripsi1;
                                } else if (choice == "Hapus") {
                                  film!.removeWhere(
                                      (item) => item.id == film![index].id);
                                  getFilm();
                                }
                              },
                            );
                          }).toList();
                        },
                      ),
                    )),
                  ],
                );
              })
          : Text("Data Kosong"),
      bottomNavigationBar: BottomNav(3),
    );
  }

  Widget fromTambah(index) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Text("Tambah Data"),
          TextFormField(
            controller: titleInput,
            decoration: InputDecoration(label: Text("Judul Buku")),
            validator: (value) {
              if (value!.isEmpty) {
                return 'harus diisi';
              } else {
                return null;
              }
            },
          ),
          TextFormField(
            controller: gambarInput,
            decoration: InputDecoration(label: Text("Gambar")),
            validator: (value) {
              if (value!.isEmpty) {
                return 'harus diisi';
              } else {
                return null;
              }
            },
          ),
          TextFormField(
            controller: penulisInput,
            decoration: InputDecoration(label: Text("Penulis")),
            validator: (value) {
              if (value!.isEmpty) {
                return 'harus diisi';
              } else {
                return null;
              }
            },
          ),
          TextFormField(
            controller: voteAverage,
            decoration: InputDecoration(label: Text("VoteAverage")),
            validator: (value) {
              if (value!.isEmpty) {
                return 'harus diisi';
              } else {
                return null;
              }
            },
          ),
          TextFormField(
            controller: deskripsiInput,
            decoration: InputDecoration(label: Text("Deskripsi")),
            validator: (value) {
              if (value!.isEmpty) {
                return 'harus diisi';
              } else {
                return null;
              }
            },
          ),
          ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  if (index != null) {
                    film![index].id = film_id!;
                    film![index].title = titleInput.text;
                    film![index].posterPath = gambarInput.text;
                    film![index].penulis = penulisInput.text;

                    film![index].vote = double.parse(voteAverage.text);
                    getFilm();
                  } else {
                    film_id = film!.length + 1;
                    Movie data = Movie(
                      id: film_id!,
                      title: titleInput.text,
                      posterPath: gambarInput.text,
                      penulis: penulisInput.text,
                      vote: double.parse(voteAverage.text),
                    );
                    addFilm(data);
                  }
                  Navigator.pop(context);
                }
              },
              child: Text("Simpan"))
        ],
      ),
    );
  }
}
