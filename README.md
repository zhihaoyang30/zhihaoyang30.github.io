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
| Scaling in Games | looping preview video `images/gamescaling.mp4` | paper / project / github / models / demo |
| Video-Arena | looping preview video `images/video-arena.mp4` | paper / project / github / dataset / demo |
| PIVOT | `images/PIVOT.png` (Figure 1 from the ICLR 2027 draft) | venue only for now |
| Skill Adaptation | `images/skill-adaptation.png` (method pipeline from the project page) | arXiv `2610.33024` / project page / github (`skill-adaptation-code`) / daily paper / demo |
| EVADE | `images/EVADE-Bench.png` | project / arXiv |
| Structuring Reasoning | `images/DAT.png` | arXiv |

Venue lines use italic 15px text in the form `SIGIR, 2026 (CCF-A)`. Preprints are written as `arXiv, 2026`. Coauthor names link to a homepage when one could be verified, and otherwise to a Google Scholar search. Zhihao Yang stays unlinked and bold.

Working experience includes miHoYo (`images/mihoyo.svg`) and Alibaba (`images/ali.png`). Each block uses the same two lines: role and year, then `Research Topic: ...`.

To swap a thumbnail, replace the corresponding file under `images/` and keep the same filename, or change the `src` / `<source>` path in `index.html`. Publication thumbnails are 160px wide so the text columns line up. Game previews have square corners.

## Common issues

- Video does not play: the preview clips are muted looping MP4s. Check that `images/gamescaling.mp4` and `images/video-arena.mp4` are present, then hard-refresh.
- Port already in use: `./stop.sh`, or start with `PORT=9000 ./run.sh`.
- Preview shows an old page: this is a static server; reload the tab. If CSS looks stale, hard-refresh.
