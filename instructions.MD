# jsk-lecnotes Typst Template Instructions

This template provides a clean, professional format for creating lecture notes using Typst instead of LaTeX. It's based on Je Sian Keith Herman's lecture notes template.

## Prerequisites

- Install [Typst](https://typst.app/) on your system
- Ensure the `typstemp` script is executable and available in your PATH

## Features

- Clean, academic-style formatting
- Automatic numbering for lectures/chapters
- Support for mathematical equations
- Code syntax highlighting
- Bibliography support
- Customizable colors and fonts
- Various theorem environments (definitions, examples, notes, etc.)

## Quick Start

1. Create a directory following the format: `CLASSCODE - CLASSNAME`
   - Example: `EC327 - Software Engineering` or `EK103 - Computational Linear Algebra`

2. Navigate to your class directory and run:
   ```bash
   typstemp
   ```

3. This will copy the template files and create a `main.typ` file with your class information pre-filled.

4. Start editing `main.typ` to add your lecture notes content.

## File Structure

After running `typstemp`, you'll have:
- `lib.typ` - The template library (don't modify)
- `main.typ` - Your main document file
- `refs.bib` - Bibliography file (optional)

## Compiling

To compile your document to PDF:
```bash
# Single compilation
typst compile main.typ

# Watch mode (auto-recompiles on changes)
typst watch main.typ
```

## Customization

In `main.typ`, you can customize:
- `title`: The main title of your notes
- `short_title`: Appears in headers
- `description`: Subtitle/description
- `authors`: Your name and optional link
- `accent`: Color scheme (hex color)
- `text_font`/`code_font`: Typography choices
- `h1-prefix`: What to call each section (default: "Lecture")

## Available Environments

The template provides several boxed environments:
- `#definition[]` - For definitions
- `#example[]` - For examples  
- `#note[]` - For important notes
- `#attention[]` - For warnings/alerts
- `#theorem[]` - For theorems
- `#proposition[]` - For propositions

## Mathematical Plotting and Diagrams

**RULE**: Always use the CeTZ package for mathematical plots, graphs, and diagrams in Typst documents.

### Standard Setup:
```typst
#figure({
  import "@preview/cetz:0.2.2": canvas, draw
  
  canvas(length: 1cm, {
    // Your plotting code here
  })
}, caption: [Your caption here])
```

### Why CeTZ:
- Professional quality mathematical graphics
- Precise control over plot elements
- Consistent with academic standards
- Native Typst integration (no external dependencies)
- Excellent for differential equations, function plots, and geometric diagrams

## Tips

- Use `#include "content/chapter1.typ"` to organize content across multiple files
- Add `#import "/lib.typ": *` at the top of separate content files
- Use `#blockquote[]` for quotations
- Use `#iboxed()` and `#dboxed()` for inline and display math boxes
- Reference equations with `@label` syntax

## Troubleshooting

- If compilation fails, check that all imported files exist
- Ensure proper Typst syntax (different from LaTeX)
- Check the [Typst documentation](https://typst.app/docs) for syntax reference
