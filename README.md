# Processing playground

Minimal creative-coding sandbox for **Processing (Java)** sketches and **p5.js** web sketches. Local-first, low-bloat, fast iteration.

## Layout

| Path | What |
|------|------|
| `sketches/` | Processing IDE sketches — one folder per experiment (**folder name = `.pde` name**) |
| `p5js/` | p5.js projects — open in browser / local serve |
| `assets/` | Shared images, sounds, fonts |
| `notes.md` | Vibe / idea log |

### Sketch naming

| Runtime | Rule |
|---------|------|
| **Processing** | Java identifiers only: letters, digits, underscore. **No hyphens, no spaces**, don’t start with a number. |
| **p5.js** | Folder name is free (may use hyphens / leading digits). Match a Processing basename only when pairing. |

| Use | Avoid (Processing) |
|-----|---------------------|
| `hexCloud`, `mirrorcube` | `hex-cloud` |
| `bloomField` | `my sketch` |

## Quick start

### Processing (Java)

1. Install [Processing](https://processing.org/download) if needed.
2. **File → Open** → pick a folder under `sketches/` (e.g. `sketches/hexCloud`).
3. Hit **▶ Run**.

New sketch: copy `sketches/template/`, rename the folder **and** the `.pde` to the same legal name.

### p5.js (web)

Prefer a local HTTP server (avoids `file://` CORS when loading textures):

```bash
# from repo root — examples
npx --yes serve p5js/hexCloud
npx --yes serve p5js/mirrorcube
npx --yes serve p5js/chipScope
npx --yes serve p5js/1-Aus
```

Or open `p5js/<name>/index.html` directly. p5 loads from CDN; for offline, drop `p5.min.js` into `assets/` and point the script tag there.

**Photo-plate sketches** (`2-Australis`, `1-Aus`, `2-Aus`) embed the still via `nebula-data.js` (data-URI) so `file://` works; serving is still fine.

**Device-aware (p5):** full viewport, `device.js` profile, capped pixel density on phones, on-screen control bars on touch. `device.js` (loaded before p5) also blocks unused `deviceorientation` / `devicemotion` listeners so the browser does not log deprecation noise. **Processing (Java IDE)** remains a desktop local workflow.

New sketch: copy `p5js/template/` (or an existing sketch closest in feel).

Machine-specific paths → `USER-NOTES.md` (local only, gitignored).

## Included sketches

### Processing + p5 pairs

| Sketch | Processing | p5.js | Notes |
|--------|------------|-------|--------|
| `template` | `sketches/template` | `p5js/template` | Particles, links, hex cursor, click spawn |
| `hexCloud` | `sketches/hexCloud` | `p5js/hexCloud` | Hex lattice + drifting points; mouse warp |

### p5-only

| Sketch | Path | Notes |
|--------|------|--------|
| `bloomField` | `p5js/bloomField` | Forever explosions — shards, sparks, shock rings, ink residual trails |
| `explosion` | `p5js/explosion` | Space detonation forever — starfield, zero-g debris, nebula plasma |
| `2-explode` | `p5js/2-explode` | Soft cream/orange fireball + horizontal energy disc (no craft) |
| `3-explode` | `p5js/3-explode` | Spherical supernova shell — wrinkled membrane, rays, lens flare |
| `4-explosion` | `p5js/4-explosion` | Radial fireball + abstract metal wreckage + flame jets |
| `Australis` | `p5js/Australis` | Living H-alpha nebula (WEBGL FBM shader) |
| `2-Australis` | `p5js/2-Australis` | Photo plate + free-look **sky sphere** (data-URI plate) |
| `1-Aus` | `p5js/1-Aus` | Pure p5 skysphere free-look; 3× rotation vs early orbit |
| `2-Aus` | `p5js/2-Aus` | Seamless skysphere — left/right edge bake + pole soften |
| `chipScope` | `p5js/chipScope` | Microscope dive into a microchip — infinite hierarchical zoom |
| `mirrorcube` | `p5js/mirrorcube` | Chrome cube on pure black; orbit + auto-spin; **no cursor** |
| `mirrorball` | `p5js/mirrorball` | Chrome orb on pure black; world-fixed env so orbit reads on a sphere; **cursor forced off** (`noCursor` + CSS `!important`) |

### Controls (common)

Many sketches share **space** pause · **r** reset · **h** HUD · **drag** pan/orbit. Sketch-specific keys are noted in each `index.html` header comment (e.g. `chipScope` **[ ]** speed, `mirrorcube` / `mirrorball` scroll dolly).

Paired Processing sketches: **space** pause · **h** hex · **r** reseed · **click** spawn (`template`) · **p** / **[ ]** rings (`hexCloud`).

## Conventions

- One idea → one folder under `sketches/` or `p5js/` (same basename when paired).
- Prefer single-file p5 until you need assets or modules.
- Shared media in `assets/`; large photo plates may ship as `nebula-data.js` (embedded) next to the sketch.
- No build step required.
- Avoid shadowing p5 globals with parameter names (e.g. do not name a param `scale` — use `zoom`).
- Mirror **sphere** env maps need world-fixed lights (not view-locked) or camera orbit looks dead; a cube’s faces hide that issue.

## Version History

71826 9:20:14:30 PM CST  
• `update .mds`: `mirrorball` cursor fully suppressed (`noCursor()`, CSS `cursor: none !important` on page + canvas). `USER-NOTES.md` lines 1–6 still User-owned on sync.

71826 9:09:34:47 PM CST  
• `update .mds`: no new sketches; reaffirm dual-doc — `USER-NOTES.md` top block (lines 1–6) is User-owned and must not be overwritten on doc sync; session notes refreshed.

71826 9:03:56:28 PM CST  
• `update .mds`: add `mirrorball` (chrome orb; world-fixed studio env so drag orbit is visible); `mirrorcube` / `mirrorball` hide system cursor; `device.js` blocks p5 motion/orientation sensors (deprecation console noise) across all p5 sketches; note sphere vs cube orbit readability.

71826 8:33:09:23 PM CST  
• `update .mds`: catalog of new p5-only sketches from session — explosion series (`bloomField`, `explosion`, `2-explode`, `3-explode`, `4-explosion`), nebula / sky (`Australis`, `2-Australis`, `1-Aus`, `2-Aus` seamless), `chipScope` microscope die zoom, `mirrorcube` chrome cube (no ground disc). Docs note data-URI plates, serve-vs-file CORS, p5 naming vs Processing-safe pairs.

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
