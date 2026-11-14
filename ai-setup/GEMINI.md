# Instrukcje i Zasady (GEMINI.md)

Poniższe reguły obowiązują w każdym czacie i zadaniu. Stosuj się do nich bezwzględnie.

---

### 1. Minimalny i konkretny kod oraz skrypty
- **Tylko to, co niezbędne:** Pisz minimalny kod osiągający cel — bez zbędnych wodotrysków, nadmiarowych bibliotek i overengineeringu.
- **Konkret:** Działaj i odpowiadaj zwięźle, bez niepotrzebnego rozlewania się.

---

### 2. Tworzenie dokumentacji (README i docs)
- **Spójność językowa:** Zawsze sprawdzaj język istniejącego repozytorium (np. angielski) i twórz dokumentację w tym samym języku, niezależnie od języka rozmowy z użytkownikiem (chyba że padnie wyraźne polecenie inaczej).
- **Z perspektywy użytkownika:** Opisuj wyłącznie to, co użytkownik ma zrobić i jakie ma wybory. Nie opisuj mechanizmów działających w tle (np. jak skrypt bada środowisko, jak robi fallbacki czy backupy).
- **Spójność struktury:** Każda sekcja musi mieć jasny kontekst i logicznie łączyć się z resztą dokumentu (np. sekcja *Manual installation* zamiast oderwanej listy ścieżek na końcu).
- **Zakaz oczywistości i nawiasów:** Nie dopowiadaj oczywistych definicji w nawiasach (np. *"globally (for every project)..."*).
- **Zakaz generycznych wyliczanek:** Nie wymieniaj długich list narzędzi ani platform, jeśli nie wynikają one wprost z projektu.

---

### 3. Komentarze w kodzie
- **Dopasowanie do projektu:** Styl i język komentarzy muszą być w 100% spójne z repozytorium.
- **Tylko miejsca nieoczywiste:** Komentarze umieszczaj wyłącznie tam, gdzie logika jest skomplikowana lub nieoczywista.
- **Brak komentarzy w oczywistym kodzie:** Nie komentuj fragmentów, których działanie wynika bezpośrednio z kodu.
- **Brak historii zmian:** Nigdy nie opisuj w komentarzach historii zmian ani przeszłości (np. *"wcześniej kod robił X, teraz robi Y"*). Od historii jest Git.

---

### 4. Zwięzłość i brak niepotwierdzonych informacji
- **Bez lania wody:** Pomiń zbędne wstępy, podsumowania i powtarzanie treści promptu użytkownika.
- **Tylko potwierdzone fakty:** Nigdy nie dodawaj niepotwierdzonych informacji, domysłów ani niesprawdzonych założeń. Opieraj się wyłącznie na zweryfikowanych faktach.

---

### 5. Niepewność i pytania
- Jeśli czegoś nie wiesz, brakuje wymogów lub kontekstu: **opisz problem i zapytaj**, zamiast zgadywać lub podejmować arbitralne decyzje samodzielnie.

---

### 6. Git, Jira i uprawnienia
- **Jira:** Nigdy nie twórz ani nie dodawaj zadań/zgłoszeń na Jirze.
- **Pull Requesty:** Nigdy nie otwieraj Pull Requestów.
- **Git Push:** Polecenie `git push` wykonuj **wyłącznie** za wyraźnym zezwoleniem użytkownika.
