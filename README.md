# BooKipu Framework: Next-Generation Publishing-as-Code Engine

---

## 1. Vision and Core Purpose

Modernizing authoring workflows requires a fundamental paradigm shift away from traditional, tightly coupled word processors. Legacy WYSIWYG tools inevitably entangle raw narrative content with visual presentation parameters, forcing creators into manual reformatting cycles, broken layout boundaries, and fragile styling maintenance whenever publication targets change. The **BooKipu Framework** solves this operational bottleneck by introducing an enterprise-grade **"Publishing-as-Code"** architecture. By decoupling raw manuscript content from typesetting engines and build orchestration, authors maintain a pristine, version-controlled plain-text narrative source that compiles deterministically across diverse physical and digital print media without structural or stylistic friction.

The name **BooKipu** is a strategic portmanteau uniting the English word **Book** with **Kipu**—derived from the Andean Inca system of knotted cords used to record complex numerical data, state inventories, and historical narratives. In modern software engineering terms, this historical metaphor directly inspires an engine designed to "tie together" disparate chapters, volume hierarchies, global metadata manifests, cascading stylesheets, and multi-format compilation pipelines into a single, cohesive software architecture.

```text
                                 ┌─► Standard Print PDF (CMYK / Bleed Ready)
                                 ├─► Pocket Print PDF (10.5 x 14.8 cm Trim)
[ Markdown Source ] ──► BooKipu ──┼─► Digital EPUB 3 (Kindle / Kobo Semantic HTML5)
   + book.yaml          Engine   ├─► Web Documentation / HTML (Jamstack / Lore Sites)
                                 └─► Version Traceability (Automated Git Hash Injection)
```

At its core, BooKipu establishes a true **Single Source Publishing** standard. It empowers technical writers, fiction authors, and tabletop RPG creators to write content once in standard Markdown and compile it seamlessly into commercial-grade print and digital assets. This high-level vision transitions directly into an architectural philosophy rooted in structural decoupling, declarative configuration, and developer-centric pipeline automation.

---

## 2. Architectural Foundations & Core Philosophy

Structural decoupling is critical for long-term maintainability and operational efficiency in editorial projects. When manuscript text is completely isolated from visual rendering systems, authors eliminate layout distractions during the writing process while automated compilers execute precise typesetting algorithms. This separation guarantees that global font re-mappings, margin recalibrations, or structural volume reorganizations can be executed instantly across an entire library without altering a single line of raw text.

```text
                              ┌───────────────────────────┐
                              │         book.yaml         │
                              │ (Single Source of Truth)  │
                              └─────────────┬─────────────┘
                                            │
                                            ▼
                              ┌───────────────────────────┐
                              │    BooKipu Parser Engine  │
                              └─────────────┬─────────────┘
                                            │
               ┌────────────────────────────┼────────────────────────────┐
               ▼                            ▼                            ▼
    ┌────────────────────┐       ┌────────────────────┐       ┌────────────────────┐
    │      `matter`      │       │      `group`       │       │     `chapter`      │
    │  (Auxiliary Nodes) │       │(Containers/Volumes)│       │ (Narrative Payload)│
    └────────────────────┘       └────────────────────┘       └────────────────────┘
```

The core orchestrator of this environment is the `book.yaml` (or `bookipu.yaml`) manifest, which acts as the project's declarative build manifest and single source of truth. Defining global project metadata (such as titles, subtitles, multi-author arrays, language ISO codes, and ISBNs), compilation target profiles, and structural entity relationships declaratively removes operational friction, allowing automated build systems to ingest and parse manuscripts predictably.

Underneath the hood, BooKipu avoids bloated editorial schemas by enforcing an object-oriented, Pydantic-backed domain model. All content nodes inherit from an abstract `Entity` base class that encapsulates shared schema attributes—including `path`, `toc` (table of contents visibility), `toc_level` (nesting depth limits), `index` (targeting specific index channels like index remissives or glossary entries), and `style` (cascading typographic rule overrides). BooKipu instantiates this object graph through three minimal, highly specialized domain entities:

