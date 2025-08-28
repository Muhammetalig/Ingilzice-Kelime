import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class A2Page extends StatefulWidget {
  const A2Page({super.key});

  static final List<Map<String, String>> words = [
    {"en": "ability", "tr": "yetenek"},
    {"en": "able", "tr": "yapabilen"},
    {"en": "abroad", "tr": "yurtdışında"},
    {"en": "accept", "tr": "kabul etmek"},
    {"en": "accident", "tr": "kaza"},
    {"en": "according to", "tr": "-e göre"},
    {"en": "achieve", "tr": "başarmak"},
    {"en": "act", "tr": "davranmak, rol yapmak"},
    {"en": "active", "tr": "aktif"},
    {"en": "actually", "tr": "aslında"},
    {"en": "adult", "tr": "yetişkin"},
    {"en": "advantage", "tr": "avantaj"},
    {"en": "adventure", "tr": "macera"},
    {"en": "advertise", "tr": "reklam yapmak"},
    {"en": "advertisement", "tr": "reklam"},
    {"en": "advertising", "tr": "reklamcılık"},
    {"en": "affect", "tr": "etkilemek"},
    {"en": "after", "tr": "sonra"},
    {"en": "against", "tr": "karşı"},
    {"en": "ah", "tr": "ah"},
    {"en": "airline", "tr": "hava yolu şirketi"},
    {"en": "alive", "tr": "canlı"},
    {"en": "all", "tr": "hepsi"},
    {"en": "all right", "tr": "tamam, iyi"},
    {"en": "allow", "tr": "izin vermek"},
    {"en": "almost", "tr": "neredeyse"},
    {"en": "alone", "tr": "yalnız"},
    {"en": "along", "tr": "boyunca"},
    {"en": "already", "tr": "zaten"},
    {"en": "alternative", "tr": "alternatif"},
    {"en": "although", "tr": "rağmen"},
    {"en": "among", "tr": "arasında"},
    {"en": "amount", "tr": "miktar"},
    {"en": "ancient", "tr": "antik"},
    {"en": "ankle", "tr": "ayak bileği"},
    {"en": "any", "tr": "herhangi"},
    {"en": "anybody", "tr": "herhangi biri"},
    {"en": "any more", "tr": "artık"},
    {"en": "anyway", "tr": "her neyse"},
    {"en": "anywhere", "tr": "her yerde"},
    {"en": "app", "tr": "uygulama"},
    {"en": "appear", "tr": "görünmek"},
    {"en": "appearance", "tr": "görünüş"},
    {"en": "apply", "tr": "başvurmak"},
    {"en": "architect", "tr": "mimar"},
    {"en": "architecture", "tr": "mimarlık"},
    {"en": "argue", "tr": "tartışmak"},
    {"en": "argument", "tr": "tartışma"},
    {"en": "army", "tr": "ordu"},
    {"en": "arrange", "tr": "düzenlemek"},
    {"en": "arrangement", "tr": "düzenleme"},
    {"en": "as", "tr": "olarak"},
    {"en": "asleep", "tr": "uykuda"},
    {"en": "assistant", "tr": "asistan"},
    {"en": "athlete", "tr": "atlet"},
    {"en": "attack", "tr": "saldırmak, saldırı"},
    {"en": "attend", "tr": "katılmak"},
    {"en": "attention", "tr": "dikkat"},
    {"en": "attractive", "tr": "çekici"},
    {"en": "audience", "tr": "izleyici"},
    {"en": "author", "tr": "yazar"},
    {"en": "available", "tr": "mevcut"},
    {"en": "average", "tr": "ortalama"},
    {"en": "avoid", "tr": "kaçınmak"},
    {"en": "award", "tr": "ödül"},
    {"en": "awful", "tr": "berbat"},
    {"en": "back", "tr": "arka"},
    {"en": "background", "tr": "arka plan"},
    {"en": "badly", "tr": "kötü bir şekilde"},
    {"en": "bar", "tr": "bar"},
    {"en": "baseball", "tr": "beyzbol"},
    {"en": "based", "tr": "dayalı"},
    {"en": "basketball", "tr": "basketbol"},
    {"en": "bean", "tr": "fasulye"},
    {"en": "bear", "tr": "ayı"},
    {"en": "beat", "tr": "yenmek, dövmek"},
    {"en": "beef", "tr": "sığır eti"},
    {"en": "before", "tr": "önce"},
    {"en": "behave", "tr": "davranmak"},
    {"en": "behaviour", "tr": "davranış"},
    {"en": "belong", "tr": "ait olmak"},
    {"en": "belt", "tr": "kemer"},
    {"en": "benefit", "tr": "fayda"},
    {"en": "best", "tr": "en iyi"},
    {"en": "better", "tr": "daha iyi"},
    {"en": "between", "tr": "arasında"},
    {"en": "billion", "tr": "milyar"},
    {"en": "bin", "tr": "çöp kutusu"},
    {"en": "biology", "tr": "biyoloji"},
    {"en": "birth", "tr": "doğum"},
    {"en": "biscuit", "tr": "bisküvi"},
    {"en": "bit", "tr": "biraz"},
    {"en": "blank", "tr": "boş"},
    {"en": "block", "tr": "blok"},
    {"en": "blood", "tr": "kan"},
    {"en": "blow", "tr": "üflemek"},
    {"en": "blue", "tr": "mavi"},
    {"en": "board", "tr": "tahta"},
    {"en": "boat", "tr": "tekne"},
    {"en": "body", "tr": "vücut"},
    {"en": "boil", "tr": "kaynatmak"},
    {"en": "bomb", "tr": "bomba"},
    {"en": "bone", "tr": "kemik"},
    {"en": "book", "tr": "kitap"},
    {"en": "border", "tr": "sınır"},
    {"en": "born", "tr": "doğmak"},
    {"en": "borrow", "tr": "ödünç almak"},
    {"en": "boss", "tr": "patron"},
    {"en": "both", "tr": "her ikisi"},
    {"en": "bottle", "tr": "şişe"},
    {"en": "bottom", "tr": "alt"},
    {"en": "box", "tr": "kutu"},
    {"en": "boy", "tr": "erkek çocuk"},
    {"en": "boyfriend", "tr": "erkek arkadaş"},
    {"en": "brain", "tr": "beyin"},
    {"en": "branch", "tr": "dal"},
    {"en": "brave", "tr": "cesur"},
    {"en": "bread", "tr": "ekmek"},
    {"en": "break", "tr": "kırmak"},
    {"en": "breakfast", "tr": "kahvaltı"},
    {"en": "breath", "tr": "nefes"},
    {"en": "breathe", "tr": "nefes almak"},
    {"en": "bridge", "tr": "köprü"},
    {"en": "bright", "tr": "parlak"},
    {"en": "bring", "tr": "getirmek"},
    {"en": "broad", "tr": "geniş"},
    {"en": "brother", "tr": "erkek kardeş"},
    {"en": "brown", "tr": "kahverengi"},
    {"en": "build", "tr": "inşa etmek"},
    {"en": "building", "tr": "bina"},
    {"en": "burn", "tr": "yakmak"},
    {"en": "bus", "tr": "otobüs"},
    {"en": "business", "tr": "iş"},
    {"en": "busy", "tr": "meşgul"},
    {"en": "but", "tr": "ama"},
    {"en": "buy", "tr": "satın almak"},
    {"en": "by", "tr": "ile"},
    {"en": "bye", "tr": "hoşça kal"},
    {"en": "cake", "tr": "pasta"},
    {"en": "call", "tr": "aramak"},
    {"en": "camera", "tr": "kamera"},
    {"en": "camp", "tr": "kamp"},
    {"en": "can", "tr": "-ebilmek"},
    {"en": "cancel", "tr": "iptal etmek"},
    {"en": "cancer", "tr": "kanser"},
    {"en": "candidate", "tr": "aday"},
    {"en": "capital", "tr": "başkent"},
    {"en": "car", "tr": "araba"},
    {"en": "card", "tr": "kart"},
    {"en": "care", "tr": "bakım"},
    {"en": "career", "tr": "kariyer"},
    {"en": "careful", "tr": "dikkatli"},
    {"en": "carry", "tr": "taşımak"},
    {"en": "case", "tr": "durum"},
    {"en": "cash", "tr": "nakit"},
    {"en": "cat", "tr": "kedi"},
    {"en": "catch", "tr": "yakalamak"},
    {"en": "cause", "tr": "neden"},
    {"en": "cell", "tr": "hücre"},
    {"en": "cent", "tr": "sent"},
    {"en": "centre", "tr": "merkez"},
    {"en": "century", "tr": "yüzyıl"},
    {"en": "certain", "tr": "kesin"},
    {"en": "chair", "tr": "sandalye"},
    {"en": "challenge", "tr": "meydan okuma"},
    {"en": "chance", "tr": "şans"},
    {"en": "change", "tr": "değişmek"},
    {"en": "channel", "tr": "kanal"},
    {"en": "charge", "tr": "ücret"},
    {"en": "cheap", "tr": "ucuz"},
    {"en": "check", "tr": "kontrol etmek"},
    {"en": "cheese", "tr": "peynir"},
    {"en": "chicken", "tr": "tavuk"},
    {"en": "child", "tr": "çocuk"},
    {"en": "choice", "tr": "seçim"},
    {"en": "choose", "tr": "seçmek"},
    {"en": "church", "tr": "kilise"},
    {"en": "city", "tr": "şehir"},
    {"en": "class", "tr": "sınıf"},
    {"en": "clean", "tr": "temiz"},
    {"en": "clear", "tr": "açık"},
    {"en": "climb", "tr": "tırmanmak"},
    {"en": "clock", "tr": "saat"},
    {"en": "close", "tr": "kapatmak"},
    {"en": "clothes", "tr": "giysi"},
    {"en": "cloud", "tr": "bulut"},
    {"en": "club", "tr": "kulüp"},
    {"en": "coach", "tr": "antrenör"},
    {"en": "coat", "tr": "palto"},
    {"en": "coffee", "tr": "kahve"},
    {"en": "cold", "tr": "soğuk"},
    {"en": "college", "tr": "kolej"},
    {"en": "colour", "tr": "renk"},
    {"en": "come", "tr": "gelmek"},
    {"en": "comfortable", "tr": "rahat"},
    {"en": "common", "tr": "yaygın"},
    {"en": "company", "tr": "şirket"},
    {"en": "compare", "tr": "karşılaştırmak"},
    {"en": "complete", "tr": "tamamlamak"},
    {"en": "computer", "tr": "bilgisayar"},
    {"en": "concert", "tr": "konser"},
    {"en": "condition", "tr": "durum"},
    {"en": "consider", "tr": "düşünmek"},
    {"en": "continue", "tr": "devam etmek"},
    {"en": "control", "tr": "kontrol"},
    {"en": "cook", "tr": "yemek pişirmek"},
    {"en": "cool", "tr": "serin"},
    {"en": "copy", "tr": "kopya"},
    {"en": "corner", "tr": "köşe"},
    {"en": "correct", "tr": "doğru"},
    {"en": "cost", "tr": "maliyet"},
    {"en": "could", "tr": "-ebilirdi"},
    {"en": "country", "tr": "ülke"},
    {"en": "course", "tr": "kurs"},
    {"en": "cousin", "tr": "kuzen"},
    {"en": "cover", "tr": "kapak"},
    {"en": "cow", "tr": "inek"},
    {"en": "cream", "tr": "krema"},
    {"en": "create", "tr": "yaratmak"},
    {"en": "cross", "tr": "geçmek"},
    {"en": "crowd", "tr": "kalabalık"},
    {"en": "cry", "tr": "ağlamak"},
    {"en": "culture", "tr": "kültür"},
    {"en": "cup", "tr": "fincan"},
    {"en": "customer", "tr": "müşteri"},
    {"en": "cut", "tr": "kesmek"},
    {"en": "dad", "tr": "baba"},
    {"en": "dance", "tr": "dans etmek"},
    {"en": "danger", "tr": "tehlike"},
    {"en": "dangerous", "tr": "tehlikeli"},
    {"en": "dark", "tr": "karanlık"},
    {"en": "date", "tr": "tarih"},
    {"en": "daughter", "tr": "kız evlat"},
    {"en": "day", "tr": "gün"},
    {"en": "dead", "tr": "ölü"},
    {"en": "deal", "tr": "anlaşma"},
    {"en": "dear", "tr": "sevgili"},
    {"en": "death", "tr": "ölüm"},
    {"en": "decide", "tr": "karar vermek"},
    {"en": "deep", "tr": "derin"},
    {"en": "degree", "tr": "derece"},
    {"en": "delicious", "tr": "lezzetli"},
    {"en": "describe", "tr": "tanımlamak"},
    {"en": "design", "tr": "tasarım"},
    {"en": "desk", "tr": "masa"},
    {"en": "develop", "tr": "geliştirmek"},
    {"en": "die", "tr": "ölmek"},
    {"en": "difference", "tr": "fark"},
    {"en": "different", "tr": "farklı"},
    {"en": "difficult", "tr": "zor"},
    {"en": "dinner", "tr": "akşam yemeği"},
    {"en": "direct", "tr": "doğrudan"},
    {"en": "direction", "tr": "yön"},
    {"en": "dirty", "tr": "kirli"},
    {"en": "discuss", "tr": "tartışmak"},
    {"en": "dish", "tr": "tabak"},
    {"en": "do", "tr": "yapmak"},
    {"en": "doctor", "tr": "doktor"},
    {"en": "dog", "tr": "köpek"},
    {"en": "door", "tr": "kapı"},
    {"en": "down", "tr": "aşağı"},
    {"en": "draw", "tr": "çizmek"},
    {"en": "dream", "tr": "rüya"},
    {"en": "dress", "tr": "elbise"},
    {"en": "drink", "tr": "içmek"},
    {"en": "drive", "tr": "sürmek"},
    {"en": "drop", "tr": "düşürmek"},
    {"en": "drug", "tr": "ilaç"},
    {"en": "dry", "tr": "kuru"},
    {"en": "during", "tr": "sırasında"},
    {"en": "each", "tr": "her biri"},
    {"en": "ear", "tr": "kulak"},
    {"en": "early", "tr": "erken"},
    {"en": "earth", "tr": "dünya"},
    {"en": "east", "tr": "doğu"},
    {"en": "easy", "tr": "kolay"},
    {"en": "eat", "tr": "yemek"},
    {"en": "edge", "tr": "kenar"},
    {"en": "education", "tr": "eğitim"},
    {"en": "effect", "tr": "etki"},
    {"en": "egg", "tr": "yumurta"},
    {"en": "eight", "tr": "sekiz"},
    {"en": "either", "tr": "ya da"},
    {"en": "else", "tr": "başka"},
    {"en": "email", "tr": "e-posta"},
    {"en": "end", "tr": "son"},
    {"en": "enemy", "tr": "düşman"},
    {"en": "energy", "tr": "enerji"},
    {"en": "enjoy", "tr": "zevk almak"},
    {"en": "enough", "tr": "yeterli"},
    {"en": "enter", "tr": "girmek"},
    {"en": "environment", "tr": "çevre"},
    {"en": "equal", "tr": "eşit"},
    {"en": "especially", "tr": "özellikle"},
    {"en": "even", "tr": "bile"},
    {"en": "evening", "tr": "akşam"},
    {"en": "event", "tr": "olay"},
    {"en": "ever", "tr": "hiç"},
    {"en": "every", "tr": "her"},
    {"en": "everybody", "tr": "herkes"},
    {"en": "everyone", "tr": "herkes"},
    {"en": "everything", "tr": "her şey"},
    {"en": "exact", "tr": "tam"},
    {"en": "exam", "tr": "sınav"},
    {"en": "example", "tr": "örnek"},
    {"en": "except", "tr": "hariç"},
    {"en": "excited", "tr": "heyecanlı"},
    {"en": "exciting", "tr": "heyecan verici"},
    {"en": "exercise", "tr": "egzersiz"},
    {"en": "expect", "tr": "beklemek"},
    {"en": "expensive", "tr": "pahalı"},
    {"en": "experience", "tr": "deneyim"},
    {"en": "explain", "tr": "açıklamak"},
    {"en": "eye", "tr": "göz"},
    {"en": "face", "tr": "yüz"},
    {"en": "fact", "tr": "gerçek"},
    {"en": "fail", "tr": "başarısız olmak"},
    {"en": "fall", "tr": "düşmek"},
    {"en": "family", "tr": "aile"},
    {"en": "famous", "tr": "ünlü"},
    {"en": "far", "tr": "uzak"},
    {"en": "farm", "tr": "çiftlik"},
    {"en": "farmer", "tr": "çiftçi"},
    {"en": "fast", "tr": "hızlı"},
    {"en": "father", "tr": "baba"},
    {"en": "favourite", "tr": "favori"},
    {"en": "feel", "tr": "hissetmek"},
    {"en": "few", "tr": "az"},
    {"en": "field", "tr": "alan"},
    {"en": "fight", "tr": "savaşmak"},
    {"en": "figure", "tr": "şekil"},
    {"en": "fill", "tr": "doldurmak"},
    {"en": "film", "tr": "film"},
    {"en": "final", "tr": "final"},
    {"en": "find", "tr": "bulmak"},
    {"en": "fine", "tr": "iyi"},
    {"en": "finger", "tr": "parmak"},
    {"en": "finish", "tr": "bitirmek"},
    {"en": "fire", "tr": "ateş"},
    {"en": "first", "tr": "birinci"},
    {"en": "fish", "tr": "balık"},
    {"en": "five", "tr": "beş"},
    {"en": "floor", "tr": "zemin"},
    {"en": "flower", "tr": "çiçek"},
    {"en": "fly", "tr": "uçmak"},
    {"en": "follow", "tr": "takip etmek"},
    {"en": "food", "tr": "yemek"},
    {"en": "foot", "tr": "ayak"},
    {"en": "for", "tr": "için"},
    {"en": "force", "tr": "güç"},
    {"en": "foreign", "tr": "yabancı"},
    {"en": "forget", "tr": "unutmak"},
    {"en": "form", "tr": "form"},
    {"en": "free", "tr": "özgür"},
    {"en": "friend", "tr": "arkadaş"},
    {"en": "from", "tr": "-den"},
    {"en": "front", "tr": "ön"},
    {"en": "full", "tr": "dolu"},
    {"en": "fun", "tr": "eğlence"},
    {"en": "future", "tr": "gelecek"},
    {"en": "game", "tr": "oyun"},
    {"en": "garden", "tr": "bahçe"},
    {"en": "gas", "tr": "gaz"},
    {"en": "general", "tr": "genel"},
    {"en": "get", "tr": "almak"},
    {"en": "girl", "tr": "kız"},
    {"en": "give", "tr": "vermek"},
    {"en": "glass", "tr": "cam"},
    {"en": "go", "tr": "gitmek"},
    {"en": "good", "tr": "iyi"},
    {"en": "government", "tr": "hükümet"},
    {"en": "great", "tr": "harika"},
    {"en": "green", "tr": "yeşil"},
    {"en": "group", "tr": "grup"},
    {"en": "grow", "tr": "büyümek"},
    {"en": "guess", "tr": "tahmin etmek"},
    {"en": "gun", "tr": "silah"},
    {"en": "guy", "tr": "adam"},
    {"en": "hair", "tr": "saç"},
    {"en": "half", "tr": "yarım"},
    {"en": "hand", "tr": "el"},
    {"en": "happen", "tr": "olmak"},
    {"en": "happy", "tr": "mutlu"},
    {"en": "hard", "tr": "zor"},
    {"en": "have", "tr": "sahip olmak"},
    {"en": "he", "tr": "o"},
    {"en": "head", "tr": "baş"},
    {"en": "health", "tr": "sağlık"},
    {"en": "hear", "tr": "duymak"},
    {"en": "heart", "tr": "kalp"},
    {"en": "heat", "tr": "ısı"},
    {"en": "heavy", "tr": "ağır"},
    {"en": "help", "tr": "yardım"},
    {"en": "here", "tr": "burada"},
    {"en": "high", "tr": "yüksek"},
    {"en": "history", "tr": "tarih"},
    {"en": "hit", "tr": "vurmak"},
    {"en": "hold", "tr": "tutmak"},
    {"en": "home", "tr": "ev"},
    {"en": "hope", "tr": "umut"},
    {"en": "horse", "tr": "at"},
    {"en": "hospital", "tr": "hastane"},
    {"en": "hot", "tr": "sıcak"},
    {"en": "hotel", "tr": "otel"},
    {"en": "hour", "tr": "saat"},
    {"en": "house", "tr": "ev"},
    {"en": "how", "tr": "nasıl"},
    {"en": "however", "tr": "ancak"},
    {"en": "huge", "tr": "devasa"},
    {"en": "human", "tr": "insan"},
    {"en": "hundred", "tr": "yüz"},
    {"en": "husband", "tr": "koca"},
    {"en": "I", "tr": "ben"},
    {"en": "ice", "tr": "buz"},
    {"en": "idea", "tr": "fikir"},
    {"en": "if", "tr": "eğer"},
    {"en": "imagine", "tr": "hayal etmek"},
    {"en": "important", "tr": "önemli"},
    {"en": "improve", "tr": "geliştirmek"},
    {"en": "in", "tr": "içinde"},
    {"en": "include", "tr": "içermek"},
    {"en": "increase", "tr": "artırmak"},
    {"en": "indeed", "tr": "gerçekten"},
    {"en": "information", "tr": "bilgi"},
    {"en": "inside", "tr": "içinde"},
    {"en": "instead", "tr": "yerine"},
    {"en": "interest", "tr": "ilgi"},
    {"en": "into", "tr": "içine"},
    {"en": "introduce", "tr": "tanıtmak"},
    {"en": "it", "tr": "o"},
    {"en": "its", "tr": "onun"},
    {"en": "job", "tr": "iş"},
    {"en": "join", "tr": "katılmak"},
    {"en": "just", "tr": "sadece"},
    {"en": "keep", "tr": "tutmak"},
    {"en": "key", "tr": "anahtar"},
    {"en": "kid", "tr": "çocuk"},
    {"en": "kill", "tr": "öldürmek"},
    {"en": "kind", "tr": "tür"},
    {"en": "know", "tr": "bilmek"},
    {"en": "land", "tr": "arazi"},
    {"en": "language", "tr": "dil"},
    {"en": "large", "tr": "büyük"},
    {"en": "last", "tr": "son"},
    {"en": "late", "tr": "geç"},
    {"en": "laugh", "tr": "gülmek"},
    {"en": "law", "tr": "yasa"},
    {"en": "lead", "tr": "yönlendirmek"},
    {"en": "learn", "tr": "öğrenmek"},
    {"en": "leave", "tr": "ayrılmak"},
    {"en": "left", "tr": "sol"},
    {"en": "leg", "tr": "bacak"},
    {"en": "less", "tr": "daha az"},
    {"en": "let", "tr": "izin vermek"},
    {"en": "letter", "tr": "mektup"},
    {"en": "life", "tr": "hayat"},
    {"en": "light", "tr": "ışık"},
    {"en": "like", "tr": "sevmek"},
    {"en": "line", "tr": "çizgi"},
    {"en": "list", "tr": "liste"},
    {"en": "listen", "tr": "dinlemek"},
    {"en": "little", "tr": "küçük"},
    {"en": "live", "tr": "yaşamak"},
    {"en": "long", "tr": "uzun"},
    {"en": "look", "tr": "bakmak"},
    {"en": "lose", "tr": "kaybetmek"},
    {"en": "lot", "tr": "çok"},
    {"en": "love", "tr": "aşk"},
    {"en": "low", "tr": "düşük"},
    {"en": "machine", "tr": "makine"},
    {"en": "main", "tr": "ana"},
    {"en": "make", "tr": "yapmak"},
    {"en": "man", "tr": "adam"},
    {"en": "many", "tr": "birçok"},
    {"en": "market", "tr": "pazar"},
    {"en": "marry", "tr": "evlenmek"},
    {"en": "match", "tr": "eşleşmek"},
    {"en": "matter", "tr": "madde"},
    {"en": "may", "tr": "mayıs"},
    {"en": "maybe", "tr": "belki"},
    {"en": "me", "tr": "beni"},
    {"en": "mean", "tr": "anlamına gelmek"},
    {"en": "meet", "tr": "buluşmak"},
    {"en": "member", "tr": "üye"},
    {"en": "men", "tr": "erkekler"},
    {"en": "message", "tr": "mesaj"},
    {"en": "middle", "tr": "orta"},
    {"en": "might", "tr": "-ebilir"},
    {"en": "mind", "tr": "akıl"},
    {"en": "miss", "tr": "kaçırmak"},
    {"en": "money", "tr": "para"},
    {"en": "month", "tr": "ay"},
    {"en": "more", "tr": "daha fazla"},
    {"en": "morning", "tr": "sabah"},
    {"en": "most", "tr": "en çok"},
    {"en": "mother", "tr": "anne"},
    {"en": "move", "tr": "hareket etmek"},
    {"en": "much", "tr": "çok"},
    {"en": "music", "tr": "müzik"},
    {"en": "must", "tr": "zorunda"},
    {"en": "my", "tr": "benim"},
    {"en": "name", "tr": "isim"},
    {"en": "near", "tr": "yakın"},
    {"en": "need", "tr": "ihtiyaç"},
    {"en": "never", "tr": "asla"},
    {"en": "new", "tr": "yeni"},
    {"en": "news", "tr": "haber"},
    {"en": "next", "tr": "sonraki"},
    {"en": "nice", "tr": "güzel"},
    {"en": "night", "tr": "gece"},
    {"en": "nine", "tr": "dokuz"},
    {"en": "no", "tr": "hayır"},
    {"en": "none", "tr": "hiçbiri"},
    {"en": "north", "tr": "kuzey"},
    {"en": "not", "tr": "değil"},
    {"en": "note", "tr": "not"},
    {"en": "nothing", "tr": "hiçbir şey"},
    {"en": "now", "tr": "şimdi"},
    {"en": "number", "tr": "sayı"},
    {"en": "of", "tr": "-ın"},
    {"en": "off", "tr": "kapalı"},
    {"en": "often", "tr": "sık sık"},
    {"en": "old", "tr": "eski"},
    {"en": "on", "tr": "üzerinde"},
    {"en": "once", "tr": "bir kere"},
    {"en": "one", "tr": "bir"},
    {"en": "only", "tr": "sadece"},
    {"en": "open", "tr": "açık"},
    {"en": "or", "tr": "veya"},
    {"en": "order", "tr": "sipariş"},
    {"en": "other", "tr": "diğer"},
    {"en": "our", "tr": "bizim"},
    {"en": "out", "tr": "dışarı"},
    {"en": "over", "tr": "üzerinde"},
    {"en": "own", "tr": "kendi"},
    {"en": "page", "tr": "sayfa"},
    {"en": "paper", "tr": "kağıt"},
    {"en": "parent", "tr": "ebeveyn"},
    {"en": "part", "tr": "parça"},
    {"en": "party", "tr": "parti"},
    {"en": "pass", "tr": "geçmek"},
    {"en": "past", "tr": "geçmiş"},
    {"en": "pay", "tr": "ödemek"},
    {"en": "people", "tr": "insanlar"},
    {"en": "perhaps", "tr": "belki"},
    {"en": "person", "tr": "kişi"},
    {"en": "picture", "tr": "resim"},
    {"en": "place", "tr": "yer"},
    {"en": "plan", "tr": "plan"},
    {"en": "play", "tr": "oynamak"},
    {"en": "point", "tr": "nokta"},
    {"en": "police", "tr": "polis"},
    {"en": "poor", "tr": "fakir"},
    {"en": "possible", "tr": "mümkün"},
    {"en": "power", "tr": "güç"},
    {"en": "present", "tr": "mevcut"},
    {"en": "president", "tr": "başkan"},
    {"en": "pretty", "tr": "güzel"},
    {"en": "probably", "tr": "muhtemelen"},
    {"en": "problem", "tr": "sorun"},
    {"en": "provide", "tr": "sağlamak"},
    {"en": "put", "tr": "koymak"},
    {"en": "question", "tr": "soru"},
    {"en": "quick", "tr": "hızlı"},
    {"en": "quite", "tr": "oldukça"},
    {"en": "race", "tr": "yarış"},
    {"en": "radio", "tr": "radyo"},
    {"en": "rather", "tr": "daha çok"},
    {"en": "reach", "tr": "ulaşmak"},
    {"en": "read", "tr": "okumak"},
    {"en": "ready", "tr": "hazır"},
    {"en": "real", "tr": "gerçek"},
    {"en": "really", "tr": "gerçekten"},
    {"en": "reason", "tr": "sebep"},
    {"en": "receive", "tr": "almak"},
    {"en": "record", "tr": "kayıt"},
    {"en": "red", "tr": "kırmızı"},
    {"en": "remember", "tr": "hatırlamak"},
    {"en": "report", "tr": "rapor"},
    {"en": "research", "tr": "araştırma"},
    {"en": "result", "tr": "sonuç"},
    {"en": "return", "tr": "dönmek"},
    {"en": "right", "tr": "doğru"},
    {"en": "road", "tr": "yol"},
    {"en": "room", "tr": "oda"},
    {"en": "rule", "tr": "kural"},
    {"en": "run", "tr": "koşmak"},
    {"en": "same", "tr": "aynı"},
    {"en": "say", "tr": "söylemek"},
    {"en": "school", "tr": "okul"},
    {"en": "sea", "tr": "deniz"},
    {"en": "second", "tr": "ikinci"},
    {"en": "see", "tr": "görmek"},
    {"en": "seem", "tr": "görünmek"},
    {"en": "sell", "tr": "satmak"},
    {"en": "send", "tr": "göndermek"},
    {"en": "service", "tr": "hizmet"},
    {"en": "set", "tr": "ayarlamak"},
    {"en": "seven", "tr": "yedi"},
    {"en": "several", "tr": "birkaç"},
    {"en": "shall", "tr": "-ecek"},
    {"en": "she", "tr": "o"},
    {"en": "should", "tr": "-meli"},
    {"en": "show", "tr": "göstermek"},
    {"en": "side", "tr": "yan"},
    {"en": "since", "tr": "-den beri"},
    {"en": "six", "tr": "altı"},
    {"en": "small", "tr": "küçük"},
    {"en": "so", "tr": "bu yüzden"},
    {"en": "some", "tr": "bazı"},
    {"en": "something", "tr": "bir şey"},
    {"en": "sometimes", "tr": "bazen"},
    {"en": "son", "tr": "oğul"},
    {"en": "soon", "tr": "yakında"},
    {"en": "sorry", "tr": "üzgün"},
    {"en": "sound", "tr": "ses"},
    {"en": "south", "tr": "güney"},
    {"en": "space", "tr": "uzay"},
    {"en": "speak", "tr": "konuşmak"},
    {"en": "special", "tr": "özel"},
    {"en": "spend", "tr": "harcamak"},
    {"en": "sport", "tr": "spor"},
    {"en": "stand", "tr": "ayakta durmak"},
    {"en": "start", "tr": "başlamak"},
    {"en": "state", "tr": "durum"},
    {"en": "stay", "tr": "kalmak"},
    {"en": "stop", "tr": "durmak"},
    {"en": "story", "tr": "hikaye"},
    {"en": "street", "tr": "sokak"},
    {"en": "strong", "tr": "güçlü"},
    {"en": "student", "tr": "öğrenci"},
    {"en": "study", "tr": "çalışmak"},
    {"en": "such", "tr": "böyle"},
    {"en": "suggest", "tr": "önermek"},
    {"en": "sure", "tr": "emin"},
    {"en": "take", "tr": "almak"},
    {"en": "talk", "tr": "konuşmak"},
    {"en": "team", "tr": "takım"},
    {"en": "tell", "tr": "söylemek"},
    {"en": "ten", "tr": "on"},
    {"en": "than", "tr": "-den"},
    {"en": "that", "tr": "şu"},
    {"en": "the", "tr": "belirli artikel"},
    {"en": "their", "tr": "onların"},
    {"en": "them", "tr": "onları"},
    {"en": "then", "tr": "sonra"},
    {"en": "there", "tr": "orada"},
    {"en": "they", "tr": "onlar"},
    {"en": "thing", "tr": "şey"},
    {"en": "think", "tr": "düşünmek"},
    {"en": "this", "tr": "bu"},
    {"en": "those", "tr": "şunlar"},
    {"en": "though", "tr": "rağmen"},
    {"en": "three", "tr": "üç"},
    {"en": "through", "tr": "içinden"},
    {"en": "time", "tr": "zaman"},
    {"en": "to", "tr": "-e"},
    {"en": "today", "tr": "bugün"},
    {"en": "together", "tr": "birlikte"},
    {"en": "too", "tr": "çok"},
    {"en": "towards", "tr": "-e doğru"},
    {"en": "try", "tr": "denemek"},
    {"en": "turn", "tr": "dönmek"},
    {"en": "two", "tr": "iki"},
    {"en": "under", "tr": "altında"},
    {"en": "understand", "tr": "anlamak"},
    {"en": "until", "tr": "-e kadar"},
    {"en": "up", "tr": "yukarı"},
    {"en": "us", "tr": "bizi"},
    {"en": "use", "tr": "kullanmak"},
    {"en": "very", "tr": "çok"},
    {"en": "wait", "tr": "beklemek"},
    {"en": "walk", "tr": "yürümek"},
    {"en": "want", "tr": "istemek"},
    {"en": "watch", "tr": "izlemek"},
    {"en": "water", "tr": "su"},
    {"en": "way", "tr": "yol"},
    {"en": "we", "tr": "biz"},
    {"en": "week", "tr": "hafta"},
    {"en": "well", "tr": "iyi"},
    {"en": "west", "tr": "batı"},
    {"en": "what", "tr": "ne"},
    {"en": "when", "tr": "ne zaman"},
    {"en": "where", "tr": "nerede"},
    {"en": "which", "tr": "hangi"},
    {"en": "while", "tr": "iken"},
    {"en": "white", "tr": "beyaz"},
    {"en": "who", "tr": "kim"},
    {"en": "why", "tr": "neden"},
    {"en": "will", "tr": "-ecek"},
    {"en": "with", "tr": "ile"},
    {"en": "without", "tr": "-sız"},
    {"en": "woman", "tr": "kadın"},
    {"en": "word", "tr": "kelime"},
    {"en": "work", "tr": "çalışmak"},
    {"en": "world", "tr": "dünya"},
    {"en": "would", "tr": "-ecekti"},
    {"en": "write", "tr": "yazmak"},
    {"en": "year", "tr": "yıl"},
    {"en": "yes", "tr": "evet"},
    {"en": "you", "tr": "sen"},
    {"en": "young", "tr": "genç"},
    {"en": "your", "tr": "senin"},
  ];

  @override
  State<A2Page> createState() => _A2PageState();
}

