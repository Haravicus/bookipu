#!/usr/bin/env bash
set -e

echo "Initializing BooKipu project directory and file structure..."

# Create directories
mkdir -p .github/workflows
mkdir -p docker
mkdir -p src/bookipu/models
mkdir -p src/bookipu/core
mkdir -p src/bookipu/builders
mkdir -p src/bookipu/assets/fonts
mkdir -p src/bookipu/assets/templates
mkdir -p src/bookipu/utils
mkdir -p examples/manual-bookipu/01-Portugues
mkdir -p examples/manual-bookipu/02-English
mkdir -p examples/manual-bookipu/03-Espanol
mkdir -p examples/romance
mkdir -p examples/livro-de-bolso
mkdir -p examples/medio-maior
mkdir -p examples/tecnico-grande
mkdir -p examples/infantil-arte
mkdir -p tests/unit
mkdir -p tests/integration
mkdir -p tests/fixtures

# pyproject.toml
cat << 'EOF' > pyproject.toml
[build-system]
requires = ["hatchling"]
build-backend = "hatchling.build"

[project]
name = "bookipu"
version = "0.1.0"
description = "Next-Generation Publishing-as-Code Engine for Books and Digital Publications"
readme = "README.md"
requires-python = ">=3.11"
license = "MIT"
authors = [
    { name = "BooKipu Contributors" }
]
dependencies = [
    "typer>=0.12.0",
    "pyyaml>=6.0.1",
    "pydantic>=2.7.0",
    "gitpython>=3.1.43",
    "httpx>=0.27.0",
    "rich>=13.7.0"
]

[project.optional-dependencies]
dev = [
    "pytest>=8.2.0",
    "pytest-cov>=5.0.0",
    "ruff>=0.4.0",
    "mypy>=1.10.0",
    "pyinstaller>=6.6.0"
]

[project.scripts]
bookipu = "bookipu.cli:app"

[tool.hatch.build.targets.wheel]
packages = ["src/bookipu"]
EOF

# GitHub Workflows
cat << 'EOF' > .github/workflows/ci-tests.yml
# TODO: Configure GitHub Actions workflow to run pytest unit/integration tests and verify Typst/EPUB builds.
EOF

cat << 'EOF' > .github/workflows/release-binaries.yml
# TODO: Configure GitHub Actions workflow to build standalone executables (Windows, Linux, macOS) and publish package to PyPI.
EOF

cat << 'EOF' > .github/workflows/publish-docker.yml
# TODO: Configure GitHub Actions workflow to build the official BooKipu Docker image and push to DockerHub.
EOF

cat << 'EOF' > .github/workflows/update-homebrew.yml
# TODO: Configure GitHub Actions workflow to automatically update the Homebrew formula on new releases.
EOF

# Docker files
cat << 'EOF' > docker/Dockerfile
# TODO: Define official BooKipu Docker image with Python, Typst, Pandoc, and base open-source fonts pre-installed.
EOF

cat << 'EOF' > docker/entrypoint.sh
#!/usr/bin/env bash
# TODO: Implement container entrypoint script to handle CLI arguments and execution permissions.
EOF
chmod +x docker/entrypoint.sh

# Package init and CLI
cat << 'EOF' > src/bookipu/__init__.py
"""TODO: Expose package version, core metadata, and public API entrypoints for BooKipu."""
EOF

cat << 'EOF' > src/bookipu/cli.py
"""TODO: Implement Typer CLI commands (init, build, watch, fonts) and user-facing terminal output."""
EOF

# Models
cat << 'EOF' > src/bookipu/models/__init__.py
"""TODO: Export all domain model classes (Book, Entity, Matter, Chapter, Group, FormatProfile, Style)."""
EOF

cat << 'EOF' > src/bookipu/models/book.py
"""TODO: Define the root Book Pydantic model encapsulating global metadata, format profiles, font dependencies, and content tree."""
EOF

cat << 'EOF' > src/bookipu/models/entity.py
"""TODO: Define the abstract base Entity model with shared fields (path, role, toc, toc_level, index, style) and common validation."""
EOF

cat << 'EOF' > src/bookipu/models/matter.py
"""TODO: Define the Matter model for unnumbered auxiliary content (frontmatter and backmatter such as prefaces, dedications, glossaries)."""
EOF

cat << 'EOF' > src/bookipu/models/chapter.py
"""TODO: Define the Chapter model for main narrative payload units with sequential numbering and editorial constraints."""
EOF

cat << 'EOF' > src/bookipu/models/group.py
"""TODO: Define the recursive Group container model supporting nested children, numbering schemes, and directory auto-discovery."""
EOF

cat << 'EOF' > src/bookipu/models/format_profile.py
"""TODO: Define the FormatProfile model representing compilation target settings (engine, template, page geometry, default styles)."""
EOF

