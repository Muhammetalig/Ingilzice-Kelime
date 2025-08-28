import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class A1Page extends StatefulWidget {
  const A1Page({super.key});

  static final List<Map<String, String>> words = [
    {"en": "a, an", "tr": "bir (belirsiz artikel)"},
    {"en": "about", "tr": "hakkında"},
    {"en": "above", "tr": "üstünde"},
    {"en": "across", "tr": "karşısında"},
    {"en": "action", "tr": "eylem"},
    {"en": "activity", "tr": "aktivite"},
    {"en": "actor", "tr": "aktör"},
    {"en": "actress", "tr": "aktris"},
    {"en": "add", "tr": "eklemek"},
    {"en": "address", "tr": "adres"},
    {"en": "adult", "tr": "yetişkin"},
    {"en": "advice", "tr": "tavsiye"},
    {"en": "afraid", "tr": "korkmuş"},
    {"en": "after", "tr": "sonra"},
    {"en": "afternoon", "tr": "öğleden sonra"},
    {"en": "again", "tr": "tekrar"},
    {"en": "age", "tr": "yaş"},
    {"en": "ago", "tr": "önce"},
    {"en": "air", "tr": "hava"},
    {"en": "airplane", "tr": "uçak"},
    {"en": "airport", "tr": "havaalanı"},
    {"en": "all", "tr": "tüm"},
    {"en": "also", "tr": "ayrıca"},
    {"en": "always", "tr": "her zaman"},
    {"en": "amazing", "tr": "şaşırtıcı"},
    {"en": "and", "tr": "ve"},
    {"en": "angry", "tr": "kızgın"},
    {"en": "animal", "tr": "hayvan"},
    {"en": "another", "tr": "başka"},
    {"en": "answer", "tr": "cevap"},
    {"en": "ant", "tr": "karınca"},
    {"en": "any", "tr": "herhangi"},
    {"en": "apartment", "tr": "daire"},
    {"en": "apple", "tr": "elma"},
    {"en": "April", "tr": "Nisan"},
    {"en": "area", "tr": "alan"},
    {"en": "arm", "tr": "kol"},
    {"en": "around", "tr": "etrafında"},
    {"en": "arrive", "tr": "varmak"},
    {"en": "art", "tr": "sanat"},
    {"en": "ask", "tr": "sormak"},
    {"en": "at", "tr": "-de, -da"},
    {"en": "August", "tr": "Ağustos"},
    {"en": "aunt", "tr": "teyze, hala"},
    {"en": "autumn", "tr": "sonbahar"},
    {"en": "away", "tr": "uzak"},
    {"en": "baby", "tr": "bebek"},
    {"en": "back", "tr": "geri, sırt"},
    {"en": "bad", "tr": "kötü"},
    {"en": "bag", "tr": "çanta"},
    {"en": "ball", "tr": "top"},
    {"en": "banana", "tr": "muz"},
    {"en": "band", "tr": "grup"},
    {"en": "bank", "tr": "banka"},
    {"en": "bath", "tr": "banyo"},
    {"en": "bathroom", "tr": "banyo"},
    {"en": "be", "tr": "olmak"},
    {"en": "beach", "tr": "plaj"},
    {"en": "beautiful", "tr": "güzel"},
    {"en": "because", "tr": "çünkü"},
    {"en": "become", "tr": "olmak"},
    {"en": "bed", "tr": "yatak"},
    {"en": "bedroom", "tr": "yatak odası"},
    {"en": "beer", "tr": "bira"},
    {"en": "before", "tr": "önce"},
    {"en": "begin", "tr": "başlamak"},
    {"en": "behind", "tr": "arkasında"},
    {"en": "believe", "tr": "inanmak"},
    {"en": "bell", "tr": "zil"},
    {"en": "below", "tr": "altında"},
    {"en": "best", "tr": "en iyi"},
    {"en": "better", "tr": "daha iyi"},
    {"en": "between", "tr": "arasında"},
    {"en": "bicycle", "tr": "bisiklet"},
    {"en": "big", "tr": "büyük"},
    {"en": "bird", "tr": "kuş"},
    {"en": "birthday", "tr": "doğum günü"},
    {"en": "black", "tr": "siyah"},
    {"en": "blue", "tr": "mavi"},
    {"en": "boat", "tr": "tekne"},
    {"en": "body", "tr": "vücut"},
    {"en": "book", "tr": "kitap"},
    {"en": "boot", "tr": "bot"},
    {"en": "bored", "tr": "sıkılmış"},
    {"en": "boring", "tr": "sıkıcı"},
    {"en": "born", "tr": "doğmak"},
    {"en": "both", "tr": "her ikisi"},
    {"en": "bottle", "tr": "şişe"},
    {"en": "box", "tr": "kutu"},
    {"en": "boy", "tr": "erkek çocuk"},
    {"en": "bread", "tr": "ekmek"},
    {"en": "break", "tr": "ara, kırmak"},
    {"en": "breakfast", "tr": "kahvaltı"},
    {"en": "bring", "tr": "getirmek"},
    {"en": "brother", "tr": "erkek kardeş"},
    {"en": "brown", "tr": "kahverengi"},
    {"en": "build", "tr": "inşa etmek"},
    {"en": "bus", "tr": "otobüs"},
    {"en": "business", "tr": "iş"},
    {"en": "busy", "tr": "meşgul"},
    {"en": "but", "tr": "ama"},
    {"en": "butter", "tr": "tereyağı"},
    {"en": "buy", "tr": "satın almak"},
    {"en": "by", "tr": "ile"},
    {"en": "bye", "tr": "hoşça kal"},
    {"en": "cafe", "tr": "kafe"},
    {"en": "cake", "tr": "pasta"},
    {"en": "call", "tr": "aramak, çağrı"},
    {"en": "camera", "tr": "kamera"},
    {"en": "can", "tr": "-ebilmek"},
    {"en": "cannot", "tr": "yapamamak"},
    {"en": "capital", "tr": "başkent, sermaye"},
    {"en": "car", "tr": "araba"},
    {"en": "card", "tr": "kart"},
    {"en": "career", "tr": "kariyer"},
    {"en": "carrot", "tr": "havuç"},
    {"en": "carry", "tr": "taşımak"},
    {"en": "cat", "tr": "kedi"},
    {"en": "CD", "tr": "CD"},
    {"en": "cent", "tr": "sent"},
    {"en": "centre", "tr": "merkez"},
    {"en": "century", "tr": "yüzyıl"},
    {"en": "chair", "tr": "sandalye"},
    {"en": "change", "tr": "değişmek, değişim"},
    {"en": "chart", "tr": "çizelge, tablo"},
    {"en": "cheap", "tr": "ucuz"},
    {"en": "check", "tr": "kontrol etmek"},
    {"en": "cheese", "tr": "peynir"},
    {"en": "chicken", "tr": "tavuk"},
    {"en": "child", "tr": "çocuk"},
    {"en": "chocolate", "tr": "çikolata"},
    {"en": "choose", "tr": "seçmek"},
    {"en": "cinema", "tr": "sinema"},
    {"en": "city", "tr": "şehir"},
    {"en": "class", "tr": "sınıf"},
    {"en": "classroom", "tr": "derslik"},
    {"en": "clean", "tr": "temiz, temizlemek"},
    {"en": "climb", "tr": "tırmanmak"},
    {"en": "clock", "tr": "saat"},
    {"en": "close", "tr": "kapatmak"},
    {"en": "clothes", "tr": "giysi"},
    {"en": "club", "tr": "kulüp"},
    {"en": "coat", "tr": "palto"},
    {"en": "coffee", "tr": "kahve"},
    {"en": "cold", "tr": "soğuk"},
    {"en": "college", "tr": "kolej, yüksekokul"},
    {"en": "colour", "tr": "renk"},
    {"en": "come", "tr": "gelmek"},
    {"en": "common", "tr": "yaygın"},
    {"en": "company", "tr": "şirket"},
    {"en": "compare", "tr": "karşılaştırmak"},
    {"en": "complete", "tr": "tamamlamak, eksiksiz"},
    {"en": "computer", "tr": "bilgisayar"},
    {"en": "concert", "tr": "konser"},
    {"en": "conversation", "tr": "konuşma"},
    {"en": "cook", "tr": "yemek pişirmek"},
    {"en": "cooking", "tr": "yemek pişirme"},
    {"en": "cool", "tr": "serin, havalı"},
    {"en": "correct", "tr": "doğru, düzeltmek"},
    {"en": "cost", "tr": "fiyat, maliyet"},
    {"en": "could", "tr": "-ebilirdi"},
    {"en": "country", "tr": "ülke"},
    {"en": "course", "tr": "kurs"},
    {"en": "cousin", "tr": "kuzen"},
    {"en": "cow", "tr": "inek"},
    {"en": "cream", "tr": "krema"},
    {"en": "create", "tr": "yaratmak"},
    {"en": "culture", "tr": "kültür"},
    {"en": "cup", "tr": "fincan"},
    {"en": "customer", "tr": "müşteri"},
    {"en": "cut", "tr": "kesmek"},
    {"en": "dad", "tr": "baba"},
    {"en": "dance", "tr": "dans etmek, dans"},
    {"en": "dancer", "tr": "dansçı"},
    {"en": "dancing", "tr": "dans etme"},
    {"en": "dangerous", "tr": "tehlikeli"},
    {"en": "dark", "tr": "karanlık"},
    {"en": "date", "tr": "tarih, randevu"},
    {"en": "daughter", "tr": "kız evlat"},
    {"en": "day", "tr": "gün"},
    {"en": "dear", "tr": "sevgili"},
    {"en": "December", "tr": "Aralık"},
    {"en": "decide", "tr": "karar vermek"},
    {"en": "delicious", "tr": "lezzetli"},
    {"en": "describe", "tr": "tanımlamak"},
    {"en": "description", "tr": "tanım"},
    {"en": "design", "tr": "tasarlamak, tasarım"},
    {"en": "desk", "tr": "sıra, masa"},
    {"en": "detail", "tr": "ayrıntı"},
    {"en": "dialogue", "tr": "diyalog"},
    {"en": "dictionary", "tr": "sözlük"},
    {"en": "die", "tr": "ölmek"},
    {"en": "diet", "tr": "diyet"},
    {"en": "difference", "tr": "fark"},
    {"en": "different", "tr": "farklı"},
    {"en": "difficult", "tr": "zor"},
    {"en": "dinner", "tr": "akşam yemeği"},
    {"en": "dirty", "tr": "kirli"},
    {"en": "discuss", "tr": "tartışmak"},
    {"en": "dish", "tr": "tabak, yemek"},
    {"en": "do", "tr": "yapmak"},
    {"en": "doctor", "tr": "doktor"},
    {"en": "dog", "tr": "köpek"},
    {"en": "dollar", "tr": "dolar"},
    {"en": "door", "tr": "kapı"},
    {"en": "down", "tr": "aşağı"},
    {"en": "downstairs", "tr": "alt kat"},
    {"en": "draw", "tr": "çizmek"},
    {"en": "dress", "tr": "elbise, giyinmek"},
    {"en": "drink", "tr": "içmek, içecek"},
    {"en": "drive", "tr": "sürmek"},
    {"en": "driver", "tr": "sürücü"},
    {"en": "during", "tr": "sırasında"},
    {"en": "DVD", "tr": "DVD"},
    {"en": "each", "tr": "her biri"},
    {"en": "ear", "tr": "kulak"},
    {"en": "early", "tr": "erken"},
    {"en": "east", "tr": "doğu"},
    {"en": "easy", "tr": "kolay"},
    {"en": "eat", "tr": "yemek"},
    {"en": "egg", "tr": "yumurta"},
    {"en": "eight", "tr": "sekiz"},
    {"en": "eighteen", "tr": "on sekiz"},
    {"en": "eighty", "tr": "seksen"},
    {"en": "elephant", "tr": "fil"},
    {"en": "eleven", "tr": "on bir"},
    {"en": "else", "tr": "başka"},
    {"en": "email", "tr": "e-posta"},
    {"en": "end", "tr": "son, bitirmek"},
    {"en": "enjoy", "tr": "zevk almak"},
    {"en": "enough", "tr": "yeterli"},
    {"en": "euro", "tr": "euro"},
    {"en": "even", "tr": "bile, hatta"},
    {"en": "evening", "tr": "akşam"},
    {"en": "event", "tr": "olay"},
    {"en": "ever", "tr": "hiç"},
    {"en": "every", "tr": "her"},
    {"en": "everybody", "tr": "herkes"},
    {"en": "everyone", "tr": "herkes"},
    {"en": "everything", "tr": "her şey"},
    {"en": "exam", "tr": "sınav"},
    {"en": "example", "tr": "örnek"},
    {"en": "excited", "tr": "heyecanlı"},
    {"en": "exciting", "tr": "heyecan verici"},
    {"en": "exercise", "tr": "egzersiz"},
    {"en": "expensive", "tr": "pahalı"},
    {"en": "explain", "tr": "açıklamak"},
    {"en": "extra", "tr": "ekstra"},
    {"en": "eye", "tr": "göz"},
    {"en": "face", "tr": "yüz"},
    {"en": "fact", "tr": "gerçek"},
    {"en": "fall", "tr": "düşmek"},
    {"en": "false", "tr": "yanlış"},
    {"en": "family", "tr": "aile"},
    {"en": "famous", "tr": "ünlü"},
    {"en": "fantastic", "tr": "harika"},
    {"en": "far", "tr": "uzak"},
    {"en": "farm", "tr": "çiftlik"},
    {"en": "farmer", "tr": "çiftçi"},
    {"en": "fast", "tr": "hızlı"},
    {"en": "fat", "tr": "şişman"},
    {"en": "father", "tr": "baba"},
    {"en": "favourite", "tr": "favori"},
    {"en": "February", "tr": "Şubat"},
    {"en": "feel", "tr": "hissetmek"},
    {"en": "feeling", "tr": "his, duygu"},
    {"en": "festival", "tr": "festival"},
    {"en": "few", "tr": "az"},
    {"en": "fifteen", "tr": "on beş"},
    {"en": "fifth", "tr": "beşinci"},
    {"en": "fifty", "tr": "elli"},
    {"en": "fill", "tr": "doldurmak"},
    {"en": "film", "tr": "film"},
    {"en": "final", "tr": "final, son"},
    {"en": "find", "tr": "bulmak"},
    {"en": "fine", "tr": "iyi, hoş"},
    {"en": "finish", "tr": "bitirmek"},
    {"en": "fire", "tr": "ateş"},
    {"en": "first", "tr": "birinci"},
    {"en": "fish", "tr": "balık"},
    {"en": "five", "tr": "beş"},
    {"en": "flat", "tr": "düz, apartman dairesi"},
    {"en": "flight", "tr": "uçuş"},
    {"en": "floor", "tr": "zemin, kat"},
    {"en": "flower", "tr": "çiçek"},
    {"en": "fly", "tr": "uçmak"},
    {"en": "follow", "tr": "takip etmek"},
    {"en": "food", "tr": "yemek"},
    {"en": "foot", "tr": "ayak"},
    {"en": "football", "tr": "futbol"},
    {"en": "for", "tr": "için"},
    {"en": "forget", "tr": "unutmak"},
    {"en": "form", "tr": "form, biçim"},
    {"en": "forty", "tr": "kırk"},
    {"en": "four", "tr": "dört"},
    {"en": "fourteen", "tr": "on dört"},
    {"en": "fourth", "tr": "dördüncü"},
    {"en": "free", "tr": "özgür, ücretsiz"},
    {"en": "Friday", "tr": "Cuma"},
    {"en": "friend", "tr": "arkadaş"},
    {"en": "friendly", "tr": "arkadaşça"},
    {"en": "from", "tr": "-den, -dan"},
    {"en": "front", "tr": "ön"},
    {"en": "fruit", "tr": "meyve"},
    {"en": "full", "tr": "dolu"},
    {"en": "fun", "tr": "eğlence"},
    {"en": "funny", "tr": "komik"},
    {"en": "future", "tr": "gelecek"},
    {"en": "game", "tr": "oyun"},
    {"en": "garden", "tr": "bahçe"},
    {"en": "geography", "tr": "coğrafya"},
    {"en": "get", "tr": "almak"},
    {"en": "girl", "tr": "kız"},
    {"en": "girlfriend", "tr": "kız arkadaş"},
    {"en": "give", "tr": "vermek"},
    {"en": "glass", "tr": "bardak, cam"},
    {"en": "go", "tr": "gitmek"},
    {"en": "good", "tr": "iyi"},
    {"en": "goodbye", "tr": "hoşça kal"},
    {"en": "grandfather", "tr": "büyükbaba"},
    {"en": "grandmother", "tr": "büyükanne"},
    {"en": "grandparent", "tr": "büyük ebeveyn"},
    {"en": "great", "tr": "harika"},
    {"en": "green", "tr": "yeşil"},
    {"en": "grey", "tr": "gri"},
    {"en": "group", "tr": "grup"},
    {"en": "grow", "tr": "büyümek"},
    {"en": "guess", "tr": "tahmin etmek"},
    {"en": "guitar", "tr": "gitar"},
    {"en": "gym", "tr": "spor salonu"},
    {"en": "hair", "tr": "saç"},
    {"en": "half", "tr": "yarım"},
    {"en": "hand", "tr": "el"},
    {"en": "happen", "tr": "olmak, meydana gelmek"},
    {"en": "happy", "tr": "mutlu"},
    {"en": "hard", "tr": "zor, sıkı"},
    {"en": "hat", "tr": "şapka"},
    {"en": "hate", "tr": "nefret etmek"},
    {"en": "have", "tr": "sahip olmak"},
    {"en": "have to", "tr": "zorunda olmak"},
    {"en": "he", "tr": "o (erkek)"},
    {"en": "head", "tr": "baş"},
    {"en": "health", "tr": "sağlık"},
    {"en": "healthy", "tr": "sağlıklı"},
    {"en": "hear", "tr": "duymak"},
    {"en": "hello", "tr": "merhaba"},
    {"en": "help", "tr": "yardım etmek"},
    {"en": "her", "tr": "onun, ona"},
    {"en": "here", "tr": "burada"},
    {"en": "hey", "tr": "hey"},
    {"en": "hi", "tr": "selam"},
    {"en": "high", "tr": "yüksek"},
    {"en": "him", "tr": "onu, ona"},
    {"en": "his", "tr": "onun"},
    {"en": "history", "tr": "tarih"},
    {"en": "hobby", "tr": "hobi"},
    {"en": "holiday", "tr": "tatil"},
    {"en": "home", "tr": "ev"},
    {"en": "homework", "tr": "ödev"},
    {"en": "hope", "tr": "umut etmek"},
    {"en": "horse", "tr": "at"},
    {"en": "hospital", "tr": "hastane"},
    {"en": "hot", "tr": "sıcak"},
    {"en": "hotel", "tr": "otel"},
    {"en": "hour", "tr": "saat"},
    {"en": "house", "tr": "ev"},
    {"en": "how", "tr": "nasıl"},
    {"en": "however", "tr": "ancak"},
    {"en": "hundred", "tr": "yüz"},
    {"en": "hungry", "tr": "aç"},
    {"en": "husband", "tr": "koca"},
    {"en": "I", "tr": "ben"},
    {"en": "ice", "tr": "buz"},
    {"en": "ice cream", "tr": "dondurma"},
    {"en": "idea", "tr": "fikir"},
    {"en": "if", "tr": "eğer"},
    {"en": "imagine", "tr": "hayal etmek"},
    {"en": "important", "tr": "önemli"},
    {"en": "improve", "tr": "geliştirmek"},
    {"en": "in", "tr": "içinde"},
    {"en": "include", "tr": "içermek"},
    {"en": "information", "tr": "bilgi"},
    {"en": "interest", "tr": "ilgi"},
    {"en": "interested", "tr": "ilgili"},
    {"en": "interesting", "tr": "ilginç"},
    {"en": "internet", "tr": "internet"},
    {"en": "interview", "tr": "mülakat, röportaj"},
    {"en": "into", "tr": "içine"},
    {"en": "introduce", "tr": "tanıtmak"},
    {"en": "island", "tr": "ada"},
    {"en": "it", "tr": "o (cansız/ hayvan)"},
    {"en": "its", "tr": "onun"},
    {"en": "jacket", "tr": "ceket"},
    {"en": "January", "tr": "Ocak"},
    {"en": "jeans", "tr": "kot pantolon"},
    {"en": "job", "tr": "iş"},
    {"en": "join", "tr": "katılmak"},
    {"en": "journey", "tr": "seyahat"},
    {"en": "juice", "tr": "meyve suyu"},
    {"en": "July", "tr": "Temmuz"},
    {"en": "June", "tr": "Haziran"},
    {"en": "just", "tr": "sadece"},
    {"en": "keep", "tr": "tutmak"},
    {"en": "key", "tr": "anahtar"},
    {"en": "kilometre", "tr": "kilometre"},
    {"en": "kind", "tr": "tür"},
    {"en": "kitchen", "tr": "mutfak"},
    {"en": "know", "tr": "bilmek"},
    {"en": "land", "tr": "arazi"},
    {"en": "language", "tr": "dil"},
    {"en": "large", "tr": "geniş"},
    {"en": "last", "tr": "son"},
    {"en": "late", "tr": "geç"},
    {"en": "later", "tr": "daha sonra"},
    {"en": "laugh", "tr": "gülmek"},
    {"en": "learn", "tr": "öğrenmek"},
    {"en": "leave", "tr": "ayrılmak"},
    {"en": "left", "tr": "sol"},
    {"en": "leg", "tr": "bacak"},
    {"en": "lesson", "tr": "ders"},
    {"en": "let", "tr": "izin vermek"},
    {"en": "letter", "tr": "mektup, harf"},
    {"en": "library", "tr": "kütüphane"},
    {"en": "lie", "tr": "yatmak, yalan söylemek"},
    {"en": "life", "tr": "hayat"},
    {"en": "light", "tr": "ışık"},
    {"en": "like", "tr": "sevmek, gibi"},
    {"en": "line", "tr": "çizgi, satır"},
    {"en": "lion", "tr": "aslan"},
    {"en": "list", "tr": "liste"},
    {"en": "listen", "tr": "dinlemek"},
    {"en": "little", "tr": "küçük"},
    {"en": "live", "tr": "yaşamak"},
    {"en": "local", "tr": "yerel"},
    {"en": "long", "tr": "uzun"},
    {"en": "look", "tr": "bakmak"},
    {"en": "lose", "tr": "kaybetmek"},
    {"en": "lot", "tr": "çok"},
    {"en": "love", "tr": "aşk, sevmek"},
    {"en": "lunch", "tr": "öğle yemeği"},
    {"en": "machine", "tr": "makine"},
    {"en": "magazine", "tr": "dergi"},
    {"en": "main", "tr": "ana"},
    {"en": "make", "tr": "yapmak"},
    {"en": "man", "tr": "adam"},
    {"en": "many", "tr": "birçok"},
    {"en": "map", "tr": "harita"},
    {"en": "March", "tr": "Mart"},
    {"en": "market", "tr": "pazar"},
    {"en": "married", "tr": "evli"},
    {"en": "match", "tr": "maç, eşleşmek"},
    {"en": "May", "tr": "Mayıs"},
    {"en": "maybe", "tr": "belki"},
    {"en": "me", "tr": "beni, bana"},
    {"en": "meal", "tr": "öğün"},
    {"en": "mean", "tr": "anlamına gelmek"},
    {"en": "meaning", "tr": "anlam"},
    {"en": "meat", "tr": "et"},
    {"en": "meet", "tr": "buluşmak"},
    {"en": "meeting", "tr": "toplantı"},
    {"en": "member", "tr": "üye"},
    {"en": "menu", "tr": "menü"},
    {"en": "message", "tr": "mesaj"},
    {"en": "metre", "tr": "metre"},
    {"en": "midnight", "tr": "gece yarısı"},
    {"en": "mile", "tr": "mil"},
    {"en": "milk", "tr": "süt"},
    {"en": "million", "tr": "milyon"},
    {"en": "minute", "tr": "dakika"},
    {"en": "miss", "tr": "özlemek, ıskalamak"},
    {"en": "mistake", "tr": "hata"},
    {"en": "model", "tr": "model"},
    {"en": "modern", "tr": "modern"},
    {"en": "moment", "tr": "an"},
    {"en": "Monday", "tr": "Pazartesi"},
    {"en": "money", "tr": "para"},
    {"en": "month", "tr": "ay"},
    {"en": "more", "tr": "daha fazla"},
    {"en": "morning", "tr": "sabah"},
    {"en": "most", "tr": "en çok"},
    {"en": "mother", "tr": "anne"},
    {"en": "mountain", "tr": "dağ"},
    {"en": "mouse", "tr": "fare"},
    {"en": "mouth", "tr": "ağız"},
    {"en": "move", "tr": "hareket etmek"},
    {"en": "movie", "tr": "film"},
    {"en": "much", "tr": "çok"},
    {"en": "mum", "tr": "anne"},
    {"en": "museum", "tr": "müze"},
    {"en": "music", "tr": "müzik"},
    {"en": "must", "tr": "zorunda"},
    {"en": "my", "tr": "benim"},
    {"en": "name", "tr": "isim"},
    {"en": "natural", "tr": "doğal"},
    {"en": "near", "tr": "yakın"},
    {"en": "need", "tr": "ihtiyaç duymak"},
    {"en": "negative", "tr": "olumsuz"},
    {"en": "neighbour", "tr": "komşu"},
    {"en": "never", "tr": "asla"},
    {"en": "new", "tr": "yeni"},
    {"en": "news", "tr": "haberler"},
    {"en": "newspaper", "tr": "gazete"},
    {"en": "next", "tr": "sonraki"},
    {"en": "next to", "tr": "yanında"},
    {"en": "nice", "tr": "güzel"},
    {"en": "night", "tr": "gece"},
    {"en": "nine", "tr": "dokuz"},
    {"en": "nineteen", "tr": "on dokuz"},
    {"en": "ninety", "tr": "doksan"},
    {"en": "no", "tr": "hayır"},
    {"en": "no one", "tr": "hiç kimse"},
    {"en": "nobody", "tr": "hiç kimse"},
    {"en": "north", "tr": "kuzey"},
    {"en": "nose", "tr": "burun"},
    {"en": "not", "tr": "değil"},
    {"en": "note", "tr": "not, not etmek"},
    {"en": "nothing", "tr": "hiçbir şey"},
    {"en": "November", "tr": "Kasım"},
    {"en": "now", "tr": "şimdi"},
    {"en": "number", "tr": "sayı"},
    {"en": "nurse", "tr": "hemşire"},
    {"en": "object", "tr": "nesne"},
    {"en": "o'clock", "tr": "saat"},
    {"en": "October", "tr": "Ekim"},
    {"en": "of", "tr": "-ın, -in"},
    {"en": "off", "tr": "kapalı"},
    {"en": "office", "tr": "ofis"},
    {"en": "often", "tr": "sık sık"},
    {"en": "oh", "tr": "oh"},
    {"en": "OK", "tr": "tamam"},
    {"en": "old", "tr": "eski, yaşlı"},
    {"en": "on", "tr": "üzerinde"},
    {"en": "once", "tr": "bir kere"},
    {"en": "one", "tr": "bir"},
    {"en": "onion", "tr": "soğan"},
    {"en": "online", "tr": "çevrimiçi"},
    {"en": "only", "tr": "sadece"},
    {"en": "open", "tr": "açmak, açık"},
    {"en": "opinion", "tr": "fikir"},
    {"en": "opposite", "tr": "karşısında, zıt"},
    {"en": "or", "tr": "veya"},
    {"en": "orange", "tr": "portakal, turuncu"},
    {"en": "order", "tr": "sipariş, düzen"},
    {"en": "other", "tr": "diğer"},
    {"en": "our", "tr": "bizim"},
    {"en": "out", "tr": "dışarı"},
    {"en": "outside", "tr": "dışında"},
    {"en": "over", "tr": "üzerinde"},
    {"en": "own", "tr": "kendi"},
    {"en": "page", "tr": "sayfa"},
    {"en": "paint", "tr": "boya, boyamak"},
    {"en": "painting", "tr": "resim"},
    {"en": "pair", "tr": "çift"},
    {"en": "paper", "tr": "kağıt"},
    {"en": "paragraph", "tr": "paragraf"},
    {"en": "parent", "tr": "ebeveyn"},
    {"en": "park", "tr": "park"},
    {"en": "part", "tr": "parça"},
    {"en": "partner", "tr": "eş, ortak"},
    {"en": "party", "tr": "parti"},
    {"en": "passport", "tr": "pasaport"},
    {"en": "past", "tr": "geçmiş"},
    {"en": "pay", "tr": "ödemek"},
    {"en": "pen", "tr": "kalem"},
    {"en": "pencil", "tr": "kurşun kalem"},
    {"en": "people", "tr": "insanlar"},
    {"en": "pepper", "tr": "biber"},
    {"en": "perfect", "tr": "mükemmel"},
    {"en": "period", "tr": "dönem"},
    {"en": "person", "tr": "kişi"},
    {"en": "personal", "tr": "kişisel"},
    {"en": "phone", "tr": "telefon"},
    {"en": "photo", "tr": "fotoğraf"},
    {"en": "photograph", "tr": "fotoğraf"},
    {"en": "phrase", "tr": "ifade"},
    {"en": "piano", "tr": "piyano"},
    {"en": "picture", "tr": "resim"},
    {"en": "piece", "tr": "parça"},
    {"en": "pig", "tr": "domuz"},
    {"en": "pink", "tr": "pembe"},
    {"en": "place", "tr": "yer"},
    {"en": "plan", "tr": "plan"},
    {"en": "plane", "tr": "uçak"},
    {"en": "plant", "tr": "bitki"},
    {"en": "play", "tr": "oynamak"},
    {"en": "player", "tr": "oyuncu"},
    {"en": "please", "tr": "lütfen"},
    {"en": "point", "tr": "nokta"},
    {"en": "police", "tr": "polis"},
    {"en": "policeman", "tr": "polis memuru"},
    {"en": "pool", "tr": "havuz"},
    {"en": "poor", "tr": "fakir"},
    {"en": "popular", "tr": "popüler"},
    {"en": "positive", "tr": "pozitif"},
    {"en": "possible", "tr": "mümkün"},
    {"en": "post", "tr": "posta, göndermek"},
    {"en": "potato", "tr": "patates"},
    {"en": "pound", "tr": "sterlin, pound"},
    {"en": "practice", "tr": "pratik"},
    {"en": "practise", "tr": "pratik yapmak"},
    {"en": "prefer", "tr": "tercih etmek"},
    {"en": "prepare", "tr": "hazırlamak"},
    {"en": "present", "tr": "mevcut, hediye"},
    {"en": "pretty", "tr": "güzel"},
    {"en": "price", "tr": "fiyat"},
    {"en": "probably", "tr": "muhtemelen"},
    {"en": "problem", "tr": "sorun"},
    {"en": "product", "tr": "ürün"},
    {"en": "programme", "tr": "program"},
    {"en": "project", "tr": "proje"},
    {"en": "purple", "tr": "mor"},
    {"en": "put", "tr": "koymak"},
    {"en": "quarter", "tr": "çeyrek"},
    {"en": "question", "tr": "soru"},
    {"en": "quick", "tr": "hızlı"},
    {"en": "quickly", "tr": "hızlıca"},
    {"en": "quiet", "tr": "sessiz"},
    {"en": "quite", "tr": "oldukça"},
    {"en": "radio", "tr": "radyo"},
    {"en": "rain", "tr": "yağmur"},
    {"en": "read", "tr": "okumak"},
    {"en": "reader", "tr": "okuyucu"},
    {"en": "reading", "tr": "okuma"},
    {"en": "ready", "tr": "hazır"},
    {"en": "real", "tr": "gerçek"},
    {"en": "really", "tr": "gerçekten"},
    {"en": "reason", "tr": "sebep"},
    {"en": "red", "tr": "kırmızı"},
    {"en": "relax", "tr": "rahatlamak"},
    {"en": "remember", "tr": "hatırlamak"},
    {"en": "repeat", "tr": "tekrarlamak"},
    {"en": "report", "tr": "rapor"},
    {"en": "restaurant", "tr": "restoran"},
    {"en": "result", "tr": "sonuç"},
    {"en": "return", "tr": "dönmek"},
    {"en": "rice", "tr": "pirinç"},
    {"en": "rich", "tr": "zengin"},
    {"en": "ride", "tr": "binmek"},
    {"en": "right", "tr": "doğru, sağ"},
    {"en": "river", "tr": "nehir"},
    {"en": "road", "tr": "yol"},
    {"en": "room", "tr": "oda"},
    {"en": "routine", "tr": "rutin"},
    {"en": "rule", "tr": "kural"},
    {"en": "run", "tr": "koşmak"},
    {"en": "sad", "tr": "üzgün"},
    {"en": "salad", "tr": "salata"},
    {"en": "salt", "tr": "tuz"},
    {"en": "same", "tr": "aynı"},
    {"en": "sandwich", "tr": "sandviç"},
    {"en": "Saturday", "tr": "Cumartesi"},
    {"en": "say", "tr": "söylemek"},
    {"en": "school", "tr": "okul"},
    {"en": "science", "tr": "bilim"},
    {"en": "scientist", "tr": "bilim insanı"},
    {"en": "sea", "tr": "deniz"},
    {"en": "second", "tr": "ikinci"},
    {"en": "section", "tr": "bölüm"},
    {"en": "see", "tr": "görmek"},
    {"en": "sell", "tr": "satmak"},
    {"en": "send", "tr": "göndermek"},
    {"en": "sentence", "tr": "cümle"},
    {"en": "September", "tr": "Eylül"},
    {"en": "seven", "tr": "yedi"},
    {"en": "seventeen", "tr": "on yedi"},
    {"en": "seventy", "tr": "yetmiş"},
    {"en": "share", "tr": "paylaşmak"},
    {"en": "she", "tr": "o (kadın)"},
    {"en": "sheep", "tr": "koyun"},
    {"en": "shirt", "tr": "gömlek"},
    {"en": "shoe", "tr": "ayakkabı"},
    {"en": "shop", "tr": "mağaza, alışveriş yapmak"},
    {"en": "shopping", "tr": "alışveriş"},
    {"en": "short", "tr": "kısa"},
    {"en": "should", "tr": "-meli, -malı"},
    {"en": "show", "tr": "göstermek, gösteri"},
    {"en": "shower", "tr": "duş"},
    {"en": "sick", "tr": "hasta"},
    {"en": "similar", "tr": "benzer"},
    {"en": "sing", "tr": "şarkı söylemek"},
    {"en": "singer", "tr": "şarkıcı"},
    {"en": "sister", "tr": "kız kardeş"},
    {"en": "sit", "tr": "oturmak"},
    {"en": "situation", "tr": "durum"},
    {"en": "six", "tr": "altı"},
    {"en": "sixteen", "tr": "on altı"},
    {"en": "sixty", "tr": "altmış"},
    {"en": "skill", "tr": "beceri"},
    {"en": "skirt", "tr": "etek"},
    {"en": "sleep", "tr": "uyumak"},
    {"en": "slow", "tr": "yavaş"},
    {"en": "small", "tr": "küçük"},
    {"en": "snake", "tr": "yılan"},
    {"en": "snow", "tr": "kar"},
    {"en": "so", "tr": "bu yüzden, böylece"},
    {"en": "some", "tr": "birkaç, bazı"},
    {"en": "somebody", "tr": "birisi"},
    {"en": "someone", "tr": "birisi"},
    {"en": "something", "tr": "bir şey"},
    {"en": "sometimes", "tr": "bazen"},
    {"en": "son", "tr": "oğul"},
    {"en": "song", "tr": "şarkı"},
    {"en": "soon", "tr": "yakında"},
    {"en": "sorry", "tr": "üzgün"},
    {"en": "sound", "tr": "ses"},
    {"en": "soup", "tr": "çorba"},
    {"en": "south", "tr": "güney"},
    {"en": "space", "tr": "uzay, boşluk"},
    {"en": "speak", "tr": "konuşmak"},
    {"en": "special", "tr": "özel"},
    {"en": "spell", "tr": "hecelemek"},
    {"en": "spelling", "tr": "yazım"},
    {"en": "spend", "tr": "harcamak"},
    {"en": "sport", "tr": "spor"},
    {"en": "spring", "tr": "ilkbahar"},
    {"en": "stand", "tr": "ayakta durmak"},
    {"en": "star", "tr": "yıldız"},
    {"en": "start", "tr": "başlamak"},
    {"en": "statement", "tr": "ifade"},
    {"en": "station", "tr": "istasyon"},
    {"en": "stay", "tr": "kalmak"},
    {"en": "still", "tr": "hala"},
    {"en": "stop", "tr": "durmak"},
    {"en": "story", "tr": "hikaye"},
    {"en": "street", "tr": "sokak"},
    {"en": "strong", "tr": "güçlü"},
    {"en": "student", "tr": "öğrenci"},
    {"en": "study", "tr": "çalışmak"},
    {"en": "style", "tr": "stil"},
    {"en": "subject", "tr": "konu"},
    {"en": "success", "tr": "başarı"},
    {"en": "sugar", "tr": "şeker"},
    {"en": "summer", "tr": "yaz"},
    {"en": "sun", "tr": "güneş"},
    {"en": "Sunday", "tr": "Pazar"},
    {"en": "supermarket", "tr": "süpermarket"},
    {"en": "sure", "tr": "emin"},
    {"en": "sweater", "tr": "kazak"},
    {"en": "swim", "tr": "yüzmek"},
    {"en": "swimming", "tr": "yüzme"},
    {"en": "table", "tr": "masa"},
    {"en": "take", "tr": "almak"},
    {"en": "talk", "tr": "konuşmak"},
    {"en": "tall", "tr": "uzun, uzun boylu"},
    {"en": "taxi", "tr": "taksi"},
    {"en": "tea", "tr": "çay"},
    {"en": "teach", "tr": "öğretmek"},
    {"en": "teacher", "tr": "öğretmen"},
    {"en": "team", "tr": "takım"},
    {"en": "teenager", "tr": "ergen"},
    {"en": "telephone", "tr": "telefon"},
    {"en": "television", "tr": "televizyon"},
    {"en": "tell", "tr": "söylemek"},
    {"en": "ten", "tr": "on"},
    {"en": "tennis", "tr": "tenis"},
    {"en": "terrible", "tr": "korkunç"},
    {"en": "test", "tr": "test"},
    {"en": "text", "tr": "metin"},
    {"en": "than", "tr": "-den, -dan"},
    {"en": "thank", "tr": "teşekkür etmek"},
    {"en": "thanks", "tr": "teşekkürler"},
    {"en": "that", "tr": "şu"},
    {"en": "the", "tr": "belirli artikel"},
    {"en": "theatre", "tr": "tiyatro"},
    {"en": "their", "tr": "onların"},
    {"en": "them", "tr": "onları"},
    {"en": "then", "tr": "sonra"},
    {"en": "there", "tr": "orada"},
    {"en": "they", "tr": "onlar"},
    {"en": "thing", "tr": "şey"},
    {"en": "think", "tr": "düşünmek"},
    {"en": "third", "tr": "üçüncü"},
    {"en": "thirsty", "tr": "susamış"},
    {"en": "thirteen", "tr": "on üç"},
    {"en": "thirty", "tr": "otuz"},
    {"en": "this", "tr": "bu"},
    {"en": "thousand", "tr": "bin"},
    {"en": "three", "tr": "üç"},
    {"en": "through", "tr": "içinden"},
    {"en": "Thursday", "tr": "Perşembe"},
    {"en": "ticket", "tr": "bilet"},
    {"en": "time", "tr": "zaman"},
    {"en": "tired", "tr": "yorgun"},
    {"en": "title", "tr": "başlık"},
    {"en": "to", "tr": "-e, -a"},
    {"en": "today", "tr": "bugün"},
    {"en": "together", "tr": "birlikte"},
    {"en": "toilet", "tr": "tuvalet"},
    {"en": "tomato", "tr": "domates"},
    {"en": "tomorrow", "tr": "yarın"},
    {"en": "tonight", "tr": "bu gece"},
    {"en": "too", "tr": "çok, ayrıca"},
    {"en": "tooth", "tr": "diş"},
    {"en": "topic", "tr": "konu"},
    {"en": "tourist", "tr": "turist"},
    {"en": "town", "tr": "kasaba"},
    {"en": "traffic", "tr": "trafik"},
    {"en": "train", "tr": "tren"},
    {"en": "travel", "tr": "seyahat etmek, seyahat"},
    {"en": "tree", "tr": "ağaç"},
    {"en": "trip", "tr": "gezi"},
    {"en": "trousers", "tr": "pantolon"},
    {"en": "true", "tr": "doğru"},
    {"en": "try", "tr": "denemek"},
    {"en": "T-shirt", "tr": "tişört"},
    {"en": "Tuesday", "tr": "Salı"},
    {"en": "turn", "tr": "dönmek, sıra"},
    {"en": "TV", "tr": "televizyon"},
    {"en": "twelve", "tr": "on iki"},
    {"en": "twenty", "tr": "yirmi"},
    {"en": "twice", "tr": "iki kez"},
    {"en": "two", "tr": "iki"},
    {"en": "type", "tr": "tür, tip"},
    {"en": "umbrella", "tr": "şemsiye"},
    {"en": "uncle", "tr": "amca, dayı"},
    {"en": "under", "tr": "altında"},
    {"en": "understand", "tr": "anlamak"},
    {"en": "university", "tr": "üniversite"},
    {"en": "until", "tr": "-e kadar"},
    {"en": "up", "tr": "yukarı"},
    {"en": "upstairs", "tr": "üst kat"},
    {"en": "us", "tr": "bizi"},
    {"en": "use", "tr": "kullanmak"},
    {"en": "useful", "tr": "yararlı"},
    {"en": "usually", "tr": "genellikle"},
    {"en": "vacation", "tr": "tatil"},
    {"en": "vegetable", "tr": "sebze"},
    {"en": "very", "tr": "çok"},
    {"en": "video", "tr": "video"},
    {"en": "village", "tr": "köy"},
    {"en": "visit", "tr": "ziyaret etmek, ziyaret"},
    {"en": "visitor", "tr": "ziyaretçi"},
    {"en": "wait", "tr": "beklemek"},
    {"en": "waiter", "tr": "garson"},
    {"en": "wake", "tr": "uyanmak"},
    {"en": "walk", "tr": "yürümek"},
    {"en": "wall", "tr": "duvar"},
    {"en": "want", "tr": "istemek"},
    {"en": "warm", "tr": "ılık"},
    {"en": "wash", "tr": "yıkamak"},
    {"en": "watch", "tr": "izlemek, saat"},
    {"en": "water", "tr": "su"},
    {"en": "way", "tr": "yol"},
    {"en": "we", "tr": "biz"},
    {"en": "wear", "tr": "giymek"},
    {"en": "weather", "tr": "hava durumu"},
    {"en": "website", "tr": "web sitesi"},
    {"en": "Wednesday", "tr": "Çarşamba"},
    {"en": "week", "tr": "hafta"},
    {"en": "weekend", "tr": "hafta sonu"},
    {"en": "welcome", "tr": "hoş geldin"},
    {"en": "well", "tr": "iyi"},
    {"en": "west", "tr": "batı"},
    {"en": "what", "tr": "ne"},
    {"en": "when", "tr": "ne zaman"},
    {"en": "where", "tr": "nerede"},
    {"en": "which", "tr": "hangi"},
    {"en": "white", "tr": "beyaz"},
    {"en": "who", "tr": "kim"},
    {"en": "why", "tr": "neden"},
    {"en": "wife", "tr": "eş, karı"},
    {"en": "will", "tr": "-ecek, -acak"},
    {"en": "win", "tr": "kazanmak"},
    {"en": "window", "tr": "pencere"},
    {"en": "wine", "tr": "şarap"},
    {"en": "winter", "tr": "kış"},
    {"en": "with", "tr": "ile"},
    {"en": "without", "tr": "-sız, -siz"},
    {"en": "woman", "tr": "kadın"},
    {"en": "wonderful", "tr": "harika"},
    {"en": "word", "tr": "kelime"},
    {"en": "work", "tr": "çalışmak, iş"},
    {"en": "worker", "tr": "işçi"},
    {"en": "world", "tr": "dünya"},
    {"en": "would", "tr": "-ecekti"},
    {"en": "write", "tr": "yazmak"},
    {"en": "writer", "tr": "yazar"},
    {"en": "writing", "tr": "yazma"},
    {"en": "wrong", "tr": "yanlış"},
    {"en": "yeah", "tr": "evet"},
    {"en": "year", "tr": "yıl"},
    {"en": "yellow", "tr": "sarı"},
    {"en": "yes", "tr": "evet"},
    {"en": "yesterday", "tr": "dün"},
    {"en": "you", "tr": "sen, siz"},
    {"en": "young", "tr": "genç"},
    {"en": "your", "tr": "senin, sizin"},
    {"en": "yourself", "tr": "kendin"},
  ];

  @override
  State<A1Page> createState() => _A1PageState();
}

