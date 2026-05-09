---
marp: true
paginate: true
lang: ja
math: katex
style: |
  section {
    font-size: 26px;
  }
---

<!--
_class: center-slide
_paginate: false
-->

# スライドタイトル

aaa
bbb

---

# タイトル
## サブタイトル
- 列挙
    - aaa
- 列挙
    - bbb

![bg right:50%](https://picsum.photos/800/300)

## サブタイトル2
1. 連番
    - ccc
1. 連番
    - ddd

---

# <span class="white">白色</span>
- <span class="red">赤色</span>
- <span class="white">白色</span>
![blur bg cover](https://picsum.photos/800/300)

---

# 文章の装飾
- インラインコード`250 abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLMNOPQRSTUVWXYZ`
- aaaと`aaa`と **`aaa`** と**aaa**と*aaa*
- <span class="red">赤色</span>の文字です😭:sob:
- <span class="green">緑色</span>の文字です:cat:

> 引用1行目
> 引用2行目

- キーボードショートカット<kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>R</kbd>、<kbd>Alt+R</kbd>、<kbd>Ctrl+K M</kbd>

---

# 画像☺️

## 画像のサンプル
![h:10em](https://picsum.photos/800/300)
<span>高さ`10em`の図</span>

---

# 画像を並べる
| A について | B について |
| :--- | :--- |
| ![h:250](https://picsum.photos/400/300) | ![h:250](https://picsum.photos/400/301) |
| Aは左の図<br>🍣改行 | Bの高さは`250`<br>改行♨️ |

---

# コードブロック

```javascript
function hello() {
  // コメント
  console.log('Hello, Marp!');
}
```

```sh
alias xargs='xargs '
alias gds='git diff --staged'
```

```
$ echo file_{001..003}.txt
file_001.txt file_002.txt file_003.txt
```

---

# 数式

- エネルギーと質量には$E=mc^2$の関係がある。

$$
\begin{align*}
  \left( \int_0^\infty \frac{\sin x}{\sqrt{x}} \mathrm{d}x \right)^2 =
  \sum_{k=0}^\infty \frac{(2k)!}{2^{2k}(k!)^2} \frac{1}{2k+1} =
  \prod_{k=1}^\infty \frac{4k^2}{4k^2 - 1} = \frac{\pi}{2}
\end{align*}
$$

$$
\begin{aligned}
a& = b+c \\
a_v &= \frac{a}{b} \times 2 \pi \\
T_a&\colon \text{添字が斜体} \\
T_\mathrm{a}&\colon \text{添字が立体} \\
V_\mathrm{a} &= 12 \thinspace \mathrm{V} \\
V_\mathrm{a} &= 12 \, \mathrm{V} \\
\end{aligned}
$$

---

# アラート

<div class="note info">
  <strong>Note</strong>
  <p>aaa</p>
  <p>bbb</p>
</div>

<div class="note warn">
  <p>○○に注意してください。</p>
  <p>■■に注意してください。</p>
</div>

<div class="note alert">
  <p><code>aaa</code>は禁止です。</p>
</div>

<div class="note check">
  <p><code>bbb</code>になりました。</p>
</div>

---

<div class="center-text">

# この見出しを中央に
これは中央寄せされる段落です。

</div>

<div class="right-text">

### この見出しは右寄せ
この段落は右寄せ

</div>

<div class="left-text">左に配置</div>
