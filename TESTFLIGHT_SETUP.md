# TestFlight ve CodeMagic Kurulum Rehberi

## Ön Gereksinimler

### 1. Apple Developer Hesabı
- Apple Developer Program üyeliği ($99/yıl)
- App Store Connect erişimi
- iOS sertifikaları ve provisioning profilleri

### 2. CodeMagic Hesabı
- [CodeMagic.io](https://codemagic.io) hesabı oluşturun
- GitHub/GitLab/Bitbucket hesabınızı bağlayın

## Adım Adım Kurulum

### 1. iOS Sertifikaları ve Profilleri

#### App Store Connect'te:
1. **App oluşturun:**
   - App Store Connect > My Apps > + > New App
   - Bundle ID: `com.example.englishwithgames` (veya kendi bundle ID'niz)
   - Platform: iOS
   - Name: English with Games

2. **Sertifikalar oluşturun:**
   - Certificates, Identifiers & Profiles > Certificates
   - iOS Distribution (App Store and Ad Hoc)
   - iOS Development

3. **Provisioning Profilleri:**
   - App Store Distribution Profile
   - Development Profile

### 2. CodeMagic Projesi Kurulumu

#### CodeMagic'te:
1. **Proje bağlayın:**
   - GitHub/GitLab/Bitbucket repo'nuzu seçin
   - `codemagic.yaml` dosyasını kullanın

2. **Environment Variables ekleyin:**
   ```
   CM_CERTIFICATE_PASSWORD: Sertifika şifreniz
   CM_KEYCHAIN_PASSWORD: Keychain şifreniz
   CM_APP_STORE_CONNECT_ISSUER_ID: App Store Connect Issuer ID
   CM_APP_STORE_CONNECT_API_KEY_ID: API Key ID
   CM_APP_STORE_CONNECT_API_KEY: API Key (base64 encoded)
   CM_TEAM_ID: Apple Developer Team ID
   ```

3. **Code Signing ayarları:**
   - iOS Distribution Certificate (.p12)
   - iOS Development Certificate (.p12)
   - Provisioning Profiles (.mobileprovision)

### 3. App Store Connect API Key

#### App Store Connect'te:
1. **API Keys oluşturun:**
   - Users and Access > Keys > In-App Purchase
   - Generate API Key
   - Download .p8 dosyası

2. **Gerekli bilgiler:**
   - Issuer ID
   - Key ID
   - API Key (base64 encode edin)

### 4. Bundle ID Güncelleme

#### iOS projesinde:
1. **Xcode'da açın:**
   ```bash
   open ios/Runner.xcworkspace
   ```

2. **Bundle Identifier güncelleyin:**
   - Runner target > General > Bundle Identifier
   - `com.example.ings` yerine kendi bundle ID'nizi yazın

3. **Team seçin:**
   - Signing & Capabilities > Team

### 5. CodeMagic Workflow

#### Otomatik Build:
1. **Git push yapın:**
   ```bash
   git add .
   git commit -m "Add CodeMagic configuration"
   git push
   ```

2. **CodeMagic'te build başlatın:**
   - Proje sayfasında "Start new build"
   - iOS workflow seçin

3. **TestFlight'a otomatik yükleme:**
   - Build başarılı olduktan sonra otomatik olarak TestFlight'a yüklenir

## TestFlight Kullanımı

### 1. TestFlight'ta Test
1. **App Store Connect > TestFlight**
2. **Build'leri kontrol edin**
3. **Test kullanıcıları ekleyin:**
   - Internal Testers (Apple Developer Team üyeleri)
   - External Testers (email ile davet)

### 2. Test Kullanıcıları
- **Internal:** Hemen test edebilir
- **External:** Apple onayı gerekir (24-48 saat)

## Sorun Giderme

### Yaygın Hatalar:
1. **Code Signing Hatası:**
   - Sertifika ve profil uyumluluğunu kontrol edin
   - Bundle ID eşleşmesini doğrulayın

2. **Build Hatası:**
   - Flutter doctor çalıştırın
   - Dependencies güncelleyin

3. **TestFlight Yükleme Hatası:**
   - App Store Connect'te app'in oluşturulduğunu kontrol edin
   - Bundle ID eşleşmesini doğrulayın

## Faydalı Komutlar

```bash
# Flutter doctor
flutter doctor

# iOS build (macOS gerekli)
flutter build ios

# iOS archive
flutter build ipa

# Dependencies güncelle
flutter pub get
flutter pub upgrade
```

## Notlar

- iOS build için macOS gereklidir
- Windows'ta sadece Android build yapılabilir
- CodeMagic cloud macOS kullanır
- TestFlight sadece iOS için mevcuttur
- Android için Google Play Console kullanın
