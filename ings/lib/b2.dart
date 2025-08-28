import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class B2Page extends StatefulWidget {
  const B2Page({super.key});

  static final List<Map<String, String>> words = [
    {"en": "abandon", "tr": "terk etmek"},
    {"en": "absolute", "tr": "mutlak"},
    {"en": "academic", "tr": "akademisyen"},
    {"en": "acceptable", "tr": "kabul edilebilir"},
    {"en": "accompany", "tr": "eşlik etmek"},
    {"en": "account", "tr": "hesaplamak"},
    {"en": "accurate", "tr": "doğru, kesin"},
    {"en": "accuse", "tr": "suçlamak"},
    {"en": "acknowledge", "tr": "kabul etmek"},
    {"en": "acquire", "tr": "edinmek"},
    {"en": "actual", "tr": "gerçek"},
    {"en": "adapt", "tr": "uyum sağlamak"},
    {"en": "additional", "tr": "ek, ilave"},
    {"en": "address", "tr": "hitap etmek"},
    {"en": "administration", "tr": "yönetim"},
    {"en": "adopt", "tr": "evlat edinmek, benimsemek"},
    {"en": "advance", "tr": "ilerleme, ilerlemek"},
    {"en": "affair", "tr": "mesele"},
    {"en": "afterwards", "tr": "sonradan"},
    {"en": "agency", "tr": "ajans"},
    {"en": "agenda", "tr": "gündem"},
    {"en": "aggressive", "tr": "agresif"},
    {"en": "aid", "tr": "yardım, yardım etmek"},
    {"en": "aircraft", "tr": "uçak"},
    {"en": "alarm", "tr": "alarm vermek"},
    {"en": "alter", "tr": "değiştirmek"},
    {"en": "amount", "tr": "miktar, olmak"},
    {"en": "anger", "tr": "öfke"},
    {"en": "angle", "tr": "açı"},
    {"en": "anniversary", "tr": "yıldönümü"},
    {"en": "annual", "tr": "yıllık"},
    {"en": "anxious", "tr": "endişeli"},
    {"en": "apparent", "tr": "görünür"},
    {"en": "apparently", "tr": "görünüşe göre"},
    {"en": "appeal", "tr": "başvuru, başvurmak"},
    {"en": "approach", "tr": "yaklaşım, yaklaşmak"},
    {"en": "appropriate", "tr": "uygun"},
    {"en": "approval", "tr": "onay"},
    {"en": "approve", "tr": "onaylamak"},
    {"en": "arise", "tr": "ortaya çıkmak"},
    {"en": "armed", "tr": "silahlı"},
    {"en": "arms", "tr": "silahlar"},
    {"en": "artificial", "tr": "yapay"},
    {"en": "artistic", "tr": "sanatsal"},
    {"en": "ashamed", "tr": "utanmış"},
    {"en": "aspect", "tr": "yön, bakış açısı"},
    {"en": "assess", "tr": "değerlendirmek"},
    {"en": "assessment", "tr": "değerlendirme"},
    {"en": "associate", "tr": "ilişkilendirmek"},
    {"en": "associated", "tr": "ilişkili"},
    {"en": "association", "tr": "dernek"},
    {"en": "assume", "tr": "varsaymak"},
    {"en": "attempt", "tr": "girişim, denemek"},
    {"en": "back", "tr": "desteklemek"},
    {"en": "bacteria", "tr": "bakteri"},
    {"en": "bar", "tr": "engel olmak"},
    {"en": "barrier", "tr": "engel"},
    {"en": "basically", "tr": "temelde"},
    {"en": "battle", "tr": "savaşmak"},
    {"en": "bear (deal with)", "tr": "katlanmak"},
    {"en": "beat", "tr": "darbe, ritim"},
    {"en": "beg", "tr": "yalvarmak"},
    {"en": "being", "tr": "varlık"},
    {"en": "bent", "tr": "eğilmiş"},
    {"en": "bet", "tr": "bahis yapmak"},
    {"en": "beyond", "tr": "ötesinde"},
    {"en": "bill", "tr": "fatura kesmek"},
    {"en": "bitter", "tr": "acı, sert"},
    {"en": "blame", "tr": "suçlamak, suç"},
    {"en": "blind", "tr": "kör"},
    {"en": "bond", "tr": "bağ"},
    {"en": "border", "tr": "sınır çizmek"},
    {"en": "breast", "tr": "göğüs"},
    {"en": "brief", "tr": "kısa"},
    {"en": "broad", "tr": "geniş"},
    {"en": "broadcast", "tr": "yayın, yayın yapmak"},
    {"en": "budget", "tr": "bütçe"},
    {"en": "bullet", "tr": "mermi"},
    {"en": "bunch", "tr": "demet"},
    {"en": "burn", "tr": "yanık"},
    {"en": "bush", "tr": "çalı"},
    {"en": "but", "tr": "hariç"},
    {"en": "cable", "tr": "kablo"},
    {"en": "calculate", "tr": "hesaplamak"},
    {"en": "cancel", "tr": "iptal etmek"},
    {"en": "cancer", "tr": "kanser"},
    {"en": "capable", "tr": "yetenekli"},
    {"en": "capacity", "tr": "kapasite"},
    {"en": "capture", "tr": "ele geçirmek"},
    {"en": "cast", "tr": "rol vermek, oyuncu kadrosu"},
    {"en": "catch", "tr": "yakalama"},
    {"en": "cell", "tr": "hücre"},
    {"en": "chain", "tr": "zincirlemek"},
    {"en": "chair", "tr": "başkanlık etmek"},
    {"en": "chairman", "tr": "başkan"},
    {"en": "challenge", "tr": "meydan okumak"},
    {"en": "characteristic", "tr": "özellik"},
    {"en": "chart", "tr": "grafik çizmek"},
    {"en": "chief", "tr": "şef, başlıca"},
    {"en": "circumstance", "tr": "durum"},
    {"en": "cite", "tr": "atıf yapmak"},
    {"en": "citizen", "tr": "vatandaş"},
    {"en": "civil", "tr": "sivil"},
    {"en": "classic", "tr": "klasik"},
    {"en": "close1", "tr": "yakınlık"},
    {"en": "closely", "tr": "yakından"},
    {"en": "collapse", "tr": "çökmek, çöküş"},
    {"en": "combination", "tr": "kombinasyon"},
    {"en": "comfort", "tr": "rahat, rahatlatmak"},
    {"en": "command", "tr": "komut, komuta etmek"},
    {"en": "commission", "tr": "komisyon"},
    {"en": "commitment", "tr": "bağlılık"},
    {"en": "committee", "tr": "komite"},
    {"en": "commonly", "tr": "genellikle"},
    {"en": "complex", "tr": "kompleks"},
    {"en": "complicated", "tr": "karmaşık"},
    {"en": "component", "tr": "bileşen"},
    {"en": "concentration", "tr": "konsantrasyon"},
    {"en": "concept", "tr": "kavram"},
    {"en": "concern", "tr": "endişe, ilgilendirmek"},
    {"en": "concerned", "tr": "ilgili, endişeli"},
    {"en": "conduct", "tr": "yönetmek, davranış"},
    {"en": "confidence", "tr": "güven"},
    {"en": "conflict", "tr": "çatışma, çatışmak"},
    {"en": "confusing", "tr": "kafa karıştırıcı"},
    {"en": "conscious", "tr": "bilinçli"},
    {"en": "conservative", "tr": "muhafazakar"},
    {"en": "consideration", "tr": "düşünce"},
    {"en": "consistent", "tr": "tutarlı"},
    {"en": "constant", "tr": "sabit"},
    {"en": "constantly", "tr": "sürekli"},
    {"en": "construct", "tr": "inşa etmek"},
    {"en": "construction", "tr": "inşaat"},
    {"en": "contemporary", "tr": "çağdaş"},
    {"en": "contest", "tr": "yarışma, yarışmak"},
    {"en": "contract", "tr": "sözleşme, sözleşme yapmak"},
    {"en": "contribute", "tr": "katkı sağlamak"},
    {"en": "contribution", "tr": "katkı"},
    {"en": "convert", "tr": "dönüştürmek"},
    {"en": "convinced", "tr": "ikna olmuş"},
    {"en": "core", "tr": "öz, çekirdek"},
    {"en": "corporate", "tr": "kurumsal"},
    {"en": "council", "tr": "konsey"},
    {"en": "county", "tr": "ilçe"},
    {"en": "courage", "tr": "cesaret"},
    {"en": "crash", "tr": "çarpışmak, çarpışma"},
    {"en": "creation", "tr": "yaratma"},
    {"en": "creature", "tr": "yaratık"},
    {"en": "credit", "tr": "kredi vermek"},
    {"en": "crew", "tr": "mürettebat"},
    {"en": "crisis", "tr": "kriz"},
    {"en": "criterion", "tr": "kriter"},
    {"en": "critic", "tr": "eleştirmen"},
    {"en": "critical", "tr": "kritik"},
    {"en": "criticism", "tr": "eleştiri"},
    {"en": "criticize", "tr": "eleştirmek"},
    {"en": "crop", "tr": "ekin"},
    {"en": "crucial", "tr": "çok önemli"},
    {"en": "cry", "tr": "ağlama"},
    {"en": "cure", "tr": "iyileştirmek, tedavi"},
    {"en": "current", "tr": "akım"},
    {"en": "curve", "tr": "eğri, eğmek"},
    {"en": "curved", "tr": "eğri"},
    {"en": "date", "tr": "tarih atmak"},
    {"en": "debate", "tr": "tartışma, tartışmak"},
    {"en": "debt", "tr": "borç"},
    {"en": "decent", "tr": "iyi, düzgün"},
    {"en": "declare", "tr": "ilan etmek"},
    {"en": "decline", "tr": "azalmak, düşüş"},
    {"en": "decoration", "tr": "süsleme"},
    {"en": "decrease", "tr": "azaltmak, azalma"},
    {"en": "deeply", "tr": "derinden"},
    {"en": "defeat", "tr": "yenmek, yenilgi"},
    {"en": "defence", "tr": "savunma"},
    {"en": "defend", "tr": "savunmak"},
    {"en": "delay", "tr": "gecikmek, gecikme"},
    {"en": "deliberate", "tr": "kasıtlı"},
    {"en": "deliberately", "tr": "kasten"},
    {"en": "delight", "tr": "zevk vermek, zevk"},
    {"en": "delighted", "tr": "memnun"},
    {"en": "delivery", "tr": "teslimat"},
    {"en": "demand", "tr": "talep, talep etmek"},
    {"en": "demonstrate", "tr": "göstermek"},
    {"en": "deny", "tr": "inkar etmek"},
    {"en": "depressed", "tr": "depresyonda"},
    {"en": "depressing", "tr": "üzücü"},
    {"en": "depth", "tr": "derinlik"},
    {"en": "desert", "tr": "terk etmek"},
    {"en": "deserve", "tr": "hak etmek"},
    {"en": "desire", "tr": "arzu, arzu etmek"},
    {"en": "desperate", "tr": "çaresiz"},
    {"en": "detail", "tr": "ayrıntı vermek"},
    {"en": "detailed", "tr": "ayrıntılı"},
    {"en": "detect", "tr": "tespit etmek"},
    {"en": "dig", "tr": "kazmak"},
    {"en": "disc", "tr": "disk"},
    {"en": "discipline", "tr": "disiplin"},
    {"en": "discount", "tr": "indirim yapmak"},
    {"en": "dishonest", "tr": "dürüst olmayan"},
    {"en": "dismiss", "tr": "kovmak, reddetmek"},
    {"en": "display", "tr": "göstermek, sergi"},
    {"en": "distribute", "tr": "dağıtmak"},
    {"en": "distribution", "tr": "dağıtım"},
    {"en": "district", "tr": "ilçe"},
    {"en": "divide", "tr": "bölmek"},
    {"en": "division", "tr": "bölme, bölüm"},
    {"en": "document", "tr": "belgelendirmek"},
    {"en": "domestic", "tr": "evcil, iç"},
    {"en": "dominate", "tr": "hakim olmak"},
    {"en": "downwards", "tr": "aşağıya doğru"},
    {"en": "dozen", "tr": "düzine"},
    {"en": "draft", "tr": "taslak, taslak yapmak"},
    {"en": "drag", "tr": "sürüklemek"},
    {"en": "dramatic", "tr": "dramatik"},
    {"en": "edit", "tr": "düzenlemek"},
    {"en": "edition", "tr": "baskı"},
    {"en": "efficient", "tr": "verimli"},
    {"en": "elderly", "tr": "yaşlı"},
    {"en": "elect", "tr": "seçmek"},
    {"en": "elsewhere", "tr": "başka yerde"},
    {"en": "emerge", "tr": "ortaya çıkmak"},
    {"en": "emotional", "tr": "duygusal"},
    {"en": "emphasis", "tr": "vurgu"},
    {"en": "emphasize", "tr": "vurgulamak"},
    {"en": "enable", "tr": "olanak sağlamak"},
    {"en": "encounter", "tr": "karşılaşmak, karşılaşma"},
    {"en": "engage", "tr": "meşgul olmak, bağlanmak"},
    {"en": "enhance", "tr": "geliştirmek"},
    {"en": "enquiry", "tr": "soruşturma"},
    {"en": "ensure", "tr": "sağlamak"},
    {"en": "enthusiasm", "tr": "coşku"},
    {"en": "enthusiastic", "tr": "hevesli"},
    {"en": "entire", "tr": "tamamı"},
    {"en": "entirely", "tr": "tamamen"},
    {"en": "equal", "tr": "eşit"},
    {"en": "establish", "tr": "kurmak"},
    {"en": "estate", "tr": "mülk"},
    {"en": "estimate", "tr": "tahmin, tahmin etmek"},
    {"en": "ethical", "tr": "etik"},
    {"en": "evaluate", "tr": "değerlendirmek"},
    {"en": "even", "tr": "düz, eşit"},
    {"en": "evil", "tr": "kötülük, kötü"},
    {"en": "examination", "tr": "sınav, inceleme"},
    {"en": "excuse", "tr": "mazeret, mazur görmek"},
    {"en": "executive", "tr": "yönetici, yürütme"},
    {"en": "existence", "tr": "varlık"},
    {"en": "expectation", "tr": "beklenti"},
    {"en": "expense", "tr": "gider"},
    {"en": "exploration", "tr": "keşif"},
    {"en": "expose", "tr": "maruz bırakmak"},
    {"en": "extend", "tr": "uzatmak"},
    {"en": "extent", "tr": "ölçü"},
    {"en": "external", "tr": "harici"},
    {"en": "extraordinary", "tr": "olağanüstü"},
    {"en": "extreme", "tr": "aşırılık"},
    {"en": "facility", "tr": "tesis"},
    {"en": "failure", "tr": "başarısızlık"},
    {"en": "faith", "tr": "inanç"},
    {"en": "fault", "tr": "hata"},
    {"en": "favour", "tr": "iyilik etmek"},
    {"en": "feather", "tr": "tüy"},
    {"en": "fee", "tr": "ücret"},
    {"en": "feed", "tr": "yem, beslemek"},
    {"en": "feedback", "tr": "geri bildirim"},
    {"en": "feel", "tr": "hissetmek"},
    {"en": "fellow", "tr": "arkadaş, meslektaş"},
    {"en": "figure", "tr": "şekil, rakam, şekillendirmek"},
    {"en": "file", "tr": "dosya, dosyalamak"},
    {"en": "finance", "tr": "maliye, finanse etmek"},
    {"en": "finding", "tr": "bulgu"},
    {"en": "firm", "tr": "firma"},
    {"en": "fix", "tr": "tamir, düzeltmek"},
    {"en": "flame", "tr": "alev"},
    {"en": "flash", "tr": "flaş, parlamak"},
    {"en": "flexible", "tr": "esnek"},
    {"en": "float", "tr": "yüzmek"},
    {"en": "fold", "tr": "kat, katlamak"},
    {"en": "folding", "tr": "katlanır"},
    {"en": "following", "tr": "takip eden, -den sonra"},
    {"en": "forgive", "tr": "affetmek"},
    {"en": "former", "tr": "eski"},
    {"en": "fortune", "tr": "servet"},
    {"en": "forward", "tr": "ileri, yönlendirmek"},
    {"en": "found", "tr": "kurmak"},
    {"en": "free", "tr": "serbest bırakmak"},
    {"en": "freedom", "tr": "özgürlük"},
    {"en": "frequency", "tr": "frekans"},
    {"en": "fuel", "tr": "yakıt, yakıt sağlamak"},
    {"en": "fully", "tr": "tamamen"},
    {"en": "function", "tr": "işlev, işlemek"},
    {"en": "fund", "tr": "fon, finanse etmek"},
    {"en": "fundamental", "tr": "temel"},
    {"en": "funding", "tr": "fonlama"},
    {"en": "furthermore", "tr": "ayrıca"},
    {"en": "gain", "tr": "kazanç, kazanmak"},
    {"en": "gang", "tr": "çete"},
    {"en": "generate", "tr": "üretmek"},
    {"en": "genre", "tr": "tür"},
    {"en": "govern", "tr": "yönetmek"},
    {"en": "grab", "tr": "kapmak"},
    {"en": "grade", "tr": "not vermek"},
    {"en": "gradually", "tr": "yavaş yavaş"},
    {"en": "grand", "tr": "görkemli"},
    {"en": "grant", "tr": "hibe, hibe etmek"},
    {"en": "guarantee", "tr": "garanti, garanti etmek"},
    {"en": "handle", "tr": "idare etmek, tutamak"},
    {"en": "harm", "tr": "zarar, zarar vermek"},
    {"en": "harmful", "tr": "zararlı"},
    {"en": "hearing", "tr": "işitme"},
    {"en": "heaven", "tr": "cennet"},
    {"en": "heel", "tr": "topuk"},
    {"en": "hell", "tr": "cehennem"},
    {"en": "hesitate", "tr": "tereddüt etmek"},
    {"en": "high", "tr": "yükseklik"},
    {"en": "hire", "tr": "kiralamak, işe almak"},
    {"en": "hold", "tr": "tutmak, tutma"},
    {"en": "hollow", "tr": "oyuk"},
    {"en": "holy", "tr": "kutsal"},
    {"en": "honour", "tr": "onur, onurlandırmak"},
    {"en": "host", "tr": "ev sahipliği yapmak"},
    {"en": "house", "tr": "barındırmak"},
    {"en": "household", "tr": "hane"},
    {"en": "housing", "tr": "konut"},
    {"en": "humorous", "tr": "mizahi"},
    {"en": "humour", "tr": "mizah"},
    {"en": "hunt", "tr": "av, avlamak"},
    {"en": "hunting", "tr": "avcılık"},
    {"en": "hurt", "tr": "yaralamak, incinme"},
    {"en": "ideal", "tr": "ideal"},
    {"en": "illustrate", "tr": "örneklemek, resimlemek"},
    {"en": "illustration", "tr": "örnek, illüstrasyon"},
    {"en": "imagination", "tr": "hayal gücü"},
    {"en": "impatient", "tr": "sabırsız"},
    {"en": "imply", "tr": "ima etmek"},
    {"en": "impose", "tr": "dayatmak"},
    {"en": "impress", "tr": "etkilemek"},
    {"en": "impressed", "tr": "etkilenmiş"},
    {"en": "inch", "tr": "inç"},
    {"en": "incident", "tr": "olay"},
    {"en": "income", "tr": "gelir"},
    {"en": "increasingly", "tr": "giderek artan"},
    {"en": "industrial", "tr": "endüstriyel"},
    {"en": "infection", "tr": "enfeksiyon"},
    {"en": "inform", "tr": "bilgilendirmek"},
    {"en": "initial", "tr": "ilk"},
    {"en": "initially", "tr": "başlangıçta"},
    {"en": "initiative", "tr": "girişim"},
    {"en": "inner", "tr": "iç"},
    {"en": "insight", "tr": "içgörü"},
    {"en": "insist", "tr": "ısrar etmek"},
    {"en": "inspire", "tr": "ilham vermek"},
    {"en": "install", "tr": "kurmak"},
    {"en": "instance", "tr": "örnek"},
    {"en": "institute", "tr": "enstitü"},
    {"en": "institution", "tr": "kurum"},
    {"en": "insurance", "tr": "sigorta"},
    {"en": "intended", "tr": "planlanan"},
    {"en": "intense", "tr": "yoğun"},
    {"en": "internal", "tr": "iç"},
    {"en": "interpret", "tr": "yorumlamak"},
    {"en": "interrupt", "tr": "yarıda kesmek"},
    {"en": "investigation", "tr": "soruşturma"},
    {"en": "investment", "tr": "yatırım"},
    {"en": "issue", "tr": "konu, yayımlamak"},
    {"en": "joy", "tr": "neşe"},
    {"en": "judgement", "tr": "yargı"},
    {"en": "junior", "tr": "küçük, alt seviyede"},
    {"en": "justice", "tr": "adalet"},
    {"en": "justify", "tr": "haklı çıkarmak"},
    {"en": "labour", "tr": "emek"},
    {"en": "landscape", "tr": "manzara"},
    {"en": "largely", "tr": "çoğunlukla"},
    {"en": "latest", "tr": "en son"},
    {"en": "launch", "tr": "başlatmak, fırlatma"},
    {"en": "leadership", "tr": "liderlik"},
    {"en": "league", "tr": "lig"},
    {"en": "lean", "tr": "yaslanmak"},
    {"en": "leave", "tr": "izin"},
    {"en": "level", "tr": "seviyeye getirmek"},
    {"en": "licence", "tr": "lisans"},
    {"en": "limited", "tr": "sınırlı"},
    {"en": "line", "tr": "çizgi çizmek"},
    {"en": "lively", "tr": "canlı"},
    {"en": "load", "tr": "yük, yüklemek"},
    {"en": "loan", "tr": "kredi"},
    {"en": "logical", "tr": "mantıklı"},
    {"en": "long-term", "tr": "uzun vadeli"},
    {"en": "loose", "tr": "gevşek"},
    {"en": "lord", "tr": "lord"},
    {"en": "low", "tr": "düşük seviye"},
    {"en": "lower", "tr": "indirmek"},
    {"en": "lung", "tr": "akciğer"},
    {"en": "maintain", "tr": "sürdürmek"},
    {"en": "majority", "tr": "çoğunluk"},
    {"en": "make", "tr": "yapı, marka"},
    {"en": "map", "tr": "harita çıkarmak"},
    {"en": "mass", "tr": "kitle"},
    {"en": "massive", "tr": "çok büyük"},
    {"en": "master", "tr": "usta, hakim olmak"},
    {"en": "matching", "tr": "uyumlu"},
    {"en": "material", "tr": "malzeme, maddi"},
    {"en": "maximum", "tr": "maksimum"},
    {"en": "means", "tr": "araç"},
    {"en": "measurement", "tr": "ölçüm"},
    {"en": "medium", "tr": "orta, araç"},
    {"en": "melt", "tr": "erimek"},
    {"en": "military", "tr": "askeri"},
    {"en": "mineral", "tr": "mineral"},
    {"en": "minimum", "tr": "minimum"},
    {"en": "minister", "tr": "bakan"},
    {"en": "minor", "tr": "küçük"},
    {"en": "minority", "tr": "azınlık"},
    {"en": "mission", "tr": "görev"},
    {"en": "mistake", "tr": "yanlış yapmak"},
    {"en": "mixed", "tr": "karışık"},
    {"en": "model", "tr": "modellemek"},
    {"en": "modify", "tr": "değiştirmek"},
    {"en": "monitor", "tr": "izlemek, monitör"},
    {"en": "moral", "tr": "ahlaki, ders"},
    {"en": "motor", "tr": "motor"},
    {"en": "mount", "tr": "yükselmek, monte etmek"},
    {"en": "multiple", "tr": "çoklu"},
    {"en": "multiply", "tr": "çarpma yapmak"},
    {"en": "mysterious", "tr": "gizemli"},
    {"en": "narrow", "tr": "daraltmak"},
    {"en": "national", "tr": "ulus"},
    {"en": "neat", "tr": "düzenli"},
    {"en": "negative", "tr": "olumsuz"},
    {"en": "nerve", "tr": "sinir"},
    {"en": "nevertheless", "tr": "yine de"},
    {"en": "nightmare", "tr": "kabus"},
    {"en": "notion", "tr": "kavram"},
    {"en": "numerous", "tr": "çok sayıda"},
    {"en": "obey", "tr": "itaat etmek"},
    {"en": "object", "tr": "itiraz etmek"},
    {"en": "objective", "tr": "hedef, nesnel"},
    {"en": "obligation", "tr": "yükümlülük"},
    {"en": "observation", "tr": "gözlem"},
    {"en": "observe", "tr": "gözlemlemek"},
    {"en": "obtain", "tr": "elde etmek"},
    {"en": "occasionally", "tr": "ara sıra"},
    {"en": "offence", "tr": "suç"},
    {"en": "offend", "tr": "gücendirmek"},
    {"en": "offensive", "tr": "saldırgan"},
    {"en": "official", "tr": "memur"},
    {"en": "opening", "tr": "açılış"},
    {"en": "operate", "tr": "işletmek, ameliyat etmek"},
    {"en": "opponent", "tr": "rakip"},
    {"en": "oppose", "tr": "karşı çıkmak"},
    {"en": "opposed", "tr": "karşı"},
    {"en": "opposition", "tr": "muhalefet"},
    {"en": "organ", "tr": "organ"},
    {"en": "origin", "tr": "köken"},
    {"en": "otherwise", "tr": "aksi takdirde"},
    {"en": "outcome", "tr": "sonuç"},
    {"en": "outer", "tr": "dış"},
    {"en": "outline", "tr": "taslak, özet"},
    {"en": "overall", "tr": "genel, tamamen"},
    {"en": "owe", "tr": "borçlu olmak"},
    {"en": "pace", "tr": "tempo, adım atmak"},
    {"en": "package", "tr": "paketlemek"},
    {"en": "panel", "tr": "panel"},
    {"en": "parliament", "tr": "parlamento"},
    {"en": "participant", "tr": "katılımcı"},
    {"en": "partly", "tr": "kısmen"},
    {"en": "passage", "tr": "geçit"},
    {"en": "patient", "tr": "sabırlı"},
    {"en": "pension", "tr": "emekli maaşı"},
    {"en": "permanent", "tr": "kalıcı"},
    {"en": "permit", "tr": "izin, izin vermek"},
    {"en": "perspective", "tr": "bakış açısı"},
    {"en": "phase", "tr": "aşama"},
    {"en": "phenomenon", "tr": "olay, fenomen"},
    {"en": "philosophy", "tr": "felsefe"},
    {"en": "pick", "tr": "seçmek"},
    {"en": "picture", "tr": "resim çekmek"},
    {"en": "pile", "tr": "yığın, yığmak"},
    {"en": "pitch", "tr": "saha"},
    {"en": "plain", "tr": "sade"},
    {"en": "plot", "tr": "komplo kurmak"},
    {"en": "plus", "tr": "artı, ek"},
    {"en": "pointed", "tr": "sivri"},
    {"en": "popularity", "tr": "popülerlik"},
    {"en": "pose", "tr": "poz vermek"},
    {"en": "position", "tr": "konumlandırmak"},
    {"en": "positive", "tr": "olumlu"},
    {"en": "possess", "tr": "sahip olmak"},
    {"en": "potential", "tr": "potansiyel"},
    {"en": "power", "tr": "güç kullanmak"},
    {"en": "praise", "tr": "övgü, övmek"},
    {"en": "pregnant", "tr": "hamile"},
    {"en": "preparation", "tr": "hazırlık"},
    {"en": "presence", "tr": "varlık"},
    {"en": "preserve", "tr": "korumak"},
    {"en": "price", "tr": "fiyat biçmek"},
    {"en": "prime", "tr": "önemli, başlıca"},
    {"en": "principle", "tr": "ilke"},
    {"en": "print", "tr": "baskı"},
    {"en": "priority", "tr": "öncelik"},
    {"en": "privacy", "tr": "gizlilik"},
    {"en": "procedure", "tr": "prosedür"},
    {"en": "process", "tr": "işlemek"},
    {"en": "produce", "tr": "ürün"},
    {"en": "professional", "tr": "uzman"},
    {"en": "progress", "tr": "ilerlemek"},
    {"en": "project", "tr": "yansıtmak"},
    {"en": "proof", "tr": "kanıt"},
    {"en": "proposal", "tr": "teklif"},
    {"en": "propose", "tr": "önermek"},
    {"en": "prospect", "tr": "olasılık"},
    {"en": "protection", "tr": "koruma"},
    {"en": "psychologist", "tr": "psikolog"},
    {"en": "psychology", "tr": "psikoloji"},
    {"en": "publication", "tr": "yayın"},
    {"en": "pupil", "tr": "öğrenci"},
    {"en": "purchase", "tr": "satın alma"},
    {"en": "pure", "tr": "saf"},
    {"en": "pursue", "tr": "takip etmek"},
    {"en": "range", "tr": "menzil"},
    {"en": "rank", "tr": "rütbe"},
    {"en": "rapid", "tr": "hızlı"},
    {"en": "rapidly", "tr": "hızla"},
    {"en": "rate", "tr": "oranlamak"},
    {"en": "raw", "tr": "çiğ"},
    {"en": "reach", "tr": "erişim"},
    {"en": "realistic", "tr": "gerçekçi"},
    {"en": "reasonable", "tr": "makul"},
    {"en": "recall", "tr": "hatırlamak"},
    {"en": "recover", "tr": "iyileşmek"},
    {"en": "reduction", "tr": "azalma"},
    {"en": "regard", "tr": "dikkat, dikkate almak"},
    {"en": "regional", "tr": "bölgesel"},
    {"en": "register", "tr": "kayıt, kaydetmek"},
    {"en": "regret", "tr": "pişmanlık, pişman olmak"},
    {"en": "regulation", "tr": "düzenleme"},
    {"en": "relatively", "tr": "nispeten"},
    {"en": "relevant", "tr": "ilgili"},
    {"en": "relief", "tr": "rahatlama"},
    {"en": "rely", "tr": "güvenmek"},
    {"en": "remark", "tr": "yorum, belirtmek"},
    {"en": "representative", "tr": "temsilci"},
    {"en": "reputation", "tr": "itibar"},
    {"en": "requirement", "tr": "gereksinim"},
    {"en": "rescue", "tr": "kurtarmak, kurtarma"},
    {"en": "reserve", "tr": "ayırmak, rezerv"},
    {"en": "resident", "tr": "ikamet eden"},
    {"en": "resist", "tr": "direnmek"},
    {"en": "resolve", "tr": "çözmek"},
    {"en": "resort", "tr": "tatil yeri"},
    {"en": "retain", "tr": "sürdürmek"},
    {"en": "reveal", "tr": "açığa çıkarmak"},
    {"en": "revolution", "tr": "devrim"},
    {"en": "reward", "tr": "ödül, ödüllendirmek"},
    {"en": "rhythm", "tr": "ritim"},
    {"en": "rid", "tr": "kurtulmak"},
    {"en": "root", "tr": "kök"},
    {"en": "round", "tr": "tur"},
    {"en": "routine", "tr": "alışılmış"},
    {"en": "rub", "tr": "ovmak"},
    {"en": "rubber", "tr": "kauçuk"},
    {"en": "rural", "tr": "kırsal"},
    {"en": "rush", "tr": "acele, acele etmek"},
    {"en": "sample", "tr": "örneklemek"},
    {"en": "satellite", "tr": "uydu"},
    {"en": "satisfied", "tr": "memnun"},
    {"en": "satisfy", "tr": "tatmin etmek"},
    {"en": "saving", "tr": "tasarruf"},
    {"en": "scale", "tr": "ölçek"},
    {"en": "schedule", "tr": "zamanlamak"},
    {"en": "scheme", "tr": "plan, düzen"},
    {"en": "scream", "tr": "çığlık atmak"},
    {"en": "screen", "tr": "ekran, taramak"},
    {"en": "seat", "tr": "oturtmak"},
    {"en": "sector", "tr": "sektör"},
    {"en": "secure", "tr": "güvenli, sağlama almak"},
    {"en": "seek", "tr": "aramak"},
    {"en": "select", "tr": "seçmek"},
    {"en": "selection", "tr": "seçim"},
    {"en": "self", "tr": "benlik"},
    {"en": "senior", "tr": "kıdemli"},
    {"en": "sense", "tr": "algılamak"},
    {"en": "sensitive", "tr": "hassas"},
    {"en": "sentence", "tr": "cümle kurmak, hüküm vermek"},
    {"en": "sequence", "tr": "sıra"},
    {"en": "session", "tr": "oturum"},
    {"en": "settle", "tr": "yerleşmek"},
    {"en": "severe", "tr": "şiddetli"},
    {"en": "shade", "tr": "gölge"},
    {"en": "shadow", "tr": "gölge"},
    {"en": "shallow", "tr": "sığ"},
    {"en": "shame", "tr": "utanç"},
    {"en": "shape", "tr": "şekillendirmek"},
    {"en": "shelter", "tr": "barınak, barındırmak"},
    {"en": "shift", "tr": "vardiya, değiştirmek"},
    {"en": "ship", "tr": "göndermek"},
    {"en": "shock", "tr": "şok, şok etmek"},
    {"en": "shocked", "tr": "şok olmuş"},
    {"en": "shooting", "tr": "çekim, ateş etme"},
    {"en": "shot", "tr": "atış"},
    {"en": "significant", "tr": "önemli"},
    {"en": "significantly", "tr": "önemli ölçüde"},
    {"en": "silence", "tr": "sessizlik"},
    {"en": "silk", "tr": "ipek"},
    {"en": "sincere", "tr": "samimi"},
    {"en": "slave", "tr": "köle"},
    {"en": "slide", "tr": "kaymak, kaydırak"},
    {"en": "slight", "tr": "hafif"},
    {"en": "slip", "tr": "kaymak"},
    {"en": "slope", "tr": "yokuş"},
    {"en": "solar", "tr": "güneşle ilgili"},
    {"en": "somewhat", "tr": "biraz"},
    {"en": "soul", "tr": "ruh"},
    {"en": "specialist", "tr": "uzman"},
    {"en": "species", "tr": "tür"},
    {"en": "speed", "tr": "hız yapmak"},
    {"en": "spiritual", "tr": "ruhsal"},
    {"en": "split", "tr": "bölmek"},
    {"en": "sponsor", "tr": "sponsor, sponsor olmak"},
    {"en": "spot", "tr": "yer"},
    {"en": "spread", "tr": "yayılma"},
    {"en": "stable", "tr": "istikrarlı"},
    {"en": "stage", "tr": "sahnelemek"},
    {"en": "stand", "tr": "tezgah, durmak"},
    {"en": "stare", "tr": "dik dik bakmak"},
    {"en": "status", "tr": "statü"},
    {"en": "steady", "tr": "istikrarlı"},
    {"en": "steel", "tr": "çelik"},
    {"en": "steep", "tr": "dik"},
    {"en": "step", "tr": "adım atmak"},
    {"en": "sticky", "tr": "yapışkan"},
    {"en": "stiff", "tr": "sert"},
    {"en": "stock", "tr": "stok"},
    {"en": "stream", "tr": "dere, akış"},
    {"en": "stretch", "tr": "gerilmek"},
    {"en": "strict", "tr": "katı"},
    {"en": "strike", "tr": "grev, vurmak"},
    {"en": "structure", "tr": "yapılandırmak"},
    {"en": "struggle", "tr": "mücadele etmek"},
    {"en": "stuff", "tr": "eşya, doldurmak"},
    {"en": "subject", "tr": "konuya bağlı"},
    {"en": "submit", "tr": "sunmak"},
    {"en": "sum", "tr": "toplam, toplamak"},
    {"en": "surgery", "tr": "ameliyat"},
    {"en": "surround", "tr": "çevrelemek"},
    {"en": "surrounding", "tr": "çevresel"},
    {"en": "survey", "tr": "anket yapmak"},
    {"en": "suspect", "tr": "şüpheli, şüphelenmek"},
    {"en": "swear", "tr": "küfretmek, yemin etmek"},
    {"en": "sweep", "tr": "süpürmek"},
    {"en": "switch", "tr": "anahtar"},
    {"en": "sympathy", "tr": "sempati"},
    {"en": "tale", "tr": "masal"},
    {"en": "tank", "tr": "tank"},
    {"en": "target", "tr": "hedef almak"},
    {"en": "tear1", "tr": "yırtmak, yırtık"},
    {"en": "tear2", "tr": "gözyaşı"},
    {"en": "temporary", "tr": "geçici"},
    {"en": "term", "tr": "terim, dönem"},
    {"en": "therapy", "tr": "terapi"},
    {"en": "threat", "tr": "tehdit"},
    {"en": "threaten", "tr": "tehdit etmek"},
    {"en": "thus", "tr": "böylece"},
    {"en": "time", "tr": "zamanlamak"},
    {"en": "title", "tr": "başlık koymak"},
    {"en": "tone", "tr": "ton"},
    {"en": "tough", "tr": "sert, zor"},
    {"en": "track", "tr": "izlemek"},
    {"en": "transfer", "tr": "transfer etmek"},
    {"en": "transform", "tr": "dönüştürmek"},
    {"en": "transition", "tr": "geçiş"},
    {"en": "trial", "tr": "duruşma, deneme"},
    {"en": "trip", "tr": "tökezlemek"},
    {"en": "tropical", "tr": "tropikal"},
    {"en": "trouble", "tr": "sorun çıkarmak"},
    {"en": "truly", "tr": "gerçekten"},
    {"en": "trust", "tr": "güven, güvenmek"},
    {"en": "try", "tr": "deneme"},
    {"en": "tune", "tr": "melodi"},
    {"en": "tunnel", "tr": "tünel"},
    {"en": "ultimately", "tr": "sonunda"},
    {"en": "unconscious", "tr": "bilinçsiz"},
    {"en": "unexpected", "tr": "beklenmedik"},
    {"en": "unique", "tr": "eşsiz"},
    {"en": "universe", "tr": "evren"},
    {"en": "unknown", "tr": "bilinmeyen"},
    {"en": "upper", "tr": "üst"},
    {"en": "upwards", "tr": "yukarıya doğru"},
    {"en": "urban", "tr": "kentsel"},
    {"en": "urge", "tr": "dürtmek"},
    {"en": "value", "tr": "değer biçmek"},
    {"en": "vary", "tr": "değişmek"},
    {"en": "vast", "tr": "çok geniş"},
    {"en": "venue", "tr": "mekan"},
    {"en": "very", "tr": "çok"},
    {"en": "via", "tr": "üzerinden"},
    {"en": "victory", "tr": "zafer"},
    {"en": "violence", "tr": "şiddet"},
    {"en": "virtual", "tr": "sanal"},
    {"en": "vision", "tr": "görüş"},
    {"en": "visual", "tr": "görsel"},
    {"en": "vital", "tr": "hayati"},
    {"en": "vitamin", "tr": "vitamin"},
    {"en": "volume", "tr": "hacim, cilt"},
    {"en": "wage", "tr": "ücret"},
    {"en": "way", "tr": "yol boyunca"},
    {"en": "weakness", "tr": "zayıflık"},
    {"en": "wealth", "tr": "zenginlik"},
    {"en": "wealthy", "tr": "zengin"},
    {"en": "whereas", "tr": "oysa"},
    {"en": "wherever", "tr": "nerede olursa"},
    {"en": "whisper", "tr": "fısıldamak"},
    {"en": "whom", "tr": "kimi"},
    {"en": "widely", "tr": "geniş ölçüde"},
    {"en": "wildlife", "tr": "vahşi yaşam"},
    {"en": "willing", "tr": "istekli"},
    {"en": "wind2", "tr": "sarmak"},
    {"en": "wire", "tr": "tel"},
    {"en": "wise", "tr": "bilge"},
    {"en": "witness", "tr": "tanık, tanıklık etmek"},
    {"en": "worse", "tr": "daha kötü şey"},
    {"en": "worst", "tr": "en kötü şey"},
    {"en": "worth", "tr": "değer"},
    {"en": "wound", "tr": "yara, yaralamak"},
    {"en": "wrap", "tr": "sarmak"},
    {"en": "wrong", "tr": "yanlış şey"},
    {"en": "yet", "tr": "ancak"},
    {"en": "zone", "tr": "bölge"},
  ];

  @override
  State<B2Page> createState() => _B2PageState();
}

