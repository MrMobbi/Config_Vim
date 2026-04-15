#!/usr/bin/env python3

import re
import shutil
from pathlib import Path

CONFIG_PATH = Path.home() / ".config/terminator/config"


def split_sections(text):
    sections = {}
    current = None

    for line in text.splitlines(keepends=True):
        if re.match(r"^\[.*\]", line):
            current = line.strip()
            sections[current] = []
        elif current:
            sections[current].append(line)

    return sections


def get_profiles(profile_lines):
    profiles = []
    for line in profile_lines:
        m = re.match(r"\s*\[\[([^\]]+)\]\]", line)
        if m:
            profiles.append(m.group(1))
    return profiles


def extract_profile_block(lines, name):
    block = []
    capture = False

    for line in lines:
        if re.match(rf"\s*\[\[{re.escape(name)}\]\]", line):
            capture = True
            block = [line]
            continue

        if capture:
            if re.match(r"\s*\[\[", line):
                break
            block.append(line)

    return block


def remove_default(lines):
    new_lines = []
    skip = False

    for line in lines:
        if re.match(r"\s*\[\[default\]\]", line):
            skip = True
            continue

        if skip and re.match(r"\s*\[\[", line):
            skip = False

        if not skip:
            new_lines.append(line)

    return new_lines


def main():
    if not CONFIG_PATH.exists():
        print("❌ Config not found")
        return

    text = CONFIG_PATH.read_text()
    sections = split_sections(text)

    if "[profiles]" not in sections:
        print("❌ No [profiles] section found")
        return

    profile_lines = sections["[profiles]"]

    profiles = get_profiles(profile_lines)

    if not profiles:
        print("❌ No profiles found")
        return

    print("Select profile:\n")
    for i, p in enumerate(profiles, 1):
        print(f"{i}) {p}")

    choice = input("\n> ").strip()

    if not choice.isdigit():
        print("❌ Invalid input")
        return

    idx = int(choice) - 1
    if idx < 0 or idx >= len(profiles):
        print("❌ Out of range")
        return

    target = profiles[idx]
    print(f"\n👉 Activating: {target}")

    # backup
    shutil.copy(CONFIG_PATH, CONFIG_PATH.with_suffix(".bak"))

    block = extract_profile_block(profile_lines, target)
    if not block:
        print("❌ Failed to extract profile")
        return

    # rename to default
    block[0] = "  [[default]]\n"

    # remove old default
    new_profile_lines = remove_default(profile_lines)

    # insert new default at top
    new_profile_lines = block + ["\n"] + new_profile_lines

    sections["[profiles]"] = new_profile_lines

    # rebuild file
    new_text = ""
    for sec, lines in sections.items():
        new_text += sec + "\n"
        new_text += "".join(lines)

    CONFIG_PATH.write_text(new_text)

    print("✅ Done (backup saved)")


if __name__ == "__main__":
    main()
