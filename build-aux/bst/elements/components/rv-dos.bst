kind: manual

build-depends:
- freedesktop-sdk.bst:components/llvm.bst
- freedesktop-sdk.bst:components/gcc.bst
- freedesktop-sdk.bst:components/rust.bst

environment:
  MAXJOBS: "%{max-jobs}"

environment-nocache:
- MAXJOBS

config:
  build-commands:
  - cargo build -j "${MAXJOBS}" --release --frozen

  install-commands:
  - ""

sources:
- kind: local
  path: rust
- kind: cargo2
  cargo-lock: Cargo.lock
