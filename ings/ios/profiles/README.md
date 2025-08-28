# iOS Provisioning Profilleri

Bu klasöre aşağıdaki provisioning profil dosyalarını yerleştirin:

## Gerekli Dosyalar

### 1. App Store Distribution Profile
- **Dosya:** `distribution.mobileprovision`
- **Açıklama:** App Store dağıtımı için profil
- **Bundle ID:** com.example.ings (veya kendi bundle ID'niz)

### 2. Development Profile
- **Dosya:** `development.mobileprovision`
- **Açıklama:** Geliştirme için profil
- **Bundle ID:** com.example.ings (veya kendi bundle ID'niz)

## Profil Oluşturma Adımları

### 1. Apple Developer Portal'da:
1. Certificates, Identifiers & Profiles > Profiles
2. + > App Store
3. App ID seçin
4. Sertifika seçin
5. Profil adı belirleyin
6. Profili indirin

### 2. CodeMagic'te:
1. Project Settings > Code Signing
2. iOS Provisioning Profile yükleyin
3. Bundle ID eşleşmesini kontrol edin

## Bundle ID Eşleşmesi

Provisioning profillerindeki Bundle ID'nin şunlarla eşleşmesi gerekir:
- Xcode projesindeki Bundle Identifier
- `codemagic.yaml` dosyasındaki BUNDLE_ID
- `exportOptions.plist` dosyasındaki bundle ID

## Güvenlik Notları

- Profil dosyalarını git'e commit etmeyin
- Profilleri düzenli olarak yenileyin
- Bundle ID değişikliklerinde profilleri güncelleyin
