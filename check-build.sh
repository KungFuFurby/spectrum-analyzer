echo "checks that this builds on std+no_std + that all tests run + that all features compile"
cargo build --all-targets
cargo build --all-targets --no-default-features --features "microfft-complex"
cargo build --all-targets --no-default-features --features "microfft-real"

cargo test --all-targets

# test no_std
rustup target add thumbv7em-none-eabihf
cargo check --target thumbv7em-none-eabihf --no-default-features --features "microfft-complex"
cargo check --target thumbv7em-none-eabihf --no-default-features --features "microfft-real"

# run examples
cargo run --release --example mp3-samples
