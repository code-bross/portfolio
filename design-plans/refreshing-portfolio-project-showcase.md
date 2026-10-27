# Refreshing the project showcase for readability

Written against: `0d81f5a37af928cbff5f1cafb065180e5df039ce`

Execution update: implemented in the current worktree. `ProjectShowcase` owns
the adaptive collection for both responsive entry points. `ProjectCard.showcase`
keeps the existing Contacts card presentation unchanged. Cards show the existing
subtitle; the full responsibility descriptions remain on the detail page rather
than being automatically shortened into potentially misleading summaries.

## Evidence chain

- Surface: the Projects section rendered by `Portfolio`, with `PortfolioMobileTab` for mobile/tablet and `PortfolioDesktop` for desktop.
- Problem: the user describes the portfolio presentation as outdated and prioritizes readability. The current mobile/tablet surface uses an auto-playing carousel; desktop uses a horizontal strip. Both reuse `ProjectCard`, whose text is overlaid on a background image, uses low font weights and wide letter spacing, and sizes content from screen height. These implementation choices make project descriptions and titles harder to scan, especially on smaller screens.
- Design evidence: the user's request to modernize the portfolio while prioritizing readability. The runtime path is `MainPage.sectionWidget(3)` → `Portfolio` → responsive layout → `PortfolioMobileTab` or `PortfolioDesktop` → `ProjectCard`; project content and images come from `projects` in `lib/constants.dart`.
- Owner: `lib/sections/portfolio/` owns responsive section composition; `lib/widget/projectCard.dart` owns the shared project presentation; `lib/widget/customTextHeading.dart` owns the section heading style.
- Scope and affected surfaces: Projects section on mobile, tablet, and desktop, including its project cards and GitHub CTA. Project details are reached through `ServiceDetails`.
- Uncertainty: no rendered screenshot was provided. Review the visual result with actual project assets and both themes before finalizing spacing and image treatment.

## Design decision

Replace the carousel-and-horizontal-strip presentation with a consistent, scannable project collection: stacked cards on narrow screens and an adaptive grid on wider screens. Give each card a clear reading order—project image or icon, title, concise subtitle, then the existing project summary—with sufficient contrast and comfortable text sizing. Avoid putting essential copy over screenshots. Keep project details accessible through the existing card tap and keep the GitHub CTA after the collection.

## Reuse

- Reuse the `projects` model and its current title, subtitle, icon, background image, description, store images, and link data; reuse the current light/dark theme provider and `kPrimaryColor`.
- Reuse `CustomSectionHeading`, `CustomSectionSubHeading`, and `ProjectCard` where their current APIs support the new hierarchy; evolve the existing card rather than creating a parallel project-card system.
- Exemplar: `lib/sections/portfolio/portfolioMobile.dart`, `lib/sections/portfolio/portfolioDesktop.dart`, and `lib/widget/projectCard.dart`

## Changes

1. `lib/sections/portfolio/portfolioMobile.dart`
   - Change: replace the auto-playing carousel with a vertically scannable list of project cards, with spacing and card width based on available width rather than viewport height.
   - Preserve: all projects, the current project detail navigation, and the GitHub CTA.
   - Verify: a reader can scan all five project titles and summaries without waiting for carousel movement; no horizontal overflow occurs at narrow mobile widths.
2. `lib/sections/portfolio/portfolioDesktop.dart`
   - Change: replace the horizontal carousel-like strip with an adaptive grid that presents multiple projects at once, uses consistent card dimensions, and retains comfortable content widths on medium and wide screens.
   - Preserve: all projects, hover feedback where useful, and the GitHub CTA.
   - Verify: the grid is balanced at tablet/desktop breakpoints and cards do not become too wide or too narrow.
3. `lib/widget/projectCard.dart`
   - Change: establish a clear typographic hierarchy; remove essential text from the background-image overlay; use project imagery as a contained visual, then show readable title, subtitle, and a concise excerpt from the existing description with sensible line limits. Keep theme-aware contrast and reduce excessive letter spacing / ultra-light weights.
   - Preserve: existing project asset usage, tap-through to `ServiceDetails`, project content, and hover treatment on pointer devices.
   - Verify: long Korean and English project names and descriptions remain legible without overflow in both themes and across the full project dataset.
4. `lib/widget/customTextHeading.dart`
   - Change: adjust only the Projects heading/subheading presentation if needed so it follows the refreshed section's readable type scale and spacing; preserve current shared consumers or scope any new variant specifically to this section.
   - Preserve: the established heading component and styling on unrelated sections.
   - Verify: headings align with the project collection and remain readable on mobile and desktop.

## Scope

- Inherit: project data and shared card changes apply to both responsive variants because both render `ProjectCard`.
- Verify: the shared heading's other consumers, `ServiceDetails` navigation, both themes, all project content lengths, and the mobile/tablet breakpoint.
- Exclude: rewriting project descriptions or adding new project data, changing other portfolio sections, and changing project detail behavior.

## Validation

- Product: scan and open each project, then use the GitHub CTA; confirm existing project details remain reachable.
- Interface: review 320, 360, 390, 760, 1024, and 1440 logical-pixel widths; light and dark themes; longest Korean/English titles and descriptions; pointer hover where available.
- System: confirm both responsive layouts use the same `ProjectCard` owner, respect existing theme colors, and do not introduce a competing card pattern.
- Repository: `flutter analyze` → no new analyzer issues; run the existing widget test suite → all tests pass.

## Stop conditions

- Stop if `ServiceDetails` depends on the current card's visual overlay or if existing project descriptions cannot be shortened for display without losing essential information; retain full content and link to details instead of silently truncating important facts.

## Design documentation

- After acceptance and validation: none.
