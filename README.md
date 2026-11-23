# Sudoku und kleine Spiele

Eine statische GitHub-Pages-Seite mit mehreren kleinen Spielen und täglichen Funktionen. Die Oberfläche ist auf Deutsch und benötigt keinen Build-Schritt.

## Seiten

- `index.html`: Startseite mit den verfügbaren Spielen und Funktionen.
- `sudoku.html`: Sudoku mit Kategorien, Tages-Sudoku und Supabase-Bestenliste.
- `runner.html`: „Dresden Runner“ mit lokalem Rekord und Supabase-Bestenliste.
- `meme.html`: Tägliches Bild aus `memes/` und Beiträge über Supabase.
- `beobachtung.html`: Platzhalterseite für die spätere Tagesbeobachtung.

## Ordnerstruktur

```text
/
├── index.html
├── sudoku.html
├── runner.html
├── meme.html
├── beobachtung.html
├── therock.jpg
├── memes/
│   ├── memes.json
│   └── meme_*.jpg
└── supabase/
    ├── meme_comments.sql
    └── runner_scores.sql
```

Der Benutzername wird browserlokal unter dem Schlüssel `localStorage["sdk_name"]` gespeichert. Der lokale Runner-Rekord liegt unter `localStorage["run_best"]`.

## Supabase einrichten

Sudoku, Tagesmeme und Dresden Runner verwenden dieselbe Supabase-Projekt-URL und denselben publishable Key. Diese Werte sind bereits in den bestehenden HTML-Dateien hinterlegt; neue Werte müssen nicht eingetragen werden.

Lege die zusätzlichen Tabellen im Supabase-SQL-Editor an:

1. Öffne die Datei `supabase/meme_comments.sql`.
2. Kopiere den vollständigen SQL-Inhalt in den SQL-Editor des Supabase-Projekts und führe ihn aus.
3. Öffne die Datei `supabase/runner_scores.sql`.
4. Kopiere den vollständigen SQL-Inhalt in denselben SQL-Editor und führe ihn aus.

Die SQL-Dateien erstellen jeweils:

- die Tabelle,
- die Spaltenbegrenzungen,
- Row-Level-Security,
- eine erlaubende Leseregel für alle Besucher,
- eine erlaubende Einfügeregel für alle Besucher.

Es werden bewusst keine Regeln zum Aktualisieren oder Löschen für anonyme Besucher angelegt. Beiträge und Ergebnisse können im Supabase-Dashboard moderiert bzw. gelöscht werden.

Wenn eine Datenbank nicht erreichbar ist oder Tabellen fehlen, zeigen die Seiten eine freundliche Fehlermeldung anstelle eines Seiteneinsturzes.

## Bilder für das Tagesmeme

Lege die Meme-Bilder in den Ordner `memes/` und trage ihre Dateinamen in `memes/memes.json` als JSON-Array ein, zum Beispiel:

```json
["meme_01.jpg", "meme_02.jpg"]
```

Die Auswahl erfolgt deterministisch nach dem lokalen Datum. Das Aussehen der Bilder wird durch die Datei selbst bestimmt.

## Deployment über GitHub Pages

1. Öffne auf GitHub `Settings` → `Pages`.
2. Wähle bei „Source“ `Deploy from a branch`.
3. Wähle Branch `main` und den Ordner `/ (root)`.
4. Speichere die Einstellung.
5. Nach dem Deployment erreichst du die Startseite über die GitHub-Pages-URL des Repositorys.

Da es sich um reine HTML-, CSS- und JavaScript-Dateien handelt, ist kein Build-Schritt nötig.