class _A1PageState extends State<A1Page> {
  bool showWords = false;
  int? _savedIndex; // sonraki kart
  int _savedKnown = 0;
  int _savedUnknown = 0;
  int _total = A1Page.words.length;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final p = await SharedPreferences.getInstance();
      final prog = p.getInt('a1_progress');
      final legacy = p.getInt('a1_index');
      final known = p.getStringList('a1_known') ?? [];
      final unknown = p.getStringList('a1_unknown') ?? [];

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
      MaterialPageRoute(builder: (_) => A1StudyPage(words: A1Page.words)),
    );
    if (mounted) _load();
  }

  Future<void> _openKnownStudy() async {
    final p = await SharedPreferences.getInstance();
    final knownWords = p.getStringList('a1_known') ?? [];
    if (knownWords.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Bildiğiniz kelime bulunmuyor')),
      );
      return;
    }

    final knownWordList = A1Page.words
        .where((w) => knownWords.contains(w['en']))
        .toList();

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => A1StudyPage(
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
    final unknownWords = p.getStringList('a1_unknown') ?? [];
    if (unknownWords.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Bilmediğiniz kelime bulunmuyor')),
      );
      return;
    }

    final unknownWordList = A1Page.words
        .where((w) => unknownWords.contains(w['en']))
        .toList();

    // 20 kelime sınırı kaldırıldı - tüm bilmediklerim kelimeleri çalışılabilir
    final limitedUnknownWords = unknownWordList;

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => A1StudyPage(
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
      await p.remove('a1_index');
      await p.remove('a1_progress');
      await p.remove('a1_total');
      await p.remove('a1_known');
      await p.remove('a1_unknown');

      // Sayfayı yeniden yükle
      if (mounted) _load();

      // Çalışma sayfasını aç
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => A1StudyPage(words: A1Page.words, isReviewMode: true),
        ),
      );
      if (mounted) _load();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('A1 Kelimeleri'),
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
            itemCount: A1Page.words.length,
            separatorBuilder: (_, __) => const SizedBox(height: 6),
            itemBuilder: (c, i) {
              final w = A1Page.words[i];
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

class A1StudyPage extends StatefulWidget {
  final List<Map<String, String>> words;
  final bool isReviewMode;
  final bool isUnknownMode;
  final bool isKnownMode;
  const A1StudyPage({
    super.key,
    required this.words,
    this.isReviewMode = false,
    this.isUnknownMode = false,
    this.isKnownMode = false,
  });
  @override
  State<A1StudyPage> createState() => _A1StudyPageState();
}

class _A1StudyPageState extends State<A1StudyPage>
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
              final currentKnown = p.getStringList('a1_known') ?? [];
              if (!currentKnown.contains(w['en'])) {
                final updatedKnown = [...currentKnown, w['en']!];
                await p.setStringList('a1_known', updatedKnown);
              }
            }

            // Bilmediklerim modunda sola kaydırıldığında ana bildiklerim listesine ekle ve bilmediklerim listesinden çıkar
            if (widget.isUnknownMode) {
              final p = await SharedPreferences.getInstance();

              // Ana bildiklerim listesine ekle
              final currentKnown = p.getStringList('a1_known') ?? [];
              if (!currentKnown.contains(w['en'])) {
                final updatedKnown = [...currentKnown, w['en']!];
                await p.setStringList('a1_known', updatedKnown);
              }

              // Ana bilmediklerim listesinden çıkar
              final currentUnknown = p.getStringList('a1_unknown') ?? [];
              final updatedUnknown = currentUnknown
                  .where((word) => word != w['en'])
                  .toList();
              await p.setStringList('a1_unknown', updatedUnknown);
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
              final currentUnknown = p.getStringList('a1_unknown') ?? [];
              if (!currentUnknown.contains(w['en'])) {
                final updatedUnknown = [...currentUnknown, w['en']!];
                await p.setStringList('a1_unknown', updatedUnknown);
              }
            }

            // Bildiklerim modunda sağa kaydırıldığında ana bilmediklerim listesine ekle ve bildiklerim listesinden çıkar
            if (widget.isKnownMode) {
              final p = await SharedPreferences.getInstance();

              // Ana bilmediklerim listesine ekle
              final currentUnknown = p.getStringList('a1_unknown') ?? [];
              if (!currentUnknown.contains(w['en'])) {
                final updatedUnknown = [...currentUnknown, w['en']!];
                await p.setStringList('a1_unknown', updatedUnknown);
              }

              // Ana bildiklerim listesinden çıkar
              final currentKnown = p.getStringList('a1_known') ?? [];
              final updatedKnown = currentKnown
                  .where((word) => word != w['en'])
                  .toList();
              await p.setStringList('a1_known', updatedKnown);
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
              LayoutBuilder(
                builder: (context, constraints) {
                  double screenWidth = constraints.maxWidth;
                  double screenHeight = constraints.maxHeight;

                  // Responsive boyutlar
                  double statsFontSize =
                      screenWidth * 0.03; // Ekran genişliğinin %3'ü
                  double spacing =
                      screenHeight * 0.02; // Ekran yüksekliğinin %2'si

                  // Minimum ve maksimum boyutlar
                  if (statsFontSize < 10) statsFontSize = 10;
                  if (statsFontSize > 16) statsFontSize = 16;
                  if (spacing < 16) spacing = 16;
                  if (spacing > 32) spacing = 32;

                  return Column(
                    children: [
                      Text(
                        'Biliyor: ${known.length}  Bilmiyor: ${unknown.length}',
                        style: TextStyle(
                          fontSize: statsFontSize,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: spacing),
                    ],
                  );
                },
              ),
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
                                    child: LayoutBuilder(
                                      builder: (context, constraints) {
                                        double cardWidth = constraints.maxWidth;
                                        double cardHeight =
                                            constraints.maxHeight;

                                        // Responsive boyutlar
                                        double englishFontSize =
                                            cardWidth *
                                            0.08; // Kart genişliğinin %8'i
                                        double turkishFontSize =
                                            cardWidth *
                                            0.06; // Kart genişliğinin %6'sı
                                        double instructionFontSize =
                                            cardWidth *
                                            0.035; // Kart genişliğinin %3.5'i
                                        double spacing =
                                            cardHeight *
                                            0.02; // Kart yüksekliğinin %2'si

                                        // Minimum ve maksimum boyutlar
                                        if (englishFontSize < 24)
                                          englishFontSize = 24;
                                        if (englishFontSize > 48)
                                          englishFontSize = 48;
                                        if (turkishFontSize < 18)
                                          turkishFontSize = 18;
                                        if (turkishFontSize > 36)
                                          turkishFontSize = 36;
                                        if (instructionFontSize < 10)
                                          instructionFontSize = 10;
                                        if (instructionFontSize > 16)
                                          instructionFontSize = 16;
                                        if (spacing < 8) spacing = 8;
                                        if (spacing > 20) spacing = 20;

                                        return showMeaning
                                            ? Column(
                                                key: const ValueKey('m'),
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    word['en']!,
                                                    style: TextStyle(
                                                      fontSize: englishFontSize,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  SizedBox(height: spacing),
                                                  Text(
                                                    word['tr']!,
                                                    style: TextStyle(
                                                      fontSize: turkishFontSize,
                                                      color: Colors.grey,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  SizedBox(
                                                    height: spacing * 0.7,
                                                  ),
                                                  Text(
                                                    'Sürükle: Sola=Biliyorum  Sağa=Bilmiyorum',
                                                    style: TextStyle(
                                                      fontSize:
                                                          instructionFontSize,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            : LayoutBuilder(
                                                builder: (context, constraints) {
                                                  double cardWidth =
                                                      constraints.maxWidth;
                                                  double englishFontSize =
                                                      cardWidth *
                                                      0.1; // Kart genişliğinin %10'u

                                                  // Minimum ve maksimum boyutlar
                                                  if (englishFontSize < 30)
                                                    englishFontSize = 30;
                                                  if (englishFontSize > 60)
                                                    englishFontSize = 60;

                                                  return Text(
                                                    word['en']!,
                                                    key: const ValueKey('w'),
                                                    style: TextStyle(
                                                      fontSize: englishFontSize,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  );
                                                },
                                              );
                                      },
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
              LayoutBuilder(
                builder: (context, constraints) {
                  double screenWidth = constraints.maxWidth;
                  double instructionFontSize =
                      screenWidth * 0.035; // Ekran genişliğinin %3.5'i
                  double spacing =
                      screenWidth * 0.02; // Ekran genişliğinin %2'si

                  // Minimum ve maksimum boyutlar
                  if (instructionFontSize < 12) instructionFontSize = 12;
                  if (instructionFontSize > 18) instructionFontSize = 18;
                  if (spacing < 8) spacing = 8;
                  if (spacing > 16) spacing = 16;

                  return Column(
                    children: [
                      SizedBox(height: spacing),
                      Text(
                        'Kartı sürükle: Sola=Biliyorum  Sağa=Bilmiyorum',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: instructionFontSize,
                        ),
                      ),
                    ],
                  );
                },
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
      await p.setInt('a1_index', index);
      await p.setInt('a1_progress', progress);
      await p.setInt('a1_total', widget.words.length);
      await p.setStringList('a1_known', known.map((e) => e['en']!).toList());
      await p.setStringList(
        'a1_unknown',
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
        await p.setInt('a1_unknown_index', index);
        await p.setInt('a1_unknown_progress', progress);
        await p.setInt('a1_unknown_total', widget.words.length);
        await p.setStringList(
          'a1_unknown_known',
          known.map((e) => e['en']!).toList(),
        );
        await p.setStringList(
          'a1_unknown_unknown',
          unknown.map((e) => e['en']!).toList(),
        );
      } else if (widget.isKnownMode) {
        // Bildiklerim modu için ayrı kaydetme
        await p.setInt('a1_known_index', index);
        await p.setInt('a1_known_progress', progress);
        await p.setInt('a1_known_total', widget.words.length);
        await p.setStringList(
          'a1_known_known',
          known.map((e) => e['en']!).toList(),
        );
        await p.setStringList(
          'a1_known_unknown',
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
        final savedKnown = p.getStringList('a1_unknown_known') ?? [];
        final savedUnknown = p.getStringList('a1_unknown_unknown') ?? [];
        final savedProgress = p.getInt('a1_unknown_progress');
        final legacy = p.getInt('a1_unknown_index');
        final shouldRestart = p.getBool('a1_unknown_restart') ?? false;

        // Resume hesaplaması düzeltildi - önce index'e bak, sonra progress'e bak
        int resume = legacy ?? savedProgress ?? 0;

        // Eğer yeniden başlatma bayrağı varsa veya liste bittiyse baştan başla
        if (shouldRestart || resume >= widget.words.length) {
          // Yeniden başlatma bayrağını temizle
          await p.setBool('a1_unknown_restart', false);
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
        final savedKnown = p.getStringList('a1_known_known') ?? [];
        final savedUnknown = p.getStringList('a1_known_unknown') ?? [];
        final savedProgress = p.getInt('a1_known_progress');
        final legacy = p.getInt('a1_known_index');
        final shouldRestart = p.getBool('a1_known_restart') ?? false;

        // Resume hesaplaması düzeltildi - önce index'e bak, sonra progress'e bak
        int resume = legacy ?? savedProgress ?? 0;

        // Eğer yeniden başlatma bayrağı varsa veya liste bittiyse baştan başla
        if (shouldRestart || resume >= widget.words.length) {
          // Yeniden başlatma bayrağını temizle
          await p.setBool('a1_known_restart', false);
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
        final savedKnown = p.getStringList('a1_known') ?? [];
        final savedUnknown = p.getStringList('a1_unknown') ?? [];
        final savedProgress = p.getInt('a1_progress');
        final legacy = p.getInt('a1_index');
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
        'a1_index',
        'a1_progress',
        'a1_total',
        'a1_known',
        'a1_unknown',
      ]) {
        p.remove(k);
      }
    } catch (_) {}
  }

  Future<void> _clearSpecialMode() async {
    try {
      final p = await SharedPreferences.getInstance();
      if (widget.isUnknownMode) {
        // Bilmediklerim modu için temizleme
        for (final k in [
          'a1_unknown_index',
          'a1_unknown_progress',
          'a1_unknown_total',
          'a1_unknown_known',
          'a1_unknown_unknown',
        ]) {
          p.remove(k);
        }
      } else if (widget.isKnownMode) {
        // Bildiklerim modu için temizleme
        for (final k in [
          'a1_known_index',
          'a1_known_progress',
          'a1_known_total',
          'a1_known_known',
          'a1_known_unknown',
        ]) {
          p.remove(k);
        }
      }
    } catch (_) {}
  }

  Future<void> _resetSpecialModeIndex() async {
    try {
      final p = await SharedPreferences.getInstance();
      if (widget.isUnknownMode) {
        // Bilmediklerim modu için sadece index'i sıfırla
        await p.setInt('a1_unknown_index', 0);
        await p.setInt('a1_unknown_progress', 0);
        // known ve unknown listelerini temizle
        await p.setStringList('a1_unknown_known', []);
        await p.setStringList('a1_unknown_unknown', []);
      } else if (widget.isKnownMode) {
        // Bildiklerim modu için sadece index'i sıfırla
        await p.setInt('a1_known_index', 0);
        await p.setInt('a1_known_progress', 0);
        // known ve unknown listelerini temizle
        await p.setStringList('a1_known_known', []);
        await p.setStringList('a1_known_unknown', []);
      }
    } catch (_) {}
  }

  Future<void> _resetSpecialModeIndexOnly() async {
    try {
      final p = await SharedPreferences.getInstance();
      if (widget.isUnknownMode) {
        // Bilmediklerim modu için index'i sıfırla ve listeleri temizle
        await p.setInt('a1_unknown_index', 0);
        await p.setInt('a1_unknown_progress', 0);
        await p.setStringList('a1_unknown_known', []);
        await p.setStringList('a1_unknown_unknown', []);
      } else if (widget.isKnownMode) {
        // Bildiklerim modu için index'i sıfırla ve listeleri temizle
        await p.setInt('a1_known_index', 0);
        await p.setInt('a1_known_progress', 0);
        await p.setStringList('a1_known_known', []);
        await p.setStringList('a1_known_unknown', []);
      }
    } catch (_) {}
  }

  Future<void> _setRestartFlag() async {
    try {
      final p = await SharedPreferences.getInstance();
      if (widget.isUnknownMode) {
        // Bilmediklerim modu için yeniden başlatma bayrağını ayarla
        await p.setBool('a1_unknown_restart', true);
      } else if (widget.isKnownMode) {
        // Bildiklerim modu için yeniden başlatma bayrağını ayarla
        await p.setBool('a1_known_restart', true);
      }
    } catch (_) {}
  }
}
