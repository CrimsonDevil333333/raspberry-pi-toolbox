#!/bin/bash

echo ""
echo "CHARACTER MAP"
echo ""

echo "1. Emojis"
echo "2. Symbols"
echo "3. Arrows"
echo "4. Math"
read -p "Choice: " choice

case $choice in
    1)
        echo ""
        echo "Smileys: 😀 😃 😄 😁 😂 😎 🤔 😐 😑 😶"
        echo "Hearts: ❤️ 💙 💚 💛 💜 🖤 💔 ❤"
        echo "Objects: 🔑 💻 📱 ⌨ 🖱 💾 💿 📀"
        echo "Nature: 🌟 🌙 ☀️ ⭐ ⚡ 🌈 ❄️ 🔥"
        ;;
    2)
        echo ""
        echo "Stars: ★ ☆ ✦ ✧ ⭐ 🌟 ✯ ✰"
        echo "Cards: ♠ ♣ ♥ ♦ ♤ ♧ ♡ ♢"
        echo "Music: ♩ ♪ ♫ ♬ 🎵 🎶 🎼 🎸"
        echo "Misc: ☎ ✉ ✓ ✗ ✔ ✘ ● ○ ■ □"
        ;;
    3)
        echo ""
        echo "Arrows: ← ↑ → ↓ ↔ ↕ ⇐ ⇒ ⇑ ⇓"
        echo "Double: « » ‹ › « »"
        echo "Corners: ┌ └ ┐ ┘ ─ │ ├ ┤ ┬ ┴ ┼"
        ;;
    4)
        echo ""
        echo "Operators: + - × ÷ = ≠ < > ≤ ≥ ≈"
        echo "Sets: ∈ ∉ ⊂ ⊃ ∪ ∩ ∞ √ ∑ ∏"
        echo "Greek: α β γ δ ε λ μ π σ Ω ω"
        ;;
esac

echo ""