cat << 'EOF' > src/bookipu/models/style.py
"""TODO: Define the Style model and cascading style merge logic (body, headings h1-h3, links, code, alignment, spacing)."""
EOF

# Core
cat << 'EOF' > src/bookipu/core/__init__.py
"""TODO: Export core engine components (Parser, Compiler, FontManager, GitContext)."""
EOF

cat << 'EOF' > src/bookipu/core/parser.py
"""TODO: Implement YAML manifest parser, directory scanner, H1 title inference, and recursive Book object graph builder."""
EOF

cat << 'EOF' > src/bookipu/core/compiler.py
"""TODO: Implement the central build orchestrator that resolves styles, invokes FontManager/GitContext, and dispatches target builders."""
EOF

cat << 'EOF' > src/bookipu/core/font_manager.py
"""TODO: Implement the font assistant to check local cache, download declared external fonts, and provide font paths to builders."""
EOF

cat << 'EOF' > src/bookipu/core/git_context.py
"""TODO: Implement Git repository inspection to extract commit hashes, branch names, and tags for colophon injection."""
EOF

# Builders
cat << 'EOF' > src/bookipu/builders/__init__.py
"""TODO: Export format builder implementations and builder registry."""
EOF

cat << 'EOF' > src/bookipu/builders/base.py
"""TODO: Define the BaseBuilder abstract interface that all output format builders must implement."""
EOF

cat << 'EOF' > src/bookipu/builders/typst_builder.py
"""TODO: Implement TypstBuilder to translate the Book object graph and cascading styles into Typst markup and compile PDFs."""
EOF

cat << 'EOF' > src/bookipu/builders/epub_builder.py
"""TODO: Implement EpubBuilder to orchestrate Pandoc and CSS generation for reflowable EPUB 3 outputs."""
EOF

# Utils
cat << 'EOF' > src/bookipu/utils/__init__.py
"""TODO: Export utility helpers for Markdown parsing and filesystem operations."""
EOF

cat << 'EOF' > src/bookipu/utils/markdown.py
"""TODO: Implement Markdown utilities for regex-based H1 title extraction, heading level shifting, and content sanitization."""
EOF

cat << 'EOF' > src/bookipu/utils/filesystem.py
"""TODO: Implement cross-platform path resolution, natural alphanumeric file sorting, and directory discovery helpers."""
EOF

# Examples placeholders
cat << 'EOF' > examples/manual-bookipu/book.yml
# TODO: Configure multilingual BooKipu user manual (Portuguese, English, Spanish sections) as living documentation.
EOF

cat << 'EOF' > examples/romance/book.yml
# TODO: Configure standard fiction/romance template (indented paragraphs, no vertical block spacing).
EOF

cat << 'EOF' > examples/livro-de-bolso/book.yml
# TODO: Configure pocket book format template (10.5cm x 14.8cm trim geometry).
EOF

cat << 'EOF' > examples/medio-maior/book.yml
# TODO: Configure medium/large trade book format template (16cm x 23cm geometry).
EOF

cat << 'EOF' > examples/tecnico-grande/book.yml
# TODO: Configure large technical manual template (code blocks, tables, syntax highlighting).
EOF

cat << 'EOF' > examples/infantil-arte/book.yml
# TODO: Configure children/art book template (enlarged typography, full-bleed image layouts).
EOF

# Tests
cat << 'EOF' > tests/conftest.py
"""TODO: Define shared pytest fixtures for temporary book projects, sample YAML manifests, and mock files."""
EOF

cat << 'EOF' > tests/unit/test_parser.py
"""TODO: Implement unit tests for YAML schema validation, recursive group expansion, and H1 title inference."""
EOF

cat << 'EOF' > tests/unit/test_style_cascade.py
"""TODO: Implement unit tests verifying cascading style inheritance and local property overrides."""
EOF

cat << 'EOF' > tests/unit/test_models.py
"""TODO: Implement unit tests for Book, Group, Chapter, Matter, and FormatProfile domain models."""
EOF

cat << 'EOF' > tests/unit/test_font_manager.py
"""TODO: Implement unit tests for font caching, URL downloading, and fallback font resolution."""
EOF

cat << 'EOF' > tests/integration/test_typst_build.py
"""TODO: Implement integration tests executing end-to-end PDF compilation via Typst and verifying output artifacts."""
EOF

cat << 'EOF' > tests/integration/test_epub_build.py
"""TODO: Implement integration tests executing end-to-end EPUB compilation via Pandoc and validating package structure."""
EOF

cat << 'EOF' > tests/integration/test_examples.py
"""TODO: Implement integration tests verifying that all sample projects in examples/ compile without errors."""
EOF

echo "BooKipu project structure generated successfully!"
