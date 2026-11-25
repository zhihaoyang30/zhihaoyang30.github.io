# zhihaoyang30.github.io

Personal homepage: https://zhihaoyang30.github.io/

This repository is a static Jon Barron-style site (`index.html` + `stylesheet.css` + `images/`). GitHub Pages serves the `master` branch as-is.

## Local preview

```bash
./stop.sh
./run.sh
```

- `run.sh` checks `python3`, refuses to start if port `8765` is already taken, writes logs to `.server.log`, and prints the preview URL `http://127.0.0.1:8765/`.
- `stop.sh` only kills the preview process recorded in `.server.pid`. It refuses to kill unrelated processes.
- Override the port with `PORT=9000 ./run.sh` if `8765` is busy.

Restart reason for a content change: the static server does not need a restart after HTML/CSS/image edits; refresh the browser. Restart only if the server failed to bind or the port changed.

## Bio

The intro lists the current advisor as [Xianpei Han](https://www.icip.org.cn/hanxianpei/). Min Yang and Yujun Cai are previous advisors. Research interest is Game & Agent. The email sits under the name as plain text (`yangzhihao25 [at] mails.ucas.ac.cn`), matching the layout on [Boyuan Zheng's site](https://zhengbryan.github.io/). The line below the intro is hobbies: basketball, rock climbing, the [Golden State Warriors](https://www.nba.com/warriors/), and being a fan of [Stephen Curry](https://www.nba.com/player/201939/stephen-curry). The profile photo uses a small corner radius. The browser tab icon is `images/favicon/`, generated from the sheep image. Replace those files together if the icon changes, and bump the `?v=` query on the favicon links in `index.html` so browsers drop the cached icon.

## Publications on the homepage

First-author entries currently include:

| Work | Thumbnail | Links used |
| --- | --- | --- |
| GameDojo | looping preview `images/gamedojo.mp4` (Genichiro sword fight) | arXiv `2611.30771` / project / github (`THUSI-Lab/GameDojo`, live stars) / benchmark & dataset / model (`THUSI-Lab/GameDojo-4B`, live downloads) / demo |
| Gamer | looping preview `images/gamer.gif` | daily paper #1 / arXiv `2611.18397` / project / github (`RainBowLuoCS/Gamer`, live star count) |
| Scaling in Games | looping preview video `images/gamescaling.mp4` | daily paper #3 / paper / project / github (live stars) / model (HF downloads) / demo |
| Video-Arena | looping preview video `images/video-arena.mp4` | paper / project / github (live stars) / benchmark & dataset / demo |
| PIVOT | `images/PIVOT.png` | paper / project page |
| Skill Adaptation | `images/skill-adaptation.png` (method pipeline from the project page) | paper / project page / github (`skill-adaptation-code`, live stars) / X |
| EVADE | `images/EVADE-Bench.png` | paper / project / benchmark & dataset (`koenshen/EVADE-Bench`) |

Co-authored entries currently include:

| Work | Thumbnail | Links used |
| --- | --- | --- |
| LLM2Cert | `images/LLM2Cert.png` | paper / project page / github (live stars) / benchmark & dataset / X |
| FlowPIE | `images/FlowPIE.png` | paper / project page / github (live stars) / benchmark & dataset |
| RuCL | `images/CuRL.png` | paper |

Each paper's links follow this order, and a missing item is left out: `[daily paper #N]`, `[paper]`, `[project page]`, `[github]` with a live star count, `[benchmark & dataset]`, `[model]` with a live download count, `[demo]`. An X post link stays after that sequence.

Venue lines use italic 15px text in the form `SIGIR, 2026 (CCF-A)`. Preprints are written as `arXiv, 2026`. Coauthor names link to a homepage when one could be verified, and otherwise to a Google Scholar search. Zhihao Yang stays unlinked and bold. On LLM2Cert, `*` is equal contribution and `†` is equal advising.

Live counts are injected by an inline `<script>` before `</body>`: GitHub stars come from `api.github.com/repos/{repo}` into `[data-github-stars]`, and HF downloads from `huggingface.co/api/models/{model}` into `[data-hf-model]` (`downloadsAllTime` with a `downloads` fallback). The star is an inline 12px SVG filled `#e3b341` (an emoji `★` ignores CSS color on macOS). The download count renders at 11px. The `#N` in `[daily paper #N]` is wrapped in `.daily-rank` (`#e8590c` orange). Static fallback numbers sit in the HTML so the page still works when the APIs are unreachable.

Working experience includes miHoYo (`images/mihoyo.svg`) and Alibaba (`images/ali.png`). Each block uses the same two lines: role and year, then `Research Topic: ...`.

To swap a thumbnail, replace the corresponding file under `images/` and keep the same filename, or change the `src` / `<source>` path in `index.html`. Publication thumbnails are 160px wide so the text columns line up. Game previews have square corners.

## Common issues

- Video does not play: the preview clips are muted looping MP4s. Check that `images/gamedojo.mp4`, `images/gamescaling.mp4`, and `images/video-arena.mp4` are present, then hard-refresh.
- Port already in use: `./stop.sh`, or start with `PORT=9000 ./run.sh`.
- Preview shows an old page: this is a static server; reload the tab. If CSS looks stale, hard-refresh.
