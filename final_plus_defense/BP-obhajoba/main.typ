#import "@preview/touying:0.5.5": *
// #import "@preview/clean-math-presentation:0.1.1": *
#import "clean-math-presentation.typ": *


#set text(lang: "sk")
#show: clean-math-presentation-theme.with(
  config-info(
    title: [Etické a bezpečnostné aspekty prompt engineeringu],
    short-title: [Etické a bezpečnostné aspekty prompt engineeringu],
    authors: ((name: "Autor: Marek Čederle
    Vedúci práce: Ing. Peter Bakonyi, PhD."),),
    // dolnu riadok
    author: "Marek Čederle",
    affiliations: (
      (name: "Fakulta informatiky a informačných technológií"),
      (name: "Slovenská Technická Univerzita v Bratislave"),
    ),
    date: [10.06.2025],
  ),
  config-common(
    slide-level: 2,
    //handout: true,
    //show-notes-on-second-screen: right,
  ),
  progress-bar: false,
)

#title-slide(
  logo1: image("images/STU-FIIT-zfv.png", height: 3em),
)

// Prezentácia výsledku riešenia bakalárskej práce• Odporúčaná obsahová štruktúra prezentácie:
// 1. Úvod do problematiky (cca 10 %)
// 2. Stav v danej oblasti, analýza problému (cca 10%)
// 3. Problém a jeho riešenie (cca 30%)
// 4. Overenie riešenia (cca 40 %)
// 5. Celkový prínos práce a zhodnotenie (cca 10 %)
// • Výsledný produkt sa nepredvádza

// #slide(title: "Ciele práce")[
//   #v(0.5em)
//   - analyzovať smernice a normy pre umelú inteligenciu (UI)
  
//   - identifikovať etické, morálne a kyber-bezpečnostné riziká UI
  
//   - vytvoriť príručku pre prompt engineering a etické zaobchádzanie s UI
// ]


// NOTE: asi bude lepsie ak budem hovorit v autorskom pluraly

#slide(title: "Úvod do problematiky")[
  #v(0.5em)
  - rýchly pokrok v oblasti umelej inteligencie (UI) // NOTE: s ktorým sa prirodzenie viažu aj určite riziká
  
  - prompt engineering // NOTE: spôsob, ako ovplyvniť výstupy modelov UI pomocou vhodného návrhu a optimalizácie textových pokynov (promptov)
  
  - jailbreaking // NOTE: je špecifická formulácia promptu, ktorá sa používa na obchádzanie bezpečnostných mechanizmov LLM na základe ktorej následne model generuje škodlivý obsah.

  #tblock(title: "Cieľ práce")[
    - analyzovať etické a bezpečnostné riziká prompt engineeringu a navrhnúť usmernenia pre zodpovedné používanie UI
  ]
]

#slide(title: "Identifikované riziká")[
  #v(0.5em)
  // NOTEs:
  //               šírenie/tvorba 
  - etické riziká --- dezinformácie, diskriminácia

  - morálne riziká --- nevhodný obsah, návody na výrobu zbraní

  - bezpečnostné riziká --- generovanie škodlivého kódu, sociálne inžinierstvo (phishing, deepfake)

  - jailbreaking --- obchádzanie bezpečnostných opatrení
]

// TODO: opytat sa veduceho a mozno vyhodit
// #slide(title: "Metódy jailbreakingu")[
//   #v(0.5em)
//   - Prompt injection
  
//   - Prompt leaking
  
//   - DAN (Do Anything Now)
  
//   - Roleplay
// ]


#slide(title: "Legislatíva")[
  #v(0.5em)
  // TODO: dat si do poznamok brief info ohladom tych zakonov keby sa na to pytali
  - EÚ --- Akt o UI, kategorizácia podľa rizika

  - USA --- štátne zákony, chýba federálny zákon
  
  - Čína --- komplexná legislatíva, regulácia deepfakes a generatívnej UI
]

#slide(title: "Návrh riešenia")[
  #v(0.5em)
  Navrhnuté usmernenia budú pozostávať z:
  + úvodu do prompt engineeringu
  
  + odporúčaní pre etické a férové používanie systémov UI
  
  + odporúčaní na zlepšenie transparentnosti systémov UI
]

#slide(title: "Experimentovanie")[
  #v(0.5em)
  
  Vybrané boli voľne dostupné neplatené verzie pre modely:

  - ChatGPT // najznámejší, podla dotaznika
  // GPT-4o model limit on the number of messages they can send using GPT-4o, when GPT-4o is unavailable, free users will be switched back to GPT-4.1 mini
  
  - Microsoft Copilot // využíva rovnakú technológiu ako ChatGPT, má však iné obmedzenia, chcel som vediet ci Microsoft pouziva nejake pridavne technologie na zabezpecenie tohto LLM
  
  - DeepSeek // čínsky open-source model, zaujímavý pre cenzúru
  // DeepSeek-V3
  
  - Perplexity
  // Sonar - in-house proprietary
  
]

