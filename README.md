# Processing playground

Minimal creative-coding sandbox for **Processing (Java)** sketches and **p5.js** web sketches. Local-first, low-bloat, fast iteration.

## Layout

| Path | What |
|------|------|
| `sketches/` | Processing IDE sketches — one folder per experiment (**folder name = `.pde` name**) |
| `p5js/` | p5.js projects — open in browser / local serve |
| `assets/` | Shared images, sounds, fonts |

### Sketch naming

| Runtime | Rule |
|---------|------|
| **Processing** | Java identifiers only: letters, digits, underscore. **No hyphens, no spaces**, don't start with a number. |
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
| `mirrorball` | `p5js/mirrorball` | Chrome orb on pure black; world-fixed env; **cursor forced off** |
| `mirrorballcube` | `p5js/mirrorballcube` | Chrome orb + cube; mutual reflections; **T** swaps center; CCW XZ revolve |
| `mirrorfire` | `p5js/mirrorfire` | Chrome ball/cube inside **fire room** (walls/floor/ceiling flames) |
| `mirrorfireorbcube-sky-box` | `p5js/mirrorfireorbcube-sky-box` | Orb+cube in fire **sky-box**; mutual + fire reflections; **T** swap; **[ ]** cam XZ |
| `mirrorfireorbcube-sky-sphere` | `p5js/mirrorfireorbcube-sky-sphere` | Same + fire **sky-sphere** shell; multi-panel lat/lon fire tiles; thin seams |
| `multifireorbcube` | `p5js/multifireorbcube` | Dense **48×32** fire panels; **[ ]** cam yaw accelerates **+1×/s** hold |
| `multigasorbcube` | `p5js/multigasorbcube` | Inside gas giant — banded plumes/storms (not fire); same dual chrome + controls |
| `saturnorbcube` | `p5js/saturnorbcube` | Inside **Saturn** — continuous butterscotch belts (no hard panel grid) |

### Controls (common)

Many sketches share **space** pause · **r** reset · **h** HUD · **drag** pan/orbit. Sketch-specific keys are noted in each `index.html` header comment (e.g. `chipScope` **[ ]** speed; fire/gas/Saturn dual-chrome: **t** swap center, **[ ]** camera XZ yaw).

Paired Processing sketches: **space** pause · **h** hex · **r** reseed · **click** spawn (`template`) · **p** / **[ ]** rings (`hexCloud`).

## Conventions

- One idea → one folder under `sketches/` or `p5js/` (same basename when paired).
- Prefer single-file p5 until you need assets or modules.
- Shared media in `assets/`; large photo plates may ship as `nebula-data.js` (embedded) next to the sketch.
- No build step required.
- Avoid shadowing p5 globals with parameter names (e.g. do not name a param `scale` — use `zoom`).
- Mirror **sphere** env maps need world-fixed lights (not view-locked) or camera orbit looks dead; a cube's faces hide that issue.
- Fire/gas dual-chrome family: **T** swaps which body is center; object revolve is CCW in **XZ**; **[ ]** orbit camera on XZ (multifire+ : hold ramps **+1× base speed per second**).
