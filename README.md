# Secret Squirrel

[![License: MIT](https://img.shields.io/badge/License-MIT-2f6f4e.svg)](LICENSE)
[![Platform: macOS 13+](https://img.shields.io/badge/macOS-13%2B-496c5a.svg)](#requirements)
[![Local only](https://img.shields.io/badge/network-none-496c5a.svg)](#privacy)

A small, native macOS utility that turns employee names into usernames and memorable temporary onboarding passwords—entirely offline.

> [!IMPORTANT]
> Secret Squirrel is an onboarding convenience tool, not a password manager, secrets manager, or general-purpose security product. Generated passwords are for short-lived new-user access only. Require a password change at first sign-in and enforce expiration, rate limiting, and lockout controls in the identity system.

## Intended use

Use Secret Squirrel to prepare temporary credentials for a new employee who will immediately replace the generated password. Do not use generated values for personal accounts, administrator or service accounts, API keys, production secrets, long-lived credentials, recovery codes, encryption keys, or any system that cannot force a first-login password change.

## Features

- Input: one name per line, as `First Last` or `First, Last`
- Quoted nicknames take precedence: `Steven "Steve" Howser` becomes `steve.howser`
- Username: `first.last` (lowercase, with accents normalized)
- Temporary password: alliterative adjective + capitalized animal + eight random digits + one symbol
- Uses Swift's system random-number generator and produces passwords of at least 16 characters
- The embedded animal list contains hundreds of carefully curated, recognizable animals, with 10 adjectives for every letter; the app makes no network requests
- Includes an original Everforest-inspired squirrel-and-key app icon

## Requirements

- macOS 13 or later
- Apple Silicon
- A Swift toolchain capable of compiling the macOS app

## Build

Run `./build.sh`. The app and a distributable zip are created in `dist/`.

The included build is ad-hoc signed for local use. On another Mac, if Gatekeeper blocks the first launch, Control-click the app, choose **Open**, then confirm **Open**.

## Privacy

Secret Squirrel makes no network requests. Names and generated values remain in memory unless you copy them or explicitly export a CSV. Treat copied or exported credentials as sensitive and delete them when onboarding is complete.

## Contributing

Bug reports and focused pull requests are welcome. Please read [CONTRIBUTING.md](CONTRIBUTING.md) before contributing. Security concerns should follow [SECURITY.md](SECURITY.md).

## License and author

Secret Squirrel is available under the [MIT License](LICENSE), including its original project artwork unless a file says otherwise.

Created and maintained by [Jake Carter](https://github.com/Elduug) ([@Elduug](https://github.com/Elduug)).