#slide(title: "Experimentovanie (2)")[
  #v(0.5em)
  Experimenty:
  - generovanie malware (ransomware)

  - testovanie cenzurovania odpovedí

  - generovanie dezinformácií

  - sociálne inžinerstvo (phishing email)

  // NOTEs:
  // každý experiment bol realizovaný bez jailbreak promptu a s jailbreak promptom
  // experimenty boli vykonané aby som dokázal resp. overil prítomnosť niektorých spomenutých hrozieb
]

#slide(title: "Vyhodnotenie")[
  #v(0.5em)
  Dotazník:
  - Počet respondentov: 75
  - Najznámejší model: ChatGPT (89\%) a zároveň najpoužívanejší (81\%)

  #grid(
    columns: 2,
    figure(
      caption: [Vnímanie rizík UI],
      supplement: [Tabuľka č.1],
      placement: top,
      table(
        inset: (x: 5pt, y: 8pt),
        fill: (x, y) => if calc.rem(y, 2) == 1  { rgb("#efefef") },
        columns: 2,
        
        [Posudzované riziko], [Priemer],
        [#emph[Šírenie dezinformácií]], [7.39],
        [#emph[Krádež identity]], [7.05],
        [#emph[Generovanie škodlivého obsahu]], [7.73], 
        [#emph[Generovanie malware]], [6.32],
      )
    ), 
    [
      #set text(size: 0.9em)
      \
      #h(1em) 0 = žiadne riziko \
      #h(1em) 10 = veľmi vysoké riziko
    ]
  )
]

#slide(title: "Vyhodnotenie (2)")[
  #v(0.5em)
  
  - Copilot --- najviac odolný voči jailbreakom (nie však na 100 \%)

  - ostatné modely po jailbreaknutí takmer vždy vygenerovali žiadaný obsah  // NOTE: to je vsak nechcene spravania pretoze islo o problematicky obsah

  // NOTE: ak neni jailbreaknuty model tak vo velkej casti pripadov neumozni generaciu problematickeho obsahu
  - potreba lepších ochranných mechanizmov voči jailbreakom
]

#slide(title: "Vyhodnotenie (3)")[
  #v(0.5em)
  Navrhnuté stratégie na zlepšenie bezpečnostných mechanizmov:
  - na úrovni promptu – prísnejšia kontrola vstupov, transformácie promptov
  
  - na úrovni modelu – safety fine-tuning, pruning, moving target defense

  - vhodné je kombinovať viacero stratégií
]

#slide(title: "Požiadavky na etickú a dôveryhodnú UI")[
  #v(0.5em)
  // TODO: urobit si kazde z tohto co je na papier poznamky, cerpat z oficialnych guidelines v slovencine co mam stiahnute
  // identifikovane HLEG AI vysoko expertnout skupinou pre UI zriadenou Európskou komisiou
- Ľudský faktor a dohľad

- Technická odolnosť a bezpečnosť

- Správa súkromia a údajov

- Transparentnosť

- Nediskriminácia a spravodlivosť

- Spoločenský a environmentálny blahobyt

- Zodpovednosť

]

#slide(title: "Zhrnutie")[
  #v(0.5em)
  - UI prináša nové etické a bezpečnostné výzvy
  
  - nedostatočné obranné mechanizmy modelov UI voči jailbreakom
  
  - vytvorené usmernenia pre etickú a dôveryhodnú UI
]

= Pripomienky oponenta práce (I.)
#clear-slide[
  #v(0.4em)
  #set text(size: 0.66em)
  #underline[Dôvod výberu modelov na experimentovanie:]
  - ChatGPT – najznámejší a najpoužívanejší LLM (potvrdené výsledkami dotazníka)
  - DeepSeek – čínsky open-source model, vhodný na analýzu cenzúry
  - Copilot – založený na technológii ako ChatGPT, umožnil porovnanie bezpečnostných mechanizmov medzi Microsoft a OpenAI implementáciou
  - Perplexity – verejne dostupný model s možnosťou testovania bez registrácie

  #pagebreak()
  #v(1em)
  
  Ďalšie zvažované modely:
  - Gemini – vyžadovala telefónne overenie, pričom som nechcel viazať informácie na účty kde budem testovať problematický obsah
  - Claude (Sonnet) – v čase testovania nebolo možné vytvoriť (bezplatný) účet 
]
= Pripomienky oponenta práce (II.)
#clear-slide()[
  #v(0.4em)
  #set text(size: 0.66em)
  #set par(justify: true)
  #underline[Overovanie experimentov:]
  - výstupy som analyzoval manuálne
  - pri detekcii dezinformácií a censorship bias, som odpovede modelov porovnával s informáciami z verejne dostupných internetových zdrojov, pričom som vyhľadával v uznávaných médiách
  - pri generovaní malware som analyzoval vygenerovaný kód na či by sa program správal ako ransomware (šifrovanie súborov, odoslanie kľúča útočníkovi)
  - pri generovaní phishing emailu som analyzoval obsah emailu, a tón správy na podobnosť so známymi phishing emailami
]