* **`group`**: Structural container nodes (representing Volumes, Parts, or major Sections) supporting directory-based conventions and recursive nesting (`children`). A group container automatically executes a folder discovery pattern: it detects root section intro files (e.g., `index.md`, `intro.md`, or `first-section-definition.md`) to generate group opening text while auto-scanning a nested `Chapters/` sub-directory to instantiate child nodes.
* **`chapter`**: Main narrative payload nodes representing core body text, supporting sequential progress tracking, automated numbering schemes, and standard editorial layout constraints.
* **`matter`**: Auxiliary non-numbered text nodes dedicated to frontmatter and backmatter content (such as prefaces, dedications, acknowledgments, historical notes, glossaries, and appendices).

To maximize developer experience (DX), BooKipu enforces the **"Don't Repeat Yourself" (DRY)** principle through a Convention over Configuration parser design. Instead of requiring authors to redundantly declare chapter titles in both `book.yaml` and manuscript headings, the Python-based parser scans the top of each Markdown file using regular expressions (`^#\s+(.+)`) to infer the title directly from the first `# H1` header. If an explicit `# H1` is missing, the parser smoothly falls back to converting the filename string into a clean title-case string (e.g., `01-intro-chapter.md` becomes `Intro Chapter`). This robust internal domain model cleanly abstracts content structures, establishing a firm foundation for multi-target compilation pipelines.

---

## 3. High-Value Ecosystem & Pipeline Capabilities

Integrating modern software engineering paradigms—such as Git version control and Continuous Integration/Continuous Deployment (CI/CD) pipelines—into creative publishing unlocks unmatched workflow automation. By utilizing plain-text Markdown stored in standard Git repositories, authors eliminate the severe risks of vendor lock-in associated with proprietary binary formats (such as `.docx` or locked cloud-based WYSIWYG databases), ensuring their intellectual property remains open, recoverable, and long-term readable.

The BooKipu compilation engine converts raw Markdown structures into diverse production targets via a specialized multi-format matrix:

| Target Output Format | Key Characteristics & Primary Use Cases |
| :--- | :--- |
| **Standard Print PDF** | Commercial-grade physical publishing layout supporting high-resolution assets, CMYK color spaces, custom gutter margins, and pre-press crop/bleed marks. |
| **Pocket Print PDF** | Compact physical form factor (10.5 x 14.8 cm trim) with optimized page geometry, proportional line leading, and tightly calibrated margin profiles. |
| **Digital EPUB 3** | Reflowable e-reader output target optimized for devices like Kindle and Kobo, leveraging semantic HTML5 markup, dynamic TOC navigation, and embedded cover assets. |
| **Web Documentation / HTML** | Web-native HTML5 rendering structured for Jamstack integrations, digital system documentations, and interactive tabletop RPG lore archives. |

By incorporating automated CI/CD runners (such as GitHub Actions or GitLab CI), BooKipu provides complete version traceability across all published binaries. During build execution, the pipeline extracts environment variables—such as the active Git commit hash (e.g., `a1b2c3d4`) or semantic release tag—and dynamically injects this trace key into the book's colophon/credits block.

```text
[ Git Push / Commit ] ──► [ CI/CD Automation Pipeline ]
                                     │
                                     ├─► Extract Short Git Hash (e.g., a1b2c3d4)
                                     ├─► Run `bookipu` CLI Compiler
                                     └─► Inject Build Identifier into Colophon Page
```

Furthermore, the framework remains strictly editor-agnostic. Authors can write in plain-text environments like Obsidian or VS Code without workflow degradation. For mobile writing setups, BooKipu projects maintain full synchronization capabilities on iOS and Android by leveraging `isomorphic-git` within the `obsidian-git` plugin or integrating with native mobile Git clients like Working Copy. These pipeline architectures seamlessly bridge local editing setups with enterprise cloud infrastructure.
