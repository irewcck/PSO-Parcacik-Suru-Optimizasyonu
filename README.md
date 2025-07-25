
# Parçacık Sürü Optimizasyonu (PSO)

Bu proje, Parçacık Sürü Optimizasyonu (PSO) algoritmasının temel mantığını, çalışma prensibini ve MATLAB ile uygulanabilir örneklerini içermektedir. PSO, kuş ve balık sürülerinin doğal hareketlerinden esinlenerek geliştirilen popülasyon temelli bir optimizasyon algoritmasıdır.

## 🔍 PSO Nedir?

PSO, 1995 yılında Kennedy ve Eberhart tarafından geliştirilmiştir. Algoritmada her bir çözüm adayı (parçacık), hem kendi en iyi çözümünü (pBest) hem de sürünün en iyi çözümünü (gBest) dikkate alarak hareket eder.

## ⚙️ Algoritmanın Temel Yapısı

- **Parçacık (Particle)**: Arama uzayındaki bir çözüm adayı.
- **Sürü (Swarm)**: Parçacıklardan oluşan topluluk.
- **Uygunluk Fonksiyonu (Fitness)**: Çözümün ne kadar iyi olduğunu ölçer.
- **pBest / gBest**: Kişisel ve küresel en iyi değerler.

## 📐 Temel Formüller

Parçacıkların hızı ve pozisyonu şu formüllerle güncellenir:

```
V = w * V + c1 * rand() * (pBest - Position) + c2 * rand() * (gBest - Position)
Position = Position + V
```

Burada:
- `w`: Eylemsizlik katsayısı
- `c1`: Bireysel öğrenme katsayısı
- `c2`: Sosyal öğrenme katsayısı

## 🧠 MATLAB Örnekleri

- Başlangıç popülasyonu
- pBest ve gBest güncellemeleri
- Sphere fonksiyonu ile minimizasyon
- Görev atama problemi uygulaması

## 📈 Görselleştirme

- Iterasyon sayısına göre en iyi çözüm değerleri
- Parçacıkların hareketleri
- Yakınsama grafikleri

## 📁 Proje Yapısı

```
PSO-Parcacik-Suru-Optimizasyonu/
├── README.md
├── matlab_kodlari/
│   ├── pso_ornek1.m
│   ├── pso_ornek2.m
└── gorseller/
    └── sonuc_grafigi.png
```

## 👩‍💻 Hazırlayan

İrem Çiçek  