= Pripomienky oponenta práce (III.)
#clear-slide()[
  #v(0.4em)
  #set text(size: 0.66em)
  #underline[Neuvedenie promptov v prílohách:]
  - jailbreak prompty, ktoré som použil, sú citované v použitých zdrojoch
  
  - ostatné vlastné prompty boli iba ako screenshot a to nie pre všetky experimenty; tieto som do prílohy nezahrnul // NOTE: čo bola chyba z mojej strany
  
  - zlepšila by sa transparentnosť ale nie celkom opakovateľnosť (výstupy LLM sú nedeterministické) // teplota (temperature) a seed modelov sa nedajú nastaviť pri free verzii testovaných modelov a ešte aj to že sú implementované ako chatbot 
]

= Pripomienky oponenta práce (IV.)
#clear-slide()[
  #v(0.7em)
  #set text(size: 0.66em)

  #underline[Obmedzenia, ktoré som mal, no výslovne som ich v práci neuviedol:]
  
  - použil som výhradne voľne dostupné verzie modelov
  
  - použil som modely, kde bola možnosť registrácie bez asociácie osobných/kontaktných údajov
]


= Pripomienky oponenta práce (V.)
#clear-slide()[
  #v(0.4em)
  #set text(size: 0.66em)

  #underline[Censorship bias:]
  
  - censorship bias pri ostatných modeloch (okrem DeepSeek) som testoval tak, že som sa zameral na to, či modely (pôvodu z USA) odmietnu generovať obsah týkajúci sa tém ako Wikileaks alebo vojenské zásahy USA // čo predstavuje kontroverznú tému ktorá by mohla byť potenciálne cenzurovaná
  - nemali problém s generáciou tohto obsahu kde uvádzali informácie zverejnené na Wikileaks, nemali ani problém generovať obsah ohľadom témy s ktorou som testoval Deepseek // Uyghur ethical minority issue
]


// == Outline <touying:hidden>

// #components.adaptive-columns(outline(title: none))

// = First section

// #slide(title: "Using the template")[
//   To use this template,
//   - import it at the beginning of your presentation like this: `#import "@preview/clean-math-presentation:0.1.1": *`
//   - import touying by `#import "@preview/touying:0.5.5": *`
//   - call the `#show: clean-math-presentation-theme.with()` function to set the title, authors, and other information of your presentation.

//   The title slide can be created with the `#title-slide()` command. You can pass a `background` (an image or `none`) and up to two logos `logo1` and `logo2`. \
//   The outline can be included, e.g., with `#components.adaptive-columns(outline(title: none))`.\
//   Normal slides can be created with `#slide()`. \
//   A lot of general documentation about the Touying package can be found #link("https://touying-typ.github.io/")[in the Touying documentation]. The general #link("https://typst.app/docs/")[typst documentation] is also helpful.
// ]

// #focus-slide[
//   Focus!
// ]

// #slide(title: "Theorems")[
//   Theorems can be created with the `#theorem` command. Similarly, there are `#proof`, `#definition`, `#example`, `#lemma`, and `#corollary`. \
//   For example, here is a theorem:
//   #theorem(title: "Important one")[
//     Using theorems is easy.
//   ]
//   #proof[
//     This was very easy, wasn't it?
//   ]
//   #pause
  // A definition already given by well-known mathematicians @Author1978definition is:
//   #definition(title: "Important stuff")[
//     _Important stuff_ is defined as the stuff that is important to me:
//     $
//       exp(upright(i) pi) + 1 = 0.
//     $
//   ]
// ]

// #slide(title: "Equations")[
//   Equations with a label with a label will be numbered automatically:
//   $
//     integral_0^oo exp(-x^2) dif x = pi/2
//   $<eq:important>
//   We can then refer to this equation as @eq:important.
//   Equations without a label will not be numbered:
//   $
//     sum_(n=1)^oo 1/n^2 = pi^2/6
//   $
//   Inline math equations will not break across lines, which can be seen here: $a x^2 + b x + c = 0 => x_(1,2) = (-b plus.minus sqrt(b^2 - 4 a c))/(2 a)$
// ]

// #show: appendix

// = References

// #slide(title: "References")[
//   #bibliography("bibliography.bib", title: none)
// ]


// #tblock(title: "Title")[
  //   Content
  // ]