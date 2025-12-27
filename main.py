import sys
import os


def convert_wsl_to_windows_path() -> None:
    # Typically WSL2 uses this format: \\wsl.localhost\<DistroName>
    # You can hardcode 'Ubuntu-24.04' or try to detect it via environment variables
    distro_name: str = os.environ.get("WSL_DISTRO_NAME", "Ubuntu-24.04")
    prefix: str = rf"\\wsl.localhost\{distro_name}"

    # Read from stdin (piped input)
    for line in sys.stdin:
        wsl_path = line.strip()
        if not wsl_path:
            continue

        # Replace forward slashes with backward slashes for Windows style
        windows_path = wsl_path.replace("/", "\\")

        # Combine prefix and path
        print(f"{prefix}{windows_path}")


if __name__ == "__main__":
    convert_wsl_to_windows_path()
