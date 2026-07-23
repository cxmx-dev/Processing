# Vibe log

Scratchpad for sketch ideas, moods, and half-baked directions. No polish required.

---

## Seeds

- **hexCloud** — generative points on a hex lattice; breathe + mouse warp. Processing + p5 pair.
- Soft particle fields with neighbor links (`template` baseline).
- Explosion series — forever detonations (ink trails → space → film fireball → supernova shell → debris field).
- **Australis** family — nebula still / generative H-alpha / skysphere free-look (seamless bake on `2-Aus`).
- **chipScope** — infinite microscope zoom into hierarchical die layers.
- **mirrorcube** / **mirrorball** — chrome cube + orb, pure black void, orbit camera (no cursor).
- **mirrorballcube** + **mirrorfire*** / **multi*** / **saturnorbcube** — dual chrome in fire or gas shells (box vs sphere env; Saturn continuous belts).
- Sound-reactive hex bloom (later — mic / FFT).
- Slow ink trails / plotter-friendly line exports.
- Grid → chaos morph (lerp ordered lattice into noise).

## Queue

- [ ] Pair keepers with Processing `.pde` when a Java port is worth it (most new work is p5-only)
- [ ] Try offline p5 (`assets/p5.min.js`) once if CDN is flaky
- [ ] Capture stills / short loops of keepers into `assets/` or a private dump
- [ ] Optional: higher-res plate for Aus family (replace `nebula.jpg` + regen `nebula-data.js`)
- [ ] True equirectangular 360 plate would map cleaner on skyspheres than flat still

## Sessions

### 71926–72026
- **mirrorballcube:** chrome orb + cube mutual reflections; **T** center swap; CCW XZ revolve.
- **mirrorfire:** fire room + chrome; then **mirrorfireorbcube** dual chrome in fire.
- Split fire dual: **`mirrorfireorbcube-sky-box`** (6 walls) + **`mirrorfireorbcube-sky-sphere`** (shell; dense panels; thin seams).
- **[ ]** cam XZ on both fire orbcube variants; **multifireorbcube** = 48×32 panels + cam accel **+1×/s**.
- **multigasorbcube** — gas-planet plumes (not fire).
- **satorbcube** → **saturnorbcube** (renamed from `nusatorbcube`) — continuous Saturn belts, no panel grid.
- `update .mds` 72026 AM — README catalog + notes/USER-NOTES.

### 71826
- Big p5-only expansion (no new Processing pairs this session).
- **Explosions:** `bloomField`, `explosion`, `2-explode`, `3-explode`, `4-explosion`.
- **Nebula / sky:** `Australis` (FBM shader; CPU ellipse path was choppy at 1440p), `2-Australis` (photo + skysphere free-look, data-URI CORS fix), `1-Aus` (pure p5 skysphere, 3× spin), `2-Aus` (seamless plate bake).
- **chipScope:** microscope dive; fixed `scale` param shadowing p5.`scale()`.
- **mirrorcube:** chrome cube; no ground disc; cursor hidden.
- **mirrorball:** chrome orb; drag “felt broken” because view-locked env is orbit-invariant on a sphere — fixed with world-fixed studio env (`uYaw`/`uPitch`); cursor forced off (`noCursor` + CSS `!important`).
- **device.js:** block `deviceorientation` / `devicemotion` before p5 loads (all sketches).
- **USER-NOTES:** lines 1–6 protected (hub `start.ps1` / `start-all.ps1` block) — agents must not overwrite.
- `update .mds` (PM) — catalog + mirror family + sensor guard; header preserved; cursor note for `mirrorball`.

### 71026
- Stood up playground; renamed off hyphens (`hex-cloud` → `hexCloud`) for Processing.
- p5 hexCloud was a thin vertical stick — lattice port fixed to match `.pde` (axial `{q,r}`, sqrt(3)).
- Processing hexCloud / template remain the look reference.
- Vanilla canvas “white square” snippets = one idea, two sizes; easy p5 port (not added as a sketch yet).
- `update .mds` 3:32 AM CST — README / notes / USER-NOTES aligned to current pairs.
- PM: co-located into hub `Repos\Processing`; pushed public repo `cxmx-dev/Processing` (local-tool).
- Device-aware p5: `device.js`, on-screen touch bars, phone pixelDensity cap.
- Hub batch: `.\scripts\start-all.ps1` (Processing `-SyncOnly` pushes public tree).

<!--
### MMDDYY
- …
-->
