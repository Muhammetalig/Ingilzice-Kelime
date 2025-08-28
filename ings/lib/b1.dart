import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class B1Page extends StatefulWidget {
  const B1Page({super.key});

  static final List<Map<String, String>> words = [
    {"en": "academic", "tr": "akademik"},
    {"en": "access", "tr": "erişim, erişmek"},
    {"en": "accommodation", "tr": "konaklama"},
    {"en": "account", "tr": "hesap"},
    {"en": "achievement", "tr": "başarı"},
    {"en": "act", "tr": "eylem"},
    {"en": "ad", "tr": "reklam"},
    {"en": "addition", "tr": "ilave, toplama"},
    {"en": "admire", "tr": "hayran olmak"},
    {"en": "admit", "tr": "itiraf etmek, kabul etmek"},
    {"en": "advanced", "tr": "ileri"},
    {"en": "advise", "tr": "tavsiye etmek"},
    {"en": "afford", "tr": "parası yetmek"},
    {"en": "age", "tr": "yaşlanmak"},
    {"en": "aged", "tr": "yaşında, yaşlı"},
    {"en": "agent", "tr": "ajan, temsilci"},
    {"en": "agreement", "tr": "anlaşma"},
    {"en": "ahead", "tr": "ileride"},
    {"en": "aim", "tr": "amaç, amaçlamak"},
    {"en": "alarm", "tr": "alarm"},
    {"en": "album", "tr": "albüm"},
    {"en": "alcohol", "tr": "alkol"},
    {"en": "alcoholic", "tr": "alkollü"},
    {"en": "alternative", "tr": "alternatif"},
    {"en": "amazed", "tr": "şaşırmış"},
    {"en": "ambition", "tr": "hırs, tutku"},
    {"en": "ambitious", "tr": "hırslı"},
    {"en": "analyse", "tr": "analiz etmek"},
    {"en": "analysis", "tr": "analiz"},
    {"en": "announce", "tr": "duyurmak"},
    {"en": "announcement", "tr": "duyuru"},
    {"en": "annoy", "tr": "rahatsız etmek"},
    {"en": "annoyed", "tr": "kızgın"},
    {"en": "annoying", "tr": "sinir bozucu"},
    {"en": "apart", "tr": "ayrı"},
    {"en": "apologize", "tr": "özür dilemek"},
    {"en": "application", "tr": "başvuru, uygulama"},
    {"en": "appointment", "tr": "randevu"},
    {"en": "appreciate", "tr": "takdir etmek"},
    {"en": "approximately", "tr": "yaklaşık olarak"},
    {"en": "arrest", "tr": "tutuklamak, tutuklama"},
    {"en": "arrival", "tr": "varış"},
    {"en": "assignment", "tr": "görev, ödev"},
    {"en": "assist", "tr": "yardım etmek"},
    {"en": "atmosphere", "tr": "atmosfer, ortam"},
    {"en": "attach", "tr": "eklemek, iliştirmek"},
    {"en": "attitude", "tr": "tavır, tutum"},
    {"en": "attract", "tr": "çekmek, cezbetmek"},
    {"en": "attraction", "tr": "çekicilik"},
    {"en": "authority", "tr": "otorite"},
    {"en": "average", "tr": "ortalama, ortalamak"},
    {"en": "award", "tr": "ödül vermek, ödül"},
    {"en": "aware", "tr": "farkında"},
    {"en": "backwards", "tr": "geri"},
    {"en": "bake", "tr": "fırında pişirmek"},
    {"en": "balance", "tr": "denge, dengelemek"},
    {"en": "ban", "tr": "yasak, yasaklamak"},
    {"en": "bank (river)", "tr": "nehir kenarı"},
    {"en": "base", "tr": "temel, dayandırmak"},
    {"en": "basic", "tr": "temel"},
    {"en": "basis", "tr": "temel, esas"},
    {"en": "battery", "tr": "pil"},
    {"en": "battle", "tr": "savaş, mücadele"},
    {"en": "beauty", "tr": "güzellik"},
    {"en": "bee", "tr": "arı"},
    {"en": "belief", "tr": "inanç"},
    {"en": "bell", "tr": "zil, çan"},
    {"en": "bend", "tr": "bükmek, viraj"},
    {"en": "benefit", "tr": "fayda, fayda sağlamak"},
    {"en": "better", "tr": "daha iyi şey"},
    {"en": "bite", "tr": "ısırmak, ısırık"},
    {"en": "block", "tr": "blok, engellemek"},
    {"en": "board", "tr": "binmek (uçağa vb.)"},
    {"en": "bomb", "tr": "bomba, bombalamak"},
    {"en": "border", "tr": "sınır"},
    {"en": "bother", "tr": "rahatsız etmek"},
    {"en": "branch", "tr": "dal, şube"},
    {"en": "brand", "tr": "marka"},
    {"en": "brave", "tr": "cesur"},
    {"en": "breath", "tr": "nefes"},
    {"en": "breathe", "tr": "nefes almak"},
    {"en": "breathing", "tr": "nefes alma"},
    {"en": "bride", "tr": "gelin"},
    {"en": "bubble", "tr": "baloncuk"},
    {"en": "bury", "tr": "gömmek"},
    {"en": "by", "tr": "tarafından"},
    {"en": "calm", "tr": "sakin, sakinleşmek"},
    {"en": "campaign", "tr": "kampanya, kampanya yürütmek"},
    {"en": "campus", "tr": "kampüs"},
    {"en": "candidate", "tr": "aday"},
    {"en": "cap", "tr": "şapka, kapak"},
    {"en": "captain", "tr": "kaptan"},
    {"en": "careless", "tr": "dikkatsiz"},
    {"en": "category", "tr": "kategori"},
    {"en": "ceiling", "tr": "tavan"},
    {"en": "celebration", "tr": "kutlama"},
    {"en": "central", "tr": "merkezi"},
    {"en": "centre", "tr": "merkez olmak"},
    {"en": "ceremony", "tr": "tören"},
    {"en": "chain", "tr": "zincir"},
    {"en": "challenge", "tr": "meydan okuma"},
    {"en": "champion", "tr": "şampiyon"},
    {"en": "channel", "tr": "kanal"},
    {"en": "chapter", "tr": "bölüm"},
    {"en": "charge", "tr": "şarj, suçlamak"},
    {"en": "cheap", "tr": "ucuzca"},
    {"en": "cheat", "tr": "hile yapmak, hile"},
    {"en": "cheerful", "tr": "neşeli"},
    {"en": "chemical", "tr": "kimyasal"},
    {"en": "chest", "tr": "göğüs"},
    {"en": "childhood", "tr": "çocukluk"},
    {"en": "claim", "tr": "iddia, iddia etmek"},
    {"en": "clause", "tr": "cümlecik"},
    {"en": "clear", "tr": "temizlemek, açık"},
    {"en": "click", "tr": "tıklamak, tık"},
    {"en": "client", "tr": "müşteri"},
    {"en": "climb", "tr": "tırmanış"},
    {"en": "close2", "tr": "yakında"},
    {"en": "cloth", "tr": "kumaş"},
    {"en": "clue", "tr": "ipucu"},
    {"en": "coach", "tr": "eğitmek, antrenör"},
    {"en": "coal", "tr": "kömür"},
    {"en": "coin", "tr": "madeni para"},
    {"en": "collection", "tr": "koleksiyon"},
    {"en": "coloured", "tr": "renkli"},
    {"en": "combine", "tr": "birleştirmek"},
    {"en": "comment", "tr": "yorum yapmak"},
    {"en": "commercial", "tr": "ticari, reklam"},
    {"en": "commit", "tr": "işlemek (suç vb.)"},
    {"en": "communication", "tr": "iletişim"},
    {"en": "comparison", "tr": "karşılaştırma"},
    {"en": "competitor", "tr": "rakip"},
    {"en": "competitive", "tr": "rekabetçi"},
    {"en": "complaint", "tr": "şikayet"},
    {"en": "complex", "tr": "karmaşık"},
    {"en": "concentrate", "tr": "konsantre olmak"},
    {"en": "conclude", "tr": "sonuçlandırmak"},
    {"en": "conclusion", "tr": "sonuç"},
    {"en": "confident", "tr": "kendinden emin"},
    {"en": "confirm", "tr": "onaylamak"},
    {"en": "confuse", "tr": "kafasını karıştırmak"},
    {"en": "confused", "tr": "şaşkın"},
    {"en": "connection", "tr": "bağlantı"},
    {"en": "consequence", "tr": "sonuç"},
    {"en": "consist", "tr": "oluşmak"},
    {"en": "consume", "tr": "tüketmek"},
    {"en": "consumer", "tr": "tüketici"},
    {"en": "contact", "tr": "iletişim, temas etmek"},
    {"en": "container", "tr": "konteyner"},
    {"en": "content1", "tr": "içerik"},
    {"en": "continuous", "tr": "sürekli"},
    {"en": "contrast", "tr": "zıtlık, karşılaştırmak"},
    {"en": "convenient", "tr": "uygun"},
    {"en": "convince", "tr": "ikna etmek"},
    {"en": "cool", "tr": "soğumak"},
    {"en": "costume", "tr": "kostüm"},
    {"en": "cottage", "tr": "kulübe"},
    {"en": "cotton", "tr": "pamuk"},
    {"en": "count", "tr": "sayım"},
    {"en": "countryside", "tr": "kırsal"},
    {"en": "court", "tr": "mahkeme"},
    {"en": "cover", "tr": "kapak"},
    {"en": "covered", "tr": "örtülü"},
    {"en": "cream", "tr": "krem"},
    {"en": "criminal", "tr": "suçlu (sıfat)"},
    {"en": "cruel", "tr": "zalim"},
    {"en": "cultural", "tr": "kültürel"},
    {"en": "currency", "tr": "para birimi"},
    {"en": "current", "tr": "güncel"},
    {"en": "currently", "tr": "şu anda"},
    {"en": "curtain", "tr": "perde"},
    {"en": "custom", "tr": "gelenek"},
    {"en": "cut", "tr": "kesik"},
    {"en": "daily", "tr": "günlük (zarf)"},
    {"en": "damage", "tr": "zarar, zarar vermek"},
    {"en": "deal", "tr": "anlaşma"},
    {"en": "decade", "tr": "on yıl"},
    {"en": "decorate", "tr": "süslemek"},
    {"en": "deep", "tr": "derin (zarf)"},
    {"en": "define", "tr": "tanımlamak"},
    {"en": "definite", "tr": "kesin"},
    {"en": "definition", "tr": "tanım"},
    {"en": "deliver", "tr": "teslim etmek"},
    {"en": "departure", "tr": "ayrılış"},
    {"en": "despite", "tr": "-e rağmen"},
    {"en": "destination", "tr": "varış yeri"},
    {"en": "determine", "tr": "belirlemek"},
    {"en": "determined", "tr": "kararlı"},
    {"en": "development", "tr": "gelişim"},
    {"en": "diagram", "tr": "diyagram"},
    {"en": "diamond", "tr": "elmas"},
    {"en": "difficulty", "tr": "zorluk"},
    {"en": "direct", "tr": "doğrudan, yönetmek"},
    {"en": "directly", "tr": "doğrudan"},
    {"en": "dirt", "tr": "kir"},
    {"en": "disadvantage", "tr": "dezavantaj"},
    {"en": "disappointed", "tr": "hayal kırıklığına uğramış"},
    {"en": "disappointing", "tr": "hayal kırıklığı yaratan"},
    {"en": "discount", "tr": "indirim"},
    {"en": "dislike", "tr": "sevmemek"},
    {"en": "divide", "tr": "bölmek"},
    {"en": "documentary", "tr": "belgesel"},
    {"en": "donate", "tr": "bağış yapmak"},
    {"en": "double", "tr": "iki kat"},
    {"en": "doubt", "tr": "şüphe, şüphelenmek"},
    {"en": "dressed", "tr": "giyinmiş"},
    {"en": "drop", "tr": "damla"},
    {"en": "drum", "tr": "davul"},
    {"en": "drunk", "tr": "sarhoş"},
    {"en": "due", "tr": "vadesi gelmiş"},
    {"en": "dust", "tr": "toz"},
    {"en": "duty", "tr": "görev"},
    {"en": "earthquake", "tr": "deprem"},
    {"en": "eastern", "tr": "doğu"},
    {"en": "economic", "tr": "ekonomik"},
    {"en": "economy", "tr": "ekonomi"},
    {"en": "edge", "tr": "kenar"},
    {"en": "editor", "tr": "editör"},
    {"en": "educate", "tr": "eğitmek"},
    {"en": "educated", "tr": "eğitimli"},
    {"en": "educational", "tr": "eğitsel"},
    {"en": "effective", "tr": "etkili"},
    {"en": "effectively", "tr": "etkili şekilde"},
    {"en": "effort", "tr": "çaba"},
    {"en": "election", "tr": "seçim"},
    {"en": "element", "tr": "element"},
    {"en": "embarrassed", "tr": "utanmış"},
    {"en": "embarrassing", "tr": "utandırıcı"},
    {"en": "emergency", "tr": "acil durum"},
    {"en": "emotion", "tr": "duygu"},
    {"en": "employment", "tr": "istihdam"},
    {"en": "empty", "tr": "boşaltmak"},
    {"en": "encourage", "tr": "cesaretlendirmek"},
    {"en": "enemy", "tr": "düşman"},
    {"en": "engaged", "tr": "nişanlı, meşgul"},
    {"en": "engineering", "tr": "mühendislik"},
    {"en": "entertain", "tr": "eğlendirmek"},
    {"en": "entertainment", "tr": "eğlence"},
    {"en": "entrance", "tr": "giriş"},
    {"en": "entry", "tr": "giriş"},
    {"en": "environmental", "tr": "çevresel"},
    {"en": "episode", "tr": "bölüm"},
    {"en": "equal", "tr": "eşit"},
    {"en": "equally", "tr": "eşit şekilde"},
    {"en": "escape", "tr": "kaçmak, kaçış"},
    {"en": "essential", "tr": "gerekli"},
    {"en": "eventually", "tr": "sonunda"},
    {"en": "examine", "tr": "incelemek"},
    {"en": "except", "tr": "hariç"},
    {"en": "exchange", "tr": "takas, değiştirmek"},
    {"en": "excitement", "tr": "heyecan"},
    {"en": "exhibition", "tr": "sergi"},
    {"en": "expand", "tr": "genişlemek"},
    {"en": "expected", "tr": "beklenen"},
    {"en": "expedition", "tr": "sefer, keşif gezisi"},
    {"en": "experience", "tr": "deneyim kazanmak"},
    {"en": "experienced", "tr": "deneyimli"},
    {"en": "experiment", "tr": "deney yapmak"},
    {"en": "explode", "tr": "patlamak"},
    {"en": "explore", "tr": "keşfetmek"},
    {"en": "explosion", "tr": "patlama"},
    {"en": "export", "tr": "ihracat, ihraç etmek"},
    {"en": "extra", "tr": "fazladan"},
    {"en": "face", "tr": "yüzleşmek"},
    {"en": "fairly", "tr": "oldukça"},
    {"en": "familiar", "tr": "tanıdık"},
    {"en": "fancy", "tr": "süslü, canı istemek"},
    {"en": "far", "tr": "uzak"},
    {"en": "fascinating", "tr": "büyüleyici"},
    {"en": "fashionable", "tr": "modaya uygun"},
    {"en": "fasten", "tr": "bağlamak"},
    {"en": "favour", "tr": "iyilik"},
    {"en": "fear", "tr": "korkmak"},
    {"en": "feature", "tr": "özellik, içermek"},
    {"en": "fence", "tr": "çit"},
    {"en": "fighting", "tr": "dövüş"},
    {"en": "file", "tr": "dosya"},
    {"en": "financial", "tr": "mali"},
    {"en": "fire", "tr": "ateş etmek, kovmak"},
    {"en": "fitness", "tr": "zindelik"},
    {"en": "fixed", "tr": "sabit"},
    {"en": "flag", "tr": "bayrak"},
    {"en": "flood", "tr": "sel, su baskını"},
    {"en": "flour", "tr": "un"},
    {"en": "flow", "tr": "akış"},
    {"en": "fold", "tr": "katlamak"},
    {"en": "folk", "tr": "halk, halk müziği"},
    {"en": "following", "tr": "takipçiler"},
    {"en": "force", "tr": "kuvvet, zorlamak"},
    {"en": "forever", "tr": "daima"},
    {"en": "frame", "tr": "çerçeve, çerçevelemek"},
    {"en": "freeze", "tr": "donmak"},
    {"en": "frequently", "tr": "sık sık"},
    {"en": "friendship", "tr": "arkadaşlık"},
    {"en": "frighten", "tr": "korkutmak"},
    {"en": "frightened", "tr": "korkmuş"},
    {"en": "frightening", "tr": "korkutucu"},
    {"en": "frozen", "tr": "donmuş"},
    {"en": "fry", "tr": "kızartmak"},
    {"en": "fuel", "tr": "yakıt"},
    {"en": "function", "tr": "işlev"},
    {"en": "fur", "tr": "kürk"},
    {"en": "further", "tr": "daha ileri"},
    {"en": "garage", "tr": "garaj"},
    {"en": "gather", "tr": "toplamak"},
    {"en": "generally", "tr": "genellikle"},
    {"en": "generation", "tr": "nesil"},
    {"en": "generous", "tr": "cömert"},
    {"en": "gentle", "tr": "nazik"},
    {"en": "gentleman", "tr": "beyefendi"},
    {"en": "ghost", "tr": "hayalet"},
    {"en": "giant", "tr": "dev"},
    {"en": "glad", "tr": "memnun"},
    {"en": "global", "tr": "küresel"},
    {"en": "glove", "tr": "eldiven"},
    {"en": "go", "tr": "gitme (isim)"},
    {"en": "goods", "tr": "mallar"},
    {"en": "grade", "tr": "not, derece"},
    {"en": "graduate", "tr": "mezun, mezun olmak"},
    {"en": "grain", "tr": "tahıl"},
    {"en": "grateful", "tr": "minnettar"},
    {"en": "growth", "tr": "büyüme"},
    {"en": "guard", "tr": "gardiyan, korumak"},
    {"en": "guilty", "tr": "suçlu"},
    {"en": "hand", "tr": "vermek (fiil)"},
    {"en": "hang", "tr": "asmak"},
    {"en": "happiness", "tr": "mutluluk"},
    {"en": "hardly", "tr": "neredeyse hiç"},
    {"en": "hate", "tr": "nefret"},
    {"en": "head", "tr": "yönetmek"},
    {"en": "headline", "tr": "manşet"},
    {"en": "heating", "tr": "ısıtma"},
    {"en": "heavily", "tr": "ağır şekilde"},
    {"en": "helicopter", "tr": "helikopter"},
    {"en": "highlight", "tr": "vurgulamak, öne çıkan kısım"},
    {"en": "highly", "tr": "yüksek derecede"},
    {"en": "hire", "tr": "kiralamak, işe almak"},
    {"en": "historic", "tr": "tarihi (önemli)"},
    {"en": "historical", "tr": "tarihî"},
    {"en": "honest", "tr": "dürüst"},
    {"en": "horrible", "tr": "berbat"},
    {"en": "horror", "tr": "dehşet"},
    {"en": "host", "tr": "ev sahibi"},
    {"en": "hunt", "tr": "avlamak"},
    {"en": "hurricane", "tr": "kasırga"},
    {"en": "hurry", "tr": "acele, acele etmek"},
    {"en": "identity", "tr": "kimlik"},
    {"en": "ignore", "tr": "göz ardı etmek"},
    {"en": "illegal", "tr": "yasa dışı"},
    {"en": "imaginary", "tr": "hayali"},
    {"en": "immediate", "tr": "acil, derhal"},
    {"en": "immigrant", "tr": "göçmen"},
    {"en": "impact", "tr": "etki"},
    {"en": "import", "tr": "ithalat, ithal etmek"},
    {"en": "importance", "tr": "önem"},
    {"en": "impression", "tr": "izlenim"},
    {"en": "impressive", "tr": "etkileyici"},
    {"en": "improvement", "tr": "gelişme"},
    {"en": "incredibly", "tr": "inanılmaz derecede"},
    {"en": "indeed", "tr": "gerçekten"},
    {"en": "indicate", "tr": "göstermek"},
    {"en": "indirect", "tr": "dolaylı"},
    {"en": "indoor", "tr": "kapalı alan"},
    {"en": "indoors", "tr": "içeride"},
    {"en": "influence", "tr": "etki, etkilemek"},
    {"en": "ingredient", "tr": "malzeme"},
    {"en": "injure", "tr": "yaralamak"},
    {"en": "injured", "tr": "yaralı"},
    {"en": "innocent", "tr": "masum"},
    {"en": "intelligence", "tr": "zeka"},
    {"en": "intend", "tr": "niyet etmek"},
    {"en": "intention", "tr": "niyet"},
    {"en": "invest", "tr": "yatırım yapmak"},
    {"en": "investigate", "tr": "soruşturmak"},
    {"en": "involved", "tr": "dahil"},
    {"en": "iron", "tr": "ütü, ütülemek, demir"},
    {"en": "issue", "tr": "sayı, konu"},
    {"en": "IT", "tr": "bilişim"},
    {"en": "journal", "tr": "dergi, günlük"},
    {"en": "judge", "tr": "yargıç, yargılamak"},
    {"en": "keen", "tr": "hevesli"},
    {"en": "key", "tr": "tuş (fiil)"},
    {"en": "keyboard", "tr": "klavye"},
    {"en": "kick", "tr": "tekme, tekme atmak"},
    {"en": "killing", "tr": "öldürme"},
    {"en": "kind", "tr": "nazik"},
    {"en": "kiss", "tr": "öpücük, öpmek"},
    {"en": "knock", "tr": "vurmak, darbe"},
    {"en": "label", "tr": "etiket, etiketlemek"},
    {"en": "laboratory", "tr": "laboratuvar"},
    {"en": "lack", "tr": "eksiklik"},
    {"en": "latest", "tr": "en son"},
    {"en": "lay", "tr": "yerleştirmek, sermek"},
    {"en": "layer", "tr": "katman"},
    {"en": "lead1", "tr": "kurşun, öncülük etmek"},
    {"en": "leading", "tr": "öncü"},
    {"en": "leaf", "tr": "yaprak"},
    {"en": "leather", "tr": "deri"},
    {"en": "legal", "tr": "yasal"},
    {"en": "leisure", "tr": "boş zaman"},
    {"en": "length", "tr": "uzunluk"},
    {"en": "level", "tr": "seviye (sıfat)"},
    {"en": "lie2", "tr": "yalan söylemek"},
    {"en": "like", "tr": "hoşlanma"},
    {"en": "limit", "tr": "sınır, sınırlamak"},
    {"en": "lip", "tr": "dudak"},
    {"en": "liquid", "tr": "sıvı"},
    {"en": "literature", "tr": "edebiyat"},
    {"en": "living", "tr": "yaşayan, geçim"},
    {"en": "local", "tr": "yerel kimse"},
    {"en": "locate", "tr": "yerini bulmak"},
    {"en": "located", "tr": "konumlanmış"},
    {"en": "location", "tr": "konum"},
    {"en": "lonely", "tr": "yalnız"},
    {"en": "loss", "tr": "kayıp"},
    {"en": "luxury", "tr": "lüks"},
    {"en": "mad", "tr": "deli"},
    {"en": "magic", "tr": "sihir"},
    {"en": "mainly", "tr": "çoğunlukla"},
    {"en": "mall", "tr": "alışveriş merkezi"},
    {"en": "management", "tr": "yönetim"},
    {"en": "market", "tr": "pazarlamak"},
    {"en": "marketing", "tr": "pazarlama"},
    {"en": "marriage", "tr": "evlilik"},
    {"en": "meanwhile", "tr": "bu arada"},
    {"en": "measure", "tr": "ölçmek, ölçü"},
    {"en": "medium", "tr": "orta"},
    {"en": "mental", "tr": "zihinsel"},
    {"en": "mention", "tr": "bahsetmek (isim)"},
    {"en": "mess", "tr": "dağınıklık"},
    {"en": "mild", "tr": "hafif"},
    {"en": "mine", "tr": "maden ocağı"},
    {"en": "mix", "tr": "karışım, karıştırmak"},
    {"en": "mixture", "tr": "karışım"},
    {"en": "mood", "tr": "ruh hali"},
    {"en": "move", "tr": "hamle"},
    {"en": "mud", "tr": "çamur"},
    {"en": "murder", "tr": "cinayet, öldürmek"},
    {"en": "muscle", "tr": "kas"},
    {"en": "musical", "tr": "müzikal"},
    {"en": "mystery", "tr": "gizem"},
    {"en": "nail", "tr": "tırnak, çivi"},
    {"en": "narrative", "tr": "anlatı"},
    {"en": "nation", "tr": "ulus"},
    {"en": "native", "tr": "yerli"},
    {"en": "naturally", "tr": "doğal olarak"},
    {"en": "necessarily", "tr": "zorunlu olarak"},
    {"en": "need", "tr": "-meli, -malı (modal)"},
    {"en": "needle", "tr": "iğne"},
    {"en": "neighbourhood", "tr": "mahalle"},
    {"en": "neither", "tr": "hiçbiri"},
    {"en": "net", "tr": "ağ"},
    {"en": "next", "tr": "sonraki"},
    {"en": "nor", "tr": "ne de"},
    {"en": "normal", "tr": "normal (isim)"},
    {"en": "northern", "tr": "kuzey"},
    {"en": "note", "tr": "not almak"},
    {"en": "now", "tr": "şimdi (bağlaç)"},
    {"en": "nuclear", "tr": "nükleer"},
    {"en": "obvious", "tr": "açık"},
    {"en": "obviously", "tr": "açıkça"},
    {"en": "occasion", "tr": "özel durum"},
    {"en": "occur", "tr": "meydana gelmek"},
    {"en": "odd", "tr": "garip"},
    {"en": "official", "tr": "resmi"},
    {"en": "old-fashioned", "tr": "eski moda"},
    {"en": "once", "tr": "bir kere (bağlaç)"},
    {"en": "operation", "tr": "ameliyat, operasyon"},
    {"en": "organized", "tr": "düzenlenmiş"},
    {"en": "organizer", "tr": "düzenleyici"},
    {"en": "original", "tr": "orijinal (isim)"},
    {"en": "originally", "tr": "aslında"},
    {"en": "ought", "tr": "gerekmek"},
    {"en": "ours", "tr": "bizimki"},
    {"en": "outdoor", "tr": "açık hava"},
    {"en": "outdoors", "tr": "dışarıda"},
    {"en": "pack", "tr": "paket"},
    {"en": "package", "tr": "paket"},
    {"en": "painful", "tr": "ağrılı"},
    {"en": "pale", "tr": "solgun"},
    {"en": "pan", "tr": "tava"},
    {"en": "participate", "tr": "katılmak"},
    {"en": "particularly", "tr": "özellikle"},
    {"en": "pass", "tr": "geçiş"},
    {"en": "passion", "tr": "tutku"},
    {"en": "path", "tr": "patika"},
    {"en": "payment", "tr": "ödeme"},
    {"en": "peaceful", "tr": "huzurlu"},
    {"en": "percentage", "tr": "yüzde"},
    {"en": "perfectly", "tr": "mükemmel şekilde"},
    {"en": "performance", "tr": "performans"},
    {"en": "personally", "tr": "şahsen"},
    {"en": "persuade", "tr": "ikna etmek"},
    {"en": "photographer", "tr": "fotoğrafçı"},
    {"en": "photography", "tr": "fotoğrafçılık"},
    {"en": "pin", "tr": "iğne, iğnelemek"},
    {"en": "pipe", "tr": "boru"},
    {"en": "place", "tr": "yerleştirmek"},
    {"en": "planning", "tr": "planlama"},
    {"en": "pleasant", "tr": "hoş"},
    {"en": "pleasure", "tr": "zevk"},
    {"en": "plenty", "tr": "bol miktar"},
    {"en": "plot", "tr": "konu, arsa"},
    {"en": "plus1", "tr": "artı"},
    {"en": "poem", "tr": "şiir"},
    {"en": "poet", "tr": "şair"},
    {"en": "poetry", "tr": "şiir"},
    {"en": "point", "tr": "işaret etmek"},
    {"en": "poison", "tr": "zehir, zehirlemek"},
    {"en": "poisonous", "tr": "zehirli"},
    {"en": "policy", "tr": "politika"},
    {"en": "political", "tr": "politik"},
    {"en": "politician", "tr": "siyasetçi"},
    {"en": "politics", "tr": "siyaset"},
    {"en": "port", "tr": "liman"},
    {"en": "portrait", "tr": "portre"},
    {"en": "possibly", "tr": "muhtemelen"},
    {"en": "pot", "tr": "tencere"},
    {"en": "pour", "tr": "dökmek"},
    {"en": "poverty", "tr": "yoksulluk"},
    {"en": "powder", "tr": "toz"},
    {"en": "powerful", "tr": "güçlü"},
    {"en": "practical", "tr": "pratik"},
    {"en": "pray", "tr": "dua etmek"},
    {"en": "prayer", "tr": "dua"},
    {"en": "prediction", "tr": "tahmin"},
    {"en": "prepared", "tr": "hazırlıklı"},
    {"en": "presentation", "tr": "sunum"},
    {"en": "press", "tr": "basın, bastırmak"},
    {"en": "pressure", "tr": "baskı"},
    {"en": "pretend", "tr": "numara yapmak"},
    {"en": "previous", "tr": "önceki"},
    {"en": "previously", "tr": "önceden"},
    {"en": "priest", "tr": "rahip"},
    {"en": "primary", "tr": "birincil"},
    {"en": "prince", "tr": "prens"},
    {"en": "princess", "tr": "prenses"},
    {"en": "printing", "tr": "baskı"},
    {"en": "prisoner", "tr": "mahkum"},
    {"en": "private", "tr": "özel"},
    {"en": "producer", "tr": "üretici"},
    {"en": "production", "tr": "üretim"},
    {"en": "profession", "tr": "meslek"},
    {"en": "profit", "tr": "kâr"},
    {"en": "program", "tr": "programlamak"},
    {"en": "promote", "tr": "terfi ettirmek, tanıtmak"},
    {"en": "proper", "tr": "uygun"},
    {"en": "properly", "tr": "uygun şekilde"},
    {"en": "property", "tr": "mülk"},
    {"en": "protest", "tr": "protesto etmek"},
    {"en": "proud", "tr": "gururlu"},
    {"en": "prove", "tr": "kanıtlamak"},
    {"en": "pull", "tr": "çekiş"},
    {"en": "punish", "tr": "cezalandırmak"},
    {"en": "punishment", "tr": "ceza"},
    {"en": "push", "tr": "itme"},
    {"en": "qualification", "tr": "nitelik"},
    {"en": "qualified", "tr": "nitelikli"},
    {"en": "qualify", "tr": "hak kazanmak"},
    {"en": "queue", "tr": "sıra, kuyruk"},
    {"en": "quit", "tr": "bırakmak"},
    {"en": "quotation", "tr": "alıntı"},
    {"en": "quote", "tr": "alıntı yapmak"},
    {"en": "race (people)", "tr": "ırk, yarış"},
    {"en": "racing", "tr": "yarış"},
    {"en": "range", "tr": "aralık, çeşit"},
    {"en": "rare", "tr": "nadir"},
    {"en": "rarely", "tr": "nadiren"},
    {"en": "reaction", "tr": "tepki"},
    {"en": "reality", "tr": "gerçeklik"},
    {"en": "receipt", "tr": "fiş"},
    {"en": "recommendation", "tr": "tavsiye"},
    {"en": "reference", "tr": "referans"},
    {"en": "reflect", "tr": "yansıtmak"},
    {"en": "regularly", "tr": "düzenli olarak"},
    {"en": "reject", "tr": "reddetmek"},
    {"en": "relate", "tr": "ilişkilendirmek"},
    {"en": "related", "tr": "ilgili"},
    {"en": "relation", "tr": "ilişki"},
    {"en": "relative", "tr": "akraba"},
    {"en": "relaxed", "tr": "rahatlamış"},
    {"en": "relaxing", "tr": "rahatlatıcı"},
    {"en": "release", "tr": "serbest bırakmak"},
    {"en": "reliable", "tr": "güvenilir"},
    {"en": "religion", "tr": "din"},
    {"en": "religious", "tr": "dini"},
    {"en": "remain", "tr": "kalmak"},
    {"en": "remind", "tr": "hatırlatmak"},
    {"en": "remote", "tr": "uzak"},
    {"en": "rent", "tr": "kira, kiralamak"},
    {"en": "repair", "tr": "tamir, onarmak"},
    {"en": "repeat", "tr": "tekrar"},
    {"en": "repeated", "tr": "tekrarlanan"},
    {"en": "represent", "tr": "temsil etmek"},
    {"en": "request", "tr": "rica, istemek"},
    {"en": "require", "tr": "gerektirmek"},
    {"en": "reservation", "tr": "rezervasyon"},
    {"en": "resource", "tr": "kaynak"},
    {"en": "respect", "tr": "saygı, saygı göstermek"},
    {"en": "responsibility", "tr": "sorumluluk"},
    {"en": "responsible", "tr": "sorumlu"},
    {"en": "result", "tr": "sonuçlanmak"},
    {"en": "retire", "tr": "emekli olmak"},
    {"en": "retired", "tr": "emekli"},
    {"en": "revise", "tr": "gözden geçirmek"},
    {"en": "ring2", "tr": "çalma (zili)"},
    {"en": "rise", "tr": "artış, yükselmek"},
    {"en": "risk", "tr": "risk, riske atmak"},
    {"en": "robot", "tr": "robot"},
    {"en": "roll", "tr": "yuvarlanmak, rulo"},
    {"en": "romantic", "tr": "romantik"},
    {"en": "rope", "tr": "halat"},
    {"en": "rough", "tr": "pürüzlü"},
    {"en": "row1", "tr": "sıra"},
    {"en": "royal", "tr": "kraliyet"},
    {"en": "rugby", "tr": "ragbi"},
    {"en": "rule", "tr": "kural, yönetmek"},
    {"en": "safety", "tr": "güvenlik"},
    {"en": "sail", "tr": "yelken"},
    {"en": "sailor", "tr": "denizci"},
    {"en": "sample", "tr": "örnek"},
    {"en": "sand", "tr": "kum"},
    {"en": "scan", "tr": "taratmak"},
    {"en": "scientific", "tr": "bilimsel"},
    {"en": "script", "tr": "senaryo"},
    {"en": "sculpture", "tr": "heykel"},
    {"en": "secondary", "tr": "ikinci, ortaokul"},
    {"en": "security", "tr": "güvenlik"},
    {"en": "seed", "tr": "tohum"},
    {"en": "sensible", "tr": "mantıklı"},
    {"en": "separate", "tr": "ayırmak"},
    {"en": "seriously", "tr": "ciddi şekilde"},
    {"en": "servant", "tr": "hizmetçi"},
    {"en": "set (put)", "tr": "yerleştirmek"},
    {"en": "set (group)", "tr": "küme"},
    {"en": "setting", "tr": "ortam, ayar"},
    {"en": "sex", "tr": "cinsiyet"},
    {"en": "sexual", "tr": "cinsel"},
    {"en": "shake", "tr": "sarsmak"},
    {"en": "share", "tr": "paylaşım, paylaşmak"},
    {"en": "sharp", "tr": "keskin"},
    {"en": "shelf", "tr": "raf"},
    {"en": "shell", "tr": "kabuk"},
    {"en": "shift", "tr": "vardiya, değiştirmek"},
    {"en": "shine", "tr": "parlamak"},
    {"en": "shiny", "tr": "parlak"},
    {"en": "shoot", "tr": "ateş etmek"},
    {"en": "shy", "tr": "utangaç"},
    {"en": "sight", "tr": "görüş"},
    {"en": "signal", "tr": "sinyal, işaret"},
    {"en": "silent", "tr": "sessiz"},
    {"en": "silly", "tr": "aptalca"},
    {"en": "similarity", "tr": "benzerlik"},
    {"en": "similarly", "tr": "benzer şekilde"},
    {"en": "simply", "tr": "basitçe"},
    {"en": "since", "tr": "den beri"},
    {"en": "sink", "tr": "batmak, lavabo"},
    {"en": "slice", "tr": "dilim, dilimlemek"},
    {"en": "slightly", "tr": "hafifçe"},
    {"en": "slow", "tr": "yavaşlatmak"},
    {"en": "smart", "tr": "zeki"},
    {"en": "smooth", "tr": "düzgün, pürüzsüz"},
    {"en": "software", "tr": "yazılım"},
    {"en": "soil", "tr": "toprak"},
    {"en": "solid", "tr": "katı"},
    {"en": "sort", "tr": "ayırmak"},
    {"en": "southern", "tr": "güney"},
    {"en": "specifically", "tr": "özellikle"},
    {"en": "spending", "tr": "harcama"},
    {"en": "spicy", "tr": "baharatlı"},
    {"en": "spirit", "tr": "ruh"},
    {"en": "spoken", "tr": "konuşulmuş"},
    {"en": "spot", "tr": "nokta"},
    {"en": "spread", "tr": "yaymak"},
    {"en": "spring", "tr": "bahar, yay, sıçramak"},
    {"en": "stadium", "tr": "stadyum"},
    {"en": "staff", "tr": "personel"},
    {"en": "standard", "tr": "standart"},
    {"en": "state", "tr": "devlet, ifade etmek"},
    {"en": "statistic", "tr": "istatistik"},
    {"en": "statue", "tr": "heykel"},
    {"en": "stick (push into/attach)", "tr": "saplamak, yapıştırmak"},
    {"en": "stick (piece of wood)", "tr": "çubuk"},
    {"en": "still", "tr": "hareketsiz"},
    {"en": "store", "tr": "depolamak"},
    {"en": "stranger", "tr": "yabancı"},
    {"en": "strength", "tr": "güç"},
    {"en": "string", "tr": "ip, tel"},
    {"en": "strongly", "tr": "güçlü şekilde"},
    {"en": "studio", "tr": "stüdyo"},
    {"en": "stuff", "tr": "şey"},
    {"en": "substance", "tr": "madde"},
    {"en": "successfully", "tr": "başarıyla"},
    {"en": "sudden", "tr": "ani"},
    {"en": "suffer", "tr": "acı çekmek"},
    {"en": "suit", "tr": "takım elbise, uymak"},
    {"en": "suitable", "tr": "uygun"},
    {"en": "summarize", "tr": "özetlemek"},
    {"en": "summary", "tr": "özet"},
    {"en": "supply", "tr": "tedarik etmek, arz"},
    {"en": "supporter", "tr": "destekçi"},
    {"en": "surely", "tr": "kesinlikle"},
    {"en": "surface", "tr": "yüzey"},
    {"en": "survive", "tr": "hayatta kalmak"},
    {"en": "swim", "tr": "yüzme"},
    {"en": "switch", "tr": "değiştirmek, anahtar"},
    {"en": "symptom", "tr": "belirti"},
    {"en": "tail", "tr": "kuyruk"},
    {"en": "talent", "tr": "yetenek"},
    {"en": "talented", "tr": "yetenekli"},
    {"en": "tape", "tr": "bant"},
    {"en": "tax", "tr": "vergi"},
    {"en": "technical", "tr": "teknik"},
    {"en": "technique", "tr": "teknik yöntem"},
    {"en": "tend", "tr": "eğiliminde olmak"},
    {"en": "tent", "tr": "çadır"},
    {"en": "that", "tr": "şu (zarf)"},
    {"en": "theirs", "tr": "onlarınki"},
    {"en": "theme", "tr": "tema"},
    {"en": "theory", "tr": "teori"},
    {"en": "therefore", "tr": "bu nedenle"},
    {"en": "this", "tr": "bu (zarf)"},
    {"en": "though", "tr": "olsa da"},
    {"en": "throat", "tr": "boğaz"},
    {"en": "throughout", "tr": "boyunca"},
    {"en": "tight", "tr": "sıkı"},
    {"en": "till", "tr": "-e kadar"},
    {"en": "tin", "tr": "konserve kutusu"},
    {"en": "tiny", "tr": "minik"},
    {"en": "tip", "tr": "bahşiş, ipucu"},
    {"en": "toe", "tr": "ayak parmağı"},
    {"en": "tongue", "tr": "dil"},
    {"en": "total", "tr": "toplam"},
    {"en": "totally", "tr": "tamamen"},
    {"en": "touch", "tr": "dokunma"},
    {"en": "tour", "tr": "gezmek"},
    {"en": "trade", "tr": "ticaret"},
    {"en": "translate", "tr": "çevirmek"},
    {"en": "translation", "tr": "çeviri"},
    {"en": "transport", "tr": "nakletmek"},
    {"en": "treat", "tr": "tedavi etmek, davranmak"},
    {"en": "treatment", "tr": "tedavi"},
    {"en": "trend", "tr": "eğilim"},
    {"en": "trick", "tr": "hile"},
    {"en": "truth", "tr": "gerçek"},
    {"en": "tube", "tr": "boru"},
    {"en": "type", "tr": "yazmak"},
    {"en": "typically", "tr": "tipik olarak"},
    {"en": "tyre", "tr": "lastik"},
    {"en": "ugly", "tr": "çirkin"},
    {"en": "unable", "tr": "aciz"},
    {"en": "uncomfortable", "tr": "rahatsız"},
    {"en": "underwear", "tr": "iç çamaşırı"},
    {"en": "unemployed", "tr": "işsiz"},
    {"en": "unemployment", "tr": "işsizlik"},
    {"en": "unfair", "tr": "adaletsiz"},
    {"en": "union", "tr": "birlik"},
    {"en": "unless", "tr": "olmadıkça"},
    {"en": "unlike", "tr": "-den farklı"},
    {"en": "unlikely", "tr": "olası değil"},
    {"en": "unnecessary", "tr": "gereksiz"},
    {"en": "unpleasant", "tr": "hoş olmayan"},
    {"en": "update", "tr": "güncellemek"},
    {"en": "upon", "tr": "üzerine"},
    {"en": "upset", "tr": "üzgün, üzmek"},
    {"en": "used1", "tr": "alışılmış"},
    {"en": "used2", "tr": "kullanılmış"},
    {"en": "valuable", "tr": "değerli"},
    {"en": "value", "tr": "değer"},
    {"en": "various", "tr": "çeşitli"},
    {"en": "version", "tr": "sürüm"},
    {"en": "victim", "tr": "kurban"},
    {"en": "view", "tr": "görüş, görmek"},
    {"en": "viewer", "tr": "izleyici"},
    {"en": "violent", "tr": "şiddetli"},
    {"en": "volunteer", "tr": "gönüllü"},
    {"en": "vote", "tr": "oy vermek"},
    {"en": "warm", "tr": "ısınmak"},
    {"en": "warn", "tr": "uyarmak"},
    {"en": "warning", "tr": "uyarı"},
    {"en": "waste", "tr": "israf, atık"},
    {"en": "water", "tr": "sulamak"},
    {"en": "wave", "tr": "el sallamak"},
    {"en": "weapon", "tr": "silah"},
    {"en": "weigh", "tr": "tartmak"},
    {"en": "western", "tr": "batılı"},
    {"en": "whatever", "tr": "her ne"},
    {"en": "whenever", "tr": "her ne zaman"},
    {"en": "whether", "tr": "olup olmadığı"},
    {"en": "while", "tr": "süre"},
    {"en": "whole", "tr": "tüm"},
    {"en": "will", "tr": "irade"},
    {"en": "win", "tr": "zafer"},
    {"en": "wing", "tr": "kanat"},
    {"en": "within", "tr": "içinde"},
    {"en": "wonder", "tr": "merak etmek, hayret"},
    {"en": "wool", "tr": "yün"},
    {"en": "worldwide", "tr": "dünya çapında"},
    {"en": "worry", "tr": "endişe"},
    {"en": "worse", "tr": "daha kötü"},
    {"en": "worst", "tr": "en kötü"},
    {"en": "worth", "tr": "değerinde"},
    {"en": "written", "tr": "yazılı"},
    {"en": "wrong", "tr": "yanlış (zarf)"},
    {"en": "yard", "tr": "avlu"},
    {"en": "young", "tr": "genç"},
    {"en": "youth", "tr": "gençlik"},
  ];

  @override
  State<B1Page> createState() => _B1PageState();
}