class _B2PageState extends State<B2Page> {
  bool showWords = false;
  int? _savedIndex; // sonraki kart
  int _savedKnown = 0;
  int _savedUnknown = 0;
  int _total = B2Page.words.length;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final p = await SharedPreferences.getInstance();
      final prog = p.getInt('b2_progress');
      final legacy = p.getInt('b2_index');
      final known = p.getStringList('b2_known') ?? [];
      final unknown = p.getStringList('b2_unknown') ?? [];
      setState(() {
        _savedIndex = prog ?? legacy;
        _savedKnown = known.length;
        _savedUnknown = unknown.length;
      });
    } catch (_) {}
  }

  Future<void> _openStudy() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => B2StudyPage(words: B2Page.words)),
    );
    if (mounted) _load();
  }

  Future<void> _openKnownStudy() async {
    final p = await SharedPreferences.getInstance();
    final knownWords = p.getStringList('b2_known') ?? [];
    if (knownWords.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Bildiğiniz kelime bulunmuyor')),
      );
      return;
    }

    final knownWordList = B2Page.words
        .where((w) => knownWords.contains(w['en']))
        .toList();

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => B2StudyPage(
          words: knownWordList,
          isReviewMode: false,
          isKnownMode: true, // Yeni parametre: Bildiklerim modu
        ),
      ),
    );
    if (mounted) {
      // Kısa bir gecikme ekleyerek SharedPreferences'ın güncellenmesini bekle
      Future.delayed(const Duration(milliseconds: 300), () {
        if (mounted) _load();
      });
    }
  }

  Future<void> _openUnknownStudy() async {
    final p = await SharedPreferences.getInstance();
    final unknownWords = p.getStringList('b2_unknown') ?? [];
    if (unknownWords.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Bilmediğiniz kelime bulunmuyor')),
      );
      return;
    }

    final unknownWordList = B2Page.words
        .where((w) => unknownWords.contains(w['en']))
        .toList();

    // 20 kelime sınırı kaldırıldı - tüm bilmediklerim kelimeleri çalışılabilir
    final limitedUnknownWords = unknownWordList;

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => B2StudyPage(
          words: limitedUnknownWords,
          isReviewMode: false, // Bilmediklerim modu için kaydetme aktif olsun
          isUnknownMode: true, // Yeni parametre: Bilmediklerim modu
        ),
      ),
    );
    if (mounted) {
      // Kısa bir gecikme ekleyerek SharedPreferences'ın güncellenmesini bekle
      Future.delayed(const Duration(milliseconds: 300), () {
        if (mounted) _load();
      });
    }
  }

  Future<void> _openReviewStudy() async {
    // Onay dialogu göster
    final result = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Emin misiniz?'),
          content: const Text(
            'Tümünü tekrar çalışmak istediğinizden emin misiniz? Bu işlem mevcut ilerlemenizi sıfırlayacaktır.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Hayır'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Evet'),
            ),
          ],
        );
      },
    );

    // Eğer kullanıcı "Evet" derse
    if (result == true) {
      // Tüm ilerlemeyi sıfırla
      final p = await SharedPreferences.getInstance();
      await p.remove('b2_index');
      await p.remove('b2_progress');
      await p.remove('b2_total');
      await p.remove('b2_known');
      await p.remove('b2_unknown');

      // Sayfayı yeniden yükle
      if (mounted) _load();

      // Çalışma sayfasını aç
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => B2StudyPage(words: B2Page.words, isReviewMode: true),
        ),
      );
      if (mounted) _load();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('B2 Kelimeleri'),
        backgroundColor: Colors.red.shade700,
        foregroundColor: Colors.white,
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: showWords ? _buildWordList() : _buildStartButtons(),
      ),
    );
  }

  Widget _buildStartButtons() => Center(
    key: const ValueKey('start'),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () => setState(() => showWords = true),
            icon: const Icon(Icons.list),
            label: const Text('Kelimeleri Göster'),
          ),
          const SizedBox(height: 18),

          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: _openStudy,
            icon: const Icon(Icons.school),
            label: const Text('Kelimeleri Çalış'),
          ),
          const SizedBox(height: 18),
          // Bildiklerim butonu
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: _openKnownStudy,
            icon: const Icon(Icons.check_circle),
            label: Text('Bildiklerim ($_savedKnown)'),
          ),
          const SizedBox(height: 18),
          // Bilmediklerim butonu
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: _openUnknownStudy,
            icon: const Icon(Icons.refresh),
            label: Text('Bilmediklerim ($_savedUnknown)'),
          ),
          const SizedBox(height: 18),
          // Tümünü tekrar çalış butonu
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: _openReviewStudy,
            icon: const Icon(Icons.replay),
            label: const Text('Tümünü Tekrar Çalış'),
          ),
        ],
      ),
    ),
  );

  Widget _buildWordList() => Padding(
    key: const ValueKey('list'),
    padding: const EdgeInsets.all(16),
    child: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () => setState(() => showWords = false),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Gizle'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: _openStudy,
                icon: const Icon(Icons.school),
                label: const Text('Çalış'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Expanded(
          child: ListView.separated(
            itemCount: B2Page.words.length,
            separatorBuilder: (_, __) => const SizedBox(height: 6),
            itemBuilder: (c, i) {
              final w = B2Page.words[i];
              return Card(
                color: Colors.red.shade50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text(
                    w['en']!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(w['tr']!),
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}

class B2StudyPage extends StatefulWidget {
  final List<Map<String, String>> words;
  final bool isReviewMode;
  final bool isUnknownMode;
  final bool isKnownMode;
  const B2StudyPage({
    super.key,
    required this.words,
    this.isReviewMode = false,
    this.isUnknownMode = false,
    this.isKnownMode = false,
  });
  @override
  State<B2StudyPage> createState() => _B2StudyPageState();
}

class _B2StudyPageState extends State<B2StudyPage>
    with SingleTickerProviderStateMixin {
  int index = 0; // gösterilen kart (0-based)
  bool showMeaning = false;
  final List<Map<String, String>> known = [];
  final List<Map<String, String>> unknown = [];
  bool _restoring = true; // async restore bitene kadar kaydetme engeli

  Offset _drag = Offset.zero;
  late AnimationController _controller;
  Animation<Offset>? _anim;
  bool _animatingOut = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 240))
      ..addListener(() {
        if (_anim != null) setState(() => _drag = _anim!.value);
      })
      ..addStatusListener((s) async {
        if (s == AnimationStatus.completed && _animatingOut) {
          final left = _drag.dx < 0;
          final w = widget.words[index];
          if (left) {
            if (!known.contains(w)) known.add(w);

            // Normal modda (Kelimeleri Çalış) bildiklerim listesine ekle
            if (!widget.isKnownMode &&
                !widget.isUnknownMode &&
                !widget.isReviewMode) {
              final p = await SharedPreferences.getInstance();
              final currentKnown = p.getStringList('b2_known') ?? [];
              if (!currentKnown.contains(w['en'])) {
                final updatedKnown = [...currentKnown, w['en']!];
                await p.setStringList('b2_known', updatedKnown);
              }
            }

            // Bilmediklerim modunda sola kaydırıldığında ana bildiklerim listesine ekle ve bilmediklerim listesinden çıkar
            if (widget.isUnknownMode) {
              final p = await SharedPreferences.getInstance();

              // Ana bildiklerim listesine ekle
              final currentKnown = p.getStringList('b2_known') ?? [];
              if (!currentKnown.contains(w['en'])) {
                final updatedKnown = [...currentKnown, w['en']!];
                await p.setStringList('b2_known', updatedKnown);
              }

              // Ana bilmediklerim listesinden çıkar
              final currentUnknown = p.getStringList('b2_unknown') ?? [];
              final updatedUnknown = currentUnknown
                  .where((word) => word != w['en'])
                  .toList();
              await p.setStringList('b2_unknown', updatedUnknown);
            }

            // Bildiklerim modunda sola kaydırıldığında bildiklerim listesinde kalsın (hiçbir şey yapma)
            // Bu durumda kelime zaten bildiklerim listesinde olduğu için ekstra işlem gerekmez
          } else {
            if (!unknown.contains(w)) unknown.add(w);

            // Normal modda (Kelimeleri Çalış) bilmediklerim listesine ekle
            if (!widget.isKnownMode &&
                !widget.isUnknownMode &&
                !widget.isReviewMode) {
              final p = await SharedPreferences.getInstance();
              final currentUnknown = p.getStringList('b2_unknown') ?? [];
              if (!currentUnknown.contains(w['en'])) {
                final updatedUnknown = [...currentUnknown, w['en']!];
                await p.setStringList('b2_unknown', updatedUnknown);
              }
            }

            // Bildiklerim modunda sağa kaydırıldığında ana bilmediklerim listesine ekle ve bildiklerim listesinden çıkar
            if (widget.isKnownMode) {
              final p = await SharedPreferences.getInstance();

              // Ana bilmediklerim listesine ekle
              final currentUnknown = p.getStringList('b2_unknown') ?? [];
              if (!currentUnknown.contains(w['en'])) {
                final updatedUnknown = [...currentUnknown, w['en']!];
                await p.setStringList('b2_unknown', updatedUnknown);
              }

              // Ana bildiklerim listesinden çıkar
              final currentKnown = p.getStringList('b2_known') ?? [];
              final updatedKnown = currentKnown
                  .where((word) => word != w['en'])
                  .toList();
              await p.setStringList('b2_known', updatedKnown);
            }
          }
          _advance();
        }
      });
    _restore();
  }

  @override
  void dispose() {
    if (index < widget.words.length) {
      // Sadece normal modda _save() çağır, özel modlarda çağırma
      if (!widget.isUnknownMode && !widget.isKnownMode) {
        _save();
      } else {
        // Özel modlarda sadece kendi verilerini kaydet
        _saveSpecialMode();
      }
    }
    _controller.dispose();
    super.dispose();
  }

  void _advance() {
    setState(() {
      _drag = Offset.zero;
      _animatingOut = false;
      if (index < widget.words.length - 1) {
        index++;
        showMeaning = false;
        // Sadece normal modda _save() çağır, özel modlarda çağırma
        if (!widget.isUnknownMode && !widget.isKnownMode) {
          _save();
        } else {
          // Özel modlarda sadece kendi verilerini kaydet
          _saveSpecialMode();
        }
      } else {
        // Sadece normal modda ana verileri temizle, özel modlarda temizleme
        if (!widget.isUnknownMode && !widget.isKnownMode) {
          _clear();
        } else {
          // Özel modlarda yeniden başlatma bayrağını ayarla
          _setRestartFlag();
        }
        Navigator.pop(context, {'known': known, 'unknown': unknown});
      }
    });
  }

  void _animateTo(Offset target, {bool out = false}) {
    _animatingOut = out;
    _anim = Tween<Offset>(
      begin: _drag,
      end: target,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _controller.forward(from: 0);
  }

  void _onPanUpdate(DragUpdateDetails d) => setState(() => _drag += d.delta);
  void _onPanEnd(DragEndDetails d) {
    const th = 120;
    if (_drag.dx.abs() > th) {
      _animateTo(
        Offset(
          _drag.dx.sign * MediaQuery.of(context).size.width * 1.2,
          _drag.dy,
        ),
        out: true,
      );
    } else {
      _animateTo(Offset.zero);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_restoring) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    if (index >= widget.words.length) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    final word = widget.words[index];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.isUnknownMode
              ? 'Bilmediklerim (${index + 1}/${widget.words.length})'
              : widget.isKnownMode
              ? 'Bildiklerim (${index + 1}/${widget.words.length})'
              : widget.isReviewMode
              ? 'Tekrar Çalış (${index + 1}/${widget.words.length})'
              : 'Çalış (${index + 1}/${widget.words.length})',
        ),
        backgroundColor: widget.isUnknownMode
            ? Colors.red
            : widget.isKnownMode
            ? Colors.green
            : widget.isReviewMode
            ? Colors.purple
            : Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            tooltip: 'Kaydet',
            icon: const Icon(Icons.save),
            onPressed: () async {
              if (_restoring) return; // henüz eski durum yüklenmediyse
              await _save();
              if (!mounted) return;
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('İlerleme kaydedildi'),
                  duration: Duration(seconds: 1),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.checklist),
            onPressed: () async {
              if (!_restoring) await _save();
              if (mounted)
                Navigator.pop(context, {'known': known, 'unknown': unknown});
            },
          ),
        ],
      ),
      body: WillPopScope(
        onWillPop: () async {
          if (!_restoring) await _save();
          return true;
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              LinearProgressIndicator(
                value: (index + 1) / widget.words.length,
                backgroundColor: Colors.grey.shade300,
                color: Colors.blue,
                minHeight: 6,
                borderRadius: BorderRadius.circular(4),
              ),
              const SizedBox(height: 4),
              Text(
                'Biliyor: ${known.length}  Bilmiyor: ${unknown.length}',
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => showMeaning = !showMeaning),
                  onPanUpdate: _onPanUpdate,
                  onPanEnd: _onPanEnd,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.green.withOpacity(.07),
                                  borderRadius: BorderRadius.circular(26),
                                ),
                                child: const Center(
                                  child: Text(
                                    'SOLA\nBİLİYORUM',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.red.withOpacity(.07),
                                  borderRadius: BorderRadius.circular(26),
                                ),
                                child: const Center(
                                  child: Text(
                                    'SAĞA\nBİLMİYORUM',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      AnimatedBuilder(
                        animation: _controller,
                        builder: (_, __) {
                          final angle = (_drag.dx / 300) * 0.30;
                          return Transform.translate(
                            offset: _drag,
                            child: Transform.rotate(
                              angle: angle,
                              child: Card(
                                elevation: 12,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(28),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.all(32),
                                  alignment: Alignment.center,
                                  child: AnimatedSwitcher(
                                    duration: const Duration(milliseconds: 220),
                                    child: showMeaning
                                        ? Column(
                                            key: const ValueKey('m'),
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                word['en']!,
                                                style: const TextStyle(
                                                  fontSize: 42,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              const SizedBox(height: 18),
                                              Text(
                                                word['tr']!,
                                                style: const TextStyle(
                                                  fontSize: 32,
                                                  color: Colors.grey,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              const SizedBox(height: 12),
                                              const Text(
                                                'Sürükle: Sola=Biliyorum  Sağa=Bilmiyorum',
                                              ),
                                            ],
                                          )
                                        : Text(
                                            word['en']!,
                                            key: const ValueKey('w'),
                                            style: const TextStyle(
                                              fontSize: 50,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Kartı sürükle: Sola=Biliyorum  Sağa=Bilmiyorum',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _save() async {
    if (_restoring) return; // restore bitmeden boş veri ile ezme
    if (widget.isReviewMode) return; // review modunda kaydetme

    try {
      final p = await SharedPreferences.getInstance();
      // Progress artık index + 1 olarak hesaplanıyor (çünkü index 0-based)
      final progress = index + 1;

      // Sadece normal mod için kaydetme
      await p.setInt('b2_index', index);
      await p.setInt('b2_progress', progress);
      await p.setInt('b2_total', widget.words.length);
      await p.setStringList('b2_known', known.map((e) => e['en']!).toList());
      await p.setStringList(
        'b2_unknown',
        unknown.map((e) => e['en']!).toList(),
      );
    } catch (_) {}
  }

  Future<void> _saveSpecialMode() async {
    if (_restoring) return; // restore bitmeden boş veri ile ezme
    if (widget.isReviewMode) return; // review modunda kaydetme

    try {
      final p = await SharedPreferences.getInstance();
      // Progress artık index + 1 olarak hesaplanıyor (çünkü index 0-based)
      final progress = index + 1;

      if (widget.isUnknownMode) {
        // Bilmediklerim modu için ayrı kaydetme
        await p.setInt('b2_unknown_index', index);
        await p.setInt('b2_unknown_progress', progress);
        await p.setInt('b2_unknown_total', widget.words.length);
        await p.setStringList(
          'b2_unknown_known',
          known.map((e) => e['en']!).toList(),
        );
        await p.setStringList(
          'b2_unknown_unknown',
          unknown.map((e) => e['en']!).toList(),
        );
      } else if (widget.isKnownMode) {
        // Bildiklerim modu için ayrı kaydetme
        await p.setInt('b2_known_index', index);
        await p.setInt('b2_known_progress', progress);
        await p.setInt('b2_known_total', widget.words.length);
        await p.setStringList(
          'b2_known_known',
          known.map((e) => e['en']!).toList(),
        );
        await p.setStringList(
          'b2_known_unknown',
          unknown.map((e) => e['en']!).toList(),
        );
      }
    } catch (_) {}
  }

  Future<void> _restore() async {
    // Review modunda ise eski kayıtları yükleme, baştan başla
    if (widget.isReviewMode) {
      setState(() {
        index = 0;
        known.clear();
        unknown.clear();
        _restoring = false;
      });
      return;
    }

    try {
      final p = await SharedPreferences.getInstance();

      if (widget.isUnknownMode) {
        // Bilmediklerim modu için ayrı yükleme
        final savedKnown = p.getStringList('b2_unknown_known') ?? [];
        final savedUnknown = p.getStringList('b2_unknown_unknown') ?? [];
        final savedProgress = p.getInt('b2_unknown_progress');
        final legacy = p.getInt('b2_unknown_index');
        final shouldRestart = p.getBool('b2_unknown_restart') ?? false;

        // Resume hesaplaması düzeltildi - önce index'e bak, sonra progress'e bak
        int resume = legacy ?? savedProgress ?? 0;

        // Eğer yeniden başlatma bayrağı varsa veya liste bittiyse baştan başla
        if (shouldRestart || resume >= widget.words.length) {
          // Yeniden başlatma bayrağını temizle
          await p.setBool('b2_unknown_restart', false);
          setState(() {
            index = 0;
            known.clear();
            unknown.clear();
            _restoring = false;
          });
          return;
        }

        setState(() {
          index = resume;
          known.addAll(widget.words.where((w) => savedKnown.contains(w['en'])));
          unknown.addAll(
            widget.words.where((w) => savedUnknown.contains(w['en'])),
          );
          _restoring = false;
        });
      } else if (widget.isKnownMode) {
        // Bildiklerim modu için ayrı yükleme
        final savedKnown = p.getStringList('b2_known_known') ?? [];
        final savedUnknown = p.getStringList('b2_known_unknown') ?? [];
        final savedProgress = p.getInt('b2_known_progress');
        final legacy = p.getInt('b2_known_index');
        final shouldRestart = p.getBool('b2_known_restart') ?? false;

        // Resume hesaplaması düzeltildi - önce index'e bak, sonra progress'e bak
        int resume = legacy ?? savedProgress ?? 0;

        // Eğer yeniden başlatma bayrağı varsa veya liste bittiyse baştan başla
        if (shouldRestart || resume >= widget.words.length) {
          // Yeniden başlatma bayrağını temizle
          await p.setBool('b2_known_restart', false);
          setState(() {
            index = 0;
            known.clear();
            unknown.clear();
            _restoring = false;
          });
          return;
        }

        setState(() {
          index = resume;
          known.addAll(widget.words.where((w) => savedKnown.contains(w['en'])));
          unknown.addAll(
            widget.words.where((w) => savedUnknown.contains(w['en'])),
          );
          _restoring = false;
        });
      } else {
        // Normal mod için yükleme
        final savedKnown = p.getStringList('b2_known') ?? [];
        final savedUnknown = p.getStringList('b2_unknown') ?? [];
        final savedProgress = p.getInt('b2_progress');
        final legacy = p.getInt('b2_index');

        // Resume hesaplaması düzeltildi - önce index'e bak, sonra progress'e bak
        int resume = legacy ?? savedProgress ?? 0;

        if (resume >= widget.words.length) {
          Future.microtask(() {
            if (mounted) Navigator.pop(context);
          });
          setState(() => _restoring = false);
          return;
        }
        setState(() {
          index = resume;
          known.addAll(widget.words.where((w) => savedKnown.contains(w['en'])));
          unknown.addAll(
            widget.words.where((w) => savedUnknown.contains(w['en'])),
          );
          _restoring = false;
        });
      }
    } catch (_) {}
    if (mounted && _restoring) {
      setState(() => _restoring = false);
    }
  }

  Future<void> _clear() async {
    try {
      final p = await SharedPreferences.getInstance();
      for (final k in [
        'b2_index',
        'b2_progress',
        'b2_total',
        'b2_known',
        'b2_unknown',
      ]) {
        p.remove(k);
      }
    } catch (_) {}
  }

  Future<void> _setRestartFlag() async {
    try {
      final p = await SharedPreferences.getInstance();
      if (widget.isUnknownMode) {
        // Bilmediklerim modu için yeniden başlatma bayrağını ayarla
        await p.setBool('b2_unknown_restart', true);
      } else if (widget.isKnownMode) {
        // Bildiklerim modu için yeniden başlatma bayrağını ayarla
        await p.setBool('b2_known_restart', true);
      }
    } catch (_) {}
  }
}
