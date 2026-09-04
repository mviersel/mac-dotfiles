#!/usr/bin/env bash
set -euo pipefail

echo "Checking Rust/Cargo..."

if ! command -v cargo >/dev/null 2>&1; then
    echo "Rust/Cargo not found. Installing Rust via rustup..."

    curl https://sh.rustup.rs -sSf | sh -s -- -y

    # Make cargo available immediately in this script
    source "$HOME/.cargo/env"
else
    echo "Rust/Cargo already installed."
fi

echo "Checking GlazeTiler..."

if ! command -v glazetiler >/dev/null 2>&1; then
    echo "GlazeTiler not found. Installing GlazeTiler..."

    cargo install --git https://github.com/Dutch-Raptor/glazetiler.git
else
    echo "GlazeTiler already installed."
fi
