# Keeping the mobile brand fully visible

Written against: `0d81f5a37af928cbff5f1cafb065180e5df039ce`

Execution update: implemented in the current worktree. The toolbar uses a
26-pixel, single-line logo in its constrained title slot. Shared logo rendering
scales down without splitting text, and navigation switches to a drawer below
1100 logical pixels so tablet navigation does not crowd the brand.

## Evidence chain

- Surface: the `MainPage` app bar on widths below 760 logical pixels, plus the same logo in the mobile drawer.
- Problem: `MainPage` places `NavBarLogo(height: 56.0)` in the mobile app bar's trailing `actions`; `NavBarLogo` adds top padding and renders three flexible text fragments, including the full nickname. The drawer uses the same component at 28 pixels. On narrow devices, the app bar action space competes with the leading menu button and can constrain or clip the logo.
- Design evidence: the user reports that the mobile logo is clipped. In `lib/sections/mainSection.dart`, the mobile app bar has a leading drawer button and trailing actions; in `lib/sections/navBar/navBarLogo.dart`, the logo uses an unbounded nickname and a 56-pixel font size in that surface.
- Owner: `lib/sections/navBar/navBarLogo.dart` owns the shared logo layout; `lib/sections/mainSection.dart` owns its mobile app-bar placement and sizing.
- Scope and affected surfaces: mobile app-bar logo and mobile drawer logo. Desktop/tablet navigation is not part of this fix.
- Uncertainty: validate on the narrowest supported viewport and with the actual nickname font loaded; no rendered evidence was provided.

## Design decision

Keep the existing text-based brand identity, but make the shared logo respect the width available to its parent and give the mobile app bar a compact, explicitly constrained logo size. Remove mobile-only excess top padding, and prevent text fragments from forcing the app bar beyond its available width. The logo must remain fully visible beside the drawer button without changing desktop navigation.

## Reuse

- Reuse `NavBarLogo`, `host.nickName`, the Agustina font, and the current light/dark theme colors.
- Exemplar: `lib/sections/navBar/navBarLogo.dart`

## Changes

1. `lib/sections/navBar/navBarLogo.dart`
   - Change: make the brand row size itself to its allocated width, keep the nickname as the priority text, and gracefully constrain or scale the decorative `"< "` and `" />"` fragments. Apply vertical padding only where the parent layout needs it rather than imposing a 20-pixel top inset on the mobile app bar.
   - Preserve: the existing brand text, Agustina nickname styling, theme-aware colors, and desktop spacing behavior.
   - Verify: at 320, 360, and 390 logical pixels, the entire nickname and closing mark are visible without overflow in both the app bar and drawer, in light and dark themes.
2. `lib/sections/mainSection.dart`
   - Change: place the mobile logo in a width-constrained app-bar slot and use a mobile-appropriate font size that leaves room for the menu button and trailing inset.
   - Preserve: the drawer trigger, desktop/tablet app bar, and existing navigation behavior.
   - Verify: the app bar has no horizontal overflow or clipped brand text at the target narrow widths.

## Scope

- Inherit: any other use of `NavBarLogo` receives the intrinsic-width and padding correction.
- Verify: desktop/tablet logo spacing and the drawer's centered logo.
- Exclude: changing the nickname, replacing the brand treatment, or redesigning the navigation.

## Validation

- Product: open the mobile menu and confirm the logo remains readable in both the app bar and drawer.
- Interface: check 320, 360, 390, and 760 logical-pixel widths; light and dark themes; drawer closed and open.
- System: confirm the shared `NavBarLogo` remains the sole owner of the brand layout and does not change desktop/tablet presentation.
- Repository: `flutter analyze` → no new analyzer issues.

## Stop conditions

- Stop if the available app-bar width cannot fit the full nickname at a readable size; ask whether a compact mobile brand variant is acceptable rather than silently truncating the nickname.

## Design documentation

- After acceptance and validation: none.
