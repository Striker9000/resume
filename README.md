# Ty Moore — Résumé

Critical infrastructure technician. Industrial controls, HVAC, component-level electronics, and enterprise Linux/Windows administration. U.S. Army veteran, medically retired. Relocating to the Washington DC metro (DC / Maryland / Northern Virginia).

**Target roles:** Data Center Controls Technician · Critical Facilities Technician · Data Center Engineering Operations Technician

---

## Read it

| | |
|---|---|
| **Web** | https://striker9000.github.io/resume/ |
| **PDF (direct download)** | https://striker9000.github.io/resume/TyMoore_Resume.pdf |

---

## Contact

- **Email:** tyshaunmoore.tm@gmail.com
- **Phone:** 213-650-8370
- **LinkedIn:** https://www.linkedin.com/in/tyshaun-moore-b487ba282

---

## How this repo works

`index.html` is the single source of truth. It carries a print stylesheet, so the
web page and the PDF are rendered from the same file and cannot drift apart.

To regenerate the PDF after editing `index.html`:

```powershell
.\build-pdf.ps1
```

That drives headless Chrome to print `index.html` to `TyMoore_Resume.pdf` at
Letter size with no browser header/footer. The output keeps a real text layer
with embedded fonts, so applicant tracking systems can parse it — it is not a
scanned image.

Commit both files together and GitHub Pages redeploys automatically.