class _B1PageState extends State<B1Page> {
  bool showWords = false;
  int? _savedIndex; // sonraki kart
  int _savedKnown = 0;
  int _savedUnknown = 0;
  int _total = B1Page.words.length;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final p = await SharedPreferences.getInstance();
      final prog = p.getInt('b1_progress');
      final legacy = p.getInt('b1_index');
      final known = p.getStringList('b1_known') ?? [];
      final unknown = p.getStringList('b1_unknown') ?? [];
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
      MaterialPageRoute(builder: (_) => B1StudyPage(words: B1Page.words)),
    );
    if (mounted) _load();
  }

  Future<void> _openKnownStudy() async {
    final p = await SharedPreferences.getInstance();
    final knownWords = p.getStringList('b1_known') ?? [];
    if (knownWords.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Bildiğiniz kelime bulunmuyor')),
      );
      return;
    }

    final knownWordList = B1Page.words
        .where((w) => knownWords.contains(w['en']))
        .toList();

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => B1StudyPage(
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
    final unknownWords = p.getStringList('b1_unknown') ?? [];
    if (unknownWords.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Bilmediğiniz kelime bulunmuyor')),
      );
      return;
    }

    final unknownWordList = B1Page.words
        .where((w) => unknownWords.contains(w['en']))
        .toList();

    // 20 kelime sınırı kaldırıldı - tüm bilmediklerim kelimeleri çalışılabilir
    final limitedUnknownWords = unknownWordList;

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => B1StudyPage(
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
      await p.remove('b1_index');
      await p.remove('b1_progress');
      await p.remove('b1_total');
      await p.remove('b1_known');
      await p.remove('b1_unknown');

      // Sayfayı yeniden yükle
      if (mounted) _load();

      // Çalışma sayfasını aç
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => B1StudyPage(words: B1Page.words, isReviewMode: true),
        ),
      );
      if (mounted) _load();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('B1 Kelimeleri'),
        backgroundColor: Colors.orange.shade700,
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
              backgroundColor: Colors.orange,
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
            itemCount: B1Page.words.length,
            separatorBuilder: (_, __) => const SizedBox(height: 6),
            itemBuilder: (c, i) {
              final w = B1Page.words[i];
              return Card(
                color: Colors.orange.shade50,
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

class B1StudyPage extends StatefulWidget {
  final List<Map<String, String>> words;
  final bool isReviewMode;
  final bool isUnknownMode;
  final bool isKnownMode;
  const B1StudyPage({
    super.key,
    required this.words,
    this.isReviewMode = false,
    this.isUnknownMode = false,
    this.isKnownMode = false,
  });
  @override
  State<B1StudyPage> createState() => _B1StudyPageState();
}

class _B1StudyPageState extends State<B1StudyPage>
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
              final currentKnown = p.getStringList('b1_known') ?? [];
              if (!currentKnown.contains(w['en'])) {
                final updatedKnown = [...currentKnown, w['en']!];
                await p.setStringList('b1_known', updatedKnown);
              }
            }

            // Bilmediklerim modunda sola kaydırıldığında ana bildiklerim listesine ekle ve bilmediklerim listesinden çıkar
            if (widget.isUnknownMode) {
              final p = await SharedPreferences.getInstance();

              // Ana bildiklerim listesine ekle
              final currentKnown = p.getStringList('b1_known') ?? [];
              if (!currentKnown.contains(w['en'])) {
                final updatedKnown = [...currentKnown, w['en']!];
                await p.setStringList('b1_known', updatedKnown);
              }

              // Ana bilmediklerim listesinden çıkar
              final currentUnknown = p.getStringList('b1_unknown') ?? [];
              final updatedUnknown = currentUnknown
                  .where((word) => word != w['en'])
                  .toList();
              await p.setStringList('b1_unknown', updatedUnknown);
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
              final currentUnknown = p.getStringList('b1_unknown') ?? [];
              if (!currentUnknown.contains(w['en'])) {
                final updatedUnknown = [...currentUnknown, w['en']!];
                await p.setStringList('b1_unknown', updatedUnknown);
              }
            }

            // Bildiklerim modunda sağa kaydırıldığında ana bilmediklerim listesine ekle ve bildiklerim listesinden çıkar
            if (widget.isKnownMode) {
              final p = await SharedPreferences.getInstance();

              // Ana bilmediklerim listesine ekle
              final currentUnknown = p.getStringList('b1_unknown') ?? [];
              if (!currentUnknown.contains(w['en'])) {
                final updatedUnknown = [...currentUnknown, w['en']!];
                await p.setStringList('b1_unknown', updatedUnknown);
              }

              // Ana bildiklerim listesinden çıkar
              final currentKnown = p.getStringList('b1_known') ?? [];
              final updatedKnown = currentKnown
                  .where((word) => word != w['en'])
                  .toList();
              await p.setStringList('b1_known', updatedKnown);
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
                value: index / widget.words.length,
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
      await p.setInt('b1_index', index);
      await p.setInt('b1_progress', progress);
      await p.setInt('b1_total', widget.words.length);
      await p.setStringList('b1_known', known.map((e) => e['en']!).toList());
      await p.setStringList(
        'b1_unknown',
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
        await p.setInt('b1_unknown_index', index);
        await p.setInt('b1_unknown_progress', progress);
        await p.setInt('b1_unknown_total', widget.words.length);
        await p.setStringList(
          'b1_unknown_known',
          known.map((e) => e['en']!).toList(),
        );
        await p.setStringList(
          'b1_unknown_unknown',
          unknown.map((e) => e['en']!).toList(),
        );
      } else if (widget.isKnownMode) {
        // Bildiklerim modu için ayrı kaydetme
        await p.setInt('b1_known_index', index);
        await p.setInt('b1_known_progress', progress);
        await p.setInt('b1_known_total', widget.words.length);
        await p.setStringList(
          'b1_known_known',
          known.map((e) => e['en']!).toList(),
        );
        await p.setStringList(
          'b1_known_unknown',
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
        final savedKnown = p.getStringList('b1_unknown_known') ?? [];
        final savedUnknown = p.getStringList('b1_unknown_unknown') ?? [];
        final savedProgress = p.getInt('b1_unknown_progress');
        final legacy = p.getInt('b1_unknown_index');
        final shouldRestart = p.getBool('b1_unknown_restart') ?? false;

        // Resume hesaplaması düzeltildi - önce index'e bak, sonra progress'e bak
        int resume = legacy ?? savedProgress ?? 0;

        // Eğer yeniden başlatma bayrağı varsa veya liste bittiyse baştan başla
        if (shouldRestart || resume >= widget.words.length) {
          // Yeniden başlatma bayrağını temizle
          await p.setBool('b1_unknown_restart', false);
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
        final savedKnown = p.getStringList('b1_known_known') ?? [];
        final savedUnknown = p.getStringList('b1_known_unknown') ?? [];
        final savedProgress = p.getInt('b1_known_progress');
        final legacy = p.getInt('b1_known_index');
        final shouldRestart = p.getBool('b1_known_restart') ?? false;

        // Resume hesaplaması düzeltildi - önce index'e bak, sonra progress'e bak
        int resume = legacy ?? savedProgress ?? 0;

        // Eğer yeniden başlatma bayrağı varsa veya liste bittiyse baştan başla
        if (shouldRestart || resume >= widget.words.length) {
          // Yeniden başlatma bayrağını temizle
          await p.setBool('b1_known_restart', false);
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
        final savedKnown = p.getStringList('b1_known') ?? [];
        final savedUnknown = p.getStringList('b1_unknown') ?? [];
        final savedProgress = p.getInt('b1_progress');
        final legacy = p.getInt('b1_index');
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
        'b1_index',
        'b1_progress',
        'b1_total',
        'b1_known',
        'b1_unknown',
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
        await p.setBool('b1_unknown_restart', true);
      } else if (widget.isKnownMode) {
        // Bildiklerim modu için yeniden başlatma bayrağını ayarla
        await p.setBool('b1_known_restart', true);
      }
    } catch (_) {}
  }
}
