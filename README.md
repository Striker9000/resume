# Ty Moore, Resume

Applied AI Engineer. Local LLMs, retrieval (RAG), and machine learning on secure infrastructure. B.A.S. in Artificial Intelligence and Machine Learning, University of Advancing Technology (expected December 2026). Ten years in technical and systems roles, including air-gapped Linux and Windows engineering. U.S. Army veteran. Las Vegas, NV, open to remote.

**Target roles:** Forward Deployed Engineer, Applied AI Engineer, AI Solutions Engineer, AI security and evaluation. Linux and systems engineering roles also considered.

---

## Read it

| | |
|---|---|
| **AI resume (web)** | https://striker9000.github.io/resume/ |
| **AI resume (PDF)** | https://striker9000.github.io/resume/TyMoore_Resume.pdf |
| **Systems engineer resume (web)** | https://striker9000.github.io/resume/sysadmin.html |
| **Systems engineer resume (PDF)** | https://striker9000.github.io/resume/TyMoore_Resume_Systems.pdf |
| **Portfolio** | https://tmaiconsultant.lovable.app/boards |

---

## Contact

- **Email:** tyshaunmoore.tm@gmail.com
- **Phone:** 213-650-8370
- **LinkedIn:** https://www.linkedin.com/in/tyshaun-moore-b487ba282

---

## How this repo works

Each page is its own source of truth and carries a print stylesheet, so a page and its PDF
are rendered from the same file and cannot drift apart.

- `index.html` -> `TyMoore_Resume.pdf`
- `sysadmin.html` -> `TyMoore_Resume_Systems.pdf`

To regenerate both PDFs after editing:

```powershell
.\build-pdf.ps1
```

That drives headless Chrome to print each page at Letter size with no browser header or
footer. The output keeps a real text layer with embedded fonts, so applicant tracking
systems can parse it.
