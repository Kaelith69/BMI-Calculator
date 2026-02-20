<p align="center">
  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 60" width="400" height="120">
    <defs>
      <linearGradient id="grad" x1="0%" y1="0%" x2="100%" y2="0%">
        <stop offset="0%" style="stop-color:#7B00FF;stop-opacity:1" />
        <stop offset="100%" style="stop-color:#02DEAC;stop-opacity:1" />
      </linearGradient>
    </defs>
    <rect width="200" height="60" rx="12" fill="url(#grad)"/>
    <text x="100" y="26" font-family="Roboto,Arial,sans-serif" font-size="13" font-weight="bold" fill="white" text-anchor="middle">⚖️ BMI CALCULATOR</text>
    <text x="100" y="46" font-family="Roboto,Arial,sans-serif" font-size="9" fill="rgba(255,255,255,0.85)" text-anchor="middle">Body Mass Index · Flutter App</text>
  </svg>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white" alt="Flutter" />
  <img src="https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart&logoColor=white" alt="Dart" />
  <img src="https://img.shields.io/badge/License-MIT-green" alt="License" />
  <img src="https://img.shields.io/badge/Platform-Android%20%7C%20iOS%20%7C%20Web-blueviolet" alt="Platform" />
</p>

---

## 📋 Overview

A clean, dark-themed **BMI Calculator** built with Flutter. It accepts your gender, height, weight, and age then computes your Body Mass Index and classifies the result according to WHO guidelines.

---

## ✨ Features

| Feature | Description |
|---|---|
| 🚻 Gender Selection | Toggle between Male / Female for a personalised experience |
| 📏 Height Slider | Smooth slider input for height (120 – 220 cm) |
| ⚖️ Weight Counter | Tap +/− buttons to set weight in kg |
| 🎂 Age Counter | Tap +/− buttons to set age |
| 📊 BMI Result | Displays numeric BMI, category, and health advice |
| 🔄 Re-calculate | One-tap navigation back to the input screen |

### BMI Categories (WHO Standard)

| Category | BMI Range |
|---|---|
| 🔵 Underweight | < 18.5 |
| 🟢 Normal | 18.5 – 24.9 |
| 🟠 Overweight | 25.0 – 29.9 |
| 🔴 Obese | ≥ 30.0 |

---

## 🏗️ Architecture

```
lib/
├── main.dart          # App entry point & theme setup
├── input_page.dart    # Main input screen (gender, height, weight, age)
├── result.dart        # Result display screen
├── brain.dart         # BMI logic: calculation & classification (CalcBrain)
├── costants.dart      # Shared colours, text styles, sizes
├── customw.dart       # ReusableCard widget
└── icon.dart          # IconContent widget (gender icon + label)
```

**Data flow:**
```
InputPage  →  CalcBrain.calculate()  →  Result screen
                     ↓
            getResult() / getMeaning()
```

---

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) ≥ 3.0
- Dart SDK ≥ 3.0
- An Android / iOS emulator or physical device

### Installation

```bash
# 1. Clone the repository
git clone https://github.com/Kaelith69/BMI-Calculator.git

# 2. Enter the project directory
cd BMI-Calculator

# 3. Fetch dependencies
flutter pub get

# 4. Run the app
flutter run
```

---

## 🖱️ How to Use

1. **Select your gender** — tap the Male or Female card (the selected card highlights).
2. **Set your height** — drag the slider to your height in centimetres.
3. **Set your weight** — use the **+** / **−** buttons to enter your weight in kg.
4. **Set your age** — use the **+** / **−** buttons to enter your age.
5. **Tap CALCULATE BMI** — the result screen shows your BMI number, category, and personalised advice.
6. **Tap RE-CALCULATE** — returns to the input screen for another calculation.

---

## 🛠️ Tech Stack

| Library | Version | Purpose |
|---|---|---|
| [flutter](https://flutter.dev) | SDK | UI framework |
| [google_fonts](https://pub.dev/packages/google_fonts) | ^4.0.4 | Roboto font |
| [font_awesome_flutter](https://pub.dev/packages/font_awesome_flutter) | ^10.4.0 | Gender & counter icons |
| [cupertino_icons](https://pub.dev/packages/cupertino_icons) | ^1.0.2 | iOS-style icons |

---

## 🧪 Tests

```bash
flutter test
```

Unit tests cover BMI calculation accuracy, all classification boundaries (Underweight / Normal / Overweight / Obese), and the advice strings.

---

## 📄 License

This project is licensed under the **MIT License** — see the [LICENSE](LICENSE) file for details.
