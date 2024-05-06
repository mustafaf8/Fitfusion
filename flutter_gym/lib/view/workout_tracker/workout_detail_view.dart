import 'package:flutter/material.dart';
import 'package:flutter_gym/common/color_extension.dart';
import 'package:flutter_gym/common_widget/exercises_set_section.dart';
import 'package:flutter_gym/common_widget/icon_title_next_row.dart';
import 'package:flutter_gym/view/workout_tracker/execises_step_details.dart';

class WorkoutDetailView extends StatefulWidget {
  final Map dObj;
  const WorkoutDetailView({super.key, required this.dObj});

  @override
  State<WorkoutDetailView> createState() => _WorkoutDetailViewState();
}

class _WorkoutDetailViewState extends State<WorkoutDetailView> {
  List youArr = [
    {"image": "lib/assets/img/yogaped.png", "title": "Yoga Mat"},
    {"image": "lib/assets/img/rop.png", "title": "Atlama İpi"},
    {"image": "lib/assets/img/dumbbells.png", "title": "Varsa Dumblle"},
    {"image": "lib/assets/img/bottle1.png", "title": "Su"},
    {"image": "lib/assets/img/towell.png", "title": "Havlu"},
  ];

  List exercisesArr = [
    {
      "name": "Üst Vücut",
      "set": [
        {
          "image": "lib/assets/img/ısınmaE.png",
          "title": "Warm-Up",
          "value": "5min",
          "kalori": "50 kCal",
          "explanation":
              "Isınma hareketleri, vücudu aktiviteye hazırlamak ve kasları esnetmek için önemlidir. Genellikle hafif kardiyo aktiviteleriyle başlar, bunlar koşu bandı, bisiklet veya kürek makinesi gibi aletlerle yapılabilir. Ardından, genişleyici ve esnetici egzersizler gelir; bu, çeşitli kas gruplarını çalıştırmak ve eklem esnekliğini artırmak için yapılır. Esneme hareketleri, statik ve dinamik olabilir, kasların uzunluğunu artırır ve sakatlanma riskini azaltır. Isınma süresi, genellikle 10 ila 15 dakika arasındadır ve vücudun ihtiyacına ve aktivitenin yoğunluğuna bağlı olarak değişebilir. İyi bir ısınma, antrenman verimliliğini artırır ve yaralanma olasılığını azaltır.",
          "videyo": "lib/assets/videos/video_2.mp4"
        },
        {
          "image": "lib/assets/img/şınav.png",
          "title": "Push-Up",
          "value": "12x",
          "kalori": "80 kCal",
          "explanation":
              "Şınav, vücut ağırlığını kullanarak yapılan temel bir egzersizdir. Yere yüz üstü uzanın, ellerinizi omuz genişliğinde açarak yerleştirin. Ayaklarınızı ise birbirine paralel olarak uzatın. Gövdenizi düz bir çizgi oluşturacak şekilde vücudunuzu kaldırın, kollarınızı düzleştirerek başlangıç pozisyonuna gelin. Ardından, göğsünüzü yere doğru indirerek dirseklerinizi bükün. Göğsünüz neredeyse yere değdiğinde durun ve sonra kollarınızı düzleştirerek tekrar yukarı kalkın. Sırtınızı ve kalçanızı düz tutun, nefes alışverişinizi kontrol altında tutun. Şınav, göğüs, omuz, triceps ve karın kaslarını hedefler, güç ve dayanıklılığı artırır.",
          "videyo": "lib/assets/videos/video_3.mp4"
        },
        {
          "image": "lib/assets/img/Shoulder Press.jpeg",
          "title": "Shoulder Press",
          "value": "12x",
          "kalori": "90 kCal",
          "explanation":
              "Shoulder press, omuz kaslarını güçlendiren temel bir egzersizdir. Ayaklarınızı omuz genişliğinde açın, dumbbell'ları omuz hizasına getirin. Kollarınızı dirseklerinizle birlikte 90 derece bükün. Başınızı dik tutarak, dumbbell'ları yukarı doğru itin, kollarınızı düzleştirin. Dumbbell'ları tekrar başlangıç pozisyonuna indirin, kollarınızı 90 dereceye bükün. Dumbbell'ları kontrolle hareket ettirin ve nefes alışverişinizi düzenleyin. Bu hareket, omuz ön ve yan kaslarını güçlendirir, dengeyi artırır.",
          "videyo": "lib/assets/videos/jjmotivation_.mp4"
        },
        {
          "image": "lib/assets/img/Bicep curls.jpeg",
          "title": "Biceps Curls",
          "value": "12x",
          "kalori": "60 kCal",
          "explanation":
              "Biceps curls, biceps kaslarını güçlendiren bir egzersizdir. Ayaklarınızı omuz genişliğinde açın, dumbbell'ları her iki elinizde tutarak kollarınızı yanınızda düzleştirin. Avuç içleriniz vücuda bakacak şekilde kollarınızı dirseklerinizin yanında tutun. Dumbbell'ları yavaşça kaldırarak kollarınızı bükün, biceps kaslarınızı sıkın. Dumbbell'ları yukarıda bir an duraklatın, ardından kontrollü bir şekilde başlangıç pozisyonuna geri indirin. Sırtınızı düz tutarak ve vücudunuzu sabit tutun. Bu hareket, biceps kaslarını güçlendirir ve şekillendirir.",
          "videyo": "lib/assets/videos/jjmotivation_.mp4"
        },
        {
          "image": "lib/assets/img/dips.jpeg",
          "title": "Triceps Dips",
          "value": "12x",
          "kalori": "60 kCal",
          "explanation":
              "Triceps dips, triceps kaslarını güçlendiren bir egzersizdir. Bir sandalyeye veya bench'e sırtınızı dönerek oturun, ellerinizi omuz genişliğinde sandalyenin kenarına koyun. Bacaklarınızı düz veya hafifçe bükerek yerde tutun. Kollarınızı düzleştirerek vücudunuzu yukarı kaldırın, dirseklerinizi bükerek vücudunuzu aşağı indirin. Dirsekleriniz hafifçe 90 dereceye kadar bükülsün. Sonra tekrar yukarı kalkın. Düzgün formda ve kontrollü bir şekilde hareket edin. Bu egzersiz triceps kaslarını güçlendirir.",
          "videyo": "lib/assets/videos/jjmotivation_.mp4"
        },
        {
          "image": "lib/assets/img/Bent-over row.jpeg",
          "title": "Rows",
          "value": "12x",
          "kalori": "90 kCal",
          "explanation":
              "Rows, sırt kaslarını güçlendiren bir egzersizdir. Bir dambıl veya barbell alarak ayaklarınızı omuz genişliğinde açın, dizlerinizi hafifçe bükerek öne eğilin. Belinizi düz tutun, sırtınızı kamburlaştırmayın. Dambılı/Barbell’i ellerinizle kavrayarak çekin, dirseklerinizi geriye doğru bükün. Omuzlarınızı geriye doğru çekin, sırtınızı sıkın. Dambılı/Barbell’i kontrolle aşağıya indirin, tekrarlayın. Bu egzersiz sırt kaslarını ve üst sırt bölgesini güçlendirir.",
          "videyo": "lib/assets/videos/jjmotivation_.mp4"
        },
        {
          "image": "lib/assets/img/reare deltoid.jpeg",
          "title": "Rear deltoid",
          "value": "12x",
          "kalori": "50 kCal",
          "explanation":
              "Rear deltoid için bent-over lateral raise egzersizi yapılır. Ayaklar omuz genişliğinde, hafifçe bükülerek eğilin. Dumbbell'ları her iki elinizle tutun, avuç içleri vücuda bakacak şekilde. Kolları hafifçe bükün, ardından kolları yana doğru kaldırarak omuz hizasına getirin. Kolları yavaşça başlangıç pozisyonuna indirin. Bu egzersiz, omuzun arka kısmını hedefler, rear deltoidi güçlendirir ve şekillendirir.",
          "videyo": "lib/assets/videos/jjmotivation_.mp4"
        },
        {
          "image": "lib/assets/img/lateral raise.jpeg",
          "title": "Lateral Raise",
          "value": "8x",
          "kalori": "75 kCal",
          "explanation":
              "Lateral raise, omuzları güçlendiren bir egzersizdir. Ayaklar omuz genişliğinde, hafifçe bükülerek dik durun. Dumbbell'ları her iki elinizle tutun, avuç içleri vücuda bakacak şekilde. Kolları hafifçe bükün, sonra kolları yanlara doğru kaldırarak omuz hizasına getirin. Kolları yavaşça başlangıç pozisyonuna indirin. Bu egzersiz, omuzların yan kısmını hedefler.",
          "videyo": "lib/assets/videos/jjmotivation_.mp4"
        },
      ],
    },
    {
      "name": "Alt Vücut",
      "set": [
        {
          "image": "lib/assets/img/squat.png",
          "title": "Squat",
          "value": "15x",
          "kalori": "100 kCal",
          "explanation":
              "Squat, temel bir vücut geliştirme egzersizidir. Ayaklarınızı omuz genişliğinde açın, göğsünüzü dik tutun, sırtınızı düzleştirin. Kalçanızı geriye doğru iterek dizlerinizi bükün, uyluklar yere paralel olana kadar. Dizleriniz ayak parmaklarınızla hizalanmalıdır. Ardından yavaşça başlangıç pozisyonuna geri dönün. Dizlerinizi içeri doğru dönmeden hareket edin. Squat, bacak, kalça ve bel kaslarını güçlendirir, dengeyi geliştirir. Doğru form ve kontrollü hareketle tekrar sayısını artırarak squat yapabilirsiniz. Ağırlık ekleyerek de zorluk seviyesini artırabilirsiniz, ancak başlangıçta dikkatli olunmalıdır.",
          "videyo": "lib/assets/videos/jjmotivation_.mp4"
        },
        {
          "image": "lib/assets/img/hill climb.jpeg",
          "title": "Hill Climb",
          "value": "30x",
          "kalori": "110 kCal",
          "explanation":
              "Hill climb, bacak ve kalça kaslarını güçlendiren bir egzersizdir. Düz bir zeminde koşu bandı veya açık havada yokuş yukarı koşun. Ayaklar omuz genişliğinde adımlar atarak yokuşu tırmanın. Dizleri yukarı doğru kaldırarak ve kalçayı iterek ilerleyin. Tüm vücudu kullanarak yukarı doğru hareket edin. Nefes alımını düzenleyin ve formu koruyun.",
          "videyo": "lib/assets/videos/jjmotivation_.mp4"
        },
        {
          "image": "lib/assets/img/ipatlama.png",
          "title": "İp Atlama",
          "value": "25x",
          "kalori": "160 kCal",
          "explanation":
              "Kollarını aç: Hareketi daha rahat hissetmek için ellerini başlatırken uzat. Eller bükülmemelidir. Ayak parmaklarını dik tut: Bu hareketin temeli zıplamadır. Şimdi, dikkate alman gereken şey, ayak parmaklarını kullanmandır. İp atlama sadece sıradan bir sıçrama değil. Ayrıca, bacak hareketlerine de dikkat etmelisin. Hareketini ayarla: Her iki eli de çırp: Bunu hafife alamazsın. Göreceksin ki, ellerini çırpmak, İp atlama yaparken ritmini korumanıza yardımcı olurken farkında olmadan gerçekleşir.",
          "videyo": "lib/assets/videos/jjmotivation_.mp4"
        },
        {
          "image": "lib/assets/img/calf.jpeg",
          "title": "Calf Raises",
          "value": "15x",
          "kalori": "80 kCal",
          "explanation":
              "Calf raises, ayak bileği ve calf kaslarını güçlendiren bir egzersizdir. Ayaklar omuz genişliğinde, dik durun. Topuklarınızı yerden kaldırarak, ayak parmaklarınız üzerinde yükselin. Kısa bir süre yukarıda durun, ardından topuklarınızı yavaşça yere indirin. Hareketi kontrolle tekrarlayın. Bu egzersiz, calf kaslarını güçlendirir ve bacakların şekillenmesine yardımcı olur.",
          "videyo": "lib/assets/videos/jjmotivation_.mp4"
        },
        {
          "image": "lib/assets/img/Hamstrings Curl.jpeg",
          "title": "Hamstring Curls",
          "value": "15x",
          "kalori": "80 kCal",
          "explanation":
              "Hamstring curls, arka bacak kaslarını güçlendiren bir egzersizdir. Sırt üstü yatın, topuklarınızı bir hamstring curl makinesinin pedine yerleştirin. Bacaklarınızı yavaşça bükerek topuğu kalçaya doğru çekin. Bir saniye kadar yukarıda kalın, ardından kontrolle başlangıç pozisyonuna geri dönün. Hamstrings kaslarını sıkarak hareketi yapın.",
          "videyo": "lib/assets/videos/jjmotivation_.mp4"
        },
      ],
    },
    {
      "name": "Karın Antrenmanı",
      "set": [
        {
          "image": "lib/assets/img/Bicycle Crunches (2).jpeg",
          "title": "Crunches",
          "value": "15x",
          "kalori": "130 kCal",
          "explanation":
              "Crunches, karın kaslarını güçlendiren bir egzersizdir. Sırt üstü yatın, dizleriniz bükülü olsun. Ellerinizi başınızın yanına yerleştirin veya göğsünüzde kavuşturun. Başınızı ve omuzlarınızı yukarı kaldırarak üst karın kaslarını sıkın. Nefes verirken, kontrollü bir şekilde başlangıç pozisyonuna geri dönün. Karın kaslarını sıkarak tekrarlayın, sırtınızı yere bastırın.",
          "videyo": "lib/assets/videos/jjmotivation_.mp4"
        },
        {
          "image": "lib/assets/img/Bicycle Crunches.jpeg",
          "title": "Leg Raises",
          "value": "10x",
          "kalori": "150 kCal",
          "explanation":
              "Leg raises, alt karın kaslarını güçlendiren bir egzersizdir. Sırt üstü yatın, ellerinizi yanlarınıza yerleştirin veya altınızda tutun. Bacaklarınızı düz bir şekilde kaldırarak vücudunuzla 90 derece bir açı oluşturun. Kontrollü bir şekilde bacaklarınızı indirin, ardından başlangıç pozisyonuna geri kaldırın. Alt karın kaslarını sıkarak hareketi yapın.",
          "videyo": "lib/assets/videos/jjmotivation_.mp4"
        },
        {
          "image": "lib/assets/img/Plank.jpeg",
          "title": "Plank",
          "value": "40-120sec",
          "kalori": "120 kCal",
          "explanation":
              "Plank, karın ve çekirdek kaslarını güçlendiren bir egzersizdir. Kollarınız omuzlarınızın altında, dirseklerinizle vücudunuzu destekleyin. Vücudunuzu düz bir çizgi halinde tutun, sırtınızı düzleştirin, karın kaslarınızı sıkın. Ayak parmak uçlarınız üzerinde veya dizlerinizin üzerinde durun, nefes alımını kontrol edin. Hareketi belirli bir süre boyunca (örneğin 30 saniye) tutun.",
          "videyo": "lib/assets/videos/jjmotivation_.mp4"
        },
        {
          "image": "lib/assets/img/Bicycle Crunches (2).jpeg",
          "title": "Bicycle Crunches",
          "value": "25x",
          "kalori": "170 kCal",
          "explanation":
              "Bicycle crunches, karın ve oblik kaslarını çalıştıran bir egzersizdir. Sırt üstü yatın, ellerinizi başınızın arkasında kenetleyin. Bacaklarınızı kaldırarak dizlerinizi 90 derece bükün. Sağ dizinizi sol dirseğinize doğru çekin, aynı anda sol dizinizi de sağ dirseğinize doğru götürün. Ayakları pedal çevirir gibi hareket ettirin, karın kaslarını sıkın ve nefes alımını düzenleyin.",
          "videyo": "lib/assets/videos/jjmotivation_.mp4"
        },
        {
          "image": "lib/assets/img/Russian Twist.jpeg",
          "title": "Russian Twists",
          "value": "20x",
          "kalori": "160 kCal",
          "explanation":
              "Russian twists, oblik kasları güçlendiren bir egzersizdir. Oturarak dizlerinizi hafifçe bükün, topu iki elinizle tutun. Sırtınızı 45 derece açıyla geriye yaslayın. Topu vücudunuzun yanlarına doğru döndürerek sağa ve sola dönün. Karın kaslarını sıkarak, kontrolle hareket edin ve nefes alımını düzenleyin.",
          "videyo": "lib/assets/videos/jjmotivation_.mp4"
        },
      ],
    }
  ];
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      decoration:
          BoxDecoration(gradient: LinearGradient(colors: TColor.primryG)),
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              elevation: 0,
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: const EdgeInsets.all(8),
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: TColor.lightgray,
                      borderRadius: BorderRadius.circular(10)),
                  child: Image.asset(
                    "lib/assets/img/donusikonu.png",
                    width: 15,
                    height: 15,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            SliverAppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              elevation: 0,
              leadingWidth: 0,
              leading: Container(),
              expandedHeight: media.width * 0.5,
              flexibleSpace: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  "lib/assets/img/jumpbig.png",
                  width: media.width * 0.75,
                  height: media.width * 0.8,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ];
        },
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
              color: TColor.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 50,
                        height: 4,
                        decoration: BoxDecoration(
                            color: TColor.gray.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(3)),
                      ),
                      SizedBox(
                        height: media.width * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.dObj["title"].toString(),
                                  style: TextStyle(
                                      color: TColor.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "${widget.dObj["exercises"].toString()} | ${widget.dObj["time"].toString()} | 425-460 kCal",
                                  style: TextStyle(
                                      color: TColor.gray, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: media.width * 0.05,
                      ),
                      //takvime gidecek navigator ayarlanacak
                      IconTitleNextRow(
                          icon: "lib/assets/img/date.png",
                          title: "Takvim",
                          time: "5/27, 09:00 ",
                          color: TColor.primryColor2.withOpacity(0.3),
                          onPressed: () {}),
                      SizedBox(
                        height: media.width * 0.02,
                      ),
                      IconTitleNextRow(
                          icon: "lib/assets/img/hight.png",
                          title: "Zorluk",
                          time: "Başlangıç Seviyesi",
                          color: TColor.scondaryColor2.withOpacity(0.3),
                          onPressed: () {}),
                      SizedBox(
                        height: media.width * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "İhtiyacın Olanlar",
                            style: TextStyle(
                                color: TColor.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "${youArr.length} Adet",
                              style:
                                  TextStyle(color: TColor.gray, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                      //ihçiyacın olanalr
                      SizedBox(
                        height: media.width * 0.5,
                        child: ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: youArr.length,
                            itemBuilder: (context, index) {
                              var yObj = youArr[index] as Map? ?? {};
                              return Container(
                                  margin: const EdgeInsets.all(8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: media.width * 0.35,
                                        width: media.width * 0.35,
                                        decoration: BoxDecoration(
                                            color: TColor.lightgray,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        alignment: Alignment.center,
                                        child: Image.asset(
                                          yObj["image"].toString(),
                                          width: media.width * 0.3,
                                          height: media.width * 0.3,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          yObj["title"].toString(),
                                          style: TextStyle(
                                              color: TColor.black,
                                              fontSize: 12),
                                        ),
                                      )
                                    ],
                                  ));
                            }),
                      ),
                      SizedBox(
                        height: media.width * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              "Antremanlar",
                              style: TextStyle(
                                  color: TColor.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          SizedBox(
                            height: media.width * 0.09,
                          ),
                        ],
                      ),
                      ListView.builder(
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: exercisesArr.length,
                          itemBuilder: (context, index) {
                            var eObj = exercisesArr[index] as Map? ?? {};
                            return ExercisesSetSection(
                              sObj: eObj,
                              onPressed: (eObj) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ExercisesStepDetails(
                                      eObj: eObj,
                                    ),
                                  ),
                                );
                              },
                              eObj: const {},
                            );
                          }),
                      SizedBox(
                        height: media.width * 0.1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