class _A2PageState extends State<A2Page> {
  bool showWords = false;
  int? _savedIndex; // sonraki kart
  int _savedKnown = 0;
  int _savedUnknown = 0;
  int _total = A2Page.words.length;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final p = await SharedPreferences.getInstance();
      final prog = p.getInt('a2_progress');
      final legacy = p.getInt('a2_index');
      final known = p.getStringList('a2_known') ?? [];
      final unknown = p.getStringList('a2_unknown') ?? [];

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
      MaterialPageRoute(builder: (_) => A2StudyPage(words: A2Page.words)),
    );
    if (mounted) _load();
  }

  Future<void> _openKnownStudy() async {
    final p = await SharedPreferences.getInstance();
    final knownWords = p.getStringList('a2_known') ?? [];
    if (knownWords.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Bildiğiniz kelime bulunmuyor')),
      );
      return;
    }

    final knownWordList = A2Page.words
        .where((w) => knownWords.contains(w['en']))
        .toList();

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => A2StudyPage(
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
    final unknownWords = p.getStringList('a2_unknown') ?? [];
    if (unknownWords.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Bilmediğiniz kelime bulunmuyor')),
      );
      return;
    }

    final unknownWordList = A2Page.words
        .where((w) => unknownWords.contains(w['en']))
        .toList();

    // 20 kelime sınırı kaldırıldı - tüm bilmediklerim kelimeleri çalışılabilir
    final limitedUnknownWords = unknownWordList;

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => A2StudyPage(
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
      await p.remove('a2_index');
      await p.remove('a2_progress');
      await p.remove('a2_total');
      await p.remove('a2_known');
      await p.remove('a2_unknown');

      // Sayfayı yeniden yükle
      if (mounted) _load();

      // Çalışma sayfasını aç
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => A2StudyPage(words: A2Page.words, isReviewMode: true),
        ),
      );
      if (mounted) _load();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('A2 Kelimeleri'),
        backgroundColor: Colors.green.shade700,
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
              backgroundColor: Colors.green,
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
            itemCount: A2Page.words.length,
            separatorBuilder: (_, __) => const SizedBox(height: 6),
            itemBuilder: (c, i) {
              final w = A2Page.words[i];
              return Card(
                color: Colors.green.shade50,
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

class A2StudyPage extends StatefulWidget {
  final List<Map<String, String>> words;
  final bool isReviewMode;
  final bool isUnknownMode;
  final bool isKnownMode;
  const A2StudyPage({
    super.key,
    required this.words,
    this.isReviewMode = false,
    this.isUnknownMode = false,
    this.isKnownMode = false,
  });
  @override
  State<A2StudyPage> createState() => _A2StudyPageState();
}

class _A2StudyPageState extends State<A2StudyPage>
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
              final currentKnown = p.getStringList('a2_known') ?? [];
              if (!currentKnown.contains(w['en'])) {
                final updatedKnown = [...currentKnown, w['en']!];
                await p.setStringList('a2_known', updatedKnown);
              }
            }

            // Bilmediklerim modunda sola kaydırıldığında ana bildiklerim listesine ekle ve bilmediklerim listesinden çıkar
            if (widget.isUnknownMode) {
              final p = await SharedPreferences.getInstance();

              // Ana bildiklerim listesine ekle
              final currentKnown = p.getStringList('a2_known') ?? [];
              if (!currentKnown.contains(w['en'])) {
                final updatedKnown = [...currentKnown, w['en']!];
                await p.setStringList('a2_known', updatedKnown);
              }

              // Ana bilmediklerim listesinden çıkar
              final currentUnknown = p.getStringList('a2_unknown') ?? [];
              final updatedUnknown = currentUnknown
                  .where((word) => word != w['en'])
                  .toList();
              await p.setStringList('a2_unknown', updatedUnknown);
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
              final currentUnknown = p.getStringList('a2_unknown') ?? [];
              if (!currentUnknown.contains(w['en'])) {
                final updatedUnknown = [...currentUnknown, w['en']!];
                await p.setStringList('a2_unknown', updatedUnknown);
              }
            }

            // Bildiklerim modunda sağa kaydırıldığında ana bilmediklerim listesine ekle ve bildiklerim listesinden çıkar
            if (widget.isKnownMode) {
              final p = await SharedPreferences.getInstance();

              // Ana bilmediklerim listesine ekle
              final currentUnknown = p.getStringList('a2_unknown') ?? [];
              if (!currentUnknown.contains(w['en'])) {
                final updatedUnknown = [...currentUnknown, w['en']!];
                await p.setStringList('a2_unknown', updatedUnknown);
              }

              // Ana bildiklerim listesinden çıkar
              final currentKnown = p.getStringList('a2_known') ?? [];
              final updatedKnown = currentKnown
                  .where((word) => word != w['en'])
                  .toList();
              await p.setStringList('a2_known', updatedKnown);
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
              // Sadece normal modda _save() çağır, özel modlarda çağırma
              if (!widget.isUnknownMode && !widget.isKnownMode) {
                await _save();
              } else {
                // Özel modlarda sadece kendi verilerini kaydet
                await _saveSpecialMode();
              }
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
              if (!_restoring) {
                // Sadece normal modda _save() çağır, özel modlarda çağırma
                if (!widget.isUnknownMode && !widget.isKnownMode) {
                  await _save();
                } else {
                  // Özel modlarda sadece kendi verilerini kaydet
                  await _saveSpecialMode();
                }
              }
              if (mounted)
                Navigator.pop(context, {'known': known, 'unknown': unknown});
            },
          ),
        ],
      ),
      body: WillPopScope(
        onWillPop: () async {
          if (!_restoring) {
            // Sadece normal modda _save() çağır, özel modlarda çağırma
            if (!widget.isUnknownMode && !widget.isKnownMode) {
              await _save();
            } else {
              // Özel modlarda sadece kendi verilerini kaydet
              await _saveSpecialMode();
            }
          }
          return true;
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              LinearProgressIndicator(
                value:
                    (index + 1) /
                    widget.words.length, // +1 ekleyerek tam dolmasını sağla
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
      await p.setInt('a2_index', index);
      await p.setInt('a2_progress', progress);
      await p.setInt('a2_total', widget.words.length);
      await p.setStringList('a2_known', known.map((e) => e['en']!).toList());
      await p.setStringList(
        'a2_unknown',
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
        await p.setInt('a2_unknown_index', index);
        await p.setInt('a2_unknown_progress', progress);
        await p.setInt('a2_unknown_total', widget.words.length);
        await p.setStringList(
          'a2_unknown_known',
          known.map((e) => e['en']!).toList(),
        );
        await p.setStringList(
          'a2_unknown_unknown',
          unknown.map((e) => e['en']!).toList(),
        );
      } else if (widget.isKnownMode) {
        // Bildiklerim modu için ayrı kaydetme
        await p.setInt('a2_known_index', index);
        await p.setInt('a2_known_progress', progress);
        await p.setInt('a2_known_total', widget.words.length);
        await p.setStringList(
          'a2_known_known',
          known.map((e) => e['en']!).toList(),
        );
        await p.setStringList(
          'a2_known_unknown',
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
        final savedKnown = p.getStringList('a2_unknown_known') ?? [];
        final savedUnknown = p.getStringList('a2_unknown_unknown') ?? [];
        final savedProgress = p.getInt('a2_unknown_progress');
        final legacy = p.getInt('a2_unknown_index');
        final shouldRestart = p.getBool('a2_unknown_restart') ?? false;

        // Resume hesaplaması düzeltildi - önce index'e bak, sonra progress'e bak
        int resume = legacy ?? savedProgress ?? 0;

        // Eğer yeniden başlatma bayrağı varsa veya liste bittiyse baştan başla
        if (shouldRestart || resume >= widget.words.length) {
          // Yeniden başlatma bayrağını temizle
          await p.setBool('a2_unknown_restart', false);
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
        final savedKnown = p.getStringList('a2_known_known') ?? [];
        final savedUnknown = p.getStringList('a2_known_unknown') ?? [];
        final savedProgress = p.getInt('a2_known_progress');
        final legacy = p.getInt('a2_known_index');
        final shouldRestart = p.getBool('a2_known_restart') ?? false;

        // Resume hesaplaması düzeltildi - önce index'e bak, sonra progress'e bak
        int resume = legacy ?? savedProgress ?? 0;

        // Eğer yeniden başlatma bayrağı varsa veya liste bittiyse baştan başla
        if (shouldRestart || resume >= widget.words.length) {
          // Yeniden başlatma bayrağını temizle
          await p.setBool('a2_known_restart', false);
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
        final savedKnown = p.getStringList('a2_known') ?? [];
        final savedUnknown = p.getStringList('a2_unknown') ?? [];
        final savedProgress = p.getInt('a2_progress');
        final legacy = p.getInt('a2_index');
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
        'a2_index',
        'a2_progress',
        'a2_total',
        'a2_known',
        'a2_unknown',
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
        await p.setBool('a2_unknown_restart', true);
      } else if (widget.isKnownMode) {
        // Bildiklerim modu için yeniden başlatma bayrağını ayarla
        await p.setBool('a2_known_restart', true);
      }
    } catch (_) {}
  }
}
