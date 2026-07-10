# Processing playground

Minimal creative-coding sandbox for **Processing (Java)** sketches and **p5.js** web sketches. Local-first, low-bloat, fast iteration.

## Layout

| Path | What |
|------|------|
| `sketches/` | Processing IDE sketches — one folder per experiment (**folder name = `.pde` name**) |
| `p5js/` | Single-file p5.js projects — open in browser / local serve |
| `assets/` | Shared images, sounds, fonts |
| `notes.md` | Vibe / idea log |

### Sketch naming (Processing)

Processing requires **Java identifiers**: letters, digits, underscore. **No hyphens, no spaces**, don’t start with a number.

| Use | Avoid |
|-----|--------|
| `hexCloud`, `hex_cloud` | `hex-cloud` |
| `template` | `my sketch` |

p5 folder names can match the Processing name so pairs stay obvious.

## Quick start

### Processing (Java)

1. Install [Processing](https://processing.org/download) if needed.
2. **File → Open** → pick a folder under `sketches/` (e.g. `sketches/hexCloud`).
3. Hit **▶ Run**.

New sketch: copy `sketches/template/`, rename the folder **and** the `.pde` to the same legal name.

### p5.js (web)

```bash
# from repo root
npx --yes serve p5js/hexCloud
# or
npx --yes serve p5js/template
```

Or open `p5js/<name>/index.html` directly. p5 loads from CDN; for offline, drop `p5.min.js` into `assets/` and point the script tag there.

**Device-aware (p5):** sketches use full viewport, `device.js` profile, capped pixel density on phones, and on-screen control bars on touch. **Processing (Java IDE)** remains a desktop local workflow.

New sketch: copy `p5js/template/`.

Machine-specific paths → `USER-NOTES.md` (local only, gitignored).

## Included sketches

| Sketch | Processing | p5.js | Notes |
|--------|------------|-------|--------|
| `template` | `sketches/template` | `p5js/template` | Particles, links, hex cursor, click spawn |
| `hexCloud` | `sketches/hexCloud` | `p5js/hexCloud` | Hex lattice + drifting points; mouse warp |

Paired sketches share behavior; Processing is the reference look.

### Controls

- **space** — pause  
- **h** — toggle hex  
- **r** — reset / reseed  
- **p** — points on/off (`hexCloud`)  
- **[ ]** — fewer / more rings (`hexCloud`)  
- **click** — spawn particle (`template`)

## Conventions

- One idea → one folder under `sketches/` or `p5js/` (same basename when paired).
- Prefer single-file p5 until you need assets or modules.
- Shared media in `assets/`.
- No build step required.

## Version History

71026 2:49:40:70 PM CST  
• `update .mds`: device-aware p5 (`device.js`, touch bars, phone DPR cap); hub **`start-all.ps1`** / `-SyncOnly` for batch push. Processing IDE remains desktop local.

71026 1:39:53:75 PM CST  
• Hub co-locate under `Repos\Processing`; first push to GitHub (`cxmx-dev/Processing`, local-tool — no Pages). Live pairs `template` / `hexCloud` only.

71026 3:32:25:89 AM CST  
• `update .mds`: docs synced to live layout — paired `template` / `hexCloud` (Processing + p5), Java-safe naming rules, p5 serve paths, dual-doc pointer to `USER-NOTES.md`.

71026 2:36:43:17 AM CST  
• Renamed pairs to Processing-safe names (`template`, `hexCloud`). p5 hexCloud rewritten as faithful .pde port (plain axial coords, Math.sqrt(3), no p5.Vector for lattice). Docs/naming rules updated.

71026 2:20:09:76 AM CST  
• Initial playground: dual Processing + p5.js layout, templates, hex cloud starter, gitignore, notes.
