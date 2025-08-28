# iOS Sertifikaları

Bu klasöre aşağıdaki sertifika dosyalarını yerleştirin:

## Gerekli Dosyalar

### 1. Distribution Certificate
- **Dosya:** `distribution.p12`
- **Açıklama:** App Store için dağıtım sertifikası
- **Nasıl alınır:** Apple Developer Portal > Certificates > iOS Distribution

### 2. Development Certificate  
- **Dosya:** `development.p12`
- **Açıklama:** Geliştirme için sertifika
- **Nasıl alınır:** Apple Developer Portal > Certificates > iOS Development

## Sertifika Oluşturma Adımları

### 1. Apple Developer Portal'da:
1. Certificates, Identifiers & Profiles > Certificates
2. + > iOS Distribution (App Store and Ad Hoc)
3. CSR dosyası yükleyin
4. Sertifikayı indirin

### 2. Keychain Access'te:
1. Keychain Access > Certificates
2. Sertifikayı import edin
3. Export > Personal Information Exchange (.p12)
4. Şifre belirleyin

### 3. CodeMagic'te:
1. Project Settings > Code Signing
2. iOS Distribution Certificate yükleyin
3. Şifreyi environment variable olarak ekleyin

## Güvenlik Notları

- Sertifika dosyalarını git'e commit etmeyin
- Şifreleri güvenli şekilde saklayın
- Sertifikaları düzenli olarak yenileyin